unit BaiduMapAPI.PoiSearchService.iOS;
//author:Xubzhlin
//Email:371889755@qq.com

//百度地图API Poi搜索服务 单元
//官方链接:http://lbsyun.baidu.com/
//TiOSBaiduMapPoiSearchService 百度地图 iOS Poi搜索服务

interface

uses
  System.Classes, System.Types, Macapi.ObjectiveC, Macapi.Helpers, iOSapi.Foundation, iOSapi.BaiduMapAPI_Search,
  iOSapi.BaiduMapAPI_Base, BaiduMapAPI.Search.CommTypes, BaiduMapAPI.PoiSearchService, FMX.Maps;

type
  TiOSBaiduMapPoiSearchService = class;

  TBMKPoiSearchDelegate = class(TOCLocal, BMKPoiSearchDelegate)
  private
    [Weak] FPoiSearchService: TiOSBaiduMapPoiSearchService;
    function BMKPoiInfoToPoiInfo(Info:BMKPoiInfo):TPoiInfo;
    function BMKPoiAddressInfoToPoiAddrInfo(Info:BMKPoiAddressInfo):TPoiAddrInfo;
    function BMKCityListInfoToCityInfo(Info:BMKCityListInfo):TCityInfo;
    function BMKPoiIndoorInfoToPoiIndoorInfo(Info:BMKPoiIndoorInfo):TPoiIndoorInfo;
  public
    procedure onGetPoiResult(searcher: BMKPoiSearch; result: BMKPoiResult;
      errorCode: BMKSearchErrorCode); cdecl;
    procedure onGetPoiDetailResult(searcher: BMKPoiSearch;
      result: BMKPoiDetailResult; errorCode: BMKSearchErrorCode); cdecl;
    procedure onGetPoiIndoorResult(searcher: BMKPoiSearch;
      result: BMKPoiIndoorResult; errorCode: BMKSearchErrorCode); cdecl;
    constructor Create(PoiSearchService: TiOSBaiduMapPoiSearchService);
  end;


  TiOSBaiduMapPoiSearchService = class(TBaiduMapPoiSearchService)
  private
    FPoiSearch: BMKPoiSearch;
    FDelegate: TBMKPoiSearchDelegate;
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

implementation

function CreatePoiType(AType:integer):TPoiType;
begin
  //0:普通点 1:公交站 2:公交线路 3:地铁站 4:地铁线路
  case AType of
    0:Result:=TPoiType.POINT;
    1:Result:=TPoiType.BUS_STATION;
    2:Result:=TPoiType.BUS_LINE;
    3:Result:=TPoiType.SUBWAY_STATION;
    4:Result:=TPoiType.SUBWAY_LINE;
  end;
end;

{ TBMKPoiSearchDelegate }

function TBMKPoiSearchDelegate.BMKCityListInfoToCityInfo(
  Info: BMKCityListInfo): TCityInfo;
begin
  Result.city:=NSStrToStr(Info.city);
  Result.num:=Info.num;
end;

function TBMKPoiSearchDelegate.BMKPoiAddressInfoToPoiAddrInfo(
  Info: BMKPoiAddressInfo): TPoiAddrInfo;
begin
  Result.address:=NSStrToStr(Info.address);
  Result.location:=TMapCoordinate.Create(Info.pt.latitude, Info.pt.longitude);
  Result.name:=NSStrToStr(Info.name);
end;

function TBMKPoiSearchDelegate.BMKPoiIndoorInfoToPoiIndoorInfo(
  Info: BMKPoiIndoorInfo): TPoiIndoorInfo;
begin
  Result.address:=NSStrToStr(Info.address);
  Result.bid:=NSStrToStr(Info.indoorId);
  Result.floor:=NSStrToStr(Info.floor);
  Result.name:=NSStrToStr(Info.name);
  Result.phone:=NSStrToStr(Info.phone);
  Result.price:=Info.price;
  Result.latLng:=TMapCoordinate.Create(Info.pt.latitude, Info.pt.longitude);
  Result.starLevel:=Info.starLevel;
  Result.isGroup:=Info.grouponFlag;
  Result.isTakeOut:=Info.takeoutFlag;
  Result.isWaited:=Info.waitedFlag;
  Result.uid:=NSStrToStr(Info.uid);
  Result.tag:=NSStrToStr(Info.tag);
  Result.isGroup:=Info.grouponNum<>-1;
  Result.groupNum:=Info.grouponNum;
end;

