unit BaiduMapAPI.ViewService;
//author:Xubzhlin
//Email:371889755@qq.com

//百度地图API 服务 单元
//官方链接:http://lbsyun.baidu.com/

//TBaiduMapViewService 百度地图 地图服务

interface

uses System.Classes, System.SysUtils, System.Types,
   FMX.Platform, FMX.Controls, FMX.Maps;

type

  TBaiduMapMarker = class(TMapMarker)
    Data:Pointer;
  end;

  TOnBaiduMapMarkerClick = procedure(Sender:TObject; Marker:TBaiduMapMarker) of object;

  TBaiduMapView = class;

  IBaiduMapBaseService = interface
    ['{CFB73BF8-5A30-4D2B-AB0D-CC48656E36DA}']
    procedure SetControl(const Value: TBaiduMapView);
    function GetControl:TBaiduMapView;
  end;


  IBaiduMapViewService = interface(IBaiduMapBaseService)
    ['{2C200D6D-DA0B-469B-80A5-888EC1EDA415}']
    procedure ShowBaiduMap;
    procedure UpdateBaiduMapFromControl;
    //通过 增加 Maker
    function AddMarker(const Descriptor: TMapMarkerDescriptor): TBaiduMapMarker;
    //通过 绘制 轨迹
    function AddPolyline(const Descriptor: TMapPolylineDescriptor): TMapPolyline;
    //通过 绘制 轨迹
    function AddPolygon(const Descriptor: TMapPolygonDescriptor): TMapPolygon;
    //通过 绘制 圆形
    function AddCircle(const Descriptor: TMapCircleDescriptor): TMapCircle;
    //设置 地图的中心位置
    procedure SetCenterCoordinate(const Coordinate:TMapCoordinate);
    //设置 当前mapView缩放
    procedure SetZoomLevel(Level:Single);
  end;

  TBaiduMapBaseService = class(TInterfacedObject, IBaiduMapBaseService)
  private
    FControl: TBaiduMapView;
    procedure SetControl(const Value: TBaiduMapView);
    function GetControl:TBaiduMapView;
    procedure SetVisible(const Value: Boolean);
  protected
    procedure DoSetControl; virtual; abstract;
    procedure DoSetVisible(const Value: Boolean); virtual; abstract;
  public
    procedure DoMarkerClick(const Marker: TBaiduMapMarker);
    property Control:TBaiduMapView read FControl;
    property Visible:Boolean write SetVisible;
  end;

  TBaiduMapViewService = class;

  TBaiduMapView = class(TControl)
  private
    FOnMakerClick:TOnBaiduMapMarkerClick;
    FBaiduMapViewService:TBaiduMapViewService;
    procedure UpdateBaiduMapView;

  protected
    procedure AncestorVisibleChanged(const Visible: Boolean); override;
    procedure ParentChanged; override;
    procedure DoAbsoluteChanged; override;
    procedure Move; override;
    procedure Resize; override;
    procedure Paint; override;
    procedure Show; override;
    procedure Hide; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    procedure ShowBaiduMap;
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
  published
    property ViewService: TBaiduMapViewService read FBaiduMapViewService;
    property OnMakerClick:TOnBaiduMapMarkerClick read FOnMakerClick write FOnMakerClick;
    property Size;
    property Align;
    property Anchors;
    property Height;
    property Padding;
    property Margins;
    property Position;
    property Visible default True;
    property Width;
  end;

  TBaiduMapViewService = class(TBaiduMapBaseService, IBaiduMapViewService)
  private
    FAppKey:String;
    FScale: Single;
  protected
    procedure DoSetControl; override;
    procedure DoShowBaiduMap; virtual;  abstract;
    procedure DoUpdateBaiduMapFromControl; virtual;  abstract;
    function DoAddMarker(const Descriptor: TMapMarkerDescriptor): TBaiduMapMarker;  virtual;  abstract;
    function DoAddPolyline(const Descriptor: TMapPolylineDescriptor):TMapPolyline; virtual;  abstract;
    function DoAddPolygon(const Descriptor: TMapPolygonDescriptor):TMapPolygon; virtual;  abstract;
    function DoAddCircle(const Descriptor: TMapCircleDescriptor): TMapCircle; virtual;  abstract;
    procedure DoSetCenterCoordinate(const Coordinate:TMapCoordinate); virtual;  abstract;
    procedure DoSetZoomLevel(Level:Single); virtual;  abstract;
  public
    procedure ShowBaiduMap;
    procedure UpdateBaiduMapFromControl;

    function AddMarker(const Descriptor: TMapMarkerDescriptor): TBaiduMapMarker;
    function AddPolyline(const Descriptor: TMapPolylineDescriptor): TMapPolyline;
    function AddPolygon(const Descriptor: TMapPolygonDescriptor):TMapPolygon;
    function AddCircle(const Descriptor: TMapCircleDescriptor): TMapCircle;
    procedure SetCenterCoordinate(const Coordinate:TMapCoordinate);
    procedure SetZoomLevel(Level:Single);

    constructor Create(AKey:String); virtual;
    destructor Destroy; override;

    property AppKey:String read FAppKey;
    property Scale:Single read FScale;
  end;

 
