unit BaiduMapAPI.RoutePlanSearchService;
//author:Xubzhlin
//Email:371889755@qq.com

//百度地图API 线路规划服务 公共单元
//官方链接:http://lbsyun.baidu.com/

interface

uses
  System.Generics.Collections, FMX.Maps, BaiduMapAPI.Search.CommTypes;

type
  TDrivingPolicy = (
    ECAR_AVOID_JAM,//驾车策略： 躲避拥堵
    ECAR_DIS_FIRST,//驾乘检索策略常量：最短距离
    ECAR_FEE_FIRST,//驾乘检索策略常量：较少费用
    ECAR_TIME_FIRST//驾乘检索策略常量：时间优先
  );

  TDrivingTrafficPolicy = (
    ROUTE_PATH,//驾车路线不含路况
    ROUTE_PATH_AND_TRAFFIC//驾车路线含路况
  );

  //市内公交换乘策略
  TTacticsIncity = (
    ETRANS_LEAST_TIME,//时间短
    ETRANS_LEAST_TRANSFER,//少换乘
    ETRANS_LEAST_WALK,//少步行
    ETRANS_NO_SUBWAY,//不坐地铁
    ETRANS_SUBWAY_FIRST,//地铁优先
    ETRANS_SUGGEST//推荐
  );

