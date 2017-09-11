unit BaiduMapAPI.Search.CommTypes;
//author:Xubzhlin
//Email:371889755@qq.com

//百度地图API 检索 公共单元

//TSearchResult 检索结果

interface

uses
{$IFDEF Android}
  Androidapi.JNI.baidu.mapapi.search,
{$ENDIF}
{$IFDEF iOS}
  iOSapi.BaiduMapAPI_Base,
{$ENDIF}
  FMX.Maps;

type
  TSearchResult_ErrorNo = (
    NO_ERROR=0,                  ///<检索结果正常返回
    RESULT_NOT_FOUND,            ///<没有找到检索结果
    AMBIGUOUS_KEYWORD,           ///<检索词有岐义
    AMBIGUOUS_ROURE_ADDR,        ///<检索地址有岐义
    NOT_SUPPORT_BUS,             ///<该城市不支持公交搜索
    NOT_SUPPORT_BUS_2CITY,       ///<不支持跨城市公交
    ST_EN_TOO_NEAR,              ///<起终点太近
    KEY_ERROR,                   ///<key错误
    PERMISSION_UNFINISHED,       ///还未完成鉴权，请在鉴权通过后重试
    NETWORK_TIME_OUT,            ///网络连接超时
    NETWORK_ERROR,               ///网络连接错误
    POIINDOOR_BID_ERROR,         ///室内图ID错误
    POIINDOOR_FLOOR_ERROR,       ///室内图检索楼层错误
    POIINDOOR_SERVER_ERROR,      ///室内图检索服务器内部错误
    INDOOR_ROUTE_NO_IN_BUILDING, ///起终点不在支持室内路线的室内图内
    INDOOR_ROUTE_NO_IN_SAME_BUILDING,///室内路线规划起终点不在同一个室内
    MASS_TRANSIT_SERVER_ERROR,   ///跨城公共交通服务器内部错误
    MASS_TRANSIT_OPTION_ERROR,   ///跨城公共交通错误码：参数无效
    MASS_TRANSIT_NO_POI_ERROR,   ///跨城公共交通没有匹配的POI
    SEARCH_SERVER_INTERNAL_ERROR,///服务器内部错误
    SEARCH_OPTION_ERROR,          ///参数错误
    REQUEST_ERROR///请求错误
    );

  TPoiType = (POINT = 0,  BUS_STATION = 1,  BUS_LINE = 2,  SUBWAY_STATION = 3,  SUBWAY_LINE = 4);

  TPoiInfo = record
    name:string;
    uid:string;
    address:string;
    city:string;
    phoneNum:string;
    postCode:string;
    &type:TPoiType;
    location:TMapCoordinate;
    isPano:Boolean;
  end;

  TCityInfo = record
    city:string;
    num:Integer;
  end;

  TPoiAddrInfo = record
    address:string;
    location:TMapCoordinate;
    name:string;
  end;

  TSearchResult = class(TObject)
    error:TSearchResult_ErrorNo;
  end;

  TRouteLineType = (
    BIKINGSTEP, //骑行
    DRIVESTEP,  //驾车
    TRANSITSTEP,//换乘
    WALKSTEP    //步行
  );

  //交通工具 枚举
  TStepVehicleInfoType = (
    ESTEP_BUS,//公交
    ESTEP_COACH,//大巴
    ESTEP_DRIVING,//驾车
    ESTEP_PLANE,//飞机
    ESTEP_TRAIN,//火车
    ESTEP_WALK//步行
  );

  //
  TPriceInfo = record
    TicketPrice:Double;//获取票价格（元）
    TicketType:Integer;//获取票类型
  end;

  //路段类型枚举
  TTransitRouteStepType = (
    BUSLINE,//公交路段
    SUBWAY,//地铁路段
    WAKLING//路行路段
  );

  //路线换乘方案里的交通工具信息
  //交通工具包括： 公交，地铁
  TVehicleInfo = record
    PassStationNum:Integer;//该交通路线的所乘站数
    Title:String;//该交通路线的名称
    TotalPrice:string;//该交通路线的全程价格
    Uid:string;//该交通路线的标识
    ZonePrice:Double;//该交通路线的所乘区间的区间价格
  end;

  TTransitResultNode = record
    CityId:Integer;//城市编号
    CityName:String;//城市名
    Location:TMapCoordinate;//坐标
    SearchWord:string;//检索时关键字（在检索词模糊，返回建议列表时才有。
  end;

