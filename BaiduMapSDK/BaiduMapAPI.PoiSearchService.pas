unit BaiduMapAPI.PoiSearchService;
//author:Xubzhlin
//Email:371889755@qq.com

//百度地图API Poi检索 单元

//TSearchResult 检索结果
//TPoiResult poi搜索结果
//TPoiDetailResult 详情搜索结果
//TPoiIndoorResult 室内POI搜索结果

//TPoiSortType Poi 结果排序
//TPoiBoundSearchOption POI范围内检索参数
//TPoiCitySearchOption POI城市内检索参数
//TPoiNearbySearchOption  附近检索参数


interface

uses System.Generics.Collections, FMX.Maps, BaiduMapAPI.Search.CommTypes;

type
  TPoiIndoorInfo = record
    address:string;
    bid:string;
    floor:string;
    name:string;
    phone:string;
    price:Double;
    latLng:TMapCoordinate;
    starLevel:Integer;
    isGroup:Boolean;
    isTakeOut:Boolean;
    isWaited:Boolean;
    uid:string;
    tag:string;
    groupNum:Integer;
  end;

  TPoiResult = class(TSearchResult)
    PoisInfo:TList<TPoiInfo>;
    CitysInfo:TList<TCityInfo>;
    PoiAddrsInfo:TList<TPoiAddrInfo>;
    CurrentPageCapacity:Integer;  //获取单页容量,单页容量可以通过检索参数指定
    CurrentPageNum:Integer;       //获取当前分页编号
    TotalPageNum:Integer;         //获取总分页数
    TotalPoiNum:Integer;          //获取POI总数
    isHasAddrInfo:Boolean;        //是否包含门址类数据

    constructor Create;
    destructor Destroy; override;
  end;

  TPoiDetailResult = class(TSearchResult)
    name:string;
    location:TMapCoordinate;
    address:string;
    telephone:string;
    uid:string;
    tag:string;
    detailUrl:string;
    &type:string;
    price:Double;
    overallRating:Double;
    tasteRating:Double;
    serviceRating:Double;
    environmentRating:Double;
    facilityRating:Double;
    hygieneRating:Double;
    technologyRating:Double;
    imageNum:Integer;
    grouponNum:Integer;
    commentNum:Integer;
    favoriteNum:Integer;
    checkinNum:Integer;
    shopHours:string;
  end;

  TPoiIndoorResult = class(TSearchResult)
    PoiIndoorsInfo:TList<TPoiIndoorInfo>;
    CurrentPageCapacity:Integer;  //获取单页容量,单页容量可以通过检索参数指定
    CurrentPageNum:Integer;       //获取当前分页编号
    TotalPoiNum:Integer;          //获取POI总数
    constructor Create;
    destructor Destroy; override;
  end;

  TOnGetPoiResult = procedure(Sender:TObject; PoiResult:TPoiResult) of object;
  TOnGetPoiDetailResult = procedure(Sender:TObject; PoiDetailResult:TPoiDetailResult) of object;
  TOnGetPoiIndoorResult = procedure(Sender:TObject; PoiIndoorResult:TPoiIndoorResult) of object;

  //Poi 检索 排序类型
  TPoiSortType = (comprehensive, distance_from_near_to_far);

  //Poi Search 基础类
  TPoiSearchrOption = class(TObject)
    Keyword:string;       //检索关键字
    PageCapacity:Integer;  //设置每页容量，默认为每页10条
    PageNum:Integer;       //分页编号
    constructor Create;
  end;

  //Poi Bound Search Option  POI范围内检索参数
  TPoiBoundSearchOption = class(TPoisearchrOption)
    NorthEast:TMapCoordinate;
    SouthWest:TMapCoordinate;
  end;

  //Poi City Search Option  poi城市内检索参数
  TPoiCitySearchOption = class(TPoisearchrOption)
    City:String;
    IsReturnAddr:Boolean;

  end;

  //Poi Near Search Option  附近检索参数
  TPoiNearbySearchOption = class(TPoisearchrOption)
    Location:TMapCoordinate;
    Radius:Integer;
    sortType:TPoiSortType;
  end;

  IBaiduMapPoiSearchService = interface
  ['{C7E5EA1F-0A74-493E-AE97-29E97C4C5100}']
    // Poi搜索
    function PoiSearch(Option:TPoiSearchrOption):Boolean;
    // Poi 详情检索
    function SearchPoiDetail(Uid:string):Boolean;
  end;

  TBaiduMapPoiSearchService = class(TInterfacedObject, IBaiduMapPoiSearchService)
  private
    FOnGetPoiResult:TOnGetPoiResult;
    FOnGetPoiDetailResult:TOnGetPoiDetailResult;
    FOnGetPoiIndoorResult:TOnGetPoiIndoorResult;
  protected
    function DoPoiSearch(Option:TPoiSearchrOption):Boolean; virtual;  abstract;
    function DoSearchPoiDetail(Uid:string):Boolean; virtual;  abstract;

    procedure GetPoiResult(PoiResult:TPoiResult);
    procedure GetPoiDetailResult(PoiDetailResult:TPoiDetailResult);
    procedure GetPoiIndoorResult(PoiIndoorResult:TPoiIndoorResult);
  public

    function PoiSearch(Option:TPoiSearchrOption):Boolean;
    function SearchPoiDetail(Uid:string):Boolean;

    property OnGetPoiResult:TOnGetPoiResult read FOnGetPoiResult write FOnGetPoiResult;
    property OnGetPoiDetailResult:TOnGetPoiDetailResult read FOnGetPoiDetailResult write FOnGetPoiDetailResult;
    property OnGetPoiIndoorResult:TOnGetPoiIndoorResult read FOnGetPoiIndoorResult write FOnGetPoiIndoorResult;
  end;

  TBaiduMapPoiSearch = class(TObject)
  private
    FPoiSearchService:TBaiduMapPoiSearchService;
  public
    constructor Create;
    destructor Destroy; override;

    property PoiSearchService:TBaiduMapPoiSearchService read FPoiSearchService;
  end;