{$SCOPEDENUMS ON}
  //跨城公交换乘策略
  TTacticsIntercity = (
    ETRANS_LEAST_PRICE,//价格低
    ETRANS_LEAST_TIME,//时间短
    ETRANS_START_EARLY//出发早
  );
{$SCOPEDENUMS OFF}

  //跨城交通方式策略
  TTransTypeIntercity = (
    ETRANS_COACH_FIRST,//大巴优先
    ETRANS_PLANE_FIRST,//飞机优先
    ETRANS_TRAIN_FIRST//火车优先
  );

  //换成策略
  TTransitPolicy = (
    EBUS_NO_SUBWAY,//公交检索策略常量：不含地铁
    EBUS_TIME_FIRST,//公交检索策略常量：时间优先
    EBUS_TRANSFER_FIRST,//公交检索策略常量：最少换乘
    EBUS_WALK_FIRST//公交检索策略常量：最少步行距离
  );

  //结点类型
  TPlanNodeType = (
    Location,   //坐标确定结点
    CityCode,   //城市编码和地名确定结点
    City        //城市名称和地名确定结点
  );

  //结点
  TPlanNode = record
    &type:TPlanNodeType;
    location:TMapCoordinate;
    cityCode:Integer;
    cityName:string;
    name:string;
  end;

  //室内结点
  TIndoorPlanNode = record
    footer:string;
    location:TMapCoordinate;
  end;

  //线路规划参数 基础类
  TRoutePlanOption = class(TObject)
   from:TPlanNode;
   &to:TPlanNode;
  end;

  //骑行 规划参数
  TBikingRoutePlanOption = class(TRoutePlanOption)
  end;

  //驾车 规划参数
  TDrivingRoutePlanOption = class(TRoutePlanOption)
    CityName:string;
    Policy:TDrivingPolicy;
    trafficPolicy:TDrivingTrafficPolicy;
    wayPoints:TArray<TPlanNode>;
  end;

  //室内 规划参数
  TIndoorRoutePlanOption = class(TObject)
   from:TIndoorPlanNode;
   &to:TIndoorPlanNode;
  end;

  //公共交通换乘 规划参数
  TMassTransitRoutePlanOption = class(TRoutePlanOption)
    CoordType:string;
    PageIndex:integer;
    PageSize:Integer;
    TacticsIncity:TTacticsIncity;
    TacticsIntercity:TTacticsIntercity;
    TransTypeIntercity:TTransTypeIntercity;
  end;

  //同城公共交通换乘 规划参数
  TTransitRoutePlanOption = class(TRoutePlanOption)
    CityName:string;
    Policy:TTransitPolicy;
  end;

  //步行规划参数
  TWalkingRoutePlanOption = class(TRoutePlanOption)
  end;

  TRouteNode = record
    Location:TMapCoordinate;//获取标题
    Title:String;//标题
    Uid:String;//当节点同时为POI时可用
  end;

  //路线中的一个路段
  TRouteStep = class(TObject)
    WayPoints:TList<TMapCoordinate>; //路段所经过的地理坐标集合
    Distance:Integer; //路段长度 单位:米
    Duration:Integer; //路段耗时 单位:秒
    constructor Create; virtual;
    destructor Destroy; override;
  end;

  //路线数据结构的基类,表示一条路线，路线可能包括：路线规划中的换乘/驾车/步行路线
  //此类为路线数据结构的基类，一般关注其子类对象即可，无需直接生成该类对象
  TRouteLine<T:class> = class(TObject)
    &type:TRouteLineType;    //类型
    Steps:TObjectList<T>; //所有线路
    Distance:Integer; //路线长度
    Duration:Integer; //路线耗时
    Starting:TRouteNode;//起点信息
    Terminal:TRouteNode;//终点信息
    Title:string; //线路名称

    constructor Create; virtual;
    destructor Destroy; override;
  end;

  TSuggestAddrInfo = record
    SuggestEndCity:TArray<TCityInfo>;//终点城市列表，如果输入地点在当前城市没有找到，但在其他城市找，则返回拥有该地点信息的城市列表。
    SuggestEndNode:TArray<TPoiInfo>; //终点地址选择列表,当终点信息有歧义时填充。
    SuggestStartCity:TArray<TCityInfo>;//起点城市列表，如果输入地点在当前城市没有找到，但在其他城市找，则返回拥有该地点信息的城市列表。
    SuggestStartNode:TArray<TPoiInfo>;//起点地址选择列表,当起点信息歧义时填充。
  end;

  //骑行线路中的一个路段
  TBikingStep = class(TRouteStep)
    Direction:Integer;  //该路段起点方向值
    Entrance:TRouteNode;//路段起点信息
    EntranceInstructions:string; //路段入口提示信息
    &Exit:TRouteNode;   //路段终点信息
    ExitInstructions:string; //路段出口指示信息
    Instructions:string; //路段整体指示信息
  end;

  //一条 骑行路线
  TBikingRouteLine = class(TRouteLine<TBikingStep>)
  end;

  TRouteResult<T:class> = class(TSearchResult)
    RouteLines:TObjectList<T>; //取所规划路线
    SuggestAddrInfo:TSuggestAddrInfo;//error 为 ERRORNO#AMBIGUOUS_ROURE_ADDR 时 可通过此接口获取建议信息

    constructor Create;
    destructor Destroy; override;
  end;

  //骑行 规划 回调类
  TBikingRouteResult = class(TRouteResult<TBikingRouteLine>)
  end;

  TTaxiInfo = record
    Desc:string;//路线打车描述信息
    Distance:Integer;//总路程 ， 单位： m
    Duration:Integer;//总耗时，单位： 秒
    PerKMPrice:Double;//每千米单价，单位 元 , 注：此价格为白天价格
    StartPrice:Double;//起步价，单位： 元, 注：此价格为白天价格
    TotalPrice:Double;//总价 , 单位： 元, 注：此价格为白天价格
  end;

  TDrivingStep = class(TRouteStep)
    Direction:Integer;//返回该路段起点方向值
    Entrance:TRouteNode;//路段入口信息
    EntranceInstructions:string;//路段入口的指示信息
    &Exit:TRouteNode;//路段出口信息
    ExitInstructions:string;//路段出口指示信息
    Instructions:string;//路段总体指示信息
    NumTurns:Integer;//路段需要转弯数
    TrafficList:TArray<Integer>;//获取路况数据数组，个数为wayPoints个数-1
    //0：没路况，1：畅通，2：缓慢，3：拥堵
  end;

  //驾车路线
  TDrivingRouteLine = class(TRouteLine<TDrivingStep>)
  end;

  //驾车 规划 回调类
  TDrivingRouteResult = class(TRouteResult<TDrivingRouteLine>)
  end;

  TIndoorStepNode = record
    Detail:string;//获取消息描述信息
    Location:TMapCoordinate;//获取坐标
    Name:string; //
    &Type:string;//获取类型;
  end;

  //描述一个室内步行路段
  TIndoorRouteStep = class(TRouteStep)
    BuildingId:String;//获取建筑物id
    Entrace:TRouteNode;//获取入口
    &Exit:TRouteNode;//获取出口
    FloorId:String;//获取楼层id
    Instructions:String;//获取路段整体指示信息
    StepNodes:TList<TIndoorStepNode>;//获取step中节点
    constructor Create; override;
    destructor Destroy; override;
  end;

  //表示一条室内路线
  TIndoorRouteLine = class(TRouteLine<TIndoorRouteStep>)
  end;

  //室内 步行规划 回调类
  TIndoorRouteResult = class(TRouteResult<TIndoorRouteLine>)
  end;

  TTransitBaseInfo = class(TObject)
    ArriveStation:string;//获取到达站（航班）
    ArriveTime:string;//获取到达时间
    DepartureStation:string;//获取出发站(航班)
    DepartureTime:string;//获取出发时间
    Name:string;//获取名称
  end;

  //公交车信息
  TBusInfo = class(TTransitBaseInfo)
    StopNum:Integer;//获得途经站点数
    &Type:Integer;//获得市内公交的具体类型
  end;

  //大巴车信息
  TCoachInfo = class(TTransitBaseInfo)
    Price:Double;//获取总票价
    ProviderName:string;//获取合作方名称
    ProviderUrl:string;//获取合作方官网地址
  end;

  //航班信息
  TPlaneInfo = class(TTransitBaseInfo)
    Airlines:string;//获取航空公司
    Booking:string;//获取订票网址
    Discount:Double;//获取折扣
    Price:Double;//获取总票价
  end;

  TTrainInfo = class(TTransitBaseInfo)
    Booking:string;//获取订票电话
    Price:Double;//获取总票价
  end;

  TTrafficCondition = record
    TrafficGeoCnt:Integer;//获取此路况的点数
    TrafficStatus:Integer;//获取路况状态，0无路况，1畅通，2缓行，3拥堵，4非常拥堵
  end;

  //表示一个换乘路段
  TMassTransitStep = class(TRouteStep)
    BusInfo:TBusInfo;//获取公交具体信息
    CoachInfo:TCoachInfo;//获取大巴具体信息
    EndLocation:TMapCoordinate;//获取本路段终点
    Instructions:String;//获取该路段换乘说明
    PlaneInfo:TPlaneInfo;//获取飞机具体信息
    StartLocation:TMapCoordinate;//获取本路段起点
    TrafficConditions:TArray<TTrafficCondition>;
    TrainInfo:TTrainInfo;//获取火车具体信息
    VehileType:TStepVehicleInfoType;//获取本路段中交通方式的类型：1火车，2飞机，3公交，4驾车，5步行，6大巴
  end;


  TTransitSteps = TObjectList<TMassTransitStep>;

  //表示一个跨城交通换乘路线，换乘路线将根据既定策略调配多种交通工具。
  //换乘路线可能包含：城市公交路段，地铁路段，步行路段，飞机，大巴
  TMassTransitRouteLine = class(TRouteLine<TMassTransitStep>)
    ArriveTime:string;//获取本线路预计到达时间，格式：2016-04-05T17：06：10
    NewSteps:TObjectList<TTransitSteps>;//返回该线路的step信息
    Price:Double;//获取本线路的总票价（元）
    PriceInfo:TList<TPriceInfo>;//获取车票详细信息

    constructor Create; override;
    destructor Destroy; override;
  end;

  TMassTransitRouteResult = class(TRouteResult<TMassTransitRouteLine>)
    Destination:TTransitResultNode;//终点
    Origin:TTransitResultNode;//起点
    TaxiInfo:TTaxiInfo;//打车信息
    Total:Integer;//所有路线总数
  end;

  TTransitStep = class(TRouteStep)
    Entrance:TRouteNode;//路段入口信息
    &Exit:TRouteNode;//路段出口信息
    Instructions:string;//获取该路段换乘说明
    StepType:TTransitRouteStepType;//获取路段类型
    VehicleInfo:TVehicleInfo;//当路段为公交路段或地铁路段时，可以获取交通工具信息
  end;

  //表示一个换乘路线，换乘路线将根据既定策略调配多种交通工具。
  //换乘路线可能包含：城市公交路段，地铁路段，步行路段
  TTransitRouteLine = class(TRouteLine<TTransitStep>)
  end;

  //换乘路线结果
  TTransitRouteResult = class(TRouteResult<TTransitRouteLine>)
    TaxiInfo:TTaxiInfo;//打车信息
  end;

  //描述一个步行路段
  TWalkingStep = class(TRouteStep)
    Direction:Integer; //该路段起点方向值
    Entrance:TRouteNode; //获取路段起点信息
    EntranceInstructions:string; //获取路段入口提示信息
    &Exit:TRouteNode; //获取路段终点信息
    ExitInstructions:string; //获取路段出口指示信息
    Instructions:string; //获取路段整体指示信息
  end;

  //表示一条步行路线
  TWalkingRouteLine = class(TRouteLine<TWalkingStep>)
  end;

  //表示步行路线结果
  TWalkingRouteResult = class(TRouteResult<TWalkingRouteLine>)
    TaxiInfo:TTaxiInfo;//打车信息
  end;

  //回调
  TOnGetWalkingRouteResult = procedure(Sender:TObject; RouteResult:TWalkingRouteResult) of object;
  TOnGetTransitRouteResult = procedure(Sender:TObject; RouteResult:TTransitRouteResult) of object;
  TOnGetMassTransitRouteResult = procedure(Sender:TObject; RouteResult:TMassTransitRouteResult) of object;
  TOnGetDrivingRouteResult = procedure(Sender:TObject; RouteResult:TDrivingRouteResult) of object;
  TOnGetIndoorRouteResult = procedure(Sender:TObject; RouteResult:TIndoorRouteResult) of object;
  TOnGetBikingRouteResult = procedure(Sender:TObject; RouteResult:TBikingRouteResult) of object;

  IBaiduMapRoutePlanSearchService = interface
  ['{B4FC312B-7205-4887-8589-82DCEB23942C}']
    //发起骑行路线规划
    function bikingSearch(option:TBikingRoutePlanOption):Boolean;
    //发起驾车路线规划
    function drivingSearch(option:TDrivingRoutePlanOption):Boolean;
    //发起跨城公共路线检索
    function masstransitSearch(option:TMassTransitRoutePlanOption):Boolean;
    //发起换乘路线规划
    function transitSearch(option:TTransitRoutePlanOption):Boolean;
    //发起室内路线规划
    function walkingIndoorSearch(option:TIndoorRoutePlanOption):Boolean;
    //发起步行路线规划
    function walkingSearch(option:TWalkingRoutePlanOption):Boolean;
  end;

  TBaiduMapRoutePlanSearchService = class(TInterfacedObject, IBaiduMapRoutePlanSearchService)
  private
    FOnGetWalkingRouteResult:TOnGetWalkingRouteResult;
    FOnGetTransitRouteResult:TOnGetTransitRouteResult;
    FOnGetMassTransitRouteResult:TOnGetMassTransitRouteResult;
    FOnGetDrivingRouteResult:TOnGetDrivingRouteResult;
    FOnGetIndoorRouteResult:TOnGetIndoorRouteResult;
    FOnGetBikingRouteResult:TOnGetBikingRouteResult;
  protected
    function DobikingSearch(option:TBikingRoutePlanOption):Boolean; virtual;  abstract;
    function DodrivingSearch(option:TDrivingRoutePlanOption):Boolean; virtual;  abstract;
    function DomasstransitSearch(option:TMassTransitRoutePlanOption):Boolean; virtual;  abstract;
    function DotransitSearch(option:TTransitRoutePlanOption):Boolean; virtual;  abstract;
    function DowalkingIndoorSearch(option:TIndoorRoutePlanOption):Boolean; virtual;  abstract;
    function DowalkingSearch(option:TWalkingRoutePlanOption):Boolean; virtual;  abstract;

    procedure GetWalkingRouteResult (RouteResult:TWalkingRouteResult);
    procedure GetTransitRouteResult(RouteResult:TTransitRouteResult);
    procedure GetMassTransitRouteResult(RouteResult:TMassTransitRouteResult);
    procedure GetDrivingRouteResult(RouteResult:TDrivingRouteResult);
    procedure GetIndoorRouteResult(RouteResult:TIndoorRouteResult);
    procedure GetBikingRouteResult(RouteResult:TBikingRouteResult);

  public
    function bikingSearch(option:TBikingRoutePlanOption):Boolean;
    function drivingSearch(option:TDrivingRoutePlanOption):Boolean;
    function masstransitSearch(option:TMassTransitRoutePlanOption):Boolean;
    function transitSearch(option:TTransitRoutePlanOption):Boolean;
    function walkingIndoorSearch(option:TIndoorRoutePlanOption):Boolean;
    function walkingSearch(option:TWalkingRoutePlanOption):Boolean;

    property OnGetWalkingRouteResult:TOnGetWalkingRouteResult read FOnGetWalkingRouteResult write FOnGetWalkingRouteResult;
    property OnGetTransitRouteResult:TOnGetTransitRouteResult read FOnGetTransitRouteResult write FOnGetTransitRouteResult;
    property OnGetMassTransitRouteResult:TOnGetMassTransitRouteResult read FOnGetMassTransitRouteResult write FOnGetMassTransitRouteResult;
    property OnGetDrivingRouteResult:TOnGetDrivingRouteResult read FOnGetDrivingRouteResult write FOnGetDrivingRouteResult;
    property OnGetIndoorRouteResult:TOnGetIndoorRouteResult read FOnGetIndoorRouteResult write FOnGetIndoorRouteResult;
    property OnGetBikingRouteResult:TOnGetBikingRouteResult read FOnGetBikingRouteResult write FOnGetBikingRouteResult;
  end;

  TTBaiduMapRoutePlanSearch = class(TObject)
  private
    FRoutePlanSearchService:TBaiduMapRoutePlanSearchService;
  public
    constructor Create;
    destructor Destroy; override;

    property RoutePlanSearchService:TBaiduMapRoutePlanSearchService read FRoutePlanSearchService;
  end;

