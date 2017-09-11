unit BaiduMapAPI.PoiSearchService.Android;
//author:Xubzhlin
//Email:371889755@qq.com

//百度地图API Poi搜索服务 单元
//官方链接:http://lbsyun.baidu.com/
//TAndroidBaiduMapPoiSearchService 百度地图 安卓Poi搜索服务

interface

uses
  System.Classes, System.Types, FMX.Maps, Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Embarcadero, Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNIBridge, System.Generics.Collections,
  Androidapi.JNI.baidu.mapapi.search, Androidapi.JNI.baidu.mapapi.model,
  BaiduMapAPI.Search.CommTypes, BaiduMapAPI.PoiSearchService;

type
  TAndroidBaiduMapPoiSearchService = class;

  TOnGetPoiSearchResultListener = class(TJavaLocal,
    JOnGetPoiSearchResultListener)
  private
    [weak]
    FPoiSearchService: TAndroidBaiduMapPoiSearchService;

    function JPoiInfoToPoiInfo(Info:JPoiInfo):TPoiInfo;
    function JCityInfoToCityInfo(Info:JCityInfo):TCityInfo;
    function JPoiAddrInfoToPoiAddrInfo(Info:JPoiAddrInfo):TPoiAddrInfo;
    function JPoiIndoorInfoToPoiIndoorInfo(Info:JPoiIndoorInfo):TPoiIndoorInfo;
  public
    procedure onGetPoiResult(P1: JPoiResult); cdecl;
    procedure onGetPoiDetailResult(P1: JPoiDetailResult); cdecl;
    procedure onGetPoiIndoorResult(P1: JPoiIndoorResult); cdecl;

    constructor Create(PoiSearchService: TAndroidBaiduMapPoiSearchService);
  end;

  TAndroidBaiduMapPoiSearchService = class(TBaiduMapPoiSearchService)
  private
    FPoiSearch: JPoiSearch;
    FResultListener: TOnGetPoiSearchResultListener;

    function DoBoundSearch(Option: TPoiBoundSearchOption): Boolean;
    function DoCitySearch(Option: TPoiCitySearchOption): Boolean;
    function DoNearbySearch(Option: TPoiNearbySearchOption): Boolean;
  protected
    function DoPoiSearch(Option: TPoiSearchrOption): Boolean; override;
    function DoSearchPoiDetail(Uid: string): Boolean; override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

//Poi 类型转换
function CreatePoiType(AType:JPoiInfo_POITYPE):TPoiType;

implementation

uses
  Androidapi.Helpers;

function CreatePoiType(AType:JPoiInfo_POITYPE):TPoiType;
begin
  if AType = TJPoiInfo_POITYPE.JavaClass.POINT then
    Result:=TPoiType.POINT
  else if AType = TJPoiInfo_POITYPE.JavaClass.BUS_STATION then
    Result:=TPoiType.BUS_STATION
  else if AType = TJPoiInfo_POITYPE.JavaClass.BUS_LINE then
    Result:=TPoiType.BUS_LINE
  else if AType = TJPoiInfo_POITYPE.JavaClass.SUBWAY_STATION then
    Result:=TPoiType.SUBWAY_STATION
  else if AType = TJPoiInfo_POITYPE.JavaClass.SUBWAY_LINE then
    Result:=TPoiType.SUBWAY_LINE
end;

{ TAndroidBaiduMapPoiSearchService }

constructor TAndroidBaiduMapPoiSearchService.Create;
begin
  inherited;
  FPoiSearch := TJPoiSearch.JavaClass.newInstance;
  FResultListener := TOnGetPoiSearchResultListener.Create(Self);
  FPoiSearch.setOnGetPoiSearchResultListener(FResultListener);
end;

destructor TAndroidBaiduMapPoiSearchService.Destroy;
begin
  FResultListener.Free;
  FPoiSearch := nil;
  inherited;
end;

function TAndroidBaiduMapPoiSearchService.DoBoundSearch
  (Option: TPoiBoundSearchOption): Boolean;
var
  Bounds: JLatLngBounds;
  SearchOption: JPoiBoundSearchOption;
begin
  Bounds := TJLatLngBounds_Builder.JavaClass.init.build;
  Bounds.northeast := TJLatLng.JavaClass.init(Option.northeast.Latitude,
    Option.northeast.Longitude);
  Bounds.southwest := TJLatLng.JavaClass.init(Option.southwest.Latitude,
    Option.southwest.Longitude);
  SearchOption := TJPoiBoundSearchOption.JavaClass.init;
  SearchOption.keyword(StringToJString(Option.keyword)).bound(Bounds)
    .pageNum(Option.pageNum).pageCapacity(Option.pageCapacity);
  Result := FPoiSearch.searchInBound(SearchOption);
end;

function TAndroidBaiduMapPoiSearchService.DoCitySearch
  (Option: TPoiCitySearchOption): Boolean;
var
  SearchOption: JPoiCitySearchOption;
