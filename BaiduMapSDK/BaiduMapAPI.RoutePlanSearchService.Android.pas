unit BaiduMapAPI.RoutePlanSearchService.Android;
//author:Xubzhlin
//Email:371889755@qq.com

//百度地图API 线路规划服务 单元
//官方链接:http://lbsyun.baidu.com/
//TAndroidBaiduMapPoiSearchService 百度地图 安卓线路规划服务


interface

uses
  System.Classes, System.Types, FMX.Maps, Androidapi.JNI.JavaTypes, Androidapi.JNI.Embarcadero, Androidapi.JNI.GraphicsContentViewText, Androidapi.JNIBridge,
  Androidapi.JNI.baidu.mapapi.search, Androidapi.JNI.baidu.mapapi.model, BaiduMapAPI.RoutePlanSearchService;

type
  TAndroidBaiduMapRoutePlanSearchService = class;

  TOnGetRoutePlanResultListener = class(TJavaLocal, JOnGetRoutePlanResultListener)
  private
    [weak]FRoutePlanSearchService:TAndroidBaiduMapRoutePlanSearchService;
  public
    procedure onGetWalkingRouteResult(P1: JWalkingRouteResult); cdecl;
    procedure onGetTransitRouteResult(P1: JTransitRouteResult); cdecl;
    procedure onGetMassTransitRouteResult(P1: JMassTransitRouteResult); cdecl;
    procedure onGetDrivingRouteResult(P1: JDrivingRouteResult); cdecl;
    procedure onGetIndoorRouteResult(P1: JIndoorRouteResult); cdecl;
    procedure onGetBikingRouteResult(P1: JBikingRouteResult); cdecl;

    constructor Create(RoutePlanSearchService: TAndroidBaiduMapRoutePlanSearchService);
  end;

  TAndroidBaiduMapRoutePlanSearchService = class(TBaiduMapRoutePlanSearchService)
  private
    FRoutePlanSearch:JRoutePlanSearch;
    FListener:TOnGetRoutePlanResultListener;

    function CreateBikingRoutePlanOption(option:TBikingRoutePlanOption):JBikingRoutePlanOption;
    function CreateDrivingRoutePlanOption(option:TDrivingRoutePlanOption):JDrivingRoutePlanOption;
    function CreateMassTransitRoutePlanOption(option:TMassTransitRoutePlanOption):JMassTransitRoutePlanOption;
    function CreateTransitRoutePlanOption(option:TTransitRoutePlanOption):JTransitRoutePlanOption;
    function CreateIndoorRoutePlanOption(option:TIndoorRoutePlanOption):JIndoorRoutePlanOption;
    function CreateWalkingRoutePlanOption(option:TWalkingRoutePlanOption):JWalkingRoutePlanOption;
  protected
    function DobikingSearch(option:TBikingRoutePlanOption):Boolean; override;
    function DodrivingSearch(option:TDrivingRoutePlanOption):Boolean; override;
    function DomasstransitSearch(option:TMassTransitRoutePlanOption):Boolean; override;
    function DotransitSearch(option:TTransitRoutePlanOption):Boolean; override;
    function DowalkingIndoorSearch(option:TIndoorRoutePlanOption):Boolean; override;
    function DowalkingSearch(option:TWalkingRoutePlanOption):Boolean; override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

//构造节点信息
function CreatePlanNode(Node:TPlanNode):JPlanNode;
function CreateIndoorPlanNode(Node:TIndoorPlanNode):JIndoorPlanNode;

//构造枚举类型
function CreateDrivingTrafficPolicy(DrivingTrafficPolicy:TDrivingTrafficPolicy):JDrivingRoutePlanOption_DrivingTrafficPolicy;
function CreateDrivingPolicy(DrivingPolicy:TDrivingPolicy):JDrivingRoutePlanOption_DrivingPolicy;

function CreateTacticsIncity(TacticsIncity:TTacticsIncity):JMassTransitRoutePlanOption_TacticsIncity;
function CreateTacticsIntercity(TacticsIntercity:TTacticsIntercity):JMassTransitRoutePlanOption_TacticsIntercity;
function CreateTransTypeIntercity(TransTypeIntercity:TTransTypeIntercity):JMassTransitRoutePlanOption_TransTypeIntercity;