implementation

{$IFDEF IOS}
uses
  BaiduMapAPI.SDKInitializer, BaiduMapAPI.ViewService.iOS;
{$ENDIF}
{$IFDEF ANDROID}
uses
  BaiduMapAPI.SDKInitializer, BaiduMapAPI.ViewService.Android;
{$ENDIF ANDROID}

{ TBaiduMapView }

procedure TBaiduMapView.AncestorVisibleChanged(const Visible: Boolean);
begin
  inherited;
  UpdateBaiduMapView;
end;

constructor TBaiduMapView.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  {$IFDEF IOS}
    FBaiduMapViewService:=TiOSBaiduMapViewService.Create(TSDKInitializer.AppKey);
  {$ENDIF}
  {$IFDEF ANDROID}
    FBaiduMapViewService:=TAndroidBaiduMapViewService.Create(TSDKInitializer.AppKey);
  {$ENDIF ANDROID}
  FBaiduMapViewService.SetControl(Self);
end;

destructor TBaiduMapView.Destroy;
begin
  if FBaiduMapViewService <> nil then
    FBaiduMapViewService.SetControl(nil);
  FBaiduMapViewService:=nil;
  inherited;
end;

procedure TBaiduMapView.DoAbsoluteChanged;
begin
  inherited;
  UpdateBaiduMapView;
end;

procedure TBaiduMapView.Hide;
begin
  inherited;
  UpdateBaiduMapView;
end;

procedure TBaiduMapView.Move;
begin
  inherited;
  UpdateBaiduMapView;
end;

procedure TBaiduMapView.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  {
  if (Operation = opRemove) and (AComponent = FBaiduMapView) then
    BaiduMapView := nil;
  }
end;

procedure TBaiduMapView.Paint;
begin
  inherited;
  if (csDesigning in ComponentState) and not Locked and not FInPaintTo then
    DrawDesignBorder;
end;

procedure TBaiduMapView.ParentChanged;
begin
  inherited;
  UpdateBaiduMapView;
end;

procedure TBaiduMapView.Resize;
begin
  inherited;
  UpdateBaiduMapView;
end;

procedure TBaiduMapView.Show;
begin
  inherited;
  UpdateBaiduMapView;
end;

procedure TBaiduMapView.ShowBaiduMap;
begin
  FBaiduMapViewService.ShowBaiduMap;
end;

procedure TBaiduMapView.UpdateBaiduMapView;
begin
  if (FBaiduMapViewService <> nil) then
    FBaiduMapViewService.UpdateBaiduMapFromControl;
end;


{ TBaiduMapBaseService }

procedure TBaiduMapBaseService.DoMarkerClick(const Marker: TBaiduMapMarker);
begin
  if (Control<>nil) and Assigned(Control.OnMakerClick) then
  begin
    Control.OnMakerClick(Self, Marker);
  end;
end;

function TBaiduMapBaseService.GetControl: TBaiduMapView;
begin
  Result:=FControl;
end;

procedure TBaiduMapBaseService.SetControl(const Value: TBaiduMapView);
begin
  FControl:=Value;
  DoSetControl;
end;

procedure TBaiduMapBaseService.SetVisible(const Value: Boolean);
begin
  DoSetVisible(Value);
end;

{ TBaiduMapViewService }

function TBaiduMapViewService.AddCircle(
  const Descriptor: TMapCircleDescriptor): TMapCircle;
begin
  Result:=DoAddCircle(Descriptor);
end;

function TBaiduMapViewService.AddMarker(
  const Descriptor: TMapMarkerDescriptor): TBaiduMapMarker;
begin
  Result:=DoAddMarker(Descriptor);
end;

function TBaiduMapViewService.AddPolygon(
  const Descriptor: TMapPolygonDescriptor): TMapPolygon;
begin
  Result:=DoAddPolygon(Descriptor);
end;

function TBaiduMapViewService.AddPolyline(
  const Descriptor: TMapPolylineDescriptor): TMapPolyline;
begin
  Result:=DoAddPolyline(Descriptor);
end;

constructor TBaiduMapViewService.Create(AKey: String);
var
  ScreenSrv:IFMXScreenService;
begin
  inherited Create;
  FAppKey:=AKey;

  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService,
    ScreenSrv) then
    FScale := ScreenSrv.GetScreenScale
  else
    FScale := 1;
end;

destructor TBaiduMapViewService.Destroy;
begin
  inherited;
end;

procedure TBaiduMapViewService.DoSetControl;
begin
  if FControl<>nil then
    UpdateBaiduMapFromControl;
end;

procedure TBaiduMapViewService.ShowBaiduMap;
begin
  DoShowBaiduMap;
end;


procedure TBaiduMapViewService.UpdateBaiduMapFromControl;
begin
  DoUpdateBaiduMapFromControl;
end;

procedure TBaiduMapViewService.SetCenterCoordinate(
  const Coordinate: TMapCoordinate);
begin
  DoSetCenterCoordinate(Coordinate);
end;

procedure TBaiduMapViewService.SetZoomLevel(Level: Single);
begin
  DoSetZoomLevel(Level);
end;


end.