begin
  SearchOption := TJPoiCitySearchOption.JavaClass.init;
  SearchOption.city(StringToJString(Option.city))
    .keyword(StringToJString(Option.keyword)).pageNum(Option.pageNum)
    .pageCapacity(Option.pageCapacity).isReturnAddr(Option.isReturnAddr);
  Result := FPoiSearch.searchInCity(SearchOption);
end;

function TAndroidBaiduMapPoiSearchService.DoNearbySearch
  (Option: TPoiNearbySearchOption): Boolean;
var
  Location:JLatLng;
  PoiSortType: JPoiSortType;
  SearchOption: JPoiNearbySearchOption;
begin
  case Option.sortType of
    comprehensive:
      PoiSortType := TJPoiSortType.JavaClass.comprehensive;
    distance_from_near_to_far:
      PoiSortType := TJPoiSortType.JavaClass.distance_from_near_to_far;
  end;
  Location:=TJLatLng.JavaClass.init(Option.Location.Latitude, Option.Location.Longitude);
  SearchOption := TJPoiNearbySearchOption.JavaClass.init;
  SearchOption.keyword(StringToJString(Option.keyword)).location(Location)
    .sortType(PoiSortType).radius(Option.radius).pageNum(Option.pageNum)
    .pageCapacity(Option.pageCapacity);
  Result := FPoiSearch.searchNearby(SearchOption);

end;

function TAndroidBaiduMapPoiSearchService.DoPoiSearch
  (Option: TPoiSearchrOption): Boolean;
begin
  if Option is TPoiBoundSearchOption then
  begin
    Result := DoBoundSearch(TPoiBoundSearchOption(Option));
  end
  else if Option is TPoiCitySearchOption then
  begin
    Result := DoCitySearch(TPoiCitySearchOption(Option));
  end
  else if Option is TPoiNearbySearchOption then
  begin
    Result := DoNearbySearch(TPoiNearbySearchOption(Option));
  end;
end;

function TAndroidBaiduMapPoiSearchService.DoSearchPoiDetail
  (Uid: string): Boolean;
var
  SearchOption: JPoiDetailSearchOption;
begin
  SearchOption := TJPoiDetailSearchOption.JavaClass.init;
  SearchOption.poiUid(StringToJString(Uid));
  Result := FPoiSearch.searchPoiDetail(SearchOption);

end;

{ TOnGetPoiSearchResultListener }

constructor TOnGetPoiSearchResultListener.Create(PoiSearchService
  : TAndroidBaiduMapPoiSearchService);
begin
  inherited Create;
  FPoiSearchService := PoiSearchService;
end;

function TOnGetPoiSearchResultListener.JCityInfoToCityInfo(
  Info: JCityInfo): TCityInfo;
begin
  Result.city:=JStringToString(Info.city);
  Result.num:=Info.num;
end;

function TOnGetPoiSearchResultListener.JPoiAddrInfoToPoiAddrInfo(
  Info: JPoiAddrInfo): TPoiAddrInfo;
begin
  Result.address:=JStringToString(Info.address);
  Result.location:=TMapCoordinate.Create(Info.location.latitude, Info.location.longitude);
  Result.name:=JStringToString(Info.name);
end;

function TOnGetPoiSearchResultListener.JPoiIndoorInfoToPoiIndoorInfo(
  Info: JPoiIndoorInfo): TPoiIndoorInfo;
begin
  Result.address:=JStringToString(Info.address);
  Result.bid:=JStringToString(Info.bid);
  Result.floor:=JStringToString(Info.floor);
  Result.name:=JStringToString(Info.name);
  Result.phone:=JStringToString(Info.phone);
  Result.price:=Info.price;
  Result.latLng:=TMapCoordinate.Create(Info.latLng.latitude, Info.latLng.longitude);
  Result.starLevel:=Info.starLevel;
  Result.isGroup:=Info.isGroup;
  Result.isTakeOut:=Info.isTakeOut;
  Result.isWaited:=Info.isWaited;
  Result.uid:=JStringToString(Info.uid);
  Result.tag:=JStringToString(Info.tag);
  Result.groupNum:=Info.groupNum;
end;

function TOnGetPoiSearchResultListener.JPoiInfoToPoiInfo(
  Info: JPoiInfo): TPoiInfo;
begin
  Result.name:=JStringToString(Info.name);
  Result.uid:=JStringToString(Info.uid);
  Result.address:=JStringToString(Info.address);
  Result.city:=JStringToString(Info.city);
  Result.phoneNum:=JStringToString(Info.phoneNum);
  Result.postCode:=JStringToString(Info.postCode);
  Result.&type:=CreatePoiType(Info.&type);
  Result.location:=TMapCoordinate.Create(Info.location.latitude, Info.location.longitude);
  Result.isPano:=Info.isPano;
end;

procedure TOnGetPoiSearchResultListener.onGetPoiDetailResult
  (P1: JPoiDetailResult);
var
  DetailResult:TPoiDetailResult;