function CreateTransitPolicy(TransitPolicy:TTransitPolicy):JTransitRoutePlanOption_TransitPolicy;
implementation

uses
  Androidapi.Helpers;

function CreateIndoorPlanNode(Node:TIndoorPlanNode):JIndoorPlanNode;
begin
  Result:=TJIndoorPlanNode.JavaClass.init(
    TJLatLng.JavaClass.init(Node.location.Latitude, Node.location.Longitude), StringToJString(Node.footer));
end;

function CreatePlanNode(Node:TPlanNode):JPlanNode;
begin
  case Node.&type of
    Location:Result:=TJPlanNode.JavaClass.withLocation(TJLatLng.JavaClass.init(Node.location.Latitude, Node.location.Longitude));
    CityCode:Result:=TJPlanNode.JavaClass.withCityCodeAndPlaceName(Node.cityCode, StringToJString(Node.name));
    City:Result:=TJPlanNode.JavaClass.withCityNameAndPlaceName(StringToJString(Node.cityName), StringToJString(Node.name));
  end;
end;

function CreateDrivingTrafficPolicy(DrivingTrafficPolicy:TDrivingTrafficPolicy):JDrivingRoutePlanOption_DrivingTrafficPolicy;
begin
  case DrivingTrafficPolicy of
    ROUTE_PATH: Result:=TJDrivingRoutePlanOption_DrivingTrafficPolicy.JavaClass.ROUTE_PATH;
    ROUTE_PATH_AND_TRAFFIC: Result:=TJDrivingRoutePlanOption_DrivingTrafficPolicy.JavaClass.ROUTE_PATH_AND_TRAFFIC;
  end;
end;

function CreateDrivingPolicy(DrivingPolicy:TDrivingPolicy):JDrivingRoutePlanOption_DrivingPolicy;
begin
  case DrivingPolicy of
    ECAR_AVOID_JAM: Result:=TJDrivingRoutePlanOption_DrivingPolicy.JavaClass.ECAR_AVOID_JAM;
    ECAR_DIS_FIRST: Result:=TJDrivingRoutePlanOption_DrivingPolicy.JavaClass.ECAR_DIS_FIRST;
    ECAR_FEE_FIRST: Result:=TJDrivingRoutePlanOption_DrivingPolicy.JavaClass.ECAR_FEE_FIRST;
    ECAR_TIME_FIRST: Result:=TJDrivingRoutePlanOption_DrivingPolicy.JavaClass.ECAR_TIME_FIRST;
  end;
end;

function CreateTacticsIncity(TacticsIncity:TTacticsIncity):JMassTransitRoutePlanOption_TacticsIncity;
begin
  case TacticsIncity of
    ETRANS_LEAST_TIME: Result:=TJMassTransitRoutePlanOption_TacticsIncity.JavaClass.ETRANS_LEAST_TIME;
    ETRANS_LEAST_TRANSFER: Result:=TJMassTransitRoutePlanOption_TacticsIncity.JavaClass.ETRANS_LEAST_TRANSFER;
    ETRANS_LEAST_WALK: Result:=TJMassTransitRoutePlanOption_TacticsIncity.JavaClass.ETRANS_LEAST_WALK;
    ETRANS_NO_SUBWAY: Result:=TJMassTransitRoutePlanOption_TacticsIncity.JavaClass.ETRANS_NO_SUBWAY;
    ETRANS_SUBWAY_FIRST: Result:=TJMassTransitRoutePlanOption_TacticsIncity.JavaClass.ETRANS_SUBWAY_FIRST;
    ETRANS_SUGGEST: Result:=TJMassTransitRoutePlanOption_TacticsIncity.JavaClass.ETRANS_SUGGEST;
  end;
end;

function CreateTacticsIntercity(TacticsIntercity:TTacticsIntercity):JMassTransitRoutePlanOption_TacticsIntercity;
begin
  case TacticsIntercity of
    TTacticsIntercity.ETRANS_LEAST_PRICE: Result:=TJMassTransitRoutePlanOption_TacticsIntercity.JavaClass.ETRANS_LEAST_PRICE;
    TTacticsIntercity.ETRANS_LEAST_TIME: Result:=TJMassTransitRoutePlanOption_TacticsIntercity.JavaClass.ETRANS_LEAST_TIME;
    TTacticsIntercity.ETRANS_START_EARLY: Result:=TJMassTransitRoutePlanOption_TacticsIntercity.JavaClass.ETRANS_START_EARLY;
  end;