implementation

{$IFDEF IOS}
//uses
//  BaiduMapAPI.RoutePlanSearchService.iOS;
{$ENDIF}
{$IFDEF ANDROID}
uses
  BaiduMapAPI.RoutePlanSearchService.Android;
{$ENDIF ANDROID}

{ TBaiduMapRoutePlanSearchService }

function TBaiduMapRoutePlanSearchService.bikingSearch(
  option: TBikingRoutePlanOption): Boolean;
begin
  Result:=DobikingSearch(option);
end;

function TBaiduMapRoutePlanSearchService.drivingSearch(
  option: TDrivingRoutePlanOption): Boolean;
begin
  Result:=DodrivingSearch(option);
end;

procedure TBaiduMapRoutePlanSearchService.GetBikingRouteResult(
  RouteResult: TBikingRouteResult);
begin
  if Assigned(FOnGetBikingRouteResult) then
    FOnGetBikingRouteResult(Self, RouteResult);
end;

procedure TBaiduMapRoutePlanSearchService.GetDrivingRouteResult(
  RouteResult: TDrivingRouteResult);
begin
  if Assigned(FOnGetDrivingRouteResult) then
    FOnGetDrivingRouteResult(Self, RouteResult);
end;

procedure TBaiduMapRoutePlanSearchService.GetIndoorRouteResult(
  RouteResult: TIndoorRouteResult);