// 错误类型转换
{$IFDEF Android}
function CreateErrorNo(error:JSearchResult_ERRORNO):TSearchResult_ERRORNO;
{$ENDIF}
{$IFDEF iOS}
function CreateErrorNo(error:BMKSearchErrorCode):TSearchResult_ERRORNO;
{$ENDIF}

implementation

{$IFDEF Android}
function CreateErrorNo(error:JSearchResult_ERRORNO):TSearchResult_ERRORNO;
begin
  Result:= TSearchResult_ERRORNO.NO_ERROR;
  if error = TJSearchResult_ERRORNO.JavaClass.NO_ERROR then
    Result:=TSearchResult_ERRORNO.NO_ERROR
  else if error = TJSearchResult_ERRORNO.JavaClass.RESULT_NOT_FOUND then
    Result:=TSearchResult_ERRORNO.RESULT_NOT_FOUND
  else if error = TJSearchResult_ERRORNO.JavaClass.AMBIGUOUS_KEYWORD then
    Result:=TSearchResult_ERRORNO.AMBIGUOUS_KEYWORD
  else if error = TJSearchResult_ERRORNO.JavaClass.AMBIGUOUS_ROURE_ADDR then
    Result:=TSearchResult_ERRORNO.AMBIGUOUS_ROURE_ADDR
  else if error = TJSearchResult_ERRORNO.JavaClass.NOT_SUPPORT_BUS then
    Result:=TSearchResult_ERRORNO.NOT_SUPPORT_BUS
  else if error = TJSearchResult_ERRORNO.JavaClass.NOT_SUPPORT_BUS_2CITY then
    Result:=TSearchResult_ERRORNO.NOT_SUPPORT_BUS_2CITY
  else if error = TJSearchResult_ERRORNO.JavaClass.ST_EN_TOO_NEAR then
    Result:=TSearchResult_ERRORNO.ST_EN_TOO_NEAR
  else if error = TJSearchResult_ERRORNO.JavaClass.KEY_ERROR then
    Result:=TSearchResult_ERRORNO.KEY_ERROR
  else if error = TJSearchResult_ERRORNO.JavaClass.PERMISSION_UNFINISHED then
    Result:=TSearchResult_ERRORNO.PERMISSION_UNFINISHED
  else if error = TJSearchResult_ERRORNO.JavaClass.NETWORK_TIME_OUT then
    Result:=TSearchResult_ERRORNO.NETWORK_TIME_OUT
  else if error = TJSearchResult_ERRORNO.JavaClass.NETWORK_ERROR then
    Result:=TSearchResult_ERRORNO.NETWORK_ERROR
  else if error = TJSearchResult_ERRORNO.JavaClass.POIINDOOR_BID_ERROR then
    Result:=TSearchResult_ERRORNO.POIINDOOR_BID_ERROR
  else if error = TJSearchResult_ERRORNO.JavaClass.POIINDOOR_FLOOR_ERROR then
    Result:=TSearchResult_ERRORNO.POIINDOOR_FLOOR_ERROR
  else if error = TJSearchResult_ERRORNO.JavaClass.POIINDOOR_SERVER_ERROR then
    Result:=TSearchResult_ERRORNO.POIINDOOR_SERVER_ERROR
  else if error = TJSearchResult_ERRORNO.JavaClass.INDOOR_ROUTE_NO_IN_BUILDING then
    Result:=TSearchResult_ERRORNO.INDOOR_ROUTE_NO_IN_BUILDING
  else if error = TJSearchResult_ERRORNO.JavaClass.INDOOR_ROUTE_NO_IN_SAME_BUILDING then
    Result:=TSearchResult_ERRORNO.INDOOR_ROUTE_NO_IN_SAME_BUILDING
  else if error = TJSearchResult_ERRORNO.JavaClass.MASS_TRANSIT_SERVER_ERROR then
    Result:=TSearchResult_ERRORNO.MASS_TRANSIT_SERVER_ERROR
  else if error = TJSearchResult_ERRORNO.JavaClass.MASS_TRANSIT_OPTION_ERROR then
    Result:=TSearchResult_ERRORNO.MASS_TRANSIT_OPTION_ERROR
  else if error = TJSearchResult_ERRORNO.JavaClass.MASS_TRANSIT_NO_POI_ERROR then
    Result:=TSearchResult_ERRORNO.MASS_TRANSIT_NO_POI_ERROR
  else if error = TJSearchResult_ERRORNO.JavaClass.SEARCH_SERVER_INTERNAL_ERROR then
    Result:=TSearchResult_ERRORNO.SEARCH_SERVER_INTERNAL_ERROR
  else if error = TJSearchResult_ERRORNO.JavaClass.SEARCH_OPTION_ERROR then
    Result:=TSearchResult_ERRORNO.SEARCH_OPTION_ERROR;
