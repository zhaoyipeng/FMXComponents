unit BaiduMapAPI.ViewService.Android;
//author:Xubzhlin
//Email:371889755@qq.com

//百度地图API 地图服务 单元
//官方链接:http://lbsyun.baidu.com/
//TAndroidBaiduMapViewService 百度地图 安卓 地图服务

interface

uses
  System.Classes, System.Generics.Collections, System.Types, FMX.Maps,
  Androidapi.JNI.Embarcadero, Androidapi.JNI.GraphicsContentViewText, Androidapi.JNIBridge,
  Androidapi.JNI.baidu.mapapi, Androidapi.JNI.baidu.mapapi.map, Androidapi.JNI.baidu.mapapi.model,
  BaiduMapAPI.ViewService;


type

  TAndroidBaiduMapViewService = class;

  TOnMapBaseListener = class(TJavaLocal)
  private
    [weak] FViewService:TAndroidBaiduMapViewService;
  public
    constructor Create(MapViewService:TAndroidBaiduMapViewService);
  end;

  //地图点击监听 用户Marker、Polyline以外的覆盖物点击
  TOnMapClickListener = class(TOnMapBaseListener, JBaiduMap_OnMapClickListener)
    procedure onMapClick(P1: JLatLng); cdecl;
    function onMapPoiClick(P1: JMapPoi): Boolean; cdecl;
  end;

  //Marker 点击监听
  TOnMarkerClickListener = class(TOnMapBaseListener, JBaiduMap_OnMarkerClickListener)
    function onMarkerClick(P1: JMarker): Boolean; cdecl;
  end;

  //Polyline 点击监听
  TOnPolylineClickListener = class(TOnMapBaseListener, JBaiduMap_OnPolylineClickListener)
    function onPolylineClick(P1: JPolyline): Boolean; cdecl;
  end;

  TAndroidBaiduMapViewService = class(TBaiduMapViewService)
  private
    FMapView:JMapView;
    FBMMap:JBaiduMap;
    FJNativeLayout:JNativeLayout;
    FOnMarkerClickListener:TOnMarkerClickListener;

    FMapObjects:TDictionary<Integer, TMapObjectBase>;

    procedure InitInstance;
    procedure RealignView;

    function BuildMarkerOptions(const D: TMapMarkerDescriptor): JMarkerOptions;
    function BuildCircleOptions(const D: TMapCircleDescriptor): JCircleOptions;
    function BuildPolygonOptions(const D: TMapPolygonDescriptor): JPolygonOptions;
    function BuildPolylineOptions(const D: TMapPolylineDescriptor): JPolylineOptions;

    function GetMapObject<T: TMapObjectBase>(const Key: Integer): T;
    procedure PutMapObject<T: TMapObjectBase>(const Key: Integer; const MapObject: T);
    procedure RemoveMapObject(const Key: Integer);
  protected
    procedure DoShowBaiduMap; override;
    procedure DoUpdateBaiduMapFromControl; override;
    function DoAddMarker(const Descriptor: TMapMarkerDescriptor):TBaiduMapMarker;  override;
    function DoAddPolyline(const Descriptor: TMapPolylineDescriptor):TMapPolyline;  override;
    function DoAddPolygon(const Descriptor: TMapPolygonDescriptor):TMapPolygon;  override;
    function DoAddCircle(const Descriptor: TMapCircleDescriptor): TMapCircle; override;
    procedure DoSetCenterCoordinate(const Coordinate:TMapCoordinate); override;
    procedure DoSetZoomLevel(Level:Single); override;
    procedure DoSetVisible(const Value: Boolean); override;
  public
    constructor Create(AKey:String); override;
    destructor Destroy; override;
  end;

implementation

uses FMX.Platform.Android, FMX.Forms, FMX.Helpers.Android, Androidapi.JNI.JavaUtil,
  FMX.Surfaces, Androidapi.Helpers, FMX.Graphics, System.IOUtils, System.SysUtils;