begin
  if Assigned(FOnGetIndoorRouteResult) then
    FOnGetIndoorRouteResult(Self, RouteResult);
end;

procedure TBaiduMapRoutePlanSearchService.GetMassTransitRouteResult(
  RouteResult: TMassTransitRouteResult);
begin
  if Assigned(FOnGetMassTransitRouteResult) then
    FOnGetMassTransitRouteResult(Self, RouteResult);
end;

procedure TBaiduMapRoutePlanSearchService.GetTransitRouteResult(
  RouteResult: TTransitRouteResult);
begin
  if Assigned(FOnGetTransitRouteResult) then
    FOnGetTransitRouteResult(Self, RouteResult);
end;

procedure TBaiduMapRoutePlanSearchService.GetWalkingRouteResult(
  RouteResult: TWalkingRouteResult);
begin
  if Assigned(FOnGetWalkingRouteResult) then
    FOnGetWalkingRouteResult(Self, RouteResult);
end;

function TBaiduMapRoutePlanSearchService.masstransitSearch(
  option: TMassTransitRoutePlanOption): Boolean;
begin
  Result:=DomasstransitSearch(option);
end;

function TBaiduMapRoutePlanSearchService.transitSearch(
  option: TTransitRoutePlanOption): Boolean;
begin
  Result:=DotransitSearch(option);
