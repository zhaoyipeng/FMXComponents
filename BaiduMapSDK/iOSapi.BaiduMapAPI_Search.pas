{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework BaiduMapAPI_Search
//

unit iOSapi.BaiduMapAPI_Search;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.BaiduMapAPI_Base,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.CoreLocation,
  iOSapi.Foundation;

const
  BMKInvalidCoordinate = -1;
  BMKCarTrafficFIRST = 60;
  BMKCarTimeFirst = 0;
  BMKCarDisFirst = 1;
  BMKCarFeeFirst = 2;
  BMKBusTimeFirst = 3;
  BMKBusTransferFirst = 4;
  BMKBusWalkFirst = 5;
  BMKBusNoSubway = 6;
  BMKTypeCityList = 7;
  BMKTypePoiList = 11;
  BMKTypeAreaPoiList = 21;
  BMKTypeAreaMultiPoiList = 45;
  BMK_BUSLINE = 0;
  BMK_SUBWAY = 1;
  BMK_WAKLING = 2;
  BMK_TRANSIT_SUBWAY = 0;
  BMK_TRANSIT_TRAIN = 1;
  BMK_TRANSIT_PLANE = 2;
  BMK_TRANSIT_BUSLINE = 3;
  BMK_TRANSIT_DRIVING = 4;
  BMK_TRANSIT_WAKLING = 5;
  BMK_TRANSIT_COACH = 6;
  BMK_INDOOR_STEP_NODE_TYPE_ELEVATOR = 1;
  BMK_INDOOR_STEP_NODE_TYPE_ESCALATOR = 2;
  BMK_INDOOR_STEP_NODE_TYPE_STAIR = 3;
  BMK_INDOOR_STEP_NODE_TYPE_SECURITY_CHECK = 4;
  BMK_TRANSIT_TIME_FIRST = 3;
  BMK_TRANSIT_TRANSFER_FIRST = 4;
  BMK_TRANSIT_WALK_FIRST = 5;
  BMK_TRANSIT_NO_SUBWAY = 6;
  BMK_MASS_TRANSIT_INCITY_RECOMMEND = 0;
  BMK_MASS_TRANSIT_INCITY_TRANSFER_FIRST = 1;
  BMK_MASS_TRANSIT_INCITY_WALK_FIRST = 2;
  BMK_MASS_TRANSIT_INCITY_NO_SUBWAY = 3;
  BMK_MASS_TRANSIT_INCITY_TIME_FIRST = 4;
  BMK_MASS_TRANSIT_INCITY_SUBWAY_FIRST = 5;
  BMK_MASS_TRANSIT_INTERCITY_TIME_FIRST = 0;
  BMK_MASS_TRANSIT_INTERCITY_START_EARLY = 1;
  BMK_MASS_TRANSIT_INTERCITY_PRICE_FIRST = 2;
  BMK_MASS_TRANSIT_INTERCITY_TRANS_TRAIN_FIRST = 0;
  BMK_MASS_TRANSIT_INTERCITY_TRANS_PLANE_FIRST = 1;
  BMK_MASS_TRANSIT_INTERCITY_TRANS_BUS_FIRST = 2;
  BMK_DRIVING_BLK_FIRST = -1;
  BMK_DRIVING_TIME_FIRST = 0;
  BMK_DRIVING_DIS_FIRST = 1;
  BMK_DRIVING_FEE_FIRST = 2;
  BMK_DRIVING_REQUEST_TRAFFICE_TYPE_NONE = 0;
  BMK_DRIVING_REQUEST_TRAFFICE_TYPE_PATH_AND_TRAFFICE = 1;
  BMK_POI_SORT_BY_COMPOSITE = 0;
  BMK_POI_SORT_BY_DISTANCE = 1;
  BMK_ROUTE_PLAN_SHARE_URL_TYPE_DRIVE = 0;
  BMK_ROUTE_PLAN_SHARE_URL_TYPE_WALK = 1;
  BMK_ROUTE_PLAN_SHARE_URL_TYPE_RIDE = 2;
  BMK_ROUTE_PLAN_SHARE_URL_TYPE_TRANSIT = 3;

type

  // ===== Forward declarations =====
{$M+}
  BMKCityListInfo = interface;
  BMKPoiInfo = interface;
  BMKPoiAddressInfo = interface;
  BMKPoiResult = interface;
  BMKPoiDetailResult = interface;
  BMKPoiIndoorInfo = interface;
  BMKPoiIndoorResult = interface;
  BMKBusLineSearchOption = interface;
  BMKTaxiInfo = interface;
  BMKVehicleInfo = interface;
  BMKTime = interface;
  BMKRouteNode = interface;
  BMKBusStation = interface;
  BMKRouteStep = interface;
  BMKBusStep = interface;
  BMKTransitStep = interface;
  BMKBaseVehicleInfo = interface;
  BMKBusVehicleInfo = interface;
  BMKPlaneVehicleInfo = interface;
  BMKTrainVehicleInfo = interface;
  BMKCoachVehicleInfo = interface;
  BMKMassTransitStep = interface;
  BMKMassTransitSubStep = interface;
  BMKDrivingStep = interface;
  BMKIndoorStepNode = interface;
  BMKIndoorRouteStep = interface;
  BMKWalkingStep = interface;
  BMKRidingStep = interface;
  BMKRouteLine = interface;
  BMKTransitRouteLine = interface;
  BMKMassTransitRouteLine = interface;
  BMKIndoorRouteLine = interface;
  BMKDrivingRouteLine = interface;
  BMKWalkingRouteLine = interface;
  BMKRidingRouteLine = interface;
  BMKSuggestAddrInfo = interface;
  BMKBusLineResult = interface;
  BMKWalkingRouteResult = interface;
  BMKDrivingRouteResult = interface;
  BMKTransitRouteResult = interface;
  BMKMassTransitRouteResult = interface;
  BMKRidingRouteResult = interface;
  BMKIndoorRouteResult = interface;
  BMKSearchBase = interface;
  BMKBusLineSearchDelegate = interface;
  BMKBusLineSearch = interface;
  BMKDistrictSearchOption = interface;
  BMKDistrictResult = interface;
  BMKDistrictSearchDelegate = interface;
  BMKDistrictSearch = interface;
  BMKGeoCodeSearchOption = interface;
  BMKReverseGeoCodeOption = interface;
  BMKReverseGeoCodeResult = interface;
  BMKGeoCodeResult = interface;
  BMKGeoCodeSearchDelegate = interface;
  BMKGeoCodeSearch = interface;
  BMKBasePoiSearchOption = interface;
  BMKCitySearchOption = interface;
  BMKNearbySearchOption = interface;
  BMKBoundSearchOption = interface;
  BMKPoiIndoorSearchOption = interface;
  BMKPoiDetailSearchOption = interface;
  BMKPoiSearchDelegate = interface;
  BMKPoiSearch = interface;
  BMKBaseRoutePlanOption = interface;
  BMKWalkingRoutePlanOption = interface;
  BMKDrivingRoutePlanOption = interface;
  BMKTransitRoutePlanOption = interface;
  BMKMassTransitRoutePlanOption = interface;
  BMKRidingRoutePlanOption = interface;
  BMKIndoorRoutePlanOption = interface;
  BMKRouteSearchDelegate = interface;
  BMKRouteSearch = interface;
  BMKPoiDetailShareURLOption = interface;
  BMKLocationShareURLOption = interface;
  BMKRoutePlanShareURLOption = interface;
  BMKShareURLResult = interface;
  BMKShareURLSearchDelegate = interface;
  BMKShareURLSearch = interface;
  BMKSuggestionSearchOption = interface;
  BMKSuggestionResult = interface;
  BMKSuggestionSearchDelegate = interface;
  BMKSuggestionSearch = interface;

  // ===== Framework typedefs =====
{$M+}
  CLLocationDegrees = Double;

  CLLocationCoordinate2D = record
    latitude: CLLocationDegrees;
    longitude: CLLocationDegrees;
  end;

  PCLLocationCoordinate2D = ^CLLocationCoordinate2D;
  NSInteger = Integer;
  BMKTransitStepType = Cardinal;
  BMKMassTransitType = Cardinal;
  BMKIndoorStepNodeType = Cardinal;
  BMKTransitPolicy = Cardinal;
  BMKMassTransitIncityPolicy = Cardinal;
  BMKMassTransitIntercityPolicy = Cardinal;
  BMKMassTransitIntercityTransPolicy = Cardinal;
  BMKDrivingPolicy = Integer;
  BMKDrivingRequestTrafficType = Cardinal;
  CGFloat = Single;
  BMKSearchErrorCode = Cardinal;
  BMKPoiSortType = Cardinal;
  NSUInteger = Cardinal;
  BMKRoutePlanShareURLType = Cardinal;
  // ===== Interface declarations =====

  BMKCityListInfoClass = interface(NSObjectClass)
    ['{1B6F00C5-2073-4F85-A0B9-084F2BE555C9}']
  end;

  BMKCityListInfo = interface(NSObject)
    ['{F308DA60-F6F5-49D4-9BCA-847984325112}']
    procedure setCity(city: NSString); cdecl;

    function city: NSString; cdecl;
    procedure setNum(num: Integer); cdecl;
    function num: Integer; cdecl;
  end;

  TBMKCityListInfo = class(TOCGenericImport<BMKCityListInfoClass,
    BMKCityListInfo>)
  end;

  PBMKCityListInfo = Pointer;

  BMKPoiInfoClass = interface(NSObjectClass)
    ['{73B3EE23-BC0C-4211-B08D-F78312A293A6}']
  end;

  BMKPoiInfo = interface(NSObject)
    ['{02046AA2-86A4-4709-B8FB-38A9D7476CCD}']
    procedure setName(name: NSString); cdecl;

    function name: NSString; cdecl;
    procedure setUid(uid: NSString); cdecl;
    function uid: NSString; cdecl;
    procedure setAddress(address: NSString); cdecl;
    function address: NSString; cdecl;
    procedure setCity(city: NSString); cdecl;
    function city: NSString; cdecl;
    procedure setPhone(phone: NSString); cdecl;
    function phone: NSString; cdecl;
    procedure setPostcode(postcode: NSString); cdecl;
    function postcode: NSString; cdecl;
    procedure setEpoitype(epoitype: Integer); cdecl;
    function epoitype: Integer; cdecl;
    procedure setPt(pt: CLLocationCoordinate2D); cdecl;
    function pt: CLLocationCoordinate2D; cdecl;
    procedure setPanoFlag(panoFlag: Boolean); cdecl;
    function panoFlag: Boolean; cdecl;
  end;

  TBMKPoiInfo = class(TOCGenericImport<BMKPoiInfoClass, BMKPoiInfo>)
  end;

  PBMKPoiInfo = Pointer;

  BMKPoiAddressInfoClass = interface(NSObjectClass)
    ['{75BF3187-2B4D-4E18-A4B6-1D9B176EA6A5}']
  end;

  BMKPoiAddressInfo = interface(NSObject)
    ['{35236D0B-1CF4-4D34-8EF3-3BA41D7ADE13}']
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setAddress(address: NSString); cdecl;
    function address: NSString; cdecl;
    procedure setPt(pt: CLLocationCoordinate2D); cdecl;
    function pt: CLLocationCoordinate2D; cdecl;
  end;

  TBMKPoiAddressInfo = class(TOCGenericImport<BMKPoiAddressInfoClass,
    BMKPoiAddressInfo>)
  end;

  PBMKPoiAddressInfo = Pointer;

  BMKPoiResultClass = interface(NSObjectClass)
    ['{E43CD791-3942-403A-85E3-C9A4E5B0A9E4}']
  end;

  BMKPoiResult = interface(NSObject)
    ['{4EDE6F59-F544-455B-BEBE-3D6F98D825B2}']
    procedure setTotalPoiNum(totalPoiNum: Integer); cdecl;
    function totalPoiNum: Integer; cdecl;
    procedure setCurrPoiNum(currPoiNum: Integer); cdecl;
    function currPoiNum: Integer; cdecl;
    procedure setPageNum(pageNum: Integer); cdecl;
    function pageNum: Integer; cdecl;
    procedure setPageIndex(pageIndex: Integer); cdecl;
    function pageIndex: Integer; cdecl;
    procedure setPoiInfoList(poiInfoList: NSArray); cdecl;
    function poiInfoList: NSArray; cdecl;
    procedure setCityList(cityList: NSArray); cdecl;
    function cityList: NSArray; cdecl;
    procedure setIsHavePoiAddressInfoList(isHavePoiAddressInfoList
      : Boolean); cdecl;
    function isHavePoiAddressInfoList: Boolean; cdecl;
    procedure setPoiAddressInfoList(poiAddressInfoList: NSArray); cdecl;
    function poiAddressInfoList: NSArray; cdecl;
  end;

  TBMKPoiResult = class(TOCGenericImport<BMKPoiResultClass, BMKPoiResult>)
  end;

  PBMKPoiResult = Pointer;

  BMKPoiDetailResultClass = interface(NSObjectClass)
    ['{691FF3D2-90A5-46E1-A985-E11086B5EF18}']
  end;

  BMKPoiDetailResult = interface(NSObject)
    ['{C7D3384C-DC06-45CC-93D9-5DAD7A70D95F}']
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setAddress(address: NSString); cdecl;
    function address: NSString; cdecl;
    procedure setPhone(phone: NSString); cdecl;
    function phone: NSString; cdecl;
    procedure setUid(uid: NSString); cdecl;
    function uid: NSString; cdecl;
    procedure setTag(tag: NSString); cdecl;
    function tag: NSString; cdecl;
    procedure setDetailUrl(detailUrl: NSString); cdecl;
    function detailUrl: NSString; cdecl;
    procedure setType(&type: NSString); cdecl;
    function &type: NSString; cdecl;
    procedure setPt(pt: CLLocationCoordinate2D); cdecl;
    function pt: CLLocationCoordinate2D; cdecl;
    procedure setPrice(price: Double); cdecl;
    function price: Double; cdecl;
    procedure setOverallRating(overallRating: Double); cdecl;
    function overallRating: Double; cdecl;
    procedure setTasteRating(tasteRating: Double); cdecl;
    function tasteRating: Double; cdecl;
    procedure setServiceRating(serviceRating: Double); cdecl;
    function serviceRating: Double; cdecl;
    procedure setEnvironmentRating(environmentRating: Double); cdecl;
    function environmentRating: Double; cdecl;
    procedure setFacilityRating(facilityRating: Double); cdecl;
    function facilityRating: Double; cdecl;
    procedure setHygieneRating(hygieneRating: Double); cdecl;
    function hygieneRating: Double; cdecl;
    procedure setTechnologyRating(technologyRating: Double); cdecl;
    function technologyRating: Double; cdecl;
    procedure setImageNum(imageNum: Integer); cdecl;
    function imageNum: Integer; cdecl;
    procedure setGrouponNum(grouponNum: Integer); cdecl;
    function grouponNum: Integer; cdecl;
    procedure setCommentNum(commentNum: Integer); cdecl;
    function commentNum: Integer; cdecl;
    procedure setFavoriteNum(favoriteNum: Integer); cdecl;
    function favoriteNum: Integer; cdecl;
    procedure setCheckInNum(checkInNum: Integer); cdecl;
    function checkInNum: Integer; cdecl;
    procedure setShopHours(shopHours: NSString); cdecl;
    function shopHours: NSString; cdecl;
  end;

  TBMKPoiDetailResult = class(TOCGenericImport<BMKPoiDetailResultClass,
    BMKPoiDetailResult>)
  end;

  PBMKPoiDetailResult = Pointer;

  BMKPoiIndoorInfoClass = interface(NSObjectClass)
    ['{C432D06F-D34E-4E2D-8C04-C070A394F0EB}']
  end;

  BMKPoiIndoorInfo = interface(NSObject)
    ['{1A98AA78-2F5E-484C-B729-7719F32B83A3}']
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setUid(uid: NSString); cdecl;
    function uid: NSString; cdecl;
    procedure setIndoorId(indoorId: NSString); cdecl;
    function indoorId: NSString; cdecl;
    procedure setFloor(floor: NSString); cdecl;
    function floor: NSString; cdecl;
    procedure setAddress(address: NSString); cdecl;
    function address: NSString; cdecl;
    procedure setCity(city: NSString); cdecl;
    function city: NSString; cdecl;
    procedure setPhone(phone: NSString); cdecl;
    function phone: NSString; cdecl;
    procedure setPt(pt: CLLocationCoordinate2D); cdecl;
    function pt: CLLocationCoordinate2D; cdecl;
    procedure setTag(tag: NSString); cdecl;
    function tag: NSString; cdecl;
    procedure setPrice(price: Double); cdecl;
    function price: Double; cdecl;
    procedure setStarLevel(starLevel: NSInteger); cdecl;
    function starLevel: NSInteger; cdecl;
    procedure setGrouponFlag(grouponFlag: Boolean); cdecl;
    function grouponFlag: Boolean; cdecl;
    procedure setTakeoutFlag(takeoutFlag: Boolean); cdecl;
    function takeoutFlag: Boolean; cdecl;
    procedure setWaitedFlag(waitedFlag: Boolean); cdecl;
    function waitedFlag: Boolean; cdecl;
    procedure setGrouponNum(grouponNum: NSInteger); cdecl;
    function grouponNum: NSInteger; cdecl;
  end;

  TBMKPoiIndoorInfo = class(TOCGenericImport<BMKPoiIndoorInfoClass,
    BMKPoiIndoorInfo>)
  end;

  PBMKPoiIndoorInfo = Pointer;

  BMKPoiIndoorResultClass = interface(NSObjectClass)
    ['{9ED96363-57F3-478A-98DE-65A441A05A05}']
  end;

  BMKPoiIndoorResult = interface(NSObject)
    ['{77219775-B85D-4788-B837-0CC647347277}']
    procedure setTotalPoiNum(totalPoiNum: NSInteger); cdecl;
    function totalPoiNum: NSInteger; cdecl;
    procedure setCurrPoiNum(currPoiNum: NSInteger); cdecl;
    function currPoiNum: NSInteger; cdecl;
    procedure setPageNum(pageNum: NSInteger); cdecl;
    function pageNum: NSInteger; cdecl;
    procedure setPageIndex(pageIndex: Integer); cdecl;
    function pageIndex: Integer; cdecl;
    procedure setPoiIndoorInfoList(poiIndoorInfoList: NSArray); cdecl;
    function poiIndoorInfoList: NSArray; cdecl;
  end;

  TBMKPoiIndoorResult = class(TOCGenericImport<BMKPoiIndoorResultClass,
    BMKPoiIndoorResult>)
  end;

  PBMKPoiIndoorResult = Pointer;

  BMKBusLineSearchOptionClass = interface(NSObjectClass)
    ['{9259872F-24BE-40B3-B444-5C9292441566}']
  end;

  BMKBusLineSearchOption = interface(NSObject)
    ['{EDAD1353-E19A-43F6-9A75-BED7C952B46F}']
    procedure setCity(city: NSString); cdecl;
    function city: NSString; cdecl;
    procedure setBusLineUid(busLineUid: NSString); cdecl;
    function busLineUid: NSString; cdecl;
  end;

  TBMKBusLineSearchOption = class(TOCGenericImport<BMKBusLineSearchOptionClass,
    BMKBusLineSearchOption>)
  end;

  PBMKBusLineSearchOption = Pointer;

  BMKTaxiInfoClass = interface(NSObjectClass)
    ['{4942AD57-3924-46E9-8286-BD27E4745586}']
  end;

  BMKTaxiInfo = interface(NSObject)
    ['{95D029C4-2C53-4D3F-8E1A-FF03F64493B4}']
    procedure setDesc(desc: NSString); cdecl;
    function desc: NSString; cdecl;
    procedure setDistance(distance: Integer); cdecl;
    function distance: Integer; cdecl;
    procedure setDuration(duration: Integer); cdecl;
    function duration: Integer; cdecl;
    procedure setPerKMPrice(perKMPrice: CGFloat); cdecl;
    function perKMPrice: CGFloat; cdecl;
    procedure setStartPrice(startPrice: CGFloat); cdecl;
    function startPrice: CGFloat; cdecl;
    procedure setTotalPrice(totalPrice: Integer); cdecl;
    function totalPrice: Integer; cdecl;
  end;

  TBMKTaxiInfo = class(TOCGenericImport<BMKTaxiInfoClass, BMKTaxiInfo>)
  end;

  PBMKTaxiInfo = Pointer;

  BMKVehicleInfoClass = interface(NSObjectClass)
    ['{008FF8F7-5F82-4C88-8271-F98F574E4AB3}']
  end;

  BMKVehicleInfo = interface(NSObject)
    ['{53A7A934-907F-4895-A769-4A8435FC463D}']
    procedure setUid(uid: NSString); cdecl;
    function uid: NSString; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure setPassStationNum(passStationNum: Integer); cdecl;
    function passStationNum: Integer; cdecl;
    procedure setTotalPrice(totalPrice: Integer); cdecl;
    function totalPrice: Integer; cdecl;
    procedure setZonePrice(zonePrice: Integer); cdecl;
    function zonePrice: Integer; cdecl;
  end;

  TBMKVehicleInfo = class(TOCGenericImport<BMKVehicleInfoClass, BMKVehicleInfo>)
  end;

  PBMKVehicleInfo = Pointer;

  BMKTimeClass = interface(NSObjectClass)
    ['{BFC1AC7E-4DA9-4C88-8CBC-B8309E91FE8B}']
  end;

  BMKTime = interface(NSObject)
    ['{3F0E6F39-C226-4A3B-BF92-72297EE48979}']
    procedure setDates(dates: Integer); cdecl;
    function dates: Integer; cdecl;
    procedure setHours(hours: Integer); cdecl;
    function hours: Integer; cdecl;
    procedure setMinutes(minutes: Integer); cdecl;
    function minutes: Integer; cdecl;
    procedure setSeconds(seconds: Integer); cdecl;
    function seconds: Integer; cdecl;
  end;

  TBMKTime = class(TOCGenericImport<BMKTimeClass, BMKTime>)
  end;

  PBMKTime = Pointer;

  BMKRouteNodeClass = interface(NSObjectClass)
    ['{E69CCE44-0518-4421-9B41-786688800DED}']
  end;

  BMKRouteNode = interface(NSObject)
    ['{11968B80-2F9C-4C40-819B-622771725C97}']
    procedure setUid(uid: NSString); cdecl;
    function uid: NSString; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure setLocation(location: CLLocationCoordinate2D); cdecl;
    function location: CLLocationCoordinate2D; cdecl;
  end;

  TBMKRouteNode = class(TOCGenericImport<BMKRouteNodeClass, BMKRouteNode>)
  end;

  PBMKRouteNode = Pointer;

  BMKBusStationClass = interface(BMKRouteNodeClass)
    ['{5387D732-E714-44BC-BF2E-8556F040B415}']
  end;

  BMKBusStation = interface(BMKRouteNode)
    ['{F7296E0C-F108-4170-B2B3-4217C8EE398D}']
  end;

  TBMKBusStation = class(TOCGenericImport<BMKBusStationClass, BMKBusStation>)
  end;

  PBMKBusStation = Pointer;

  BMKRouteStepClass = interface(NSObjectClass)
    ['{67895D6D-EE59-4CE1-AD36-8716DFA97AB9}']
  end;

  BMKRouteStep = interface(NSObject)
    ['{AC1AB58A-5F29-46E4-AB09-FE3A04BC56F9}']
    procedure setDistance(distance: Integer); cdecl;
    function distance: Integer; cdecl;
    procedure setDuration(duration: Integer); cdecl;
    function duration: Integer; cdecl;
    procedure setPoints(points: Pointer); cdecl;
    function points: Pointer; cdecl;
    procedure setPointsCount(pointsCount: Integer); cdecl;
    function pointsCount: Integer; cdecl;
  end;

  TBMKRouteStep = class(TOCGenericImport<BMKRouteStepClass, BMKRouteStep>)
  end;

  PBMKRouteStep = Pointer;

  BMKBusStepClass = interface(BMKRouteStepClass)
    ['{202E2E73-B1F2-4F1A-83A4-3D0935CE48E7}']
  end;

  BMKBusStep = interface(BMKRouteStep)
    ['{07F9DAA0-3E46-47EE-8E09-40BFAF445BE0}']
  end;

  TBMKBusStep = class(TOCGenericImport<BMKBusStepClass, BMKBusStep>)
  end;

  PBMKBusStep = Pointer;

  BMKTransitStepClass = interface(BMKRouteStepClass)
    ['{98A976EA-026F-47E8-A25A-7398BFD4AA27}']
  end;

  BMKTransitStep = interface(BMKRouteStep)
    ['{678C33F9-2C05-470C-9975-4CB6ECD5E5F5}']
    procedure setEntrace(entrace: BMKRouteNode); cdecl;
    function entrace: BMKRouteNode; cdecl;
    procedure setExit(exit: BMKRouteNode); cdecl;
    function exit: BMKRouteNode; cdecl;
    procedure setInstruction(instruction: NSString); cdecl;
    function instruction: NSString; cdecl;
    procedure setStepType(stepType: BMKTransitStepType); cdecl;
    function stepType: BMKTransitStepType; cdecl;
    procedure setVehicleInfo(vehicleInfo: BMKVehicleInfo); cdecl;
    function vehicleInfo: BMKVehicleInfo; cdecl;
  end;

  TBMKTransitStep = class(TOCGenericImport<BMKTransitStepClass, BMKTransitStep>)
  end;

  PBMKTransitStep = Pointer;

  BMKBaseVehicleInfoClass = interface(NSObjectClass)
    ['{BFEC0BF9-26D3-498C-BAB7-A5A03CD442E2}']
  end;

  BMKBaseVehicleInfo = interface(NSObject)
    ['{3E102CE0-E19C-4FDC-8B53-8C60D6ECD587}']
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setDepartureStation(departureStation: NSString); cdecl;
    function departureStation: NSString; cdecl;
    procedure setArriveStation(arriveStation: NSString); cdecl;
    function arriveStation: NSString; cdecl;
    procedure setDepartureTime(departureTime: NSString); cdecl;
    function departureTime: NSString; cdecl;
    procedure setArriveTime(arriveTime: NSString); cdecl;
    function arriveTime: NSString; cdecl;
  end;

  TBMKBaseVehicleInfo = class(TOCGenericImport<BMKBaseVehicleInfoClass,
    BMKBaseVehicleInfo>)
  end;

  PBMKBaseVehicleInfo = Pointer;

  BMKBusVehicleInfoClass = interface(BMKBaseVehicleInfoClass)
    ['{223BC2C0-F537-4D44-8FA5-6B8D6000CB3C}']
  end;

  BMKBusVehicleInfo = interface(BMKBaseVehicleInfo)
    ['{0751CDA3-5015-4628-9803-4A743D174DAD}']
    procedure setPassStationNum(passStationNum: NSInteger); cdecl;
    function passStationNum: NSInteger; cdecl;
    procedure setFirstTime(firstTime: NSString); cdecl;
    function firstTime: NSString; cdecl;
    procedure setLastTime(lastTime: NSString); cdecl;
    function lastTime: NSString; cdecl;
  end;

  TBMKBusVehicleInfo = class(TOCGenericImport<BMKBusVehicleInfoClass,
    BMKBusVehicleInfo>)
  end;

  PBMKBusVehicleInfo = Pointer;

  BMKPlaneVehicleInfoClass = interface(BMKBaseVehicleInfoClass)
    ['{CACABA1E-F447-48DB-BCF9-6539260BBFE5}']
  end;

  BMKPlaneVehicleInfo = interface(BMKBaseVehicleInfo)
    ['{4C57A89C-7481-4797-9DE1-7F761292348C}']
    procedure setPrice(price: CGFloat); cdecl;
    function price: CGFloat; cdecl;
    procedure setDiscount(discount: CGFloat); cdecl;
    function discount: CGFloat; cdecl;
    procedure setAirlines(airlines: NSString); cdecl;
    function airlines: NSString; cdecl;
    procedure setBookingUrl(bookingUrl: NSString); cdecl;
    function bookingUrl: NSString; cdecl;
  end;

  TBMKPlaneVehicleInfo = class(TOCGenericImport<BMKPlaneVehicleInfoClass,
    BMKPlaneVehicleInfo>)
  end;

  PBMKPlaneVehicleInfo = Pointer;

  BMKTrainVehicleInfoClass = interface(BMKBaseVehicleInfoClass)
    ['{17B972DF-91C0-435A-9610-D323305626FC}']
  end;

  BMKTrainVehicleInfo = interface(BMKBaseVehicleInfo)
    ['{8C1DC5FB-8474-4F1A-8319-1CB9D4768EAC}']
    procedure setPrice(price: CGFloat); cdecl;
    function price: CGFloat; cdecl;
    procedure setBooking(booking: NSString); cdecl;
    function booking: NSString; cdecl;
  end;

  TBMKTrainVehicleInfo = class(TOCGenericImport<BMKTrainVehicleInfoClass,
    BMKTrainVehicleInfo>)
  end;

  PBMKTrainVehicleInfo = Pointer;

  BMKCoachVehicleInfoClass = interface(BMKBaseVehicleInfoClass)
    ['{792F13F2-FEE2-4FFA-9E28-D114B6CCD90A}']
  end;

  BMKCoachVehicleInfo = interface(BMKBaseVehicleInfo)
    ['{7AB48A12-2A41-4A43-A751-F1BE29B3881B}']
    procedure setPrice(price: CGFloat); cdecl;
    function price: CGFloat; cdecl;
    procedure setBookingUrl(bookingUrl: NSString); cdecl;
    function bookingUrl: NSString; cdecl;
    procedure setProviderName(providerName: NSString); cdecl;
    function providerName: NSString; cdecl;
    procedure setProviderUrl(providerUrl: NSString); cdecl;
    function providerUrl: NSString; cdecl;
  end;

  TBMKCoachVehicleInfo = class(TOCGenericImport<BMKCoachVehicleInfoClass,
    BMKCoachVehicleInfo>)
  end;

  PBMKCoachVehicleInfo = Pointer;

  BMKMassTransitStepClass = interface(NSObjectClass)
    ['{C1D2EE4F-8922-455A-B404-9CF47D1C0A8C}']
  end;

  BMKMassTransitStep = interface(NSObject)
    ['{1D03327D-682E-4C27-9052-8A25CC849CB6}']
    procedure setIsSubStep(isSubStep: Boolean); cdecl;
    function isSubStep: Boolean; cdecl;
    procedure setSteps(steps: NSArray); cdecl;
    function steps: NSArray; cdecl;
  end;

  TBMKMassTransitStep = class(TOCGenericImport<BMKMassTransitStepClass,
    BMKMassTransitStep>)
  end;

  PBMKMassTransitStep = Pointer;

  BMKMassTransitSubStepClass = interface(BMKRouteStepClass)
    ['{667EFBED-2EF1-4E5B-99BB-4A5CADFBDBB2}']
  end;

  BMKMassTransitSubStep = interface(BMKRouteStep)
    ['{78F7BD14-84D8-4DA0-8D61-9F7B68BB2FCF}']
    procedure setEntraceCoor(entraceCoor: CLLocationCoordinate2D); cdecl;
    function entraceCoor: CLLocationCoordinate2D; cdecl;
    procedure setExitCoor(exitCoor: CLLocationCoordinate2D); cdecl;
    function exitCoor: CLLocationCoordinate2D; cdecl;
    procedure setInstructions(instructions: NSString); cdecl;
    function instructions: NSString; cdecl;
    procedure setStepType(stepType: BMKMassTransitType); cdecl;
    function stepType: BMKMassTransitType; cdecl;
    procedure setVehicleInfo(vehicleInfo: BMKBaseVehicleInfo); cdecl;
    function vehicleInfo: BMKBaseVehicleInfo; cdecl;
  end;

  TBMKMassTransitSubStep = class(TOCGenericImport<BMKMassTransitSubStepClass,
    BMKMassTransitSubStep>)
  end;

  PBMKMassTransitSubStep = Pointer;

  BMKDrivingStepClass = interface(BMKRouteStepClass)
    ['{D68F5933-EC7E-48BB-8D8C-5A92E3AAEA3D}']
  end;

  BMKDrivingStep = interface(BMKRouteStep)
    ['{5FCF3E9F-1813-4D25-BE47-61250442154C}']
    procedure setDirection(direction: Integer); cdecl;
    function direction: Integer; cdecl;
    procedure setEntrace(entrace: BMKRouteNode); cdecl;
    function entrace: BMKRouteNode; cdecl;
    procedure setEntraceInstruction(entraceInstruction: NSString); cdecl;
    function entraceInstruction: NSString; cdecl;
    procedure setExit(exit: BMKRouteNode); cdecl;
    function exit: BMKRouteNode; cdecl;
    procedure setExitInstruction(exitInstruction: NSString); cdecl;
    function exitInstruction: NSString; cdecl;
    procedure setInstruction(instruction: NSString); cdecl;
    function instruction: NSString; cdecl;
    procedure setNumTurns(numTurns: Integer); cdecl;
    function numTurns: Integer; cdecl;
    procedure setHasTrafficsInfo(hasTrafficsInfo: Boolean); cdecl;
    function hasTrafficsInfo: Boolean; cdecl;
    procedure setTraffics(traffics: NSArray); cdecl;
    function traffics: NSArray; cdecl;
  end;

  TBMKDrivingStep = class(TOCGenericImport<BMKDrivingStepClass, BMKDrivingStep>)
  end;

  PBMKDrivingStep = Pointer;

  BMKIndoorStepNodeClass = interface(NSObjectClass)
    ['{8FB65B3B-1AAB-4466-BA73-9D59147F1852}']
  end;

  BMKIndoorStepNode = interface(NSObject)
    ['{B01936BF-BC0E-4216-8D67-535C0AA8F726}']
    procedure setCoordinate(coordinate: CLLocationCoordinate2D); cdecl;
    function coordinate: CLLocationCoordinate2D; cdecl;
    procedure setType(&type: BMKIndoorStepNodeType); cdecl;
    function &type: BMKIndoorStepNodeType; cdecl;
    procedure setDesc(desc: NSString); cdecl;
    function desc: NSString; cdecl;
  end;

  TBMKIndoorStepNode = class(TOCGenericImport<BMKIndoorStepNodeClass,
    BMKIndoorStepNode>)
  end;

  PBMKIndoorStepNode = Pointer;

  BMKIndoorRouteStepClass = interface(BMKRouteStepClass)
    ['{C1CB507C-3D5E-4936-AE53-7148F9403391}']
  end;

  BMKIndoorRouteStep = interface(BMKRouteStep)
    ['{DE310B92-088E-41C5-B590-0E252282216A}']
    procedure setEntrace(entrace: BMKRouteNode); cdecl;
    function entrace: BMKRouteNode; cdecl;
    procedure setExit(exit: BMKRouteNode); cdecl;
    function exit: BMKRouteNode; cdecl;
    procedure setInstructions(instructions: NSString); cdecl;
    function instructions: NSString; cdecl;
    procedure setBuildingid(buildingid: NSString); cdecl;
    function buildingid: NSString; cdecl;
    procedure setFloorid(floorid: NSString); cdecl;
    function floorid: NSString; cdecl;
    procedure setIndoorStepNodes(indoorStepNodes: NSArray); cdecl;
    function indoorStepNodes: NSArray; cdecl;
  end;

  TBMKIndoorRouteStep = class(TOCGenericImport<BMKIndoorRouteStepClass,
    BMKIndoorRouteStep>)
  end;

  PBMKIndoorRouteStep = Pointer;

  BMKWalkingStepClass = interface(BMKRouteStepClass)
    ['{6F3052A3-01E1-4679-9605-D581127C42A1}']
  end;

  BMKWalkingStep = interface(BMKRouteStep)
    ['{85D54FAB-982A-44DB-A7B4-3E3A6353EF65}']
    procedure setDirection(direction: Integer); cdecl;
    function direction: Integer; cdecl;
    procedure setEntrace(entrace: BMKRouteNode); cdecl;
    function entrace: BMKRouteNode; cdecl;
    procedure setEntraceInstruction(entraceInstruction: NSString); cdecl;
    function entraceInstruction: NSString; cdecl;
    procedure setExit(exit: BMKRouteNode); cdecl;
    function exit: BMKRouteNode; cdecl;
    procedure setExitInstruction(exitInstruction: NSString); cdecl;
    function exitInstruction: NSString; cdecl;
    procedure setInstruction(instruction: NSString); cdecl;
    function instruction: NSString; cdecl;
  end;

  TBMKWalkingStep = class(TOCGenericImport<BMKWalkingStepClass, BMKWalkingStep>)
  end;

  PBMKWalkingStep = Pointer;

  BMKRidingStepClass = interface(BMKRouteStepClass)
    ['{27A1E755-0EFC-44B0-9D3F-2ED14A552C98}']
  end;

  BMKRidingStep = interface(BMKRouteStep)
    ['{0D63A2EE-EAE3-40E7-B961-0FD82F218368}']
    procedure setDirection(direction: NSInteger); cdecl;
    function direction: NSInteger; cdecl;
    procedure setEntrace(entrace: BMKRouteNode); cdecl;
    function entrace: BMKRouteNode; cdecl;
    procedure setEntraceInstruction(entraceInstruction: NSString); cdecl;
    function entraceInstruction: NSString; cdecl;
    procedure setExit(exit: BMKRouteNode); cdecl;
    function exit: BMKRouteNode; cdecl;
    procedure setExitInstruction(exitInstruction: NSString); cdecl;
    function exitInstruction: NSString; cdecl;
    procedure setInstruction(instruction: NSString); cdecl;
    function instruction: NSString; cdecl;
  end;

  TBMKRidingStep = class(TOCGenericImport<BMKRidingStepClass, BMKRidingStep>)
  end;

  PBMKRidingStep = Pointer;

  BMKRouteLineClass = interface(NSObjectClass)
    ['{A9D412D8-0DA2-4B66-839E-4EF269B2CBF0}']
  end;

  BMKRouteLine = interface(NSObject)
    ['{F309CE6D-94A6-45E5-85D1-EC5EF10BA315}']
    procedure setDistance(distance: Integer); cdecl;
    function distance: Integer; cdecl;
    procedure setDuration(duration: BMKTime); cdecl;
    function duration: BMKTime; cdecl;
    procedure setStarting(starting: BMKRouteNode); cdecl;
    function starting: BMKRouteNode; cdecl;
    procedure setTerminal(terminal: BMKRouteNode); cdecl;
    function terminal: BMKRouteNode; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure setSteps(steps: NSArray); cdecl;
    function steps: NSArray; cdecl;
  end;

  TBMKRouteLine = class(TOCGenericImport<BMKRouteLineClass, BMKRouteLine>)
  end;

  PBMKRouteLine = Pointer;

  BMKTransitRouteLineClass = interface(BMKRouteLineClass)
    ['{E36E5017-348F-465D-9AC7-E32A0828B97C}']
  end;

  BMKTransitRouteLine = interface(BMKRouteLine)
    ['{1759528E-03C4-48BD-A90D-DF19D2FEE708}']
  end;

  TBMKTransitRouteLine = class(TOCGenericImport<BMKTransitRouteLineClass,
    BMKTransitRouteLine>)
  end;

  PBMKTransitRouteLine = Pointer;

  BMKMassTransitRouteLineClass = interface(BMKRouteLineClass)
    ['{03F5D833-C208-4B8A-A72B-4F2B0885B049}']
  end;

  BMKMassTransitRouteLine = interface(BMKRouteLine)
    ['{1D748096-41B5-485C-BFEE-E76A399BE09E}']
    procedure setPrice(price: CGFloat); cdecl;
    function price: CGFloat; cdecl;
  end;

  TBMKMassTransitRouteLine = class
    (TOCGenericImport<BMKMassTransitRouteLineClass, BMKMassTransitRouteLine>)
  end;

  PBMKMassTransitRouteLine = Pointer;

  BMKIndoorRouteLineClass = interface(BMKRouteLineClass)
    ['{E62565B4-8E2D-44E7-A2EB-B20908D847C9}']
  end;

  BMKIndoorRouteLine = interface(BMKRouteLine)
    ['{14F07764-7839-4737-9DC9-3018A723B7BF}']
  end;

  TBMKIndoorRouteLine = class(TOCGenericImport<BMKIndoorRouteLineClass,
    BMKIndoorRouteLine>)
  end;

  PBMKIndoorRouteLine = Pointer;

  BMKDrivingRouteLineClass = interface(BMKRouteLineClass)
    ['{B3274412-FAD4-4971-A771-F95A175472CE}']
  end;

  BMKDrivingRouteLine = interface(BMKRouteLine)
    ['{46AE2667-0E66-482E-BA01-BAFF791ADB9E}']
    procedure setIsSupportTraffic(isSupportTraffic: Integer); cdecl;
    function isSupportTraffic: Integer; cdecl;
    procedure setWayPoints(wayPoints: NSArray); cdecl;
    function wayPoints: NSArray; cdecl;
    procedure setLightNum(lightNum: NSInteger); cdecl;
    function lightNum: NSInteger; cdecl;
    procedure setCongestionMetres(congestionMetres: NSInteger); cdecl;
    function congestionMetres: NSInteger; cdecl;
    procedure setTaxiFares(taxiFares: NSInteger); cdecl;
    function taxiFares: NSInteger; cdecl;
  end;

  TBMKDrivingRouteLine = class(TOCGenericImport<BMKDrivingRouteLineClass,
    BMKDrivingRouteLine>)
  end;

  PBMKDrivingRouteLine = Pointer;

  BMKWalkingRouteLineClass = interface(BMKRouteLineClass)
    ['{13AF356A-80EB-4CEC-8F02-3E4D2AA73D3A}']
  end;

  BMKWalkingRouteLine = interface(BMKRouteLine)
    ['{BC4AEDAF-9388-43A7-8DA7-DFBC9C76CC35}']
  end;

  TBMKWalkingRouteLine = class(TOCGenericImport<BMKWalkingRouteLineClass,
    BMKWalkingRouteLine>)
  end;

  PBMKWalkingRouteLine = Pointer;

  BMKRidingRouteLineClass = interface(BMKRouteLineClass)
    ['{F82A7586-C6A2-4501-A08D-E8405D343974}']
  end;

  BMKRidingRouteLine = interface(BMKRouteLine)
    ['{5CF1C649-28AC-4672-8D29-69E85EDD0D27}']
  end;

  TBMKRidingRouteLine = class(TOCGenericImport<BMKRidingRouteLineClass,
    BMKRidingRouteLine>)
  end;

  PBMKRidingRouteLine = Pointer;

  BMKSuggestAddrInfoClass = interface(NSObjectClass)
    ['{D4614B2B-E003-400E-BAFD-D073ED9EC99F}']
  end;

  BMKSuggestAddrInfo = interface(NSObject)
    ['{978F1222-F7BF-4DCF-B132-308C3743AECC}']
    procedure setStartPoiList(startPoiList: NSArray); cdecl;
    function startPoiList: NSArray; cdecl;
    procedure setStartCityList(startCityList: NSArray); cdecl;
    function startCityList: NSArray; cdecl;
    procedure setEndPoiList(endPoiList: NSArray); cdecl;
    function endPoiList: NSArray; cdecl;
    procedure setEndCityList(endCityList: NSArray); cdecl;
    function endCityList: NSArray; cdecl;
    procedure setWayPointPoiList(wayPointPoiList: NSArray); cdecl;
    function wayPointPoiList: NSArray; cdecl;
    procedure setWayPointCityList(wayPointCityList: NSArray); cdecl;
    function wayPointCityList: NSArray; cdecl;
  end;

  TBMKSuggestAddrInfo = class(TOCGenericImport<BMKSuggestAddrInfoClass,
    BMKSuggestAddrInfo>)
  end;

  PBMKSuggestAddrInfo = Pointer;

  BMKBusLineResultClass = interface(NSObjectClass)
    ['{D1DBD835-C2E5-462F-9D5B-4B85E7B123E5}']
  end;

  BMKBusLineResult = interface(NSObject)
    ['{255ACA61-DFA2-4DC1-A5E1-AFFBACD01A2A}']
    procedure setBusCompany(busCompany: NSString); cdecl;
    function busCompany: NSString; cdecl;
    procedure setBusLineName(busLineName: NSString); cdecl;
    function busLineName: NSString; cdecl;
    procedure setBusLineDirection(busLineDirection: NSString); cdecl;
    function busLineDirection: NSString; cdecl;
    procedure setUid(uid: NSString); cdecl;
    function uid: NSString; cdecl;
    procedure setStartTime(startTime: NSString); cdecl;
    function startTime: NSString; cdecl;
    procedure setEndTime(endTime: NSString); cdecl;
    function endTime: NSString; cdecl;
    procedure setIsMonTicket(isMonTicket: Integer); cdecl;
    function isMonTicket: Integer; cdecl;
    procedure setBasicPrice(basicPrice: CGFloat); cdecl;
    function basicPrice: CGFloat; cdecl;
    procedure setTotalPrice(totalPrice: CGFloat); cdecl;
    function totalPrice: CGFloat; cdecl;
    procedure setBusStations(busStations: NSArray); cdecl;
    function busStations: NSArray; cdecl;
    procedure setBusSteps(busSteps: NSArray); cdecl;
    function busSteps: NSArray; cdecl;
  end;

  TBMKBusLineResult = class(TOCGenericImport<BMKBusLineResultClass,
    BMKBusLineResult>)
  end;

  PBMKBusLineResult = Pointer;

  BMKWalkingRouteResultClass = interface(NSObjectClass)
    ['{5E206624-E89E-4325-B212-32E1C017C54A}']
  end;

  BMKWalkingRouteResult = interface(NSObject)
    ['{211BB781-1E31-4EA7-AD21-1E704D0B8ACD}']
    procedure setTaxiInfo(taxiInfo: BMKTaxiInfo); cdecl;
    function taxiInfo: BMKTaxiInfo; cdecl;
    procedure setSuggestAddrResult(suggestAddrResult
      : BMKSuggestAddrInfo); cdecl;
    function suggestAddrResult: BMKSuggestAddrInfo; cdecl;
    procedure setRoutes(routes: NSArray); cdecl;
    function routes: NSArray; cdecl;
  end;

  TBMKWalkingRouteResult = class(TOCGenericImport<BMKWalkingRouteResultClass,
    BMKWalkingRouteResult>)
  end;

  PBMKWalkingRouteResult = Pointer;

  BMKDrivingRouteResultClass = interface(NSObjectClass)
    ['{8B8C633B-DEC5-42EF-9B1B-E9D70E573B69}']
  end;

  BMKDrivingRouteResult = interface(NSObject)
    ['{EB8F9C26-2FE3-4CC6-AB01-4392524D392A}']
    procedure setTaxiInfo(taxiInfo: BMKTaxiInfo); cdecl;
    function taxiInfo: BMKTaxiInfo; cdecl;
    procedure setSuggestAddrResult(suggestAddrResult
      : BMKSuggestAddrInfo); cdecl;
    function suggestAddrResult: BMKSuggestAddrInfo; cdecl;
    procedure setRoutes(routes: NSArray); cdecl;
    function routes: NSArray; cdecl;
  end;

  TBMKDrivingRouteResult = class(TOCGenericImport<BMKDrivingRouteResultClass,
    BMKDrivingRouteResult>)
  end;

  PBMKDrivingRouteResult = Pointer;

  BMKTransitRouteResultClass = interface(NSObjectClass)
    ['{F454F137-9B4C-4CC3-A0B7-253F7A3F25E1}']
  end;

  BMKTransitRouteResult = interface(NSObject)
    ['{BDFC6B28-348D-47D0-B1D1-8302245CB15E}']
    procedure setTaxiInfo(taxiInfo: BMKTaxiInfo); cdecl;
    function taxiInfo: BMKTaxiInfo; cdecl;
    procedure setSuggestAddrResult(suggestAddrResult
      : BMKSuggestAddrInfo); cdecl;
    function suggestAddrResult: BMKSuggestAddrInfo; cdecl;
    procedure setRoutes(routes: NSArray); cdecl;
    function routes: NSArray; cdecl;
  end;

  TBMKTransitRouteResult = class(TOCGenericImport<BMKTransitRouteResultClass,
    BMKTransitRouteResult>)
  end;

  PBMKTransitRouteResult = Pointer;

  BMKMassTransitRouteResultClass = interface(NSObjectClass)
    ['{0456EEC2-2787-4079-A15A-79787A93BBD7}']
  end;

  BMKMassTransitRouteResult = interface(NSObject)
    ['{07C56380-557F-4E93-9168-38A26D73089F}']
    procedure setSuggestAddrResult(suggestAddrResult
      : BMKSuggestAddrInfo); cdecl;
    function suggestAddrResult: BMKSuggestAddrInfo; cdecl;
    procedure setRoutes(routes: NSArray); cdecl;
    function routes: NSArray; cdecl;
    procedure setTotalRoutes(totalRoutes: NSInteger); cdecl;
    function totalRoutes: NSInteger; cdecl;
    procedure setTaxiInfo(taxiInfo: BMKTaxiInfo); cdecl;
    function taxiInfo: BMKTaxiInfo; cdecl;
  end;

  TBMKMassTransitRouteResult = class
    (TOCGenericImport<BMKMassTransitRouteResultClass,
    BMKMassTransitRouteResult>)
  end;

  PBMKMassTransitRouteResult = Pointer;

  BMKRidingRouteResultClass = interface(NSObjectClass)
    ['{D11E5669-2CA6-4620-ABF4-107879FE9D16}']
  end;

  BMKRidingRouteResult = interface(NSObject)
    ['{E83EF081-4269-48B5-A1AE-C0ADBDC3EFB2}']
    procedure setSuggestAddrResult(suggestAddrResult
      : BMKSuggestAddrInfo); cdecl;
    function suggestAddrResult: BMKSuggestAddrInfo; cdecl;
    procedure setRoutes(routes: NSArray); cdecl;
    function routes: NSArray; cdecl;
  end;

  TBMKRidingRouteResult = class(TOCGenericImport<BMKRidingRouteResultClass,
    BMKRidingRouteResult>)
  end;

  PBMKRidingRouteResult = Pointer;

  BMKIndoorRouteResultClass = interface(NSObjectClass)
    ['{CBADAB3D-B360-4942-A816-92737570903D}']
  end;

  BMKIndoorRouteResult = interface(NSObject)
    ['{2A161A84-7368-4CED-A852-DB4EEC0625F8}']
    procedure setRoutes(routes: NSArray); cdecl;
    function routes: NSArray; cdecl;
  end;

  TBMKIndoorRouteResult = class(TOCGenericImport<BMKIndoorRouteResultClass,
    BMKIndoorRouteResult>)
  end;

  PBMKIndoorRouteResult = Pointer;

  BMKSearchBaseClass = interface(NSObjectClass)
    ['{6A957563-6794-4825-B047-423BD0A026F8}']
  end;

  BMKSearchBase = interface(NSObject)
    ['{2831D8D4-F74A-4DCE-817F-577955186886}']
  end;

  TBMKSearchBase = class(TOCGenericImport<BMKSearchBaseClass, BMKSearchBase>)
  end;

  PBMKSearchBase = Pointer;

  BMKBusLineSearchClass = interface(BMKSearchBaseClass)
    ['{A97C6C3A-3FC4-4FDA-A466-272F0471B284}']
  end;

  BMKBusLineSearch = interface(BMKSearchBase)
    ['{0DA685B2-128E-41EF-AC31-75DAD3AE9F3C}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function busLineSearch(busLineSearchOption: BMKBusLineSearchOption)
      : Boolean; cdecl;
  end;

  TBMKBusLineSearch = class(TOCGenericImport<BMKBusLineSearchClass,
    BMKBusLineSearch>)
  end;

  PBMKBusLineSearch = Pointer;

  BMKDistrictSearchOptionClass = interface(NSObjectClass)
    ['{2754CF48-E934-470A-8CFF-FE53CB97995B}']
  end;

  BMKDistrictSearchOption = interface(NSObject)
    ['{B01EEA8B-F29A-422D-A47A-C63924227B16}']
    procedure setCity(city: NSString); cdecl;
    function city: NSString; cdecl;
    procedure setDistrict(district: NSString); cdecl;
    function district: NSString; cdecl;
  end;

  TBMKDistrictSearchOption = class
    (TOCGenericImport<BMKDistrictSearchOptionClass, BMKDistrictSearchOption>)
  end;

  PBMKDistrictSearchOption = Pointer;

  BMKDistrictResultClass = interface(NSObjectClass)
    ['{83CDAE6B-087D-4B90-B25A-C1BCF4494E42}']
  end;

  BMKDistrictResult = interface(NSObject)
    ['{7E2F4A4A-CF7D-4962-BDCC-0434D1E09201}']
    procedure setCode(code: NSInteger); cdecl;
    function code: NSInteger; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setCenter(center: CLLocationCoordinate2D); cdecl;
    function center: CLLocationCoordinate2D; cdecl;
    procedure setPaths(paths: NSArray); cdecl;
    function paths: NSArray; cdecl;
  end;

  TBMKDistrictResult = class(TOCGenericImport<BMKDistrictResultClass,
    BMKDistrictResult>)
  end;

  PBMKDistrictResult = Pointer;

  BMKDistrictSearchClass = interface(BMKSearchBaseClass)
    ['{906B2005-2E2A-4B36-95E5-F626BA318296}']
  end;

  BMKDistrictSearch = interface(BMKSearchBase)
    ['{770F512B-F57E-4B40-BAAB-CCA8C2C6B638}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function districtSearch(districtSearchOption: BMKDistrictSearchOption)
      : Boolean; cdecl;
  end;

  TBMKDistrictSearch = class(TOCGenericImport<BMKDistrictSearchClass,
    BMKDistrictSearch>)
  end;

  PBMKDistrictSearch = Pointer;

  BMKGeoCodeSearchOptionClass = interface(NSObjectClass)
    ['{154C92CA-9A8A-4407-826C-AA4F7F694B3D}']
  end;

  BMKGeoCodeSearchOption = interface(NSObject)
    ['{110DDE54-C02E-4E4F-9B94-CBEC925676D8}']
    procedure setAddress(address: NSString); cdecl;
    function address: NSString; cdecl;
    procedure setCity(city: NSString); cdecl;
    function city: NSString; cdecl;
  end;

  TBMKGeoCodeSearchOption = class(TOCGenericImport<BMKGeoCodeSearchOptionClass,
    BMKGeoCodeSearchOption>)
  end;

  PBMKGeoCodeSearchOption = Pointer;

  BMKReverseGeoCodeOptionClass = interface(NSObjectClass)
    ['{4DDB7D72-28B5-4D25-B08F-F821131FEB37}']
  end;

  BMKReverseGeoCodeOption = interface(NSObject)
    ['{2337C9A7-EE4F-48F6-917C-0396DD8437CF}']
    procedure setReverseGeoPoint(reverseGeoPoint
      : CLLocationCoordinate2D); cdecl;
    function reverseGeoPoint: CLLocationCoordinate2D; cdecl;
  end;

  TBMKReverseGeoCodeOption = class
    (TOCGenericImport<BMKReverseGeoCodeOptionClass, BMKReverseGeoCodeOption>)
  end;

  PBMKReverseGeoCodeOption = Pointer;

  BMKReverseGeoCodeResultClass = interface(NSObjectClass)
    ['{68BC1B14-1213-4BCF-A180-8E7A8AB5C622}']
  end;

  BMKReverseGeoCodeResult = interface(NSObject)
    ['{FE499D98-E9BE-44A5-A07C-1C7286BF3702}']
    procedure setAddressDetail(addressDetail: BMKAddressComponent); cdecl;
    function addressDetail: BMKAddressComponent; cdecl;
    procedure setAddress(address: NSString); cdecl;
    function address: NSString; cdecl;
    procedure setBusinessCircle(businessCircle: NSString); cdecl;
    function businessCircle: NSString; cdecl;
    procedure setSematicDescription(sematicDescription: NSString); cdecl;
    function sematicDescription: NSString; cdecl;
    procedure setLocation(location: CLLocationCoordinate2D); cdecl;
    function location: CLLocationCoordinate2D; cdecl;
    procedure setPoiList(poiList: NSArray); cdecl;
    function poiList: NSArray; cdecl;
  end;

  TBMKReverseGeoCodeResult = class
    (TOCGenericImport<BMKReverseGeoCodeResultClass, BMKReverseGeoCodeResult>)
  end;

  PBMKReverseGeoCodeResult = Pointer;

  BMKGeoCodeResultClass = interface(NSObjectClass)
    ['{7F6030EF-2908-4612-BA45-BD7ECAEDD172}']
  end;

  BMKGeoCodeResult = interface(NSObject)
    ['{5B0EA43E-1112-4211-BA57-D941B7F4B65A}']
    procedure setLocation(location: CLLocationCoordinate2D); cdecl;
    function location: CLLocationCoordinate2D; cdecl;
    procedure setAddress(address: NSString); cdecl;
    function address: NSString; cdecl;
  end;

  TBMKGeoCodeResult = class(TOCGenericImport<BMKGeoCodeResultClass,
    BMKGeoCodeResult>)
  end;

  PBMKGeoCodeResult = Pointer;

  BMKGeoCodeSearchClass = interface(BMKSearchBaseClass)
    ['{899E8D31-A42B-4FEA-A4EE-0B7D688871C4}']
  end;

  BMKGeoCodeSearch = interface(BMKSearchBase)
    ['{9B436D9F-5383-4EFB-8127-E35A5F621BFC}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function geoCode(geoCodeOption: BMKGeoCodeSearchOption): Boolean; cdecl;
    function reverseGeoCode(reverseGeoCodeOption: BMKReverseGeoCodeOption)
      : Boolean; cdecl;
  end;

  TBMKGeoCodeSearch = class(TOCGenericImport<BMKGeoCodeSearchClass,
    BMKGeoCodeSearch>)
  end;

  PBMKGeoCodeSearch = Pointer;

  BMKBasePoiSearchOptionClass = interface(NSObjectClass)
    ['{AF7AA637-3BA4-47E4-B96E-00935DF859CA}']
  end;

  BMKBasePoiSearchOption = interface(NSObject)
    ['{0E79A55D-CB43-4B61-A062-47DC85DB1070}']
    procedure setKeyword(keyword: NSString); cdecl;
    function keyword: NSString; cdecl;
    procedure setPageIndex(pageIndex: Integer); cdecl;
    function pageIndex: Integer; cdecl;
    procedure setPageCapacity(pageCapacity: Integer); cdecl;
    function pageCapacity: Integer; cdecl;
  end;

  TBMKBasePoiSearchOption = class(TOCGenericImport<BMKBasePoiSearchOptionClass,
    BMKBasePoiSearchOption>)
  end;

  PBMKBasePoiSearchOption = Pointer;

  BMKCitySearchOptionClass = interface(BMKBasePoiSearchOptionClass)
    ['{0D2A0CFF-D321-426C-BCC4-ACB97E5298F3}']
  end;

  BMKCitySearchOption = interface(BMKBasePoiSearchOption)
    ['{DA38A310-B4D2-4EC8-86E1-41A411E5B153}']
    procedure setCity(city: NSString); cdecl;
    function city: NSString; cdecl;
    procedure setRequestPoiAddressInfoList(requestPoiAddressInfoList
      : Boolean); cdecl;
    function requestPoiAddressInfoList: Boolean; cdecl;
  end;

  TBMKCitySearchOption = class(TOCGenericImport<BMKCitySearchOptionClass,
    BMKCitySearchOption>)
  end;

  PBMKCitySearchOption = Pointer;

  BMKNearbySearchOptionClass = interface(BMKBasePoiSearchOptionClass)
    ['{4D69D7C2-0673-4BE0-A993-1ACC47A12380}']
  end;

  BMKNearbySearchOption = interface(BMKBasePoiSearchOption)
    ['{5A030AD0-83B4-4251-A40C-A10E6F2E3DEC}']
    procedure setLocation(location: CLLocationCoordinate2D); cdecl;
    function location: CLLocationCoordinate2D; cdecl;
    procedure setRadius(radius: Integer); cdecl;
    function radius: Integer; cdecl;
    procedure setSortType(sortType: BMKPoiSortType); cdecl;
    function sortType: BMKPoiSortType; cdecl;
  end;

  TBMKNearbySearchOption = class(TOCGenericImport<BMKNearbySearchOptionClass,
    BMKNearbySearchOption>)
  end;

  PBMKNearbySearchOption = Pointer;

  BMKBoundSearchOptionClass = interface(BMKBasePoiSearchOptionClass)
    ['{19A6FC1C-1864-4359-BFA5-A74C7D642EC8}']
  end;

  BMKBoundSearchOption = interface(BMKBasePoiSearchOption)
    ['{853EF563-A801-42CA-8FF2-01B804F9BF14}']
    procedure setLeftBottom(leftBottom: CLLocationCoordinate2D); cdecl;
    function leftBottom: CLLocationCoordinate2D; cdecl;
    procedure setRightTop(rightTop: CLLocationCoordinate2D); cdecl;
    function rightTop: CLLocationCoordinate2D; cdecl;
  end;

  TBMKBoundSearchOption = class(TOCGenericImport<BMKBoundSearchOptionClass,
    BMKBoundSearchOption>)
  end;

  PBMKBoundSearchOption = Pointer;

  BMKPoiIndoorSearchOptionClass = interface(BMKBasePoiSearchOptionClass)
    ['{78EC923C-363D-4A56-920D-40617241A61B}']
  end;

  BMKPoiIndoorSearchOption = interface(BMKBasePoiSearchOption)
    ['{7D3BA4C7-D5C3-4667-9F5F-CC76B06851AE}']
    procedure setIndoorId(indoorId: NSString); cdecl;
    function indoorId: NSString; cdecl;
    procedure setFloor(floor: NSString); cdecl;
    function floor: NSString; cdecl;
  end;

  TBMKPoiIndoorSearchOption = class
    (TOCGenericImport<BMKPoiIndoorSearchOptionClass, BMKPoiIndoorSearchOption>)
  end;

  PBMKPoiIndoorSearchOption = Pointer;

  BMKPoiDetailSearchOptionClass = interface(NSObjectClass)
    ['{C5146FA0-A1E6-4D3C-AE02-5BE2F782DFE8}']
  end;

  BMKPoiDetailSearchOption = interface(NSObject)
    ['{AEB39FEA-0471-4E77-BDFA-E7F5E3496D7B}']
    procedure setPoiUid(poiUid: NSString); cdecl;
    function poiUid: NSString; cdecl;
  end;

  TBMKPoiDetailSearchOption = class
    (TOCGenericImport<BMKPoiDetailSearchOptionClass, BMKPoiDetailSearchOption>)
  end;

  PBMKPoiDetailSearchOption = Pointer;

  BMKPoiSearchClass = interface(BMKSearchBaseClass)
    ['{79B284AC-A58F-45C8-AB8D-81C3B1D71A2B}']
  end;

  BMKPoiSearch = interface(BMKSearchBase)
    ['{57F78F37-A261-4F49-A5AB-509EBCC687A0}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function poiSearchInCity(option: BMKCitySearchOption): Boolean; cdecl;
    function poiSearchInbounds(option: BMKBoundSearchOption): Boolean; cdecl;
    function poiSearchNearBy(option: BMKNearbySearchOption): Boolean; cdecl;
    function poiDetailSearch(option: BMKPoiDetailSearchOption): Boolean; cdecl;
    function poiIndoorSearch(option: BMKPoiIndoorSearchOption): Boolean; cdecl;
  end;

  TBMKPoiSearch = class(TOCGenericImport<BMKPoiSearchClass, BMKPoiSearch>)
  end;

  PBMKPoiSearch = Pointer;

  BMKBaseRoutePlanOptionClass = interface(NSObjectClass)
    ['{CD9EA33F-799E-4471-B27F-E6A604EFCB21}']
  end;

  BMKBaseRoutePlanOption = interface(NSObject)
    ['{A7CE5A1E-6DC0-42B7-A9B9-6FF3CADA2E18}']
    procedure setFrom(from: BMKPlanNode); cdecl;
    function from: BMKPlanNode; cdecl;
    procedure setTo(&to: BMKPlanNode); cdecl;
    function &to: BMKPlanNode; cdecl;
  end;

  TBMKBaseRoutePlanOption = class(TOCGenericImport<BMKBaseRoutePlanOptionClass,
    BMKBaseRoutePlanOption>)
  end;

  PBMKBaseRoutePlanOption = Pointer;

  BMKWalkingRoutePlanOptionClass = interface(BMKBaseRoutePlanOptionClass)
    ['{456B1556-807D-4864-A2AF-02AE1DD1DE97}']
  end;

  BMKWalkingRoutePlanOption = interface(BMKBaseRoutePlanOption)
    ['{324AE0EC-3812-4BBD-A7EC-3BF946927B60}']
  end;

  TBMKWalkingRoutePlanOption = class
    (TOCGenericImport<BMKWalkingRoutePlanOptionClass,
    BMKWalkingRoutePlanOption>)
  end;

  PBMKWalkingRoutePlanOption = Pointer;

  BMKDrivingRoutePlanOptionClass = interface(BMKBaseRoutePlanOptionClass)
    ['{D3CDF043-EABE-4E5D-BAAF-712E5B8429AF}']
  end;

  BMKDrivingRoutePlanOption = interface(BMKBaseRoutePlanOption)
    ['{1933D91C-4995-4202-914D-55E3D8E14DDD}']
    procedure setWayPointsArray(wayPointsArray: NSArray); cdecl;
    function wayPointsArray: NSArray; cdecl;
    procedure setDrivingPolicy(drivingPolicy: BMKDrivingPolicy); cdecl;
    function drivingPolicy: BMKDrivingPolicy; cdecl;
    procedure setDrivingRequestTrafficType(drivingRequestTrafficType
      : BMKDrivingRequestTrafficType); cdecl;
    function drivingRequestTrafficType: BMKDrivingRequestTrafficType; cdecl;
  end;

  TBMKDrivingRoutePlanOption = class
    (TOCGenericImport<BMKDrivingRoutePlanOptionClass,
    BMKDrivingRoutePlanOption>)
  end;

  PBMKDrivingRoutePlanOption = Pointer;

  BMKTransitRoutePlanOptionClass = interface(BMKBaseRoutePlanOptionClass)
    ['{CEBE406D-69F0-41D4-B3EE-9A453B61CBC0}']
  end;

  BMKTransitRoutePlanOption = interface(BMKBaseRoutePlanOption)
    ['{54B832A0-7563-4613-83A7-60D786BE84B3}']
    procedure setCity(city: NSString); cdecl;
    function city: NSString; cdecl;
    procedure setTransitPolicy(transitPolicy: BMKTransitPolicy); cdecl;
    function transitPolicy: BMKTransitPolicy; cdecl;
  end;

  TBMKTransitRoutePlanOption = class
    (TOCGenericImport<BMKTransitRoutePlanOptionClass,
    BMKTransitRoutePlanOption>)
  end;

  PBMKTransitRoutePlanOption = Pointer;

  BMKMassTransitRoutePlanOptionClass = interface(BMKBaseRoutePlanOptionClass)
    ['{7C894270-C7EE-4EB3-AF62-86512E3A8599}']
  end;

  BMKMassTransitRoutePlanOption = interface(BMKBaseRoutePlanOption)
    ['{F8DA438E-984D-4B4F-A203-C023A79E2B3F}']
    procedure setPageIndex(pageIndex: NSUInteger); cdecl;
    function pageIndex: NSUInteger; cdecl;
    procedure setPageCapacity(pageCapacity: NSUInteger); cdecl;
    function pageCapacity: NSUInteger; cdecl;
    procedure setIncityPolicy(incityPolicy: BMKMassTransitIncityPolicy); cdecl;
    function incityPolicy: BMKMassTransitIncityPolicy; cdecl;
    procedure setIntercityPolicy(intercityPolicy
      : BMKMassTransitIntercityPolicy); cdecl;
    function intercityPolicy: BMKMassTransitIntercityPolicy; cdecl;
    procedure setIntercityTransPolicy(intercityTransPolicy
      : BMKMassTransitIntercityTransPolicy); cdecl;
    function intercityTransPolicy: BMKMassTransitIntercityTransPolicy; cdecl;
  end;

  TBMKMassTransitRoutePlanOption = class
    (TOCGenericImport<BMKMassTransitRoutePlanOptionClass,
    BMKMassTransitRoutePlanOption>)
  end;

  PBMKMassTransitRoutePlanOption = Pointer;

  BMKRidingRoutePlanOptionClass = interface(BMKBaseRoutePlanOptionClass)
    ['{D113A18A-9F4F-4702-9E7A-788255B06883}']
  end;

  BMKRidingRoutePlanOption = interface(BMKBaseRoutePlanOption)
    ['{9ADE3DAB-D6E8-4A0C-A0FE-075364A3ECD5}']
  end;

  TBMKRidingRoutePlanOption = class
    (TOCGenericImport<BMKRidingRoutePlanOptionClass, BMKRidingRoutePlanOption>)
  end;

  PBMKRidingRoutePlanOption = Pointer;

  BMKIndoorRoutePlanOptionClass = interface(NSObjectClass)
    ['{6F28DC9E-6A93-440B-BA52-13DAEE9B949F}']
  end;

  BMKIndoorRoutePlanOption = interface(NSObject)
    ['{FE6766A9-08EB-463A-A06A-4D0E0522AA4D}']
    procedure setFrom(from: BMKIndoorPlanNode); cdecl;
    function from: BMKIndoorPlanNode; cdecl;
    procedure setTo(&to: BMKIndoorPlanNode); cdecl;
    function &to: BMKIndoorPlanNode; cdecl;
  end;

  TBMKIndoorRoutePlanOption = class
    (TOCGenericImport<BMKIndoorRoutePlanOptionClass, BMKIndoorRoutePlanOption>)
  end;

  PBMKIndoorRoutePlanOption = Pointer;

  BMKRouteSearchClass = interface(BMKSearchBaseClass)
    ['{FCA1FCB5-F702-4195-B8DE-6D442398F5B7}']
  end;

  BMKRouteSearch = interface(BMKSearchBase)
    ['{9E7FEB1D-47B8-4586-BB59-14C04DFEF814}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function transitSearch(transitRoutePlanOption: BMKTransitRoutePlanOption)
      : Boolean; cdecl;
    function massTransitSearch(routePlanOption: BMKMassTransitRoutePlanOption)
      : Boolean; cdecl;
    function drivingSearch(drivingRoutePlanOption: BMKDrivingRoutePlanOption)
      : Boolean; cdecl;
    function walkingSearch(walkingRoutePlanOption: BMKWalkingRoutePlanOption)
      : Boolean; cdecl;
    function ridingSearch(ridingRoutePlanOption: BMKRidingRoutePlanOption)
      : Boolean; cdecl;
    function indoorRoutePlanSearch(indoorRoutePlanOption
      : BMKIndoorRoutePlanOption): Boolean; cdecl;
  end;

  TBMKRouteSearch = class(TOCGenericImport<BMKRouteSearchClass, BMKRouteSearch>)
  end;

  PBMKRouteSearch = Pointer;

  BMKPoiDetailShareURLOptionClass = interface(NSObjectClass)
    ['{28CC6116-9228-4D58-B55C-6333B0329B4B}']
  end;

  BMKPoiDetailShareURLOption = interface(NSObject)
    ['{23C10567-384E-42B3-B35E-CAA460E013F3}']
    procedure setUid(uid: NSString); cdecl;
    function uid: NSString; cdecl;
  end;

  TBMKPoiDetailShareURLOption = class
    (TOCGenericImport<BMKPoiDetailShareURLOptionClass,
    BMKPoiDetailShareURLOption>)
  end;

  PBMKPoiDetailShareURLOption = Pointer;

  BMKLocationShareURLOptionClass = interface(NSObjectClass)
    ['{8874BEAD-75EA-4766-95EB-2FF052FCD8BF}']
  end;

  BMKLocationShareURLOption = interface(NSObject)
    ['{F75BC015-0A7A-4CFD-A16C-E13C29059A44}']
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setSnippet(snippet: NSString); cdecl;
    function snippet: NSString; cdecl;
    procedure setLocation(location: CLLocationCoordinate2D); cdecl;
    function location: CLLocationCoordinate2D; cdecl;
  end;

  TBMKLocationShareURLOption = class
    (TOCGenericImport<BMKLocationShareURLOptionClass,
    BMKLocationShareURLOption>)
  end;

  PBMKLocationShareURLOption = Pointer;

  BMKRoutePlanShareURLOptionClass = interface(NSObjectClass)
    ['{2CAFCA59-CC41-4089-A8BE-0D3B137DAA21}']
  end;

  BMKRoutePlanShareURLOption = interface(NSObject)
    ['{A2DAE763-C7CE-40F1-8421-CB002CC85E9B}']
    procedure setRoutePlanType(routePlanType: BMKRoutePlanShareURLType); cdecl;
    function routePlanType: BMKRoutePlanShareURLType; cdecl;
    procedure setFrom(from: BMKPlanNode); cdecl;
    function from: BMKPlanNode; cdecl;
    procedure setTo(&to: BMKPlanNode); cdecl;
    function &to: BMKPlanNode; cdecl;
    procedure setCityID(cityID: NSUInteger); cdecl;
    function cityID: NSUInteger; cdecl;
    procedure setRouteIndex(routeIndex: NSUInteger); cdecl;
    function routeIndex: NSUInteger; cdecl;
  end;

  TBMKRoutePlanShareURLOption = class
    (TOCGenericImport<BMKRoutePlanShareURLOptionClass,
    BMKRoutePlanShareURLOption>)
  end;

  PBMKRoutePlanShareURLOption = Pointer;

  BMKShareURLResultClass = interface(NSObjectClass)
    ['{C6D5C102-AEB7-4BC8-858D-17528D356B3D}']
  end;

  BMKShareURLResult = interface(NSObject)
    ['{36433423-461B-4FC1-81AE-FFF113437259}']
    procedure setUrl(url: NSString); cdecl;
    function url: NSString; cdecl;
  end;

  TBMKShareURLResult = class(TOCGenericImport<BMKShareURLResultClass,
    BMKShareURLResult>)
  end;

  PBMKShareURLResult = Pointer;

  BMKShareURLSearchClass = interface(BMKSearchBaseClass)
    ['{C5EA2AE5-4698-4B8B-9E88-02E4B503A8C0}']
  end;

  BMKShareURLSearch = interface(BMKSearchBase)
    ['{47546192-7BF1-4CDA-B621-0608676645A3}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function requestPoiDetailShareURL(poiDetailShareUrlSearchOption
      : BMKPoiDetailShareURLOption): Boolean; cdecl;
    function requestLocationShareURL(reverseGeoShareUrlSearchOption
      : BMKLocationShareURLOption): Boolean; cdecl;
    function requestRoutePlanShareURL(routePlanShareUrlSearchOption
      : BMKRoutePlanShareURLOption): Boolean; cdecl;
  end;

  TBMKShareURLSearch = class(TOCGenericImport<BMKShareURLSearchClass,
    BMKShareURLSearch>)
  end;

  PBMKShareURLSearch = Pointer;

  BMKSuggestionSearchOptionClass = interface(NSObjectClass)
    ['{39FFA429-6174-4D1A-B78B-7B67D753C202}']
  end;

  BMKSuggestionSearchOption = interface(NSObject)
    ['{21F8BD0A-116A-4AFB-ABCE-ABEB76FFE980}']
    procedure setKeyword(keyword: NSString); cdecl;
    function keyword: NSString; cdecl;
    procedure setCityname(cityname: NSString); cdecl;
    function cityname: NSString; cdecl;
    procedure setCityLimit(cityLimit: Boolean); cdecl;
    function cityLimit: Boolean; cdecl;
  end;

  TBMKSuggestionSearchOption = class
    (TOCGenericImport<BMKSuggestionSearchOptionClass,
    BMKSuggestionSearchOption>)
  end;

  PBMKSuggestionSearchOption = Pointer;

  BMKSuggestionResultClass = interface(BMKSearchBaseClass)
    ['{2FAA3209-6B31-4B2D-A3E5-D6554BF97DE9}']
  end;

  BMKSuggestionResult = interface(BMKSearchBase)
    ['{D19F9EDD-68E3-4E03-9F7F-9A6D79038D75}']
    procedure setKeyList(keyList: NSArray); cdecl;
    function keyList: NSArray; cdecl;
    procedure setCityList(cityList: NSArray); cdecl;
    function cityList: NSArray; cdecl;
    procedure setDistrictList(districtList: NSArray); cdecl;
    function districtList: NSArray; cdecl;
    procedure setPoiIdList(poiIdList: NSArray); cdecl;
    function poiIdList: NSArray; cdecl;
    procedure setPtList(ptList: NSArray); cdecl;
    function ptList: NSArray; cdecl;
  end;

  TBMKSuggestionResult = class(TOCGenericImport<BMKSuggestionResultClass,
    BMKSuggestionResult>)
  end;

  PBMKSuggestionResult = Pointer;

  BMKSuggestionSearchClass = interface(BMKSearchBaseClass)
    ['{9CEA4D2B-6A94-4415-8416-8B8677BE1602}']
  end;

  BMKSuggestionSearch = interface(BMKSearchBase)
    ['{D3A47B44-8633-4964-9DF5-6B1DEC1B4604}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function suggestionSearch(suggestionSearchOption: BMKSuggestionSearchOption)
      : Boolean; cdecl;
  end;

  TBMKSuggestionSearch = class(TOCGenericImport<BMKSuggestionSearchClass,
    BMKSuggestionSearch>)
  end;

  PBMKSuggestionSearch = Pointer;

  // ===== Protocol declarations =====

  BMKBusLineSearchDelegate = interface(IObjectiveC)
    ['{92C65D1F-087E-4C7C-BCD4-D18D27F11A5F}']
    procedure onGetBusDetailResult(searcher: BMKBusLineSearch;
      result: BMKBusLineResult; errorCode: BMKSearchErrorCode); cdecl;
  end;

  BMKDistrictSearchDelegate = interface(IObjectiveC)
    ['{133E3295-1715-48A7-B0BA-036692CF5D53}']
    procedure onGetDistrictResult(searcher: BMKDistrictSearch;
      result: BMKDistrictResult; errorCode: BMKSearchErrorCode); cdecl;
  end;

  BMKGeoCodeSearchDelegate = interface(IObjectiveC)
    ['{5CC3C338-536F-41EF-ADAA-9F2F8C2038F6}']
    procedure onGetGeoCodeResult(searcher: BMKGeoCodeSearch;
      result: BMKGeoCodeResult; errorCode: BMKSearchErrorCode); cdecl;
    procedure onGetReverseGeoCodeResult(searcher: BMKGeoCodeSearch;
      result: BMKReverseGeoCodeResult; errorCode: BMKSearchErrorCode); cdecl;
  end;

  BMKPoiSearchDelegate = interface(IObjectiveC)
    ['{FC4727D6-0319-4A56-9A18-02BAD7B7C08B}']
    procedure onGetPoiResult(searcher: BMKPoiSearch; result: BMKPoiResult;
      errorCode: BMKSearchErrorCode); cdecl;
    procedure onGetPoiDetailResult(searcher: BMKPoiSearch;
      result: BMKPoiDetailResult; errorCode: BMKSearchErrorCode); cdecl;
    procedure onGetPoiIndoorResult(searcher: BMKPoiSearch;
      result: BMKPoiIndoorResult; errorCode: BMKSearchErrorCode); cdecl;
  end;

  BMKRouteSearchDelegate = interface(IObjectiveC)
    ['{394C1EF8-5516-4E21-A11C-3125F4523DB4}']
    procedure onGetTransitRouteResult(searcher: BMKRouteSearch;
      result: BMKTransitRouteResult; errorCode: BMKSearchErrorCode); cdecl;
    procedure onGetMassTransitRouteResult(searcher: BMKRouteSearch;
      result: BMKMassTransitRouteResult; errorCode: BMKSearchErrorCode); cdecl;
    procedure onGetDrivingRouteResult(searcher: BMKRouteSearch;
      result: BMKDrivingRouteResult; errorCode: BMKSearchErrorCode); cdecl;
    procedure onGetWalkingRouteResult(searcher: BMKRouteSearch;
      result: BMKWalkingRouteResult; errorCode: BMKSearchErrorCode); cdecl;
    procedure onGetRidingRouteResult(searcher: BMKRouteSearch;
      result: BMKRidingRouteResult; errorCode: BMKSearchErrorCode); cdecl;
    procedure onGetIndoorRouteResult(searcher: BMKRouteSearch;
      result: BMKIndoorRouteResult; errorCode: BMKSearchErrorCode); cdecl;
  end;

  BMKShareURLSearchDelegate = interface(IObjectiveC)
    ['{FDCE81FE-F84D-421B-B234-ADEAB0B67D14}']
    procedure onGetPoiDetailShareURLResult(searcher: BMKShareURLSearch;
      result: BMKShareURLResult; errorCode: BMKSearchErrorCode); cdecl;
    procedure onGetLocationShareURLResult(searcher: BMKShareURLSearch;
      result: BMKShareURLResult; errorCode: BMKSearchErrorCode); cdecl;
    procedure onGetRoutePlanShareURLResult(searcher: BMKShareURLSearch;
      result: BMKShareURLResult; errorCode: BMKSearchErrorCode); cdecl;
  end;

  BMKSuggestionSearchDelegate = interface(IObjectiveC)
    ['{992FA38F-E9FB-46CB-ABDB-BA3AEB4BDC4B}']
    procedure onGetSuggestionResult(searcher: BMKSuggestionSearch;
      result: BMKSuggestionResult; errorCode: BMKSearchErrorCode); cdecl;
  end;

  // ===== External functions =====

const
  libBaiduMapAPI_Search =
    '/System/Library/Frameworks/BaiduMapAPI_Search.framework/BaiduMapAPI_Search';
function BMKGetMapApiSearchComponentVersion: Pointer { NSString }; cdecl;
  external libBaiduMapAPI_Search name _PU +
  'BMKGetMapApiSearchComponentVersion';
function BMKCheckSearchComponentIsLegal: Boolean; cdecl;
  external libBaiduMapAPI_Search name _PU + 'BMKCheckSearchComponentIsLegal';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  BaiduMapAPI_SearchModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

BaiduMapAPI_SearchModule := dlopen(MarshaledAString(libBaiduMapAPI_Search),
  RTLD_LAZY);

finalization

dlclose(BaiduMapAPI_SearchModule);
{$ENDIF IOS}

end.