type
  TAndroidMapMarker = class(TBaiduMapMarker)
  private
    FJavaMarker: JMarker;
    [Weak] FMapView: TAndroidBaiduMapViewService;
  public
    constructor Create(const Descriptor: TMapMarkerDescriptor); override;
    destructor Destroy; override;
    procedure SetJMarker(Marker: JMarker);
    procedure SetHostView(MapView: TAndroidBaiduMapViewService);
    procedure Remove; override;
    procedure SetVisible(const Value: Boolean); override;
  end;

  TAndroidMapCircle = class(TMapCircle)
  private
    FJavaCircle: JCircle;
    [Weak] FMapView: TAndroidBaiduMapViewService;
  public
    destructor Destroy; override;
    procedure SetJCircle(Circle: JCircle);
    procedure SetHostView(MapView: TAndroidBaiduMapViewService);
    procedure Remove; override;
    procedure SetVisible(const Value: Boolean); override;
  end;

  TAndroidMapPolygon = class(TMapPolygon)
  private
    FJavaPolygon: JPolygon;
    [Weak] FMapView: TAndroidBaiduMapViewService;
  public
    destructor Destroy; override;
    procedure SetJPolygon(Polygon: JPolygon);
    procedure SetHostView(MapView: TAndroidBaiduMapViewService);
    procedure Remove; override;
    procedure SetVisible(const Value: Boolean); override;
  end;

  TAndroidMapPolyline = class(TMapPolyline)
  private
    FJavaPolyline: JPolyline;
    [Weak] FMapView: TAndroidBaiduMapViewService;
  public
    destructor Destroy; override;
    procedure SetJPolyline(Polyline: JPolyline);
    procedure SetHostView(MapView: TAndroidBaiduMapViewService);
    procedure Remove; override;
    procedure SetVisible(const Value: Boolean); override;
  end;

function CoordToLatLng(const C: TMapCoordinate): JLatLng;
begin
  Result := TJLatLng.JavaClass.init(C.Latitude, C.Longitude)
end;

function CreateBitmapDescriptorFromBitmap(const Bitmap: TBitmap): JBitmapDescriptor;
var
  Surface: TBitmapSurface;
  JavaBitmap: JBitmap;
begin
  Result := nil;
  Surface := TBitmapSurface.Create;
  try
    Surface.Assign(Bitmap);
    JavaBitmap := TJBitmap.JavaClass.createBitmap(Surface.Width, Surface.Height, TJBitmap_Config.JavaClass.ARGB_8888);
    if SurfaceToJBitmap(Surface, JavaBitmap) then
      Result := TJBitmapDescriptorFactory.JavaClass.fromBitmap(JavaBitmap);
  finally
    Surface.DisposeOf;
  end;
end;

{ TAndroidBaiduMapViewService }

function TAndroidBaiduMapViewService.BuildCircleOptions(
  const D: TMapCircleDescriptor): JCircleOptions;
var
  Stroke:JStroke;
begin
  Stroke:=TJStroke.JavaClass.init(trunc(D.StrokeWidth), D.StrokeColor);

  Result := TJCircleOptions.JavaClass.init
    .center(CoordToLatLng(D.Center))
    .fillColor(D.FillColor)
    .stroke(Stroke)
    .radius(trunc(D.Radius))
    .zIndex(trunc(D.ZIndex));


end;

function TAndroidBaiduMapViewService.BuildMarkerOptions(
  const D: TMapMarkerDescriptor): JMarkerOptions;
begin
  Result := TJMarkerOptions.JavaClass.init.alpha(D.Opacity)
    .anchor(D.Origin.X, D.Origin.Y)
    .draggable(D.Draggable)
    .flat(D.Appearance = TMarkerAppearance.Flat)
    .position(CoordToLatLng(D.Position))
    .rotate(D.Rotation)
    .title(StringToJString(D.Title))
    .visible(D.Visible);
  if D.Icon <> nil then
    Result := Result.icon(CreateBitmapDescriptorFromBitmap(D.Icon));
end;

function TAndroidBaiduMapViewService.BuildPolygonOptions(
  const D: TMapPolygonDescriptor): JPolygonOptions;
var
  Vertex: TMapCoordinate;
  List: JArrayList;
  Stroke:JStroke;
begin
  Stroke:=TJStroke.JavaClass.init(trunc(D.StrokeWidth), D.StrokeColor);

  List := TJArrayList.JavaClass.init;
  for Vertex in D.Outline.Points do
    List.add(CoordToLatLng(Vertex));

  Result := TJPolygonOptions.JavaClass.init
    .fillColor(D.FillColor)
    .stroke(Stroke)
    .points(JList(List))
    .zIndex(trunc(D.ZIndex));
end;

function TAndroidBaiduMapViewService.BuildPolylineOptions(
  const D: TMapPolylineDescriptor): JPolylineOptions;
var
  List: JList;
  Vertex: TMapCoordinate;
begin
  Result := TJPolylineOptions.JavaClass.init
    .width(trunc(D.StrokeWidth))
    .color(D.StrokeColor)
    .zIndex(trunc(D.ZIndex));

  List := TJList.Create;
  for Vertex in D.Points.Points do
    List.add(CoordToLatLng(Vertex));
  Result.points(List);

end;