function TBMKPoiSearchDelegate.BMKPoiInfoToPoiInfo(Info: BMKPoiInfo): TPoiInfo;
begin
  Result.name:=NSStrToStr(Info.name);
  Result.uid:=NSStrToStr(Info.uid);
  Result.address:=NSStrToStr(Info.address);
  Result.city:=NSStrToStr(Info.city);
  Result.phoneNum:=NSStrToStr(Info.phone);
  Result.postCode:=NSStrToStr(Info.postCode);
  Result.&type:=CreatePoiType(Info.epoitype);
  Result.location:=TMapCoordinate.Create(Info.pt.latitude, Info.pt.longitude);
  Result.isPano:=Info.panoFlag;
end;

constructor TBMKPoiSearchDelegate.Create(
  PoiSearchService: TiOSBaiduMapPoiSearchService);
begin
  inherited Create;
  FPoiSearchService := PoiSearchService;
end;

procedure TBMKPoiSearchDelegate.onGetPoiDetailResult(searcher: BMKPoiSearch;
  result: BMKPoiDetailResult; errorCode: BMKSearchErrorCode);
var
  DetailResult:TPoiDetailResult;
begin
  if FPoiSearchService<>nil then
  begin
    DetailResult:=TPoiDetailResult.Create;
    DetailResult.error:=CreateErrorNo(errorCode);
    if DetailResult.error = TSearchResult_ErrorNo.NO_ERROR then
    begin
      DetailResult.name:=NSStrToStr(result.name);
      DetailResult.location:=TMapCoordinate.Create(result.pt.latitude, result.pt.longitude);
      DetailResult.address:=NSStrToStr(result.address);
      DetailResult.telephone:=NSStrToStr(result.phone);
      DetailResult.uid:=NSStrToStr(result.uid);
      DetailResult.tag:=NSStrToStr(result.tag);
      DetailResult.detailUrl:=NSStrToStr(result.DetailUrl);
      DetailResult.&type:= NSStrToStr(result.&type);
      DetailResult.price:=result.price;
      DetailResult.overallRating:=result.overallRating;
      DetailResult.tasteRating:=result.tasteRating;
      DetailResult.serviceRating:=result.serviceRating;
      DetailResult.environmentRating:=result.environmentRating;
      DetailResult.facilityRating:=result.facilityRating;
      DetailResult.hygieneRating:=result.hygieneRating;
      DetailResult.technologyRating:=result.technologyRating;
      DetailResult.imageNum:=result.imageNum;
      DetailResult.grouponNum:=result.grouponNum;
      DetailResult.commentNum:=result.commentNum;
      DetailResult.favoriteNum:=result.favoriteNum;
      DetailResult.checkinNum:=result.checkInNum;
      DetailResult.shopHours:=NSStrToStr(result.shopHours);
    end;
    FPoiSearchService.GetPoiDetailResult(DetailResult);
  end;

end;

procedure TBMKPoiSearchDelegate.onGetPoiIndoorResult(searcher: BMKPoiSearch;
  result: BMKPoiIndoorResult; errorCode: BMKSearchErrorCode);
var
  PoiIndoorResult:TPoiIndoorResult;
  i:Integer;
  PoiIndoorInfo:BMKPoiIndoorInfo;
  List:NSArray;
begin
  if FPoiSearchService <> nil then
  begin
    PoiIndoorResult:=TPoiIndoorResult.Create;
    PoiIndoorResult.error:=CreateErrorNo(errorCode);
    if PoiIndoorResult.error = TSearchResult_ErrorNo.NO_ERROR then
    begin
      List:=result.poiIndoorInfoList;
      for i := 0 to List.count - 1 do
      begin
        PoiIndoorInfo:=TBMKPoiIndoorInfo.Wrap(List.objectAtIndex(i));
        PoiIndoorResult.PoiIndoorsInfo.Add(BMKPoiIndoorInfoToPoiIndoorInfo(PoiIndoorInfo));
      end;

      PoiIndoorResult.CurrentPageNum:=result.pageIndex;
      PoiIndoorResult.CurrentPageCapacity:=result.currPoiNum;
      PoiIndoorResult.TotalPoiNum:=result.totalPoiNum;
    end;
    FPoiSearchService.GetPoiIndoorResult(PoiIndoorResult);
  end;

end;

procedure TBMKPoiSearchDelegate.onGetPoiResult(searcher: BMKPoiSearch;
  result: BMKPoiResult; errorCode: BMKSearchErrorCode);
var
  PoiResult:TPoiResult;
  List:NSArray;
  i: Integer;
  PoiInfo:BMKPoiInfo;
  AddrInfo:BMKPoiAddressInfo;
  CityInfo:BMKCityListInfo ;
