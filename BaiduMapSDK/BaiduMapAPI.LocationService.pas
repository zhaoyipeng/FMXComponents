unit BaiduMapAPI.LocationService;
//author:Xubzhlin
//Email:371889755@qq.com

//百度地图API 定位服务 单元
//官方链接:http://lbsyun.baidu.com/
//TAndroidBaiduMapLocationService 百度地图 定位服务

interface

uses FMX.Maps;

type
  TOnUserLocationWillChanged = procedure(Sender:TObject; UserLocation:TMapCoordinate) of object;

  IBaiduMapLocationService = interface
    ['{71804C20-5F9E-4487-BE8D-DE833B68F071}']
    procedure InitLocation;
    procedure StarLocation;
    procedure StopLocation;
  end;

  TBaiduMapLocationService = class(TInterfacedObject, IBaiduMapLocationService)
  private
    FUserLocation:TMapCoordinate;
    FOnUserLocationWillChanged:TOnUserLocationWillChanged;

  protected
    procedure DoInitLocation; virtual;  abstract;
    procedure DoStarLocation; virtual;  abstract;
    procedure DoStopLocation; virtual;  abstract;

    procedure UserLocationWillChanged(Coordinate:TMapCoordinate);
  public
    procedure InitLocation;
    procedure StarLocation;
    procedure StopLocation;

    constructor Create; virtual;
    destructor Destroy; override;

    property UserLocation:TMapCoordinate read FUserLocation;
    property OnUserLocationWillChanged:TOnUserLocationWillChanged read FOnUserLocationWillChanged write FOnUserLocationWillChanged;
  end;

  TBaiduMapLocation = class(TObject)
  private
    FLocationService:TBaiduMapLocationService;
  public
    constructor Create;
    destructor Destroy; override;

    property LocationService:TBaiduMapLocationService read FLocationService;
  end;


implementation

{$IFDEF IOS}
uses
  BaiduMapAPI.LocationService.iOS;
{$ENDIF}
{$IFDEF ANDROID}
uses
  BaiduMapAPI.LocationService.Android;
{$ENDIF ANDROID}

{ TBaiduMapLocationService }

constructor TBaiduMapLocationService.Create;
begin
  inherited Create;
end;

destructor TBaiduMapLocationService.Destroy;
begin

  inherited;
end;

procedure TBaiduMapLocationService.InitLocation;
begin
  DoInitLocation;
end;

procedure TBaiduMapLocationService.StarLocation;
begin
  DoStarLocation;
end;

procedure TBaiduMapLocationService.StopLocation;
begin
  DoStopLocation;
end;

procedure TBaiduMapLocationService.UserLocationWillChanged(
  Coordinate: TMapCoordinate);
begin
  if Assigned(FOnUserLocationWillChanged) then
    FOnUserLocationWillChanged(Self, Coordinate);
  //更新用户位置
  FUserLocation:=Coordinate;
end;


{ TBaiduMapLocation }

constructor TBaiduMapLocation.Create;
begin
  inherited Create;
{$IFDEF IOS}
  FLocationService:=TiOSBaiduMapLocationService.Create;
{$ENDIF}
{$IFDEF ANDROID}
  FLocationService:=TAndroidBaiduMapLocationService.Create;
{$ENDIF ANDROID}
end;

destructor TBaiduMapLocation.Destroy;
begin
  FLocationService.Free;
  inherited;
end;

end.