constructor TAndroidBaiduMapViewService.Create(AKey: String);
begin
  inherited Create(AKey);
  FMapObjects:=TDictionary<Integer, TMapObjectBase>.Create;
end;

destructor TAndroidBaiduMapViewService.Destroy;
begin
  FMapObjects.DisposeOf;
  FOnMarkerClickListener.DisposeOf;
  FBMMap:=nil;
  FMapView:=nil;
  FJNativeLayout := nil;
  inherited;
end;

function TAndroidBaiduMapViewService.DoAddCircle(
  const Descriptor: TMapCircleDescriptor): TMapCircle;
var
  R: TAndroidMapCircle;
begin
  R := TAndroidMapCircle.Create(Descriptor);
  R.SetHostView(Self);
  Result:=R;
  if  FBMMap <> nil then
  begin
    R.SetJCircle(TUIThreadCaller.Call<TMapCircleDescriptor,JCircle>(
      function(D: TMapCircleDescriptor): JCircle
      begin
        Result := JCircle(FBMMap.addOverlay(BuildCircleOptions(D)));
      end, Descriptor));
    if R.FJavaCircle <> nil then
      PutMapObject<TMapCircle>(R.FJavaCircle.hashCode, Result);
  end;

end;

function TAndroidBaiduMapViewService.DoAddMarker(
  const Descriptor: TMapMarkerDescriptor): TBaiduMapMarker;
var
  R: TAndroidMapMarker;
begin
  R := TAndroidMapMarker.Create(Descriptor);
  R.SetHostView(Self);
  Result := R;
  if FMapView <> nil then
  begin
    R.SetJMarker(TUIThreadCaller.Call<TMapMarkerDescriptor,JMarker>(
      function(D: TMapMarkerDescriptor): JMarker
      begin
        Result := JMarker(FBMMap.addOverlay(BuildMarkerOptions(D)));
      end, Descriptor));
    if R.FJavaMarker <> nil then
    begin
      PutMapObject<TBaiduMapMarker>(R.FJavaMarker.hashCode, Result);
    end;
  end;

end;

function TAndroidBaiduMapViewService.DoAddPolygon(
  const Descriptor: TMapPolygonDescriptor): TMapPolygon;
var
  R: TAndroidMapPolygon;
begin
  R := TAndroidMapPolygon.Create(Descriptor);
  R.SetHostView(Self);
  Result := R;
  if FMapView <> nil then
  begin
    R.SetJPolygon(TUIThreadCaller.Call<TMapPolygonDescriptor, JPolygon>(
      function(D: TMapPolygonDescriptor): JPolygon
      begin
        Result := JPolygon(FBMMap.addOverlay(BuildPolygonOptions(D)));
      end, Descriptor));
    if R.FJavaPolygon <> nil then
      PutMapObject<TMapPolygon>(R.FJavaPolygon.hashCode, Result);
  end;

end;

function TAndroidBaiduMapViewService.DoAddPolyline(
  const Descriptor: TMapPolylineDescriptor): TMapPolyline;
var
  R: TAndroidMapPolyline;
begin
  R := TAndroidMapPolyline.Create(Descriptor);
  R.SetHostView(Self);
  Result := R;
  if FMapView <> nil then
  begin
    R.SetJPolyline(TUIThreadCaller.Call<TMapPolylineDescriptor,JPolyline>(
      function(D: TMapPolylineDescriptor): JPolyline
      begin
        Result := JPolyline(FBMMap.addOverlay(BuildPolylineOptions(D)));
      end, Descriptor));
    if R.FJavaPolyline <> nil then
      PutMapObject<TMapPolyline>(R.FJavaPolyline.hashCode, Result);
  end;

end;

procedure TAndroidBaiduMapViewService.DoSetCenterCoordinate(
  const Coordinate: TMapCoordinate);
var
  Builder:JMapStatus_Builder;
  MapStatusUpdate:JMapStatusUpdate;
begin
  Builder:=TJMapStatus_Builder.JavaClass.init;
  Builder.target(TJLatLng.JavaClass.init(Coordinate.Latitude, Coordinate.Longitude));
  MapStatusUpdate:=TJMapStatusUpdateFactory.JavaClass.newMapStatus(Builder.build);
  CallInUIThread(
    procedure
    begin
      FBMMap.setMapStatus(MapStatusUpdate);
    end);
end;

procedure TAndroidBaiduMapViewService.DoSetVisible(const Value: Boolean);
begin
  if FMapView = nil then exit;

  CallInUiThread(procedure
    begin
      if Value then
        FMapView.onResume
      else
        FMapView.onPause;
    end);
end;