begin
  if FPoiSearchService<>nil then
  begin
    PoiResult:=TPoiResult.Create;
    PoiResult.error:=CreateErrorNo(errorCode);
    case PoiResult.error of
      TSearchResult_ErrorNo.NO_ERROR:
        begin
          List:=result.poiInfoList;
          for i := 0 to List.count -1 do
          begin
            PoiInfo := TBMKPoiInfo.Wrap(List.objectAtIndex(i));
            PoiResult.PoisInfo.Add(BMKPoiInfoToPoiInfo(PoiInfo));
          end;

          if result.isHavePoiAddressInfoList then
          begin
            List:=result.poiAddressInfoList;
            for i := 0 to List.count-1 do
            begin
              AddrInfo:=TBMKPoiAddressInfo.Wrap(List.objectAtIndex(i));
              PoiResult.PoiAddrsInfo.Add(BMKPoiAddressInfoToPoiAddrInfo(AddrInfo));
            end;
          end;

          PoiResult.CurrentPageCapacity:=result.currPoiNum;
          PoiResult.CurrentPageNum:=result.pageIndex;
          PoiResult.TotalPageNum:=result.pageNum;
          PoiResult.TotalPoiNum:=result.totalPoiNum;
          PoiResult.isHasAddrInfo:=result.isHavePoiAddressInfoList;
        end;
      TSearchResult_ErrorNo.AMBIGUOUS_KEYWORD:
        begin
          List:=result.cityList;
          for i := 0 to List.count - 1 do
          begin
            CityInfo:=TBMKCityListInfo.Wrap(List.objectAtIndex(i));
            PoiResult.CitysInfo.Add(BMKCityListInfoToCityInfo(CityInfo));
          end;
        end;
    end;
    FPoiSearchService.GetPoiResult(PoiResult);
  end;
end;

{ TiOSBaiduMapPoiSearchService }

constructor TiOSBaiduMapPoiSearchService.Create;
begin
  inherited Create;
  FPoiSearch := TBMKPoiSearch.Create;
  FDelegate :=  TBMKPoiSearchDelegate.Create(Self);
  FPoiSearch.setDelegate(FDelegate.GetObjectID);
end;

destructor TiOSBaiduMapPoiSearchService.Destroy;
begin
  FPoiSearch:=nil;
  FDelegate.Free;
  inherited;
end;

function TiOSBaiduMapPoiSearchService.DoBoundSearch(
  Option: TPoiBoundSearchOption): Boolean;
var
  SearchOption:BMKBoundSearchOption;
begin
  SearchOption:=TBMKBoundSearchOption.Create;
  SearchOption.SetpageIndex(Option.PageNum);
  SearchOption.SetpageCapacity(Option.PageCapacity);
  SearchOption.setKeyword(StrToNSStr(Option.Keyword));
  SearchOption.setLeftBottom(CLLocationCoordinate2D(Option.NorthEast));
  SearchOption.setRightTop(CLLocationCoordinate2D(Option.SouthWest));
  Result := FPoiSearch.poiSearchInbounds(SearchOption);
end;

function TiOSBaiduMapPoiSearchService.DoCitySearch(
  Option: TPoiCitySearchOption): Boolean;
var
  SearchOption:BMKCitySearchOption;
begin
  SearchOption:=TBMKCitySearchOption.Create;
  SearchOption.SetpageIndex(Option.PageNum);
  SearchOption.SetpageCapacity(Option.PageCapacity);
  SearchOption.setKeyword(StrToNSStr(Option.Keyword));
  SearchOption.setCity(StrToNSStr(Option.City));
  SearchOption.setRequestPoiAddressInfoList(Option.IsReturnAddr);
  Result := FPoiSearch.poiSearchInCity(SearchOption);
end;

function TiOSBaiduMapPoiSearchService.DoNearbySearch(
  Option: TPoiNearbySearchOption): Boolean;
var
  SearchOption:BMKNearbySearchOption;
begin
  SearchOption:=TBMKNearbySearchOption.Create;
  SearchOption.SetpageIndex(Option.PageNum);
  SearchOption.SetpageCapacity(Option.PageCapacity);
  SearchOption.setKeyword(StrToNSStr(Option.Keyword));
  SearchOption.setLocation(CLLocationCoordinate2D(Option.Location));
  SearchOption.setSortType(ord(Option.sortType));
  SearchOption.setRadius(Option.radius);
  Result := FPoiSearch.poiSearchNearBy(SearchOption);
end;

function TiOSBaiduMapPoiSearchService.DoPoiSearch(
  Option: TPoiSearchrOption): Boolean;
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

function TiOSBaiduMapPoiSearchService.DoSearchPoiDetail(Uid: string): Boolean;
var
  SearchOption: BMKPoiDetailSearchOption;
begin
  SearchOption := TBMKPoiDetailSearchOption.Create;
  SearchOption.setPoiUid(StrToNSStr(Uid));
  Result := FPoiSearch.poiDetailSearch(SearchOption);
end;

end.