begin
  if FPoiSearchService <> nil then
  begin
    DetailResult:=TPoiDetailResult.Create;
    DetailResult.error:=CreateErrorNo(P1.error);
    if DetailResult.error = TSearchResult_ErrorNo.NO_ERROR then
    begin
      DetailResult.name:=JStringToString(P1.getName);
      DetailResult.location:=TMapCoordinate.Create(P1.getLocation.latitude, P1.getLocation.longitude);
      DetailResult.address:=JStringToString(P1.getAddress);
      DetailResult.telephone:=JStringToString(P1.getTelephone);
      DetailResult.uid:=JStringToString(P1.getUid);
      DetailResult.tag:=JStringToString(P1.getTag);
      DetailResult.detailUrl:=JStringToString(P1.getDetailUrl);
      DetailResult.&type:= JStringToString(P1.getType);
      DetailResult.price:=P1.getPrice;
      DetailResult.overallRating:=P1.getOverallRating;
      DetailResult.tasteRating:=P1.getTasteRating;
      DetailResult.serviceRating:=P1.getServiceRating;
      DetailResult.environmentRating:=P1.getEnvironmentRating;
      DetailResult.facilityRating:=P1.getFacilityRating;
      DetailResult.hygieneRating:=P1.getHygieneRating;
      DetailResult.technologyRating:=P1.getTechnologyRating;
      DetailResult.imageNum:=P1.getImageNum;
      DetailResult.grouponNum:=P1.getGrouponNum;
      DetailResult.commentNum:=P1.getCommentNum;
      DetailResult.favoriteNum:=P1.getFavoriteNum;
      DetailResult.checkinNum:=P1.getCheckinNum;
      DetailResult.shopHours:=JStringToString(P1.getShopHours);
    end;
    FPoiSearchService.GetPoiDetailResult(DetailResult);
  end;

end;

procedure TOnGetPoiSearchResultListener.onGetPoiIndoorResult
  (P1: JPoiIndoorResult);
var
  PoiIndoorResult:TPoiIndoorResult;
  i:Integer;
  PoiIndoorInfo:JPoiIndoorInfo;
  List:JList;
begin
  if FPoiSearchService <> nil then
  begin
    PoiIndoorResult:=TPoiIndoorResult.Create;
    PoiIndoorResult.error:=CreateErrorNo(P1.error);
    if PoiIndoorResult.error = TSearchResult_ErrorNo.NO_ERROR then
    begin
      List:=P1.getmArrayPoiInfo;
      for i := 0 to List.size - 1 do
      begin
        PoiIndoorInfo:=TJPoiIndoorInfo.Wrap(List.get(i));
        PoiIndoorResult.PoiIndoorsInfo.Add(JPoiIndoorInfoToPoiIndoorInfo(PoiIndoorInfo));
      end;

      PoiIndoorResult.CurrentPageNum:=P1.getPageNum;
      PoiIndoorResult.CurrentPageCapacity:=List.size;
      PoiIndoorResult.TotalPoiNum:=P1.getPoiNum;
    end;
    FPoiSearchService.GetPoiIndoorResult(PoiIndoorResult);
  end;

end;

procedure TOnGetPoiSearchResultListener.onGetPoiResult(P1: JPoiResult);
var
  PoiResult:TPoiResult;
  i:Integer;
  PoiInfo:JPoiInfo;
  CityInfo:JCityInfo;
  AddrInfo:JPoiAddrInfo;
  List:JList;
begin
  if FPoiSearchService <> nil then
  begin
    PoiResult:=TPoiResult.Create;
    PoiResult.error:=CreateErrorNo(P1.error);
    case PoiResult.error of
      TSearchResult_ErrorNo.NO_ERROR:
        begin
          List:=P1.getAllPoi;
          for i := 0 to List.size - 1 do
          begin
            PoiInfo:=TJPoiInfo.Wrap(List.get(i));
            PoiResult.PoisInfo.Add(JPoiInfoToPoiInfo(PoiInfo));
          end;

          if P1.isHasAddrInfo then
          begin
            List:=P1.getAllAddr;
            for i := 0 to List.size - 1 do
            begin
              AddrInfo:=TJPoiAddrInfo.Wrap(List.get(i));
              PoiResult.PoiAddrsInfo.Add(JPoiAddrInfoToPoiAddrInfo(AddrInfo));
            end;
          end;

          PoiResult.CurrentPageCapacity:=P1.getCurrentPageCapacity;
          PoiResult.CurrentPageNum:=P1.getCurrentPageNum;
          PoiResult.TotalPageNum:=P1.getTotalPageNum;
          PoiResult.TotalPoiNum:=P1.getTotalPoiNum;
          PoiResult.isHasAddrInfo:=P1.isHasAddrInfo;
        end;
      TSearchResult_ErrorNo.AMBIGUOUS_KEYWORD:
        begin
          List:=P1.getSuggestCityList;
          for i := 0 to List.size - 1 do
          begin
            CityInfo:=TJCityInfo.Wrap(List.get(i));
            PoiResult.CitysInfo.Add(JCityInfoToCityInfo(CityInfo));
          end;
        end;
    end;
    FPoiSearchService.GetPoiResult(PoiResult);
  end;

end;


end.