procedure TAndroidBaiduMapViewService.DoSetZoomLevel(Level: Single);
var
  Builder:JMapStatus_Builder;
  MapStatusUpdate:JMapStatusUpdate;
begin
  Builder:=TJMapStatus_Builder.JavaClass.init;
  Builder.zoom(Level);
  MapStatusUpdate:=TJMapStatusUpdateFactory.JavaClass.newMapStatus(Builder.build);
  CallInUIThread(
    procedure
    begin
      FBMMap.setMapStatus(MapStatusUpdate);
    end);
end;

procedure TAndroidBaiduMapViewService.DoShowBaiduMap;
begin
  InitInstance;

end;

procedure TAndroidBaiduMapViewService.DoUpdateBaiduMapFromControl;
begin
  CallInUiThread(RealignView);
end;

function TAndroidBaiduMapViewService.GetMapObject<T>(const Key: Integer): T;
var
  TmpResult: TMapObjectBase;
begin
  if FMapObjects.TryGetValue(Key, TmpResult) then
    try
      Result := TmpResult as T;
    except
      on EInvalidCast do
        Result := nil;
    end;


end;

procedure TAndroidBaiduMapViewService.InitInstance;
var
  Rect: JRect;
begin
  CallInUIThread(
    procedure
    begin
      FJNativeLayout := TJNativeLayout.JavaClass.init(SharedActivity,
        MainActivity.getWindow.getDecorView.getWindowToken);
      FMapView := TJMapView.JavaClass.init(SharedActivityContext);
      FBMMap := FMapView.getMap;
      //注册Marker 点击事件
      FOnMarkerClickListener:=TOnMarkerClickListener.Create(Self);
      FBMMap.setOnMarkerClickListener(FOnMarkerClickListener);

      Rect := TJRect.JavaClass.init(0, 0, Round(Control.Size.Height),
        Round(Control.Size.Width));
      FMapView.requestFocus(0, Rect);
      FJNativeLayout.setPosition(0, 0);
      FJNativeLayout.setSize(Round(Control.Size.Height), Round(Control.Size.Width));
      FJNativeLayout.setControl(FMapView);
      RealignView;
    end);

end;

procedure TAndroidBaiduMapViewService.PutMapObject<T>(const Key: Integer;
  const MapObject: T);
var
  MObject: TMapObjectBase;
begin
  if FMapObjects.TryGetValue(Key, MObject) then
    FMapObjects[Key] := MapObject
  else
    FMapObjects.Add(Key, MapObject);

end;

procedure TAndroidBaiduMapViewService.RealignView;
const
  MapExtraSpace = 100;
  // To be sure that destination rect will fit to fullscreen
var
  MapRect: TRectF;
  RoundedRect: TRect;
  LSizeF: TPointF;
  LRealBounds: TRectF;
  LRealPosition, LRealSize: TPointF;
begin
  if (FJNativeLayout <> nil) then
  begin
    LRealPosition := Control.LocalToAbsolute(TPointF.Zero) * Scale;
    LSizeF := TPointF.Create(Control.Size.Size.cx, Control.Size.Size.cy);
    LRealSize := Control.LocalToAbsolute(LSizeF) * Scale;
    LRealBounds := TRectF.Create(LRealPosition, LRealSize);
    MapRect := TRectF.Create(0, 0, Control.Width * MapExtraSpace,
      Control.Height * MapExtraSpace);
    RoundedRect := MapRect.FitInto(LRealBounds).Round;

    if not Control.ParentedVisible then
      RoundedRect.Left := Round(Screen.Size.cx * Scale);
    FJNativeLayout.setPosition(RoundedRect.TopLeft.X, RoundedRect.TopLeft.Y);
    FJNativeLayout.setSize(RoundedRect.Width, RoundedRect.Height);
  end;

end;

procedure TAndroidBaiduMapViewService.RemoveMapObject(const Key: Integer);
begin
  FMapObjects.Remove(Key);
end;


{ TAndroidMapMarker }

constructor TAndroidMapMarker.Create(const Descriptor: TMapMarkerDescriptor);
begin
  inherited;

end;

destructor TAndroidMapMarker.Destroy;
begin
  Remove;
  inherited;
end;

procedure TAndroidMapMarker.Remove;
begin
  inherited;
  TUIThreadCaller.InvokeIfNotNil<JMarker>(procedure (M: JMarker)
    begin
      M.remove;
    end, FJavaMarker);
  FMapView.RemoveMapObject(FJavaMarker.hashCode);
end;

procedure TAndroidMapMarker.SetHostView(MapView: TAndroidBaiduMapViewService);
begin
  FMapView:=MapView;