implementation

{$IFDEF IOS}
uses
  BaiduMapAPI.PoiSearchService.iOS;
{$ENDIF}
{$IFDEF ANDROID}
uses
  BaiduMapAPI.PoiSearchService.Android;
{$ENDIF ANDROID}

{ TPoiResult }

constructor TPoiResult.Create;
begin
  inherited Create;
  PoisInfo:=TList<TPoiInfo>.Create;
  CitysInfo:=TList<TCityInfo>.Create;
  PoiAddrsInfo:=TList<TPoiAddrInfo>.Create;
end;

destructor TPoiResult.Destroy;
begin
  PoisInfo.Free;
  CitysInfo.Free;
  PoiAddrsInfo.Free;
  inherited;
end;

{ TPoiIndoorResult }

constructor TPoiIndoorResult.Create;
begin
  PoiIndoorsInfo:=TList<TPoiIndoorInfo>.Create;
end;

destructor TPoiIndoorResult.Destroy;
begin
  PoiIndoorsInfo.Free;
  inherited;
end;

{ TPoiSearchrOption }

constructor TPoiSearchrOption.Create;
begin
  PageNum:=0;
  PageCapacity:=10;  //设置每页容量，默认为每页10条
end;


{ TBaiduMapPoiSearchService }

procedure TBaiduMapPoiSearchService.GetPoiDetailResult(
  PoiDetailResult: TPoiDetailResult);
begin
  if Assigned(FOnGetPoiDetailResult) then
    FOnGetPoiDetailResult(Self, PoiDetailResult);
end;

procedure TBaiduMapPoiSearchService.GetPoiIndoorResult(
  PoiIndoorResult: TPoiIndoorResult);
begin
  if Assigned(FOnGetPoiIndoorResult) then
    FOnGetPoiIndoorResult(Self, PoiIndoorResult);
end;

procedure TBaiduMapPoiSearchService.GetPoiResult(PoiResult: TPoiResult);
begin
  if Assigned(FOnGetPoiResult) then
    FOnGetPoiResult(Self, PoiResult);
end;

function TBaiduMapPoiSearchService.PoiSearch(Option: TPoiSearchrOption):Boolean;
begin
  Result:=DoPoiSearch(Option);
end;

function TBaiduMapPoiSearchService.SearchPoiDetail(Uid: string):Boolean;
begin
  Result:=SearchPoiDetail(Uid);
end;

{ TBaiduMapPoiSearch }

constructor TBaiduMapPoiSearch.Create;
begin
  inherited Create;
  {$IFDEF IOS}
    FPoiSearchService:=TiOSBaiduMapPoiSearchService.Create;
  {$ENDIF}
  {$IFDEF ANDROID}
    FPoiSearchService:=TAndroidBaiduMapPoiSearchService.Create;
  {$ENDIF ANDROID}
end;

destructor TBaiduMapPoiSearch.Destroy;
begin
  FPoiSearchService.Free;
  inherited;
end;

end.