end;
{$ENDIF}

{$IFDEF iOS}
function CreateErrorNo(error:BMKSearchErrorCode):TSearchResult_ERRORNO;
begin
  case error of
    BMK_SEARCH_NO_ERROR:
      Result:=TSearchResult_ERRORNO.NO_ERROR;
    BMK_SEARCH_AMBIGUOUS_KEYWORD:
      Result:=TSearchResult_ERRORNO.AMBIGUOUS_KEYWORD;
    BMK_SEARCH_AMBIGUOUS_ROURE_ADDR:
      Result:=TSearchResult_ERRORNO.AMBIGUOUS_ROURE_ADDR;
    BMK_SEARCH_NOT_SUPPORT_BUS:
      Result:=TSearchResult_ERRORNO.NOT_SUPPORT_BUS;
    BMK_SEARCH_NOT_SUPPORT_BUS_2CITY:
      Result:=TSearchResult_ERRORNO.NOT_SUPPORT_BUS_2CITY;
    BMK_SEARCH_RESULT_NOT_FOUND:
      Result:=TSearchResult_ERRORNO.RESULT_NOT_FOUND;
    BMK_SEARCH_ST_EN_TOO_NEAR:
      Result:=TSearchResult_ERRORNO.ST_EN_TOO_NEAR;
    BMK_SEARCH_KEY_ERROR:
      Result:=TSearchResult_ERRORNO.KEY_ERROR;
    BMK_SEARCH_NETWOKR_ERROR:
      Result:=TSearchResult_ERRORNO.NETWORK_ERROR;
    BMK_SEARCH_NETWOKR_TIMEOUT:
      Result:=TSearchResult_ERRORNO.NETWORK_TIME_OUT;
    BMK_SEARCH_PERMISSION_UNFINISHED:
      Result:=TSearchResult_ERRORNO.PERMISSION_UNFINISHED;
    BMK_SEARCH_INDOOR_ID_ERROR:
      Result:=TSearchResult_ERRORNO.POIINDOOR_BID_ERROR;
    BMK_SEARCH_FLOOR_ERROR:
      Result:=TSearchResult_ERRORNO.POIINDOOR_FLOOR_ERROR;
    BMK_SEARCH_INDOOR_ROUTE_NO_IN_BUILDING:
      Result:=TSearchResult_ERRORNO.INDOOR_ROUTE_NO_IN_BUILDING;
    BMK_SEARCH_INDOOR_ROUTE_NO_IN_SAME_BUILDING:
      Result:=TSearchResult_ERRORNO.INDOOR_ROUTE_NO_IN_SAME_BUILDING;
    BMK_SEARCH_PARAMETER_ERROR:
      Result:=TSearchResult_ERRORNO.REQUEST_ERROR;
  end;
end;
{$ENDIF}

end.