end;

function CreateTransTypeIntercity(TransTypeIntercity:TTransTypeIntercity):JMassTransitRoutePlanOption_TransTypeIntercity;
begin
  case TransTypeIntercity of
    ETRANS_COACH_FIRST: Result:=TJMassTransitRoutePlanOption_TransTypeIntercity.JavaClass.ETRANS_COACH_FIRST;
    ETRANS_PLANE_FIRST: Result:=TJMassTransitRoutePlanOption_TransTypeIntercity.JavaClass.ETRANS_PLANE_FIRST;
    ETRANS_TRAIN_FIRST: Result:=TJMassTransitRoutePlanOption_TransTypeIntercity.JavaClass.ETRANS_TRAIN_FIRST;
  end;
end;

function CreateTransitPolicy(TransitPolicy:TTransitPolicy):JTransitRoutePlanOption_TransitPolicy;
begin
  case TransitPolicy of
    EBUS_NO_SUBWAY: Result:=TJTransitRoutePlanOption_TransitPolicy.JavaClass.EBUS_NO_SUBWAY;
    EBUS_TIME_FIRST: Result:=TJTransitRoutePlanOption_TransitPolicy.JavaClass.EBUS_TIME_FIRST;
    EBUS_TRANSFER_FIRST: Result:=TJTransitRoutePlanOption_TransitPolicy.JavaClass.EBUS_TRANSFER_FIRST;
    EBUS_WALK_FIRST: Result:=TJTransitRoutePlanOption_TransitPolicy.JavaClass.EBUS_WALK_FIRST;
  end;
end;

{ TAndroidBaiduMapRoutePlanSearchService }

constructor TAndroidBaiduMapRoutePlanSearchService.Create;
begin
  FRoutePlanSearch:= TJRoutePlanSearch.JavaClass.newInstance;
  FListener:=TOnGetRoutePlanResultListener.Create(Self);
  FRoutePlanSearch.setOnGetRoutePlanResultListener(FListener);
end;

function TAndroidBaiduMapRoutePlanSearchService.CreateBikingRoutePlanOption(
  option: TBikingRoutePlanOption): JBikingRoutePlanOption;
var
  PlanOption:JBikingRoutePlanOption;
begin
  PlanOption:=TJBikingRoutePlanOption.JavaClass.init
  .from(CreatePlanNode(option.from))
  .&to(CreatePlanNode(option.&to));
end;

function TAndroidBaiduMapRoutePlanSearchService.CreateDrivingRoutePlanOption(
  option: TDrivingRoutePlanOption): JDrivingRoutePlanOption;
var
  i:integer;
  List:JList;
  PlanOption:JDrivingRoutePlanOption;
begin
  PlanOption:=TJDrivingRoutePlanOption.JavaClass.init
  .from(CreatePlanNode(option.from))
  .&to(CreatePlanNode(option.&to))
  .currentCity(StringToJString(option.CityName))
  .trafficPolicy(CreateDrivingTrafficPolicy(option.trafficPolicy))
  .policy(CreateDrivingPolicy(option.Policy));

  //途经点
  if Length(option.wayPoints)>0 then
  begin
    List:=TJList.Create;
    for i := 0 to Length(option.wayPoints)-1 do
    begin
      List.add(CreatePlanNode(option.wayPoints[i]));
    end;
    PlanOption.passBy(List);
  end;
end;

function TAndroidBaiduMapRoutePlanSearchService.CreateIndoorRoutePlanOption(
  option: TIndoorRoutePlanOption): JIndoorRoutePlanOption;
var
  PlanOption:JIndoorRoutePlanOption;
begin
  PlanOption:=TJIndoorRoutePlanOption.JavaClass.init
  .from(CreateIndoorPlanNode(option.from))
  .&to(CreateIndoorPlanNode(option.&to));
end;

function TAndroidBaiduMapRoutePlanSearchService.CreateMassTransitRoutePlanOption(
  option: TMassTransitRoutePlanOption): JMassTransitRoutePlanOption;
var
  PlanOption:JMassTransitRoutePlanOption;
