unit BaiduMapAPI.LocationService.iOS;
//author:Xubzhlin
//Email:371889755@qq.com

//百度地图API 定位服务 单元
//官方链接:http://lbsyun.baidu.com/
//TiOSBaiduMapLocationService 百度地图 iOS定位服务

interface

uses
  System.Classes, FMX.Maps, Macapi.ObjectiveC, Macapi.ObjCRuntime, iOSapi.CoreLocation,
  iOSapi.Foundation, iOSapi.BaiduMapAPI_Base, iOSapi.BaiduMapAPI_Location, BaiduMapAPI.LocationService;

type
  TiOSBaiduMapLocationService = class;

  TBMKLocationServiceDelegate = class(TOCLocal, BMKLocationServiceDelegate)
  private
    [Weak] FLocationService: TiOSBaiduMapLocationService;
  public
    constructor Create(const LocationService: TiOSBaiduMapLocationService);

    procedure willStartLocatingUser; cdecl;
    procedure didStopLocatingUser; cdecl;
    procedure didUpdateUserHeading(userLocation: BMKUserLocation); cdecl;
    procedure didUpdateBMKUserLocation(userLocation: BMKUserLocation); cdecl;
    procedure didFailToLocateUserWithError(error: NSError); cdecl;
  end;

  TiOSBaiduMapLocationService = class(TBaiduMapLocationService)
  private
    FLocationService:BMKLocationService;
    FLocationDelegate:TBMKLocationServiceDelegate;
  protected
    procedure DoInitLocation; override;
    procedure DoStarLocation; override;
    procedure DoStopLocation; override;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TiOSBaiduMapLocationService }

constructor TiOSBaiduMapLocationService.Create;
begin
  inherited;
  FLocationService:=TBMKLocationService.Wrap(TBMKLocationService.Alloc.init);
  FLocationService.retain;
  FLocationDelegate:=TBMKLocationServiceDelegate.Create(Self);
  FLocationService.setDelegate(FLocationDelegate.GetObjectID);
end;

destructor TiOSBaiduMapLocationService.Destroy;
begin

  inherited;
end;

procedure TiOSBaiduMapLocationService.DoInitLocation;
begin
//  inherited;
//
//
//  LocationParam:=TBMKLocationViewDisplayParam.Wrap(TBMKLocationViewDisplayParam.Alloc.init);
//  if (LocationParam<>nil) then
//  begin
//    LocationParam.setIsRotateAngleValid(IsRotateAngleValid);
//    LocationParam.setLocationViewImgName(StrToNSStr(LocationViewImgName));
//    //TiOSBaiduMapView(Control.BaiduMapView).FMapView.updateLocationViewWithParam(LocationParam);
//  end;
end;

procedure TiOSBaiduMapLocationService.DoStarLocation;
begin
  FLocationService.startUserLocationService;
end;

procedure TiOSBaiduMapLocationService.DoStopLocation;
begin
  FLocationService.stopUserLocationService;
end;

{ TBMKLocationServiceDelegate }

constructor TBMKLocationServiceDelegate.Create(
  const LocationService: TiOSBaiduMapLocationService);
begin
  inherited Create;
  FLocationService:=LocationService;
end;

procedure TBMKLocationServiceDelegate.didFailToLocateUserWithError(
  error: NSError);
begin

end;

procedure TBMKLocationServiceDelegate.didStopLocatingUser;
begin

end;

procedure TBMKLocationServiceDelegate.didUpdateBMKUserLocation(
  userLocation: BMKUserLocation);
var
  Coordinate:TMapCoordinate;
begin
  //位置更新
  if FLocationService<>nil then
  begin
    Coordinate:= TMapCoordinate(userLocation.location.coordinate);
    FLocationService.UserLocationWillChanged(Coordinate);
  end;
end;

procedure TBMKLocationServiceDelegate.didUpdateUserHeading(
  userLocation: BMKUserLocation);
var
  Coordinate:TMapCoordinate;
begin
  //位置更新
  if FLocationService<>nil then
  begin
    Coordinate:= TMapCoordinate(userLocation.location.coordinate);
    FLocationService.UserLocationWillChanged(Coordinate);
  end;
end;

procedure TBMKLocationServiceDelegate.willStartLocatingUser;
begin

end;

end.