end;

function TBaiduMapRoutePlanSearchService.walkingIndoorSearch(
  option: TIndoorRoutePlanOption): Boolean;
begin
  Result:=DowalkingIndoorSearch(option);
end;

function TBaiduMapRoutePlanSearchService.walkingSearch(
  option: TWalkingRoutePlanOption): Boolean;
begin
  Result:=DowalkingSearch(option);
end;

{ TRouteStep }

constructor TRouteStep.Create;
begin
  inherited;
  WayPoints:=TList<TMapCoordinate>.Create;
end;

destructor TRouteStep.Destroy;
begin
  WayPoints.Free;
  inherited;
end;

{ TRouteLine<T> }

constructor TRouteLine<T>.Create;
begin
  inherited;
  Steps:=TObjectList<T>.Create;
end;

destructor TRouteLine<T>.Destroy;
begin
  Steps.Free;
  inherited;
end;

{ TRouteResult<T> }

constructor TRouteResult<T>.Create;
begin
  inherited;
  RouteLines:=TObjectList<T>.Create;
end;

destructor TRouteResult<T>.Destroy;
begin
  RouteLines.Free;
  inherited;
end;

{ TIndoorRouteStep }

constructor TIndoorRouteStep.Create;
begin
  inherited;
  StepNodes:=TList<TIndoorStepNode>.Create;
end;

destructor TIndoorRouteStep.Destroy;
begin
  StepNodes.Free;
  inherited;
end;

{ TMassTransitRouteLine }

constructor TMassTransitRouteLine.Create;
begin
  inherited;
  NewSteps:=TObjectList<TTransitSteps>.Create;
  PriceInfo:=TList<TPriceInfo>.Create;
end;

destructor TMassTransitRouteLine.Destroy;
begin
  NewSteps.Free;
  PriceInfo.Free;
  inherited;
end;

{ TTBaiduMapRoutePlanSearch }

constructor TTBaiduMapRoutePlanSearch.Create;
begin
  inherited Create;
{$IFDEF IOS}
  //FRoutePlanSearchService:=TiOSBaiduMapFoutePlanSearchService.Create;
{$ENDIF}
{$IFDEF ANDROID}
  FRoutePlanSearchService:=TAndroidBaiduMapRoutePlanSearchService.Create;
{$ENDIF ANDROID}
end;

destructor TTBaiduMapRoutePlanSearch.Destroy;
begin

  inherited;
end;

end.