begin
  PlanOption:=TJMassTransitRoutePlanOption.JavaClass.init
  .from(CreatePlanNode(option.from))
  .&to(CreatePlanNode(option.&to))
  .coordType(StringToJString(option.CoordType))
  .tacticsIncity(CreateTacticsIncity(option.TacticsIncity))
  .tacticsIntercity(CreateTacticsIntercity(option.TacticsIntercity))
  .transtypeintercity(CreateTransTypeIntercity(option.TransTypeIntercity))
  .pageSize(option.PageSize)
  .pageIndex(option.PageIndex);
end;

function TAndroidBaiduMapRoutePlanSearchService.CreateTransitRoutePlanOption(
  option: TTransitRoutePlanOption): JTransitRoutePlanOption;
var
  PlanOption:JTransitRoutePlanOption;
begin
  PlanOption:=TJTransitRoutePlanOption.JavaClass.init
  .from(CreatePlanNode(option.from))
  .&to(CreatePlanNode(option.&to))
  .city(StringToJString(option.CityName))
  .policy(CreateTransitPolicy(option.Policy))

end;

function TAndroidBaiduMapRoutePlanSearchService.CreateWalkingRoutePlanOption(
  option: TWalkingRoutePlanOption): JWalkingRoutePlanOption;
var
  PlanOption:JWalkingRoutePlanOption;
begin
  PlanOption:=TJWalkingRoutePlanOption.JavaClass.init
  .from(CreatePlanNode(option.from))
  .&to(CreatePlanNode(option.&to));
end;

destructor TAndroidBaiduMapRoutePlanSearchService.Destroy;
begin
  FListener.Free;
  FRoutePlanSearch.destroy;
  FRoutePlanSearch:=nil;
  inherited;
end;

function TAndroidBaiduMapRoutePlanSearchService.DobikingSearch(
  option: TBikingRoutePlanOption): Boolean;
begin
  Result:=FRoutePlanSearch.bikingSearch(CreateBikingRoutePlanOption(option));
end;

function TAndroidBaiduMapRoutePlanSearchService.DodrivingSearch(
  option: TDrivingRoutePlanOption): Boolean;
begin
  Result:=FRoutePlanSearch.drivingSearch(CreateDrivingRoutePlanOption(option));
end;

function TAndroidBaiduMapRoutePlanSearchService.DomasstransitSearch(
  option: TMassTransitRoutePlanOption): Boolean;
begin
  Result:=FRoutePlanSearch.masstransitSearch(CreateMassTransitRoutePlanOption(option));
end;

function TAndroidBaiduMapRoutePlanSearchService.DotransitSearch(
  option: TTransitRoutePlanOption): Boolean;
begin
  Result:=FRoutePlanSearch.transitSearch(CreateTransitRoutePlanOption(option));
end;

function TAndroidBaiduMapRoutePlanSearchService.DowalkingIndoorSearch(
  option: TIndoorRoutePlanOption): Boolean;
begin
  Result:=FRoutePlanSearch.walkingIndoorSearch(CreateIndoorRoutePlanOption(option));
end;

function TAndroidBaiduMapRoutePlanSearchService.DowalkingSearch(
  option: TWalkingRoutePlanOption): Boolean;
begin
  Result:=FRoutePlanSearch.walkingSearch(CreateWalkingRoutePlanOption(option));
end;

{ TOnGetRoutePlanResultListener }

constructor TOnGetRoutePlanResultListener.Create(
  RoutePlanSearchService: TAndroidBaiduMapRoutePlanSearchService);
begin
  FRoutePlanSearchService:=RoutePlanSearchService;
end;

procedure TOnGetRoutePlanResultListener.onGetBikingRouteResult(
  P1: JBikingRouteResult);
begin

end;

procedure TOnGetRoutePlanResultListener.onGetDrivingRouteResult(
  P1: JDrivingRouteResult);
begin

end;

procedure TOnGetRoutePlanResultListener.onGetIndoorRouteResult(
  P1: JIndoorRouteResult);
begin

end;

procedure TOnGetRoutePlanResultListener.onGetMassTransitRouteResult(
  P1: JMassTransitRouteResult);
begin

end;

procedure TOnGetRoutePlanResultListener.onGetTransitRouteResult(
  P1: JTransitRouteResult);
begin

end;

procedure TOnGetRoutePlanResultListener.onGetWalkingRouteResult(
  P1: JWalkingRouteResult);
begin

end;

end.