end;

procedure TAndroidMapMarker.SetJMarker(Marker: JMarker);
begin
  FJavaMarker := Marker;
end;

procedure TAndroidMapMarker.SetVisible(const Value: Boolean);
begin
  inherited;
  TUIThreadCaller.InvokeIfNotNil<JMarker>(
    procedure (M: JMarker) begin
      M.setVisible(Value);
    end, FJavaMarker);

end;

{ TAndroidMapCircle }

destructor TAndroidMapCircle.Destroy;
begin
  Remove;
  inherited;
end;

procedure TAndroidMapCircle.Remove;
begin
  inherited;
  TUIThreadCaller.InvokeIfNotNil<JCircle>(
    procedure (C: JCircle) begin
      C.remove;
    end, FJavaCircle);
  FMapView.RemoveMapObject(FJavaCircle.hashCode);
end;

procedure TAndroidMapCircle.SetHostView(MapView: TAndroidBaiduMapViewService);
begin
  FMapView := MapView;
end;

procedure TAndroidMapCircle.SetJCircle(Circle: JCircle);
begin
  FJavaCircle := Circle;
end;

procedure TAndroidMapCircle.SetVisible(const Value: Boolean);
begin
  inherited;
  TUIThreadCaller.InvokeIfNotNil<JCircle>(
    procedure (C: JCircle) begin
      C.setVisible(Value)
    end, FJavaCircle);
end;

{ TAndroidMapPolygon }

destructor TAndroidMapPolygon.Destroy;
begin
  Remove;
  inherited;
end;

procedure TAndroidMapPolygon.Remove;
begin
  inherited;
  TUIThreadCaller.InvokeIfNotNil<JPolygon>(
    procedure (P: JPolygon) begin
      P.remove;
    end, FJavaPolygon);
  FMapView.RemoveMapObject(FJavaPolygon.hashCode);
end;

procedure TAndroidMapPolygon.SetHostView(MapView: TAndroidBaiduMapViewService);
begin
  FMapView := MapView;
end;

procedure TAndroidMapPolygon.SetJPolygon(Polygon: JPolygon);
begin
  FJavaPolygon := Polygon;
end;

procedure TAndroidMapPolygon.SetVisible(const Value: Boolean);
begin
  inherited;
  TUIThreadCaller.InvokeIfNotNil<JPolygon>(
    procedure (P: JPolygon) begin
      P.setVisible(Value);
    end, FJavaPolygon);
end;

{ TAndroidMapPolyline }

destructor TAndroidMapPolyline.Destroy;
begin
  Remove;
  inherited;
end;

procedure TAndroidMapPolyline.Remove;
begin
  inherited;
  TUIThreadCaller.InvokeIfNotNil<JPolyline>(
    procedure (P: JPolyline) begin
      P.remove;
    end, FJavaPolyline);
  FMapView.RemoveMapObject(FJavaPolyline.hashCode);
end;

procedure TAndroidMapPolyline.SetHostView(MapView: TAndroidBaiduMapViewService);
begin
  FMapView := MapView;
end;

procedure TAndroidMapPolyline.SetJPolyline(Polyline: JPolyline);
begin
  FJavaPolyline := Polyline;
end;

procedure TAndroidMapPolyline.SetVisible(const Value: Boolean);
begin
  inherited;
  TUIThreadCaller.InvokeIfNotNil<JPolyline>(
    procedure (P: JPolyline) begin
      P.setVisible(Value);
    end, FJavaPolyline);
end;

{ TOnMapBaseListener }

constructor TOnMapBaseListener.Create(
  MapViewService: TAndroidBaiduMapViewService);
begin
  inherited Create;
  FViewService:=MapViewService;
end;


{ TOnMapClickListener }

procedure TOnMapClickListener.onMapClick(P1: JLatLng);
begin
  if FViewService<>nil then

end;

function TOnMapClickListener.onMapPoiClick(P1: JMapPoi): Boolean;
begin

end;


{ TOnMarkerClickListener }

function TOnMarkerClickListener.onMarkerClick(P1: JMarker): Boolean;
var
  hashcode:integer;
  P:Pointer;
  Marker:TBaiduMapMarker;
begin
  if (FViewService<>nil) and (P1<>nil) then
  begin
    Marker:=FViewService.GetMapObject<TBaiduMapMarker>(P1.hashCode);
    if Marker<>nil then
      FViewService.DoMarkerClick(Marker);
  end;
end;

{ TOnPolylineClickListener }

function TOnPolylineClickListener.onPolylineClick(P1: JPolyline): Boolean;
begin

end;

end.
