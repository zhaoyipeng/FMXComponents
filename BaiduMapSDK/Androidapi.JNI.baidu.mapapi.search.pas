unit Androidapi.JNI.baidu.mapapi.search;
// ====================================================
// Android Baidu Map SDK interface
// Package:com.baidu.mapapi.search.core
// com.baidu.mapapi.search.busline
// com.baidu.mapapi.search.district
// com.baidu.mapapi.search.geocode
// com.baidu.mapapi.search.poi
// com.baidu.mapapi.search.route
// com.baidu.mapapi.search.share
// com.baidu.mapapi.search.sug
// author:Xubzhlin
// email:371889755@qq.com
//
// date:2017.5.10
// version:4.3.0
// ====================================================

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.Os,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.baidu.mapapi.model;

type
  // ===== Forward declarations =====
  // com.baidu.mapapi.search.core
  JBusInfo = interface; // com.baidu.mapapi.search.core.BusInfo
  JCityInfo = interface; // com.baidu.mapapi.search.core.CityInfo
  JCoachInfo = interface; // com.baidu.mapapi.search.core.CoachInfo
  JPlaneInfo = interface; // com.baidu.mapapi.search.core.PlaneInfo
  JPoiInfo_POITYPE = interface; // com.baidu.mapapi.search.core.PoiInfo$POITYPE
  JPoiInfo = interface; // com.baidu.mapapi.search.core.PoiInfo
  JPriceInfo = interface; // com.baidu.mapapi.search.core.PriceInfo
  JRouteLine_TYPE = interface; // com.baidu.mapapi.search.core.RouteLine$TYPE
  JRouteLine = interface; // com.baidu.mapapi.search.core.RouteLine
  JRouteNode = interface; // com.baidu.mapapi.search.core.RouteNode
  JRouteStep = interface; // com.baidu.mapapi.search.core.RouteStep
  JSearchResult_ERRORNO = interface;
  // com.baidu.mapapi.search.core.SearchResult$ERRORNO
  JSearchResult = interface; // com.baidu.mapapi.search.core.SearchResult
  JTaxiInfo = interface; // com.baidu.mapapi.search.core.TaxiInfo
  JTrainInfo = interface; // com.baidu.mapapi.search.core.TrainInfo
  JTransitBaseInfo = interface; // com.baidu.mapapi.search.core.TransitBaseInfo
  JTransitResultNode = interface;
  // com.baidu.mapapi.search.core.TransitResultNode
  JVehicleInfo = interface; // com.baidu.mapapi.search.core.VehicleInfo

  // com.baidu.mapapi.search.busline
  JBusLineResult_BusStation = interface;
  // com.baidu.mapapi.search.busline.BusLineResult$BusStation
  JBusLineResult_BusStep = interface;
  // com.baidu.mapapi.search.busline.BusLineResult$BusStep
  JBusLineResult = interface; // com.baidu.mapapi.search.busline.BusLineResult
  JBusLineSearch = interface; // com.baidu.mapapi.search.busline.BusLineSearch
  JBusLineSearchOption = interface;
  // com.baidu.mapapi.search.busline.BusLineSearchOption
  JOnGetBusLineSearchResultListener = interface;
  // com.baidu.mapapi.search.busline.OnGetBusLineSearchResultListener

  // com.baidu.mapapi.search.district
  JDistrictResult = interface;
  // com.baidu.mapapi.search.district.DistrictResult
  JDistrictSearch = interface;
  // com.baidu.mapapi.search.district.DistrictSearch
  JDistrictSearchOption = interface;
  // com.baidu.mapapi.search.district.DistrictSearchOption
  JOnGetDistricSearchResultListener = interface;
  // com.baidu.mapapi.search.district.OnGetDistricSearchResultListener

  // com.baidu.mapapi.search.geocode
  JGeoCodeOption = interface; // com.baidu.mapapi.search.geocode.GeoCodeOption
  JGeoCoder = interface; // com.baidu.mapapi.search.geocode.GeoCoder
  JGeoCodeResult = interface; // com.baidu.mapapi.search.geocode.GeoCodeResult
  JOnGetGeoCoderResultListener = interface;
  // com.baidu.mapapi.search.geocode.OnGetGeoCoderResultListener
  JReverseGeoCodeOption = interface;
  // com.baidu.mapapi.search.geocode.ReverseGeoCodeOption
  JReverseGeoCodeResult_AddressComponent = interface;
  // com.baidu.mapapi.search.geocode.ReverseGeoCodeResult$AddressComponent
  JReverseGeoCodeResult = interface;
  // com.baidu.mapapi.search.geocode.ReverseGeoCodeResult

  // com.baidu.mapapi.search.poi
  JOnGetPoiSearchResultListener = interface;
  // com.baidu.mapapi.search.poi.OnGetPoiSearchResultListener
  JPoiAddrInfo = interface; // com.baidu.mapapi.search.poi.PoiAddrInfo
  JPoiBoundSearchOption = interface;
  // com.baidu.mapapi.search.poi.PoiBoundSearchOption
  JPoiCitySearchOption = interface;
  // com.baidu.mapapi.search.poi.PoiCitySearchOption
  JPoiDetailResult = interface; // com.baidu.mapapi.search.poi.PoiDetailResult
  JPoiDetailSearchOption = interface;
  // com.baidu.mapapi.search.poi.PoiDetailSearchOption
  JPoiIndoorInfo = interface; // com.baidu.mapapi.search.poi.PoiIndoorInfo
  JPoiIndoorOption = interface; // com.baidu.mapapi.search.poi.PoiIndoorOption
  JPoiIndoorResult = interface; // com.baidu.mapapi.search.poi.PoiIndoorResult
  JPoiNearbySearchOption = interface;
  // com.baidu.mapapi.search.poi.PoiNearbySearchOption
  JPoiResult = interface; // com.baidu.mapapi.search.poi.PoiResult
  JPoiSearch = interface; // com.baidu.mapapi.search.poi.PoiSearch
  JPoiSortType = interface; // com.baidu.mapapi.search.poi.PoiSortType

  // com.baidu.mapapi.search.route
  JBikingRouteLine_BikingStep = interface;
  // com.baidu.mapapi.search.route.BikingRouteLine$BikingStep
  JBikingRouteLine = interface; // com.baidu.mapapi.search.route.BikingRouteLine
  JBikingRoutePlanOption = interface;
  // com.baidu.mapapi.search.route.BikingRoutePlanOption
  JBikingRouteResult = interface;
  // com.baidu.mapapi.search.route.BikingRouteResult
  JDrivingRouteLine_DrivingStep = interface;
  // com.baidu.mapapi.search.route.DrivingRouteLine$DrivingStep
  JDrivingRouteLine = interface;
  // com.baidu.mapapi.search.route.DrivingRouteLine
  JDrivingRoutePlanOption_DrivingPolicy = interface;
  // com.baidu.mapapi.search.route.DrivingRoutePlanOption$DrivingPolicy
  JDrivingRoutePlanOption_DrivingTrafficPolicy = interface;
  // com.baidu.mapapi.search.route.DrivingRoutePlanOption$DrivingTrafficPolicy
  JDrivingRoutePlanOption = interface;
  // com.baidu.mapapi.search.route.DrivingRoutePlanOption
  JDrivingRouteResult = interface;
  // com.baidu.mapapi.search.route.DrivingRouteResult
  JIndoorPlanNode = interface; // com.baidu.mapapi.search.route.IndoorPlanNode
  JIndoorRouteLine_IndoorRouteStep_IndoorStepNode = interface;// com.baidu.mapapi.search.route.IndoorRouteLine$IndoorRouteStep$IndoorStepNode
  JIndoorRouteLine_IndoorRouteStep = interface;// com.baidu.mapapi.search.route.IndoorRouteLine$IndoorRouteStep
  JIndoorRouteLine = interface; // com.baidu.mapapi.search.route.IndoorRouteLine
  JIndoorRoutePlanOption = interface;// com.baidu.mapapi.search.route.IndoorRoutePlanOption
  JIndoorRouteResult = interface;// com.baidu.mapapi.search.route.IndoorRouteResult
  JMassTransitRouteLine_TransitStep_StepVehicleInfoType = interface;// com.baidu.mapapi.search.route.MassTransitRouteLine$TransitStep$StepVehicleInfoType
  JMassTransitRouteLine_TransitStep_TrafficCondition = interface;// com.baidu.mapapi.search.route.MassTransitRouteLine$TransitStep$TrafficCondition
  JMassTransitRouteLine_TransitStep = interface;// com.baidu.mapapi.search.route.MassTransitRouteLine$TransitStep
  JMassTransitRouteLine = interface;// com.baidu.mapapi.search.route.MassTransitRouteLine
  JMassTransitRoutePlanOption_TacticsIncity = interface;// com.baidu.mapapi.search.route.MassTransitRoutePlanOption$TacticsIncity
  JMassTransitRoutePlanOption_TacticsIntercity = interface;// com.baidu.mapapi.search.route.MassTransitRoutePlanOption$TacticsIntercity
  JMassTransitRoutePlanOption_TransTypeIntercity = interface;// com.baidu.mapapi.search.route.MassTransitRoutePlanOption$TransTypeIntercity
  JMassTransitRoutePlanOption = interface;// com.baidu.mapapi.search.route.MassTransitRoutePlanOption
  JMassTransitRouteResult = interface;// com.baidu.mapapi.search.route.MassTransitRouteResult
  JOnGetRoutePlanResultListener = interface;// com.baidu.mapapi.search.route.OnGetRoutePlanResultListener
  JPlanNode = interface; // com.baidu.mapapi.search.route.PlanNode
  JRoutePlanSearch = interface; // com.baidu.mapapi.search.route.RoutePlanSearch
  JSuggestAddrInfo = interface; // com.baidu.mapapi.search.route.SuggestAddrInfo
  JTransitRouteLine_TransitStep_TransitRouteStepType = interface;// com.baidu.mapapi.search.route.TransitRouteLine$TransitStep$TransitRouteStepType
  JTransitRouteLine_TransitStep = interface;
  // com.baidu.mapapi.search.route.TransitRouteLine$TransitStep
  JTransitRouteLine = interface;
  // com.baidu.mapapi.search.route.TransitRouteLine
  JTransitRoutePlanOption_TransitPolicy = interface;
  // com.baidu.mapapi.search.route.TransitRoutePlanOption$TransitPolicy
  JTransitRoutePlanOption = interface;
  // com.baidu.mapapi.search.route.TransitRoutePlanOption
  JTransitRouteResult = interface;
  // com.baidu.mapapi.search.route.TransitRouteResult
  JWalkingRouteLine_WalkingStep = interface;
  // com.baidu.mapapi.search.route.WalkingRouteLine$WalkingStep
  JWalkingRouteLine = interface;
  // com.baidu.mapapi.search.route.WalkingRouteLine
  JWalkingRoutePlanOption = interface;
  // com.baidu.mapapi.search.route.WalkingRoutePlanOption
  JWalkingRouteResult = interface;
  // com.baidu.mapapi.search.route.WalkingRouteResult

  // com.baidu.mapapi.search.share
  JLocationShareURLOption = interface;
  // com.baidu.mapapi.search.share.LocationShareURLOption
  JOnGetShareUrlResultListener = interface;
  // com.baidu.mapapi.search.share.OnGetShareUrlResultListener
  JPoiDetailShareURLOption = interface;
  // com.baidu.mapapi.search.share.PoiDetailShareURLOption
  JRouteShareURLOption_RouteShareMode = interface;
  // com.baidu.mapapi.search.share.RouteShareURLOption$RouteShareMode
  JRouteShareURLOption = interface;
  // com.baidu.mapapi.search.share.RouteShareURLOption
  JShareUrlResult = interface; // com.baidu.mapapi.search.share.ShareUrlResult
  JShareUrlSearch = interface; // com.baidu.mapapi.search.share.ShareUrlSearch

  // com.baidu.mapapi.search.sug
  JOnGetSuggestionResultListener = interface;
  // com.baidu.mapapi.search.sug.OnGetSuggestionResultListener
  JSuggestionResult_SuggestionInfo = interface;
  // com.baidu.mapapi.search.sug.SuggestionResult$SuggestionInfo
  JSuggestionResult = interface; // com.baidu.mapapi.search.sug.SuggestionResult
  JSuggestionSearch = interface; // com.baidu.mapapi.search.sug.SuggestionSearch
  JSuggestionSearchOption = interface;
  // com.baidu.mapapi.search.sug.SuggestionSearchOption

  // ===== Interface declarations =====
  JTransitBaseInfoClass = interface(JObjectClass)
    ['{C31E71D7-4908-402A-B3DC-E7EA9B71E493}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JTransitBaseInfo; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/core/TransitBaseInfo')]
  JTransitBaseInfo = interface(JObject)
    ['{4A49C78A-46D5-4D8E-91CE-49AF1035B497}']
    { Property Methods }

    { methods }
    function getName: JString; cdecl; // ()Ljava/lang/String;
    procedure setName(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getDepartureStation: JString; cdecl; // ()Ljava/lang/String;
    procedure setDepartureStation(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getArriveStation: JString; cdecl; // ()Ljava/lang/String;
    procedure setArriveStation(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getDepartureTime: JString; cdecl; // ()Ljava/lang/String;
    procedure setDepartureTime(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getArriveTime: JString; cdecl; // ()Ljava/lang/String;
    procedure setArriveTime(P1: JString); cdecl; // (Ljava/lang/String;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJTransitBaseInfo = class(TJavaGenericImport<JTransitBaseInfoClass,
    JTransitBaseInfo>)
  end;

  JBusInfoClass = interface(JTransitBaseInfoClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/TransitBaseInfo
    ['{30730CB9-A427-466D-A594-668943256008}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JBusInfo; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/core/BusInfo')]
  JBusInfo = interface(JTransitBaseInfo)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/TransitBaseInfo
    ['{BC551ED4-E43F-4DB2-A06D-80FF634C118C}']
    { Property Methods }

    { methods }
    function getType: Integer; cdecl; // ()I
    procedure setType(P1: Integer); cdecl; // (I)V
    function getStopNum: Integer; cdecl; // ()I
    procedure setStopNum(P1: Integer); cdecl; // (I)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJBusInfo = class(TJavaGenericImport<JBusInfoClass, JBusInfo>)
  end;

  JCityInfoClass = interface(JObjectClass)
    ['{19C1A738-2087-4F06-A0FE-A65D4ECDCE11}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JCityInfo; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/core/CityInfo')]
  JCityInfo = interface(JObject)
    ['{9596FC6E-733F-4159-A072-2F8E7EE604D8}']
    { Property Methods }
    function _Getcity: JString; // Ljava/lang/String;
    procedure _Setcity(acity: JString); // (Ljava/lang/String;)V
    function _Getnum: Integer; // I
    procedure _Setnum(anum: Integer); // (I)V

    { methods }
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
    property city: JString read _Getcity write _Setcity;
    property num: Integer read _Getnum write _Setnum;
  end;

  TJCityInfo = class(TJavaGenericImport<JCityInfoClass, JCityInfo>)
  end;

  JCoachInfoClass = interface(JTransitBaseInfoClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/TransitBaseInfo
    ['{69DBD67A-ADB8-4C8E-AE9A-C811C7DFBBCA}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JCoachInfo; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/core/CoachInfo')]
  JCoachInfo = interface(JTransitBaseInfo)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/TransitBaseInfo
    ['{E0FB324B-647B-4F6C-9BAA-09C7E1186F07}']
    { Property Methods }

    { methods }
    function getProviderName: JString; cdecl; // ()Ljava/lang/String;
    procedure setProviderName(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getProviderUrl: JString; cdecl; // ()Ljava/lang/String;
    procedure setProviderUrl(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getPrice: Double; cdecl; // ()D
    procedure setPrice(P1: Double); cdecl; // (D)V
    function getBooking: JString; cdecl; // ()Ljava/lang/String;
    procedure setBooking(P1: JString); cdecl; // (Ljava/lang/String;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJCoachInfo = class(TJavaGenericImport<JCoachInfoClass, JCoachInfo>)
  end;

  JPlaneInfoClass = interface(JTransitBaseInfoClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/TransitBaseInfo
    ['{41B1DBBF-E163-4752-A087-33231C137091}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JPlaneInfo; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/core/PlaneInfo')]
  JPlaneInfo = interface(JTransitBaseInfo)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/TransitBaseInfo
    ['{66D08BFB-0EDA-47FB-948A-524D5F4300DC}']
    { Property Methods }

    { methods }
    function getPrice: Double; cdecl; // ()D
    procedure setPrice(P1: Double); cdecl; // (D)V
    function getDiscount: Double; cdecl; // ()D
    procedure setDiscount(P1: Double); cdecl; // (D)V
    function getAirlines: JString; cdecl; // ()Ljava/lang/String;
    procedure setAirlines(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getBooking: JString; cdecl; // ()Ljava/lang/String;
    procedure setBooking(P1: JString); cdecl; // (Ljava/lang/String;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJPlaneInfo = class(TJavaGenericImport<JPlaneInfoClass, JPlaneInfo>)
  end;

  JPoiInfo_POITYPEClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{37AD064A-85D7-47DE-A5FB-FBB65D2B0BAA}']
    { static Property Methods }
    { class } function _GetPOINT: JPoiInfo_POITYPE;
    // Lcom/baidu/mapapi/search/core/PoiInfo$POITYPE;
    { class } function _GetBUS_STATION: JPoiInfo_POITYPE;
    // Lcom/baidu/mapapi/search/core/PoiInfo$POITYPE;
    { class } function _GetBUS_LINE: JPoiInfo_POITYPE;
    // Lcom/baidu/mapapi/search/core/PoiInfo$POITYPE;
    { class } function _GetSUBWAY_STATION: JPoiInfo_POITYPE;
    // Lcom/baidu/mapapi/search/core/PoiInfo$POITYPE;
    { class } function _GetSUBWAY_LINE: JPoiInfo_POITYPE;
    // Lcom/baidu/mapapi/search/core/PoiInfo$POITYPE;

    { static Methods }
    { class } function values: TJavaObjectArray<JPoiInfo_POITYPE>; cdecl;
    // ()[Lcom/baidu/mapapi/search/core/PoiInfo$POITYPE;
    { class } function valueOf(P1: JString): JPoiInfo_POITYPE; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/core/PoiInfo$POITYPE;
    { class } function fromInt(P1: Integer): JPoiInfo_POITYPE; cdecl;
    // (I)Lcom/baidu/mapapi/search/core/PoiInfo$POITYPE;

    { static Property }
    { class } property POINT: JPoiInfo_POITYPE read _GetPOINT;
    { class } property BUS_STATION: JPoiInfo_POITYPE read _GetBUS_STATION;
    { class } property BUS_LINE: JPoiInfo_POITYPE read _GetBUS_LINE;
    { class } property SUBWAY_STATION: JPoiInfo_POITYPE read _GetSUBWAY_STATION;
    { class } property SUBWAY_LINE: JPoiInfo_POITYPE read _GetSUBWAY_LINE;
  end;

  [JavaSignature('com/baidu/mapapi/search/core/PoiInfo$POITYPE')]
  JPoiInfo_POITYPE = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{E59C9591-98C9-4BF8-A909-07864663AB0F}']
    { Property Methods }

    { methods }
    function getInt: Integer; cdecl; // ()I

    { Property }
  end;

  TJPoiInfo_POITYPE = class(TJavaGenericImport<JPoiInfo_POITYPEClass,
    JPoiInfo_POITYPE>)
  end;

  JPoiInfoClass = interface(JObjectClass)
    ['{7EE3F56F-DB94-46D3-929C-03FA1E343DC0}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JPoiInfo; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/core/PoiInfo')]
  JPoiInfo = interface(JObject)
    ['{D981D5EB-F9BC-40C6-B506-94061B82793F}']
    { Property Methods }
    function _Getname: JString; // Ljava/lang/String;
    procedure _Setname(aname: JString); // (Ljava/lang/String;)V
    function _Getuid: JString; // Ljava/lang/String;
    procedure _Setuid(auid: JString); // (Ljava/lang/String;)V
    function _Getaddress: JString; // Ljava/lang/String;
    procedure _Setaddress(aaddress: JString); // (Ljava/lang/String;)V
    function _Getcity: JString; // Ljava/lang/String;
    procedure _Setcity(acity: JString); // (Ljava/lang/String;)V
    function _GetphoneNum: JString; // Ljava/lang/String;
    procedure _SetphoneNum(aphoneNum: JString); // (Ljava/lang/String;)V
    function _GetpostCode: JString; // Ljava/lang/String;
    procedure _SetpostCode(apostCode: JString); // (Ljava/lang/String;)V
    function _Gettype: JPoiInfo_POITYPE;
    // Lcom/baidu/mapapi/search/core/PoiInfo$POITYPE;
    procedure _Settype(atype: JPoiInfo_POITYPE);
    // (Lcom/baidu/mapapi/search/core/PoiInfo$POITYPE;)V
    function _Getlocation: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _Setlocation(alocation: JLatLng);
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function _GethasCaterDetails: Boolean; // Z
    procedure _SethasCaterDetails(ahasCaterDetails: Boolean); // (Z)V
    function _GetisPano: Boolean; // Z
    procedure _SetisPano(aisPano: Boolean); // (Z)V

    { methods }
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
    property name: JString read _Getname write _Setname;
    property uid: JString read _Getuid write _Setuid;
    property address: JString read _Getaddress write _Setaddress;
    property city: JString read _Getcity write _Setcity;
    property phoneNum: JString read _GetphoneNum write _SetphoneNum;
    property postCode: JString read _GetpostCode write _SetpostCode;
    property &type: JPoiInfo_POITYPE read _Gettype write _Settype;
    property location: JLatLng read _Getlocation write _Setlocation;
    property hasCaterDetails: Boolean read _GethasCaterDetails
      write _SethasCaterDetails;
    property isPano: Boolean read _GetisPano write _SetisPano;
  end;

  TJPoiInfo = class(TJavaGenericImport<JPoiInfoClass, JPoiInfo>)
  end;

  JPriceInfoClass = interface(JObjectClass)
    ['{75A49B5D-C2DC-4913-96F1-0E94107675BB}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JPriceInfo; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/core/PriceInfo')]
  JPriceInfo = interface(JObject)
    ['{6D4F8640-AF78-4B03-8FB1-289F2F95620C}']
    { Property Methods }

    { methods }
    function getTicketType: Integer; cdecl; // ()I
    procedure setTicketType(P1: Integer); cdecl; // (I)V
    function getTicketPrice: Double; cdecl; // ()D
    procedure setTicketPrice(P1: Double); cdecl; // (D)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJPriceInfo = class(TJavaGenericImport<JPriceInfoClass, JPriceInfo>)
  end;

  JRouteLine_TYPEClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{BD7AAA43-F6B2-4A64-B546-D2057980751B}']
    { static Property Methods }
    { class } function _GetDRIVESTEP: JRouteLine_TYPE;
    // Lcom/baidu/mapapi/search/core/RouteLine$TYPE;
    { class } function _GetTRANSITSTEP: JRouteLine_TYPE;
    // Lcom/baidu/mapapi/search/core/RouteLine$TYPE;
    { class } function _GetWALKSTEP: JRouteLine_TYPE;
    // Lcom/baidu/mapapi/search/core/RouteLine$TYPE;
    { class } function _GetBIKINGSTEP: JRouteLine_TYPE;
    // Lcom/baidu/mapapi/search/core/RouteLine$TYPE;

    { static Methods }
    { class } function values: TJavaObjectArray<JRouteLine_TYPE>; cdecl;
    // ()[Lcom/baidu/mapapi/search/core/RouteLine$TYPE;
    { class } function valueOf(P1: JString): JRouteLine_TYPE; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/core/RouteLine$TYPE;

    { static Property }
    { class } property DRIVESTEP: JRouteLine_TYPE read _GetDRIVESTEP;
    { class } property TRANSITSTEP: JRouteLine_TYPE read _GetTRANSITSTEP;
    { class } property WALKSTEP: JRouteLine_TYPE read _GetWALKSTEP;
    { class } property BIKINGSTEP: JRouteLine_TYPE read _GetBIKINGSTEP;
  end;

  [JavaSignature('com/baidu/mapapi/search/core/RouteLine$TYPE')]
  JRouteLine_TYPE = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{A9F42084-3A1E-4304-A611-F11EC562F241}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRouteLine_TYPE = class(TJavaGenericImport<JRouteLine_TYPEClass,
    JRouteLine_TYPE>)
  end;

  JRouteLineClass = interface(JObjectClass)
    ['{F7852AD2-9851-4AC6-BA18-3E009F1AD489}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/core/RouteLine')]
  JRouteLine = interface(JObject)
    ['{FCF6A3AF-FF17-454F-A8BA-90F35BA37CFB}']
    { Property Methods }

    { methods }
    function getDistance: Integer; cdecl; // ()I
    procedure setDistance(P1: Integer); cdecl; // (I)V
    function getDuration: Integer; cdecl; // ()I
    procedure setDuration(P1: Integer); cdecl; // (I)V
    function getStarting: JRouteNode; cdecl;
    // ()Lcom/baidu/mapapi/search/core/RouteNode;
    procedure setStarting(P1: JRouteNode); cdecl;
    // (Lcom/baidu/mapapi/search/core/RouteNode;)V
    function getTerminal: JRouteNode; cdecl;
    // ()Lcom/baidu/mapapi/search/core/RouteNode;
    procedure setTerminal(P1: JRouteNode); cdecl;
    // (Lcom/baidu/mapapi/search/core/RouteNode;)V
    function getTitle: JString; cdecl; // ()Ljava/lang/String;
    procedure setTitle(P1: JString); cdecl; // (Ljava/lang/String;)V
    procedure setSteps(P1: JList); cdecl; // (Ljava/util/List;)V
    function getAllStep: JList; cdecl; // ()Ljava/util/List;
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJRouteLine = class(TJavaGenericImport<JRouteLineClass, JRouteLine>)
  end;

  JRouteNodeClass = interface(JObjectClass)
    ['{A4E5A568-DCAF-48A6-9B32-5668E8ACB0C1}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JRouteNode; cdecl; // ()V
    { class } function titleAndLocation(P1: JString; P2: JLatLng): JRouteNode;
      cdecl; // (Ljava/lang/String;Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/search/core/RouteNode;
    { class } function location(P1: JLatLng): JRouteNode; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/search/core/RouteNode;

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/core/RouteNode')]
  JRouteNode = interface(JObject)
    ['{4D84F381-56C6-464F-86F5-5A16D38A76A8}']
    { Property Methods }

    { methods }
    function getTitle: JString; cdecl; // ()Ljava/lang/String;
    procedure setTitle(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getLocation: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    procedure setLocation(P1: JLatLng); cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function getUid: JString; cdecl; // ()Ljava/lang/String;
    procedure setUid(P1: JString); cdecl; // (Ljava/lang/String;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJRouteNode = class(TJavaGenericImport<JRouteNodeClass, JRouteNode>)
  end;

  JRouteStepClass = interface(JObjectClass)
    ['{EDA484D2-A06D-4EBE-A18D-8F43D89F4FA8}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/core/RouteStep')]
  JRouteStep = interface(JObject)
    ['{B262A55A-CD2B-4590-A268-78C1A44D2C6B}']
    { Property Methods }

    { methods }
    function getDistance: Integer; cdecl; // ()I
    procedure setDistance(P1: Integer); cdecl; // (I)V
    function getDuration: Integer; cdecl; // ()I
    procedure setDuration(P1: Integer); cdecl; // (I)V
    function getWayPoints: JList; cdecl; // ()Ljava/util/List;
    procedure setWayPoints(P1: JList); cdecl; // (Ljava/util/List;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJRouteStep = class(TJavaGenericImport<JRouteStepClass, JRouteStep>)
  end;

  JSearchResult_ERRORNOClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{1487572B-9C1B-421E-A779-74CBC28DA8C1}']
    { static Property Methods }
    { class } function _GetNO_ERROR: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetRESULT_NOT_FOUND: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetAMBIGUOUS_KEYWORD: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetAMBIGUOUS_ROURE_ADDR: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetNOT_SUPPORT_BUS: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetNOT_SUPPORT_BUS_2CITY: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetST_EN_TOO_NEAR: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetKEY_ERROR: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetPERMISSION_UNFINISHED: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetNETWORK_TIME_OUT: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetNETWORK_ERROR: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetPOIINDOOR_BID_ERROR: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetPOIINDOOR_FLOOR_ERROR: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetPOIINDOOR_SERVER_ERROR: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetINDOOR_ROUTE_NO_IN_BUILDING: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetINDOOR_ROUTE_NO_IN_SAME_BUILDING
      : JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetMASS_TRANSIT_SERVER_ERROR: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetMASS_TRANSIT_OPTION_ERROR: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetMASS_TRANSIT_NO_POI_ERROR: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetSEARCH_SERVER_INTERNAL_ERROR: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function _GetSEARCH_OPTION_ERROR: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;

    { static Methods }
    { class } function values: TJavaObjectArray<JSearchResult_ERRORNO>; cdecl;
    // ()[Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    { class } function valueOf(P1: JString): JSearchResult_ERRORNO; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;

    { static Property }
    { class } property NO_ERROR: JSearchResult_ERRORNO read _GetNO_ERROR;
    { class } property RESULT_NOT_FOUND: JSearchResult_ERRORNO
      read _GetRESULT_NOT_FOUND;
    { class } property AMBIGUOUS_KEYWORD: JSearchResult_ERRORNO
      read _GetAMBIGUOUS_KEYWORD;
    { class } property AMBIGUOUS_ROURE_ADDR: JSearchResult_ERRORNO
      read _GetAMBIGUOUS_ROURE_ADDR;
    { class } property NOT_SUPPORT_BUS: JSearchResult_ERRORNO
      read _GetNOT_SUPPORT_BUS;
    { class } property NOT_SUPPORT_BUS_2CITY: JSearchResult_ERRORNO
      read _GetNOT_SUPPORT_BUS_2CITY;
    { class } property ST_EN_TOO_NEAR: JSearchResult_ERRORNO
      read _GetST_EN_TOO_NEAR;
    { class } property KEY_ERROR: JSearchResult_ERRORNO read _GetKEY_ERROR;
    { class } property PERMISSION_UNFINISHED: JSearchResult_ERRORNO
      read _GetPERMISSION_UNFINISHED;
    { class } property NETWORK_TIME_OUT: JSearchResult_ERRORNO
      read _GetNETWORK_TIME_OUT;
    { class } property NETWORK_ERROR: JSearchResult_ERRORNO
      read _GetNETWORK_ERROR;
    { class } property POIINDOOR_BID_ERROR: JSearchResult_ERRORNO
      read _GetPOIINDOOR_BID_ERROR;
    { class } property POIINDOOR_FLOOR_ERROR: JSearchResult_ERRORNO
      read _GetPOIINDOOR_FLOOR_ERROR;
    { class } property POIINDOOR_SERVER_ERROR: JSearchResult_ERRORNO
      read _GetPOIINDOOR_SERVER_ERROR;
    { class } property INDOOR_ROUTE_NO_IN_BUILDING: JSearchResult_ERRORNO
      read _GetINDOOR_ROUTE_NO_IN_BUILDING;
    { class } property INDOOR_ROUTE_NO_IN_SAME_BUILDING: JSearchResult_ERRORNO
      read _GetINDOOR_ROUTE_NO_IN_SAME_BUILDING;
    { class } property MASS_TRANSIT_SERVER_ERROR: JSearchResult_ERRORNO
      read _GetMASS_TRANSIT_SERVER_ERROR;
    { class } property MASS_TRANSIT_OPTION_ERROR: JSearchResult_ERRORNO
      read _GetMASS_TRANSIT_OPTION_ERROR;
    { class } property MASS_TRANSIT_NO_POI_ERROR: JSearchResult_ERRORNO
      read _GetMASS_TRANSIT_NO_POI_ERROR;
    { class } property SEARCH_SERVER_INTERNAL_ERROR: JSearchResult_ERRORNO
      read _GetSEARCH_SERVER_INTERNAL_ERROR;
    { class } property SEARCH_OPTION_ERROR: JSearchResult_ERRORNO
      read _GetSEARCH_OPTION_ERROR;
  end;

  [JavaSignature('com/baidu/mapapi/search/core/SearchResult$ERRORNO')]
  JSearchResult_ERRORNO = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{383913B2-887B-4AA3-9AF8-AEC0B565799F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSearchResult_ERRORNO = class(TJavaGenericImport<JSearchResult_ERRORNOClass,
    JSearchResult_ERRORNO>)
  end;

  JSearchResultClass = interface(JObjectClass)
    ['{AB0D5F97-1FFF-40F5-A946-B0FD8F0AECBA}']
    { static Property Methods }

    { static Methods }
    { class } function init: JSearchResult; cdecl; overload; // ()V
    { class } function init(P1: JSearchResult_ERRORNO): JSearchResult; cdecl;
      overload; // (Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/core/SearchResult')]
  JSearchResult = interface(JObject)
    ['{B9772C7A-B77B-4C04-A7A1-0C58D71414E0}']
    { Property Methods }
    function _Geterror: JSearchResult_ERRORNO;
    // Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;
    procedure _Seterror(aerror: JSearchResult_ERRORNO);
    // (Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;)V

    { methods }
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
    property error: JSearchResult_ERRORNO read _Geterror write _Seterror;
  end;

  TJSearchResult = class(TJavaGenericImport<JSearchResultClass, JSearchResult>)
  end;

  JTaxiInfoClass = interface(JObjectClass)
    ['{FBF3C302-E5D3-4FFE-B0DA-60212378594C}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JTaxiInfo; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/core/TaxiInfo')]
  JTaxiInfo = interface(JObject)
    ['{F82D9BE2-BF79-4609-84B4-56F4A4180460}']
    { Property Methods }

    { methods }
    function getTotalPrice: Single; cdecl; // ()F
    procedure setTotalPrice(P1: Single); cdecl; // (F)V
    function getDesc: JString; cdecl; // ()Ljava/lang/String;
    procedure setDesc(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getDistance: Integer; cdecl; // ()I
    procedure setDistance(P1: Integer); cdecl; // (I)V
    function getDuration: Integer; cdecl; // ()I
    procedure setDuration(P1: Integer); cdecl; // (I)V
    function getPerKMPrice: Single; cdecl; // ()F
    procedure setPerKMPrice(P1: Single); cdecl; // (F)V
    function getStartPrice: Single; cdecl; // ()F
    procedure setStartPrice(P1: Single); cdecl; // (F)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJTaxiInfo = class(TJavaGenericImport<JTaxiInfoClass, JTaxiInfo>)
  end;

  JTrainInfoClass = interface(JTransitBaseInfoClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/TransitBaseInfo
    ['{D6F0F2FF-FD6F-47CF-A616-ADA34B665344}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JTrainInfo; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/core/TrainInfo')]
  JTrainInfo = interface(JTransitBaseInfo)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/TransitBaseInfo
    ['{43A82125-7975-4B8D-A246-A0B3689152A3}']
    { Property Methods }

    { methods }
    procedure a(P1: Double); cdecl; overload; // (D)V
    procedure a(P1: JString); cdecl; overload; // (Ljava/lang/String;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJTrainInfo = class(TJavaGenericImport<JTrainInfoClass, JTrainInfo>)
  end;

  JTransitResultNodeClass = interface(JObjectClass)
    ['{6742627C-0DC3-4602-9753-4019452C47C7}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init(P1: Integer; P2: JString; P3: JLatLng; P4: JString)
      : JTransitResultNode; cdecl;
    // (ILjava/lang/String;Lcom/baidu/mapapi/model/LatLng;Ljava/lang/String;)V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/core/TransitResultNode')]
  JTransitResultNode = interface(JObject)
    ['{8907E3AC-0109-4207-9E90-FEF0FB9C322C}']
    { Property Methods }

    { methods }
    function getSearchWord: JString; cdecl; // ()Ljava/lang/String;
    function getLocation: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getCityName: JString; cdecl; // ()Ljava/lang/String;
    function getCityId: Integer; cdecl; // ()I
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJTransitResultNode = class(TJavaGenericImport<JTransitResultNodeClass,
    JTransitResultNode>)
  end;

  JVehicleInfoClass = interface(JObjectClass)
    ['{88D8E1E2-3C8F-4705-B24E-60E934974850}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JVehicleInfo; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/core/VehicleInfo')]
  JVehicleInfo = interface(JObject)
    ['{C368987D-24F8-41A4-B16B-B04359D3FB26}']
    { Property Methods }

    { methods }
    function getUid: JString; cdecl; // ()Ljava/lang/String;
    procedure setUid(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getPassStationNum: Integer; cdecl; // ()I
    procedure setPassStationNum(P1: Integer); cdecl; // (I)V
    function getTitle: JString; cdecl; // ()Ljava/lang/String;
    procedure setTitle(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getZonePrice: Integer; cdecl; // ()I
    procedure setZonePrice(P1: Integer); cdecl; // (I)V
    function getTotalPrice: Integer; cdecl; // ()I
    procedure setTotalPrice(P1: Integer); cdecl; // (I)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJVehicleInfo = class(TJavaGenericImport<JVehicleInfoClass, JVehicleInfo>)
  end;

  JBusLineResult_BusStationClass = interface(JRouteNodeClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/RouteNode
    ['{1841C687-EF73-4DA0-82BE-E55CA098C726}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBusLineResult_BusStation; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/busline/BusLineResult$BusStation')]
  JBusLineResult_BusStation = interface(JRouteNode)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/RouteNode
    ['{43F7DC7E-5C6F-4E0C-8A4F-2E22C98B37D1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBusLineResult_BusStation = class
    (TJavaGenericImport<JBusLineResult_BusStationClass,
    JBusLineResult_BusStation>)
  end;

  JBusLineResult_BusStepClass = interface(JRouteStepClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/RouteStep
    ['{B69FCE81-3230-4AFC-A044-76583CA1B9FF}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBusLineResult_BusStep; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/busline/BusLineResult$BusStep')]
  JBusLineResult_BusStep = interface(JRouteStep)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/RouteStep
    ['{73A18A9A-AB64-4382-91B9-E6272D4DDAB4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBusLineResult_BusStep = class
    (TJavaGenericImport<JBusLineResult_BusStepClass, JBusLineResult_BusStep>)
  end;

  JBusLineResultClass = interface(JSearchResultClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{1C7C6ABE-D865-443C-B26E-63AD9C2B235B}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JBusLineResult; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/busline/BusLineResult')]
  JBusLineResult = interface(JSearchResult)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{53195D65-A7FD-49F3-B3DE-362C4A56DFD9}']
    { Property Methods }

    { methods }
    function getLineDirection: JString; cdecl; // ()Ljava/lang/String;
    procedure setLineDirection(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getBasePrice: Single; cdecl; // ()F
    procedure setBasePrice(P1: Single); cdecl; // (F)V
    function getMaxPrice: Single; cdecl; // ()F
    procedure setMaxPrice(P1: Single); cdecl; // (F)V
    function getBusCompany: JString; cdecl; // ()Ljava/lang/String;
    function getBusLineName: JString; cdecl; // ()Ljava/lang/String;
    procedure setBusLineName(P1: JString); cdecl; // (Ljava/lang/String;)V
    function isMonthTicket: Boolean; cdecl; // ()Z
    procedure setMonthTicket(P1: Boolean); cdecl; // (Z)V
    function getStartTime: JDate; cdecl; // ()Ljava/util/Date;
    procedure setStartTime(P1: JDate); cdecl; // (Ljava/util/Date;)V
    function getEndTime: JDate; cdecl; // ()Ljava/util/Date;
    procedure setEndTime(P1: JDate); cdecl; // (Ljava/util/Date;)V
    function getStations: JList; cdecl; // ()Ljava/util/List;
    procedure setStations(P1: JList); cdecl; // (Ljava/util/List;)V
    function getSteps: JList; cdecl; // ()Ljava/util/List;
    procedure setSteps(P1: JList); cdecl; // (Ljava/util/List;)V
    function getUid: JString; cdecl; // ()Ljava/lang/String;
    procedure setUid(P1: JString); cdecl; // (Ljava/lang/String;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJBusLineResult = class(TJavaGenericImport<JBusLineResultClass,
    JBusLineResult>)
  end;

  JBusLineSearchClass = interface(JObjectClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/a
    ['{A27FC29B-4D83-4FFE-8357-60FCA9FE4DDB}']
    { static Property Methods }

    { static Methods }
    { class } function newInstance: JBusLineSearch; cdecl;
    // ()Lcom/baidu/mapapi/search/busline/BusLineSearch;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/busline/BusLineSearch')]
  JBusLineSearch = interface(JObject)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/a
    ['{62F792D2-6736-464F-A60C-6852CAA36E3C}']
    { Property Methods }

    { methods }
    function searchBusLine(P1: JBusLineSearchOption): Boolean; cdecl;
    // (Lcom/baidu/mapapi/search/busline/BusLineSearchOption;)Z
    procedure setOnGetBusLineSearchResultListener
      (P1: JOnGetBusLineSearchResultListener); cdecl;
    // (Lcom/baidu/mapapi/search/busline/OnGetBusLineSearchResultListener;)V
    procedure destroy; cdecl; // ()V

    { Property }
  end;

  TJBusLineSearch = class(TJavaGenericImport<JBusLineSearchClass,
    JBusLineSearch>)
  end;

  JBusLineSearchOptionClass = interface(JObjectClass)
    ['{450CEAAC-60E8-40E3-B641-BCF4442BCA4E}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBusLineSearchOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/busline/BusLineSearchOption')]
  JBusLineSearchOption = interface(JObject)
    ['{B9EEF507-0352-4AD1-8EFC-4ACE05954629}']
    { Property Methods }
    function _GetmUid: JString; // Ljava/lang/String;
    procedure _SetmUid(amUid: JString); // (Ljava/lang/String;)V
    function _GetmCity: JString; // Ljava/lang/String;
    procedure _SetmCity(amCity: JString); // (Ljava/lang/String;)V

    { methods }
    function city(P1: JString): JBusLineSearchOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/busline/BusLineSearchOption;
    function uid(P1: JString): JBusLineSearchOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/busline/BusLineSearchOption;

    { Property }
    property mUid: JString read _GetmUid write _SetmUid;
    property mCity: JString read _GetmCity write _SetmCity;
  end;

  TJBusLineSearchOption = class(TJavaGenericImport<JBusLineSearchOptionClass,
    JBusLineSearchOption>)
  end;

  JOnGetBusLineSearchResultListenerClass = interface(JObjectClass)
    ['{EB1EFB29-B19C-4CC8-91AF-ADF1A031E7C3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature
    ('com/baidu/mapapi/search/busline/OnGetBusLineSearchResultListener')]
  JOnGetBusLineSearchResultListener = interface(IJavaInstance)
    ['{811AD08E-3672-452D-9D3E-FF6017C99066}']
    { Property Methods }

    { methods }
    procedure onGetBusLineResult(P1: JBusLineResult); cdecl;
    // (Lcom/baidu/mapapi/search/busline/BusLineResult;)V

    { Property }
  end;

  TJOnGetBusLineSearchResultListener = class
    (TJavaGenericImport<JOnGetBusLineSearchResultListenerClass,
    JOnGetBusLineSearchResultListener>)
  end;

  JDistrictResultClass = interface(JSearchResultClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{8A01C3E5-427E-428D-8664-FA41C4207A56}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JDistrictResult; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/district/DistrictResult')]
  JDistrictResult = interface(JSearchResult)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{9A87C693-2149-4A02-BE0B-FDFD4272FBEC}']
    { Property Methods }
    function _GetcenterPt: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _SetcenterPt(acenterPt: JLatLng);
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function _Getpolylines: JList; // Ljava/util/List;
    procedure _Setpolylines(apolylines: JList); // (Ljava/util/List;)V
    function _GetcityCode: Integer; // I
    procedure _SetcityCode(acityCode: Integer); // (I)V
    function _GetcityName: JString; // Ljava/lang/String;
    procedure _SetcityName(acityName: JString); // (Ljava/lang/String;)V

    { methods }
    procedure setCityName(P1: JString); cdecl; // (Ljava/lang/String;)V
    procedure setCenterPt(P1: JLatLng); cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)V
    procedure setPolylines(P1: JList); cdecl; // (Ljava/util/List;)V
    procedure setCityCode(P1: Integer); cdecl; // (I)V
    function getCenterPt: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getPolylines: JList; cdecl; // ()Ljava/util/List;
    function getCityCode: Integer; cdecl; // ()I
    function getCityName: JString; cdecl; // ()Ljava/lang/String;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; // ()I

    { Property }
    property centerPt: JLatLng read _GetcenterPt write _SetcenterPt;
    property polylines: JList read _Getpolylines write _Setpolylines;
    property cityCode: Integer read _GetcityCode write _SetcityCode;
    property cityName: JString read _GetcityName write _SetcityName;
  end;

  TJDistrictResult = class(TJavaGenericImport<JDistrictResultClass,
    JDistrictResult>)
  end;

  JDistrictSearchClass = interface(JObjectClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/a
    ['{571A58B3-2722-4DD0-A814-9C75EA4C982E}']
    { static Property Methods }

    { static Methods }
    { class } function newInstance: JDistrictSearch; cdecl;
    // ()Lcom/baidu/mapapi/search/district/DistrictSearch;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/district/DistrictSearch')]
  JDistrictSearch = interface(JObject)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/a
    ['{A6AC4B30-3A9A-414E-A4A4-5CA9DC5EE645}']
    { Property Methods }

    { methods }
    function searchDistrict(P1: JDistrictSearchOption): Boolean; cdecl;
    // (Lcom/baidu/mapapi/search/district/DistrictSearchOption;)Z
    procedure setOnDistrictSearchListener
      (P1: JOnGetDistricSearchResultListener); cdecl;
    // (Lcom/baidu/mapapi/search/district/OnGetDistricSearchResultListener;)V
    procedure destroy; cdecl; // ()V

    { Property }
  end;

  TJDistrictSearch = class(TJavaGenericImport<JDistrictSearchClass,
    JDistrictSearch>)
  end;

  JDistrictSearchOptionClass = interface(JObjectClass)
    ['{E698A2E3-3BC9-4F9C-9DAB-A9F5C7F04BCE}']
    { static Property Methods }

    { static Methods }
    { class } function init: JDistrictSearchOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/district/DistrictSearchOption')]
  JDistrictSearchOption = interface(JObject)
    ['{5EECB1DD-3EBC-4F27-9515-1A9B1F3CF1E3}']
    { Property Methods }
    function _GetmCityName: JString; // Ljava/lang/String;
    procedure _SetmCityName(amCityName: JString); // (Ljava/lang/String;)V
    function _GetmDistrictName: JString; // Ljava/lang/String;
    procedure _SetmDistrictName(amDistrictName: JString);
    // (Ljava/lang/String;)V

    { methods }
    function cityName(P1: JString): JDistrictSearchOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/district/DistrictSearchOption;
    function districtName(P1: JString): JDistrictSearchOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/district/DistrictSearchOption;

    { Property }
    property mCityName: JString read _GetmCityName write _SetmCityName;
    property mDistrictName: JString read _GetmDistrictName
      write _SetmDistrictName;
  end;

  TJDistrictSearchOption = class(TJavaGenericImport<JDistrictSearchOptionClass,
    JDistrictSearchOption>)
  end;

  JOnGetDistricSearchResultListenerClass = interface(JObjectClass)
    ['{10CFC89A-500A-4341-BCE2-DB677D304244}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature
    ('com/baidu/mapapi/search/district/OnGetDistricSearchResultListener')]
  JOnGetDistricSearchResultListener = interface(IJavaInstance)
    ['{4D7A5D3B-705D-48EE-AA17-953B5DADA534}']
    { Property Methods }

    { methods }
    procedure onGetDistrictResult(P1: JDistrictResult); cdecl;
    // (Lcom/baidu/mapapi/search/district/DistrictResult;)V

    { Property }
  end;

  TJOnGetDistricSearchResultListener = class
    (TJavaGenericImport<JOnGetDistricSearchResultListenerClass,
    JOnGetDistricSearchResultListener>)
  end;

  JGeoCodeOptionClass = interface(JObjectClass)
    ['{D23E891A-68E3-4CB7-8DB7-AD8B1926C3C8}']
    { static Property Methods }

    { static Methods }
    { class } function init: JGeoCodeOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/geocode/GeoCodeOption')]
  JGeoCodeOption = interface(JObject)
    ['{42491B82-0C21-4A20-A2E1-35E834460A4E}']
    { Property Methods }
    function _GetmCity: JString; // Ljava/lang/String;
    procedure _SetmCity(amCity: JString); // (Ljava/lang/String;)V
    function _GetmAddress: JString; // Ljava/lang/String;
    procedure _SetmAddress(amAddress: JString); // (Ljava/lang/String;)V

    { methods }
    function city(P1: JString): JGeoCodeOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/geocode/GeoCodeOption;
    function address(P1: JString): JGeoCodeOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/geocode/GeoCodeOption;

    { Property }
    property mCity: JString read _GetmCity write _SetmCity;
    property mAddress: JString read _GetmAddress write _SetmAddress;
  end;

  TJGeoCodeOption = class(TJavaGenericImport<JGeoCodeOptionClass,
    JGeoCodeOption>)
  end;

  JGeoCoderClass = interface(JObjectClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/a
    ['{B053BDEE-3D1D-4184-81BC-B9CD4C9556B5}']
    { static Property Methods }

    { static Methods }
    { class } function newInstance: JGeoCoder; cdecl;
    // ()Lcom/baidu/mapapi/search/geocode/GeoCoder;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/geocode/GeoCoder')]
  JGeoCoder = interface(JObject)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/a
    ['{DEAEFBA2-3A93-47A2-8368-112647DDD13A}']
    { Property Methods }

    { methods }
    function geocode(P1: JGeoCodeOption): Boolean; cdecl;
    // (Lcom/baidu/mapapi/search/geocode/GeoCodeOption;)Z
    function reverseGeoCode(P1: JReverseGeoCodeOption): Boolean; cdecl;
    // (Lcom/baidu/mapapi/search/geocode/ReverseGeoCodeOption;)Z
    procedure setOnGetGeoCodeResultListener(P1: JOnGetGeoCoderResultListener);
      cdecl; // (Lcom/baidu/mapapi/search/geocode/OnGetGeoCoderResultListener;)V
    procedure destroy; cdecl; // ()V

    { Property }
  end;

  TJGeoCoder = class(TJavaGenericImport<JGeoCoderClass, JGeoCoder>)
  end;

  JGeoCodeResultClass = interface(JSearchResultClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{865DD507-A4D0-4EEA-A778-48C69CFE6364}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JGeoCodeResult; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/geocode/GeoCodeResult')]
  JGeoCodeResult = interface(JSearchResult)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{2F2B5BD6-62BD-4EDA-8DE9-781F60627C5C}']
    { Property Methods }

    { methods }
    function getLocation: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    procedure setLocation(P1: JLatLng); cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function getAddress: JString; cdecl; // ()Ljava/lang/String;
    procedure setAddress(P1: JString); cdecl; // (Ljava/lang/String;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJGeoCodeResult = class(TJavaGenericImport<JGeoCodeResultClass,
    JGeoCodeResult>)
  end;

  JOnGetGeoCoderResultListenerClass = interface(JObjectClass)
    ['{EF477E94-80B1-4CBD-9CB2-3949128BC23E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/geocode/OnGetGeoCoderResultListener')]
  JOnGetGeoCoderResultListener = interface(IJavaInstance)
    ['{D9E708CD-BBF9-4A99-90F3-852D3E27CC67}']
    { Property Methods }

    { methods }
    procedure onGetGeoCodeResult(P1: JGeoCodeResult); cdecl;
    // (Lcom/baidu/mapapi/search/geocode/GeoCodeResult;)V
    procedure onGetReverseGeoCodeResult(P1: JReverseGeoCodeResult); cdecl;
    // (Lcom/baidu/mapapi/search/geocode/ReverseGeoCodeResult;)V

    { Property }
  end;

  TJOnGetGeoCoderResultListener = class
    (TJavaGenericImport<JOnGetGeoCoderResultListenerClass,
    JOnGetGeoCoderResultListener>)
  end;

  JReverseGeoCodeOptionClass = interface(JObjectClass)
    ['{A5E5BC75-28D2-4E3B-9635-97243093D42A}']
    { static Property Methods }

    { static Methods }
    { class } function init: JReverseGeoCodeOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/geocode/ReverseGeoCodeOption')]
  JReverseGeoCodeOption = interface(JObject)
    ['{BD940BBB-C202-4035-A8BA-BBEA893E5B65}']
    { Property Methods }
    function _GetmLocation: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _SetmLocation(amLocation: JLatLng);
    // (Lcom/baidu/mapapi/model/LatLng;)V

    { methods }
    function location(P1: JLatLng): JReverseGeoCodeOption; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/search/geocode/ReverseGeoCodeOption;

    { Property }
    property mLocation: JLatLng read _GetmLocation write _SetmLocation;
  end;

  TJReverseGeoCodeOption = class(TJavaGenericImport<JReverseGeoCodeOptionClass,
    JReverseGeoCodeOption>)
  end;

  JReverseGeoCodeResult_AddressComponentClass = interface(JObjectClass)
    ['{FAEE2F2F-7A85-4602-A22A-5CE4DB6705A1}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JReverseGeoCodeResult_AddressComponent; cdecl;
    // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature
    ('com/baidu/mapapi/search/geocode/ReverseGeoCodeResult$AddressComponent')]
  JReverseGeoCodeResult_AddressComponent = interface(JObject)
    ['{37E7AE45-C397-4888-8527-8AB0C5B737E0}']
    { Property Methods }
    function _GetstreetNumber: JString; // Ljava/lang/String;
    procedure _SetstreetNumber(astreetNumber: JString); // (Ljava/lang/String;)V
    function _Getstreet: JString; // Ljava/lang/String;
    procedure _Setstreet(astreet: JString); // (Ljava/lang/String;)V
    function _Getdistrict: JString; // Ljava/lang/String;
    procedure _Setdistrict(adistrict: JString); // (Ljava/lang/String;)V
    function _Getcity: JString; // Ljava/lang/String;
    procedure _Setcity(acity: JString); // (Ljava/lang/String;)V
    function _Getprovince: JString; // Ljava/lang/String;
    procedure _Setprovince(aprovince: JString); // (Ljava/lang/String;)V
    function _GetcountryName: JString; // Ljava/lang/String;
    procedure _SetcountryName(acountryName: JString); // (Ljava/lang/String;)V
    function _GetcountryCode: Integer; // I
    procedure _SetcountryCode(acountryCode: Integer); // (I)V

    { methods }
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
    property streetNumber: JString read _GetstreetNumber write _SetstreetNumber;
    property street: JString read _Getstreet write _Setstreet;
    property district: JString read _Getdistrict write _Setdistrict;
    property city: JString read _Getcity write _Setcity;
    property province: JString read _Getprovince write _Setprovince;
    property countryName: JString read _GetcountryName write _SetcountryName;
    property countryCode: Integer read _GetcountryCode write _SetcountryCode;
  end;

  TJReverseGeoCodeResult_AddressComponent = class
    (TJavaGenericImport<JReverseGeoCodeResult_AddressComponentClass,
    JReverseGeoCodeResult_AddressComponent>)
  end;

  JReverseGeoCodeResultClass = interface(JSearchResultClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{33F50241-FD14-4055-B40A-59136D56CC43}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JReverseGeoCodeResult; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/geocode/ReverseGeoCodeResult')]
  JReverseGeoCodeResult = interface(JSearchResult)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{D8552785-ADB6-4F60-BEB1-7ACFB7E13C47}']
    { Property Methods }

    { methods }
    function getBusinessCircle: JString; cdecl; // ()Ljava/lang/String;
    procedure setBusinessCircle(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getAddress: JString; cdecl; // ()Ljava/lang/String;
    procedure setAddress(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getAddressDetail: JReverseGeoCodeResult_AddressComponent; cdecl;
    // ()Lcom/baidu/mapapi/search/geocode/ReverseGeoCodeResult$AddressComponent;
    procedure setAddressDetail(P1: JReverseGeoCodeResult_AddressComponent);
      cdecl; // (Lcom/baidu/mapapi/search/geocode/ReverseGeoCodeResult$AddressComponent;)V
    function getLocation: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    procedure setLocation(P1: JLatLng); cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function getPoiList: JList; cdecl; // ()Ljava/util/List;
    procedure setPoiList(P1: JList); cdecl; // (Ljava/util/List;)V
    function getSematicDescription: JString; cdecl; // ()Ljava/lang/String;
    procedure setSematicDescription(P1: JString); cdecl;
    // (Ljava/lang/String;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJReverseGeoCodeResult = class(TJavaGenericImport<JReverseGeoCodeResultClass,
    JReverseGeoCodeResult>)
  end;

  JOnGetPoiSearchResultListenerClass = interface(JObjectClass)
    ['{E2B9CFF2-6DCA-4E59-A489-051FED66DA60}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/poi/OnGetPoiSearchResultListener')]
  JOnGetPoiSearchResultListener = interface(IJavaInstance)
    ['{59AFC7E0-291B-4B33-8BDB-F271F6C58809}']
    { Property Methods }

    { methods }
    procedure onGetPoiResult(P1: JPoiResult); cdecl;
    // (Lcom/baidu/mapapi/search/poi/PoiResult;)V
    procedure onGetPoiDetailResult(P1: JPoiDetailResult); cdecl;
    // (Lcom/baidu/mapapi/search/poi/PoiDetailResult;)V
    procedure onGetPoiIndoorResult(P1: JPoiIndoorResult); cdecl;
    // (Lcom/baidu/mapapi/search/poi/PoiIndoorResult;)V

    { Property }
  end;

  TJOnGetPoiSearchResultListener = class
    (TJavaGenericImport<JOnGetPoiSearchResultListenerClass,
    JOnGetPoiSearchResultListener>)
  end;

  JPoiAddrInfoClass = interface(JObjectClass)
    ['{53CF1EE7-D10E-4659-BAED-772D6C754B5E}']
    { static Property Methods }

    { static Methods }
    { class } function init: JPoiAddrInfo; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/poi/PoiAddrInfo')]
  JPoiAddrInfo = interface(JObject)
    ['{61226DCB-BA92-4CA6-9457-3D67FBCEA27B}']
    { Property Methods }
    function _Getaddress: JString; // Ljava/lang/String;
    procedure _Setaddress(aaddress: JString); // (Ljava/lang/String;)V
    function _Getlocation: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _Setlocation(alocation: JLatLng);
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function _Getname: JString; // Ljava/lang/String;
    procedure _Setname(aname: JString); // (Ljava/lang/String;)V

    { methods }

    { Property }
    property address: JString read _Getaddress write _Setaddress;
    property location: JLatLng read _Getlocation write _Setlocation;
    property name: JString read _Getname write _Setname;
  end;

  TJPoiAddrInfo = class(TJavaGenericImport<JPoiAddrInfoClass, JPoiAddrInfo>)
  end;

  JPoiBoundSearchOptionClass = interface(JObjectClass)
    ['{04E7A60F-5261-4D26-8AB2-BD9E474D1E23}']
    { static Property Methods }

    { static Methods }
    { class } function init: JPoiBoundSearchOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/poi/PoiBoundSearchOption')]
  JPoiBoundSearchOption = interface(JObject)
    ['{B733AF7C-33C1-4033-998D-D6651F4449DC}']
    { Property Methods }
    function _GetmBound: JLatLngBounds; // Lcom/baidu/mapapi/model/LatLngBounds;
    procedure _SetmBound(amBound: JLatLngBounds);
    // (Lcom/baidu/mapapi/model/LatLngBounds;)V
    function _GetmKeyword: JString; // Ljava/lang/String;
    procedure _SetmKeyword(amKeyword: JString); // (Ljava/lang/String;)V
    function _GetmPageNum: Integer; // I
    procedure _SetmPageNum(amPageNum: Integer); // (I)V
    function _GetmPageCapacity: Integer; // I
    procedure _SetmPageCapacity(amPageCapacity: Integer); // (I)V

    { methods }
    function keyword(P1: JString): JPoiBoundSearchOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/poi/PoiBoundSearchOption;
    function bound(P1: JLatLngBounds): JPoiBoundSearchOption; cdecl;
    // (Lcom/baidu/mapapi/model/LatLngBounds;)Lcom/baidu/mapapi/search/poi/PoiBoundSearchOption;
    function pageNum(P1: Integer): JPoiBoundSearchOption; cdecl;
    // (I)Lcom/baidu/mapapi/search/poi/PoiBoundSearchOption;
    function pageCapacity(P1: Integer): JPoiBoundSearchOption; cdecl;
    // (I)Lcom/baidu/mapapi/search/poi/PoiBoundSearchOption;

    { Property }
    property mBound: JLatLngBounds read _GetmBound write _SetmBound;
    property mKeyword: JString read _GetmKeyword write _SetmKeyword;
    property mPageNum: Integer read _GetmPageNum write _SetmPageNum;
    property mPageCapacity: Integer read _GetmPageCapacity
      write _SetmPageCapacity;
  end;

  TJPoiBoundSearchOption = class(TJavaGenericImport<JPoiBoundSearchOptionClass,
    JPoiBoundSearchOption>)
  end;

  JPoiCitySearchOptionClass = interface(JObjectClass)
    ['{0A991D3F-30AA-4DDD-863D-CC29D1B23AF9}']
    { static Property Methods }

    { static Methods }
    { class } function init: JPoiCitySearchOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/poi/PoiCitySearchOption')]
  JPoiCitySearchOption = interface(JObject)
    ['{6290A59A-88BE-4065-BFBE-59B8F4338317}']
    { Property Methods }
    function _GetmCity: JString; // Ljava/lang/String;
    procedure _SetmCity(amCity: JString); // (Ljava/lang/String;)V
    function _GetmKeyword: JString; // Ljava/lang/String;
    procedure _SetmKeyword(amKeyword: JString); // (Ljava/lang/String;)V
    function _GetmPageNum: Integer; // I
    procedure _SetmPageNum(amPageNum: Integer); // (I)V
    function _GetmPageCapacity: Integer; // I
    procedure _SetmPageCapacity(amPageCapacity: Integer); // (I)V
    function _GetmIsReturnAddr: Boolean; // Z
    procedure _SetmIsReturnAddr(amIsReturnAddr: Boolean); // (Z)V

    { methods }
    function city(P1: JString): JPoiCitySearchOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/poi/PoiCitySearchOption;
    function keyword(P1: JString): JPoiCitySearchOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/poi/PoiCitySearchOption;
    function pageNum(P1: Integer): JPoiCitySearchOption; cdecl;
    // (I)Lcom/baidu/mapapi/search/poi/PoiCitySearchOption;
    function pageCapacity(P1: Integer): JPoiCitySearchOption; cdecl;
    // (I)Lcom/baidu/mapapi/search/poi/PoiCitySearchOption;
    function isReturnAddr(P1: Boolean): JPoiCitySearchOption; cdecl;
    // (Z)Lcom/baidu/mapapi/search/poi/PoiCitySearchOption;

    { Property }
    property mCity: JString read _GetmCity write _SetmCity;
    property mKeyword: JString read _GetmKeyword write _SetmKeyword;
    property mPageNum: Integer read _GetmPageNum write _SetmPageNum;
    property mPageCapacity: Integer read _GetmPageCapacity
      write _SetmPageCapacity;
    property mIsReturnAddr: Boolean read _GetmIsReturnAddr
      write _SetmIsReturnAddr;
  end;

  TJPoiCitySearchOption = class(TJavaGenericImport<JPoiCitySearchOptionClass,
    JPoiCitySearchOption>)
  end;

  JPoiDetailResultClass = interface(JSearchResultClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{C9CEBEBF-4B29-4E1E-96F0-A863F709679B}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JPoiDetailResult; cdecl; overload; // ()V
    { class } function init(P1: JSearchResult_ERRORNO): JPoiDetailResult; cdecl;
      overload; // (Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;)V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/poi/PoiDetailResult')]
  JPoiDetailResult = interface(JSearchResult)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{F71540A8-C746-454A-991C-BE47768C724F}']
    { Property Methods }
    function _Getname: JString; // Ljava/lang/String;
    procedure _Setname(aname: JString); // (Ljava/lang/String;)V
    function _Getlocation: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _Setlocation(alocation: JLatLng);
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function _Getaddress: JString; // Ljava/lang/String;
    procedure _Setaddress(aaddress: JString); // (Ljava/lang/String;)V
    function _Gettelephone: JString; // Ljava/lang/String;
    procedure _Settelephone(atelephone: JString); // (Ljava/lang/String;)V
    function _Getuid: JString; // Ljava/lang/String;
    procedure _Setuid(auid: JString); // (Ljava/lang/String;)V
    function _Gettag: JString; // Ljava/lang/String;
    procedure _Settag(atag: JString); // (Ljava/lang/String;)V
    function _GetdetailUrl: JString; // Ljava/lang/String;
    procedure _SetdetailUrl(adetailUrl: JString); // (Ljava/lang/String;)V
    function _Gettype: JString; // Ljava/lang/String;
    procedure _Settype(atype: JString); // (Ljava/lang/String;)V
    function _Getprice: Double; // D
    procedure _Setprice(aprice: Double); // (D)V
    function _GetoverallRating: Double; // D
    procedure _SetoverallRating(aoverallRating: Double); // (D)V
    function _GettasteRating: Double; // D
    procedure _SettasteRating(atasteRating: Double); // (D)V
    function _GetserviceRating: Double; // D
    procedure _SetserviceRating(aserviceRating: Double); // (D)V
    function _GetenvironmentRating: Double; // D
    procedure _SetenvironmentRating(aenvironmentRating: Double); // (D)V
    function _GetfacilityRating: Double; // D
    procedure _SetfacilityRating(afacilityRating: Double); // (D)V
    function _GethygieneRating: Double; // D
    procedure _SethygieneRating(ahygieneRating: Double); // (D)V
    function _GettechnologyRating: Double; // D
    procedure _SettechnologyRating(atechnologyRating: Double); // (D)V
    function _GetimageNum: Integer; // I
    procedure _SetimageNum(aimageNum: Integer); // (I)V
    function _GetgrouponNum: Integer; // I
    procedure _SetgrouponNum(agrouponNum: Integer); // (I)V
    function _GetcommentNum: Integer; // I
    procedure _SetcommentNum(acommentNum: Integer); // (I)V
    function _GetfavoriteNum: Integer; // I
    procedure _SetfavoriteNum(afavoriteNum: Integer); // (I)V
    function _GetcheckinNum: Integer; // I
    procedure _SetcheckinNum(acheckinNum: Integer); // (I)V
    function _GetshopHours: JString; // Ljava/lang/String;
    procedure _SetshopHours(ashopHours: JString); // (Ljava/lang/String;)V

    { methods }
    function getName: JString; cdecl; // ()Ljava/lang/String;
    function getLocation: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getAddress: JString; cdecl; // ()Ljava/lang/String;
    function getTelephone: JString; cdecl; // ()Ljava/lang/String;
    function getUid: JString; cdecl; // ()Ljava/lang/String;
    function getTag: JString; cdecl; // ()Ljava/lang/String;
    function getDetailUrl: JString; cdecl; // ()Ljava/lang/String;
    function getType: JString; cdecl; // ()Ljava/lang/String;
    function getPrice: Double; cdecl; // ()D
    function getOverallRating: Double; cdecl; // ()D
    function getTasteRating: Double; cdecl; // ()D
    function getServiceRating: Double; cdecl; // ()D
    function getEnvironmentRating: Double; cdecl; // ()D
    function getFacilityRating: Double; cdecl; // ()D
    function getHygieneRating: Double; cdecl; // ()D
    function getTechnologyRating: Double; cdecl; // ()D
    function getImageNum: Integer; cdecl; // ()I
    function getGrouponNum: Integer; cdecl; // ()I
    function getCommentNum: Integer; cdecl; // ()I
    function getFavoriteNum: Integer; cdecl; // ()I
    function getCheckinNum: Integer; cdecl; // ()I
    function getShopHours: JString; cdecl; // ()Ljava/lang/String;
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
    property name: JString read _Getname write _Setname;
    property location: JLatLng read _Getlocation write _Setlocation;
    property address: JString read _Getaddress write _Setaddress;
    property telephone: JString read _Gettelephone write _Settelephone;
    property uid: JString read _Getuid write _Setuid;
    property tag: JString read _Gettag write _Settag;
    property detailUrl: JString read _GetdetailUrl write _SetdetailUrl;
    property &type: JString read _Gettype write _Settype;
    property price: Double read _Getprice write _Setprice;
    property overallRating: Double read _GetoverallRating
      write _SetoverallRating;
    property tasteRating: Double read _GettasteRating write _SettasteRating;
    property serviceRating: Double read _GetserviceRating
      write _SetserviceRating;
    property environmentRating: Double read _GetenvironmentRating
      write _SetenvironmentRating;
    property facilityRating: Double read _GetfacilityRating
      write _SetfacilityRating;
    property hygieneRating: Double read _GethygieneRating
      write _SethygieneRating;
    property technologyRating: Double read _GettechnologyRating
      write _SettechnologyRating;
    property imageNum: Integer read _GetimageNum write _SetimageNum;
    property grouponNum: Integer read _GetgrouponNum write _SetgrouponNum;
    property commentNum: Integer read _GetcommentNum write _SetcommentNum;
    property favoriteNum: Integer read _GetfavoriteNum write _SetfavoriteNum;
    property checkinNum: Integer read _GetcheckinNum write _SetcheckinNum;
    property shopHours: JString read _GetshopHours write _SetshopHours;
  end;

  TJPoiDetailResult = class(TJavaGenericImport<JPoiDetailResultClass,
    JPoiDetailResult>)
  end;

  JPoiDetailSearchOptionClass = interface(JObjectClass)
    ['{DDBCDD5D-655F-4B17-874F-DBFF58D5B3D5}']
    { static Property Methods }

    { static Methods }
    { class } function init: JPoiDetailSearchOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/poi/PoiDetailSearchOption')]
  JPoiDetailSearchOption = interface(JObject)
    ['{92A32927-6F54-4C64-B25D-EF513A0D936A}']
    { Property Methods }
    function _GetmUid: JString; // Ljava/lang/String;
    procedure _SetmUid(amUid: JString); // (Ljava/lang/String;)V

    { methods }
    function poiUid(P1: JString): JPoiDetailSearchOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/poi/PoiDetailSearchOption;

    { Property }
    property mUid: JString read _GetmUid write _SetmUid;
  end;

  TJPoiDetailSearchOption = class
    (TJavaGenericImport<JPoiDetailSearchOptionClass, JPoiDetailSearchOption>)
  end;

  JPoiIndoorInfoClass = interface(JObjectClass)
    ['{2D3A14FE-28DE-42F7-99C7-8DDD99D764D5}']
    { static Property Methods }

    { static Methods }
    { class } function init: JPoiIndoorInfo; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/poi/PoiIndoorInfo')]
  JPoiIndoorInfo = interface(JObject)
    ['{9562DD96-2364-4E39-AC16-C5B9427A18D7}']
    { Property Methods }
    function _Getaddress: JString; // Ljava/lang/String;
    procedure _Setaddress(aaddress: JString); // (Ljava/lang/String;)V
    function _Getbid: JString; // Ljava/lang/String;
    procedure _Setbid(abid: JString); // (Ljava/lang/String;)V
    function _Getcid: Integer; // I
    procedure _Setcid(acid: Integer); // (I)V
    function _Getdiscount: Integer; // I
    procedure _Setdiscount(adiscount: Integer); // (I)V
    function _Getfloor: JString; // Ljava/lang/String;
    procedure _Setfloor(afloor: JString); // (Ljava/lang/String;)V
    function _Getname: JString; // Ljava/lang/String;
    procedure _Setname(aname: JString); // (Ljava/lang/String;)V
    function _Getphone: JString; // Ljava/lang/String;
    procedure _Setphone(aphone: JString); // (Ljava/lang/String;)V
    function _Getprice: Double; // D
    procedure _Setprice(aprice: Double); // (D)V
    function _GetlatLng: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _SetlatLng(alatLng: JLatLng);
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function _GetstarLevel: Integer; // I
    procedure _SetstarLevel(astarLevel: Integer); // (I)V
    function _GetisGroup: Boolean; // Z
    procedure _SetisGroup(aisGroup: Boolean); // (Z)V
    function _GetisTakeOut: Boolean; // Z
    procedure _SetisTakeOut(aisTakeOut: Boolean); // (Z)V
    function _GetisWaited: Boolean; // Z
    procedure _SetisWaited(aisWaited: Boolean); // (Z)V
    function _Getuid: JString; // Ljava/lang/String;
    procedure _Setuid(auid: JString); // (Ljava/lang/String;)V
    function _Gettag: JString; // Ljava/lang/String;
    procedure _Settag(atag: JString); // (Ljava/lang/String;)V
    function _GetgroupNum: Integer; // I
    procedure _SetgroupNum(agroupNum: Integer); // (I)V

    { methods }

    { Property }
    property address: JString read _Getaddress write _Setaddress;
    property bid: JString read _Getbid write _Setbid;
    property cid: Integer read _Getcid write _Setcid;
    property discount: Integer read _Getdiscount write _Setdiscount;
    property floor: JString read _Getfloor write _Setfloor;
    property name: JString read _Getname write _Setname;
    property phone: JString read _Getphone write _Setphone;
    property price: Double read _Getprice write _Setprice;
    property latLng: JLatLng read _GetlatLng write _SetlatLng;
    property starLevel: Integer read _GetstarLevel write _SetstarLevel;
    property isGroup: Boolean read _GetisGroup write _SetisGroup;
    property isTakeOut: Boolean read _GetisTakeOut write _SetisTakeOut;
    property isWaited: Boolean read _GetisWaited write _SetisWaited;
    property uid: JString read _Getuid write _Setuid;
    property tag: JString read _Gettag write _Settag;
    property groupNum: Integer read _GetgroupNum write _SetgroupNum;
  end;

  TJPoiIndoorInfo = class(TJavaGenericImport<JPoiIndoorInfoClass,
    JPoiIndoorInfo>)
  end;

  JPoiIndoorOptionClass = interface(JObjectClass)
    ['{72633A60-A736-44CD-AF70-0D10D2DFCB8D}']
    { static Property Methods }

    { static Methods }
    { class } function init: JPoiIndoorOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/poi/PoiIndoorOption')]
  JPoiIndoorOption = interface(JObject)
    ['{01E6CA3A-AAD1-45A0-9D3E-1B4A65A006F8}']
    { Property Methods }
    function _Getbid: JString; // Ljava/lang/String;
    procedure _Setbid(abid: JString); // (Ljava/lang/String;)V
    function _Getwd: JString; // Ljava/lang/String;
    procedure _Setwd(awd: JString); // (Ljava/lang/String;)V
    function _Getfloor: JString; // Ljava/lang/String;
    procedure _Setfloor(afloor: JString); // (Ljava/lang/String;)V
    function _GetcurrentPage: Integer; // I
    procedure _SetcurrentPage(acurrentPage: Integer); // (I)V
    function _GetpageSize: Integer; // I
    procedure _SetpageSize(apageSize: Integer); // (I)V

    { methods }
    function poiIndoorBid(P1: JString): JPoiIndoorOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/poi/PoiIndoorOption;
    function poiIndoorWd(P1: JString): JPoiIndoorOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/poi/PoiIndoorOption;
    function poiCurrentPage(P1: Integer): JPoiIndoorOption; cdecl;
    // (I)Lcom/baidu/mapapi/search/poi/PoiIndoorOption;
    function poiPageSize(P1: Integer): JPoiIndoorOption; cdecl;
    // (I)Lcom/baidu/mapapi/search/poi/PoiIndoorOption;
    function poiFloor(P1: JString): JPoiIndoorOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/poi/PoiIndoorOption;

    { Property }
    property bid: JString read _Getbid write _Setbid;
    property wd: JString read _Getwd write _Setwd;
    property floor: JString read _Getfloor write _Setfloor;
    property currentPage: Integer read _GetcurrentPage write _SetcurrentPage;
    property pageSize: Integer read _GetpageSize write _SetpageSize;
  end;

  TJPoiIndoorOption = class(TJavaGenericImport<JPoiIndoorOptionClass,
    JPoiIndoorOption>)
  end;

  JPoiIndoorResultClass = interface(JSearchResultClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{DB5A0F5E-E19B-40A0-B834-6BD06B6C1BAD}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JPoiIndoorResult; cdecl; overload; // ()V
    { class } function init(P1: JSearchResult_ERRORNO): JPoiIndoorResult; cdecl;
      overload; // (Lcom/baidu/mapapi/search/core/SearchResult$ERRORNO;)V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/poi/PoiIndoorResult')]
  JPoiIndoorResult = interface(JSearchResult)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{0FC57B2C-B3F7-43A1-8374-126F750ED3F6}']
    { Property Methods }
    function _GetpoiNum: Integer; // I
    procedure _SetpoiNum(apoiNum: Integer); // (I)V
    function _GetpageNum: Integer; // I
    procedure _SetpageNum(apageNum: Integer); // (I)V

    { methods }
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; // ()I
    function getmArrayPoiInfo: JList; cdecl; // ()Ljava/util/List;
    procedure setmArrayPoiInfo(P1: JList); cdecl; // (Ljava/util/List;)V
    function getPoiNum: Integer; cdecl; // ()I
    procedure setPoiNum(P1: Integer); cdecl; // (I)V
    function getPageNum: Integer; cdecl; // ()I
    procedure setPageNum(P1: Integer); cdecl; // (I)V

    { Property }
    property poiNum: Integer read _GetpoiNum write _SetpoiNum;
    property pageNum: Integer read _GetpageNum write _SetpageNum;
  end;

  TJPoiIndoorResult = class(TJavaGenericImport<JPoiIndoorResultClass,
    JPoiIndoorResult>)
  end;

  JPoiNearbySearchOptionClass = interface(JObjectClass)
    ['{D3CD4E49-FDA9-4A04-960E-F6B6268C6FAA}']
    { static Property Methods }

    { static Methods }
    { class } function init: JPoiNearbySearchOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/poi/PoiNearbySearchOption')]
  JPoiNearbySearchOption = interface(JObject)
    ['{AC122723-CB7A-43C7-8307-210B13E5D40C}']
    { Property Methods }
    function _GetmKeyword: JString; // Ljava/lang/String;
    procedure _SetmKeyword(amKeyword: JString); // (Ljava/lang/String;)V
    function _GetmLocation: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _SetmLocation(amLocation: JLatLng);
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function _GetmRadius: Integer; // I
    procedure _SetmRadius(amRadius: Integer); // (I)V
    function _GetmPageNum: Integer; // I
    procedure _SetmPageNum(amPageNum: Integer); // (I)V
    function _GetmPageCapacity: Integer; // I
    procedure _SetmPageCapacity(amPageCapacity: Integer); // (I)V
    function _GetsortType: JPoiSortType;
    // Lcom/baidu/mapapi/search/poi/PoiSortType;
    procedure _SetsortType(asortType: JPoiSortType);
    // (Lcom/baidu/mapapi/search/poi/PoiSortType;)V

    { methods }
    function keyword(P1: JString): JPoiNearbySearchOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/poi/PoiNearbySearchOption;
    function location(P1: JLatLng): JPoiNearbySearchOption; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/search/poi/PoiNearbySearchOption;
    function sortType(P1: JPoiSortType): JPoiNearbySearchOption; cdecl;
    // (Lcom/baidu/mapapi/search/poi/PoiSortType;)Lcom/baidu/mapapi/search/poi/PoiNearbySearchOption;
    function radius(P1: Integer): JPoiNearbySearchOption; cdecl;
    // (I)Lcom/baidu/mapapi/search/poi/PoiNearbySearchOption;
    function pageNum(P1: Integer): JPoiNearbySearchOption; cdecl;
    // (I)Lcom/baidu/mapapi/search/poi/PoiNearbySearchOption;
    function pageCapacity(P1: Integer): JPoiNearbySearchOption; cdecl;
    // (I)Lcom/baidu/mapapi/search/poi/PoiNearbySearchOption;

    { Property }
    property mKeyword: JString read _GetmKeyword write _SetmKeyword;
    property mLocation: JLatLng read _GetmLocation write _SetmLocation;
    property mRadius: Integer read _GetmRadius write _SetmRadius;
    property mPageNum: Integer read _GetmPageNum write _SetmPageNum;
    property mPageCapacity: Integer read _GetmPageCapacity
      write _SetmPageCapacity;
    property _sortType: JPoiSortType read _GetsortType write _SetsortType;
  end;

  TJPoiNearbySearchOption = class
    (TJavaGenericImport<JPoiNearbySearchOptionClass, JPoiNearbySearchOption>)
  end;

  JPoiResultClass = interface(JSearchResultClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{04E13DAC-3050-4928-B507-263B3EAE3F91}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JPoiResult; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/poi/PoiResult')]
  JPoiResult = interface(JSearchResult)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{DBA4143B-8120-4667-92D9-C6FAE9DCAB0C}']
    { Property Methods }

    { methods }
    function getCurrentPageNum: Integer; cdecl; // ()I
    procedure setCurrentPageNum(P1: Integer); cdecl; // (I)V
    function getTotalPageNum: Integer; cdecl; // ()I
    procedure setTotalPageNum(P1: Integer); cdecl; // (I)V
    function getCurrentPageCapacity: Integer; cdecl; // ()I
    procedure setCurrentPageCapacity(P1: Integer); cdecl; // (I)V
    function getTotalPoiNum: Integer; cdecl; // ()I
    procedure setTotalPoiNum(P1: Integer); cdecl; // (I)V
    function getAllPoi: JList; cdecl; // ()Ljava/util/List;
    procedure setPoiInfo(P1: JList); cdecl; // (Ljava/util/List;)V
    function getAllAddr: JList; cdecl; // ()Ljava/util/List;
    procedure setAddrInfo(P1: JList); cdecl; // (Ljava/util/List;)V
    function isHasAddrInfo: Boolean; cdecl; // ()Z
    procedure setHasAddrInfo(P1: Boolean); cdecl; // (Z)V
    function getSuggestCityList: JList; cdecl; // ()Ljava/util/List;
    procedure setSuggestCityList(P1: JList); cdecl; // (Ljava/util/List;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJPoiResult = class(TJavaGenericImport<JPoiResultClass, JPoiResult>)
  end;

  JPoiSearchClass = interface(JObjectClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/a
    ['{B46753F0-AC4D-46EE-81FE-F4B12FFE08D0}']
    { static Property Methods }

    { static Methods }
    { class } function newInstance: JPoiSearch; cdecl;
    // ()Lcom/baidu/mapapi/search/poi/PoiSearch;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/poi/PoiSearch')]
  JPoiSearch = interface(JObject)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/a
    ['{28A17A29-D948-47AC-86B5-AA3DC60E5728}']
    { Property Methods }

    { methods }
    procedure setOnGetPoiSearchResultListener
      (P1: JOnGetPoiSearchResultListener); cdecl;
    // (Lcom/baidu/mapapi/search/poi/OnGetPoiSearchResultListener;)V
    function searchInCity(P1: JPoiCitySearchOption): Boolean; cdecl;
    // (Lcom/baidu/mapapi/search/poi/PoiCitySearchOption;)Z
    function searchNearby(P1: JPoiNearbySearchOption): Boolean; cdecl;
    // (Lcom/baidu/mapapi/search/poi/PoiNearbySearchOption;)Z
    function searchInBound(P1: JPoiBoundSearchOption): Boolean; cdecl;
    // (Lcom/baidu/mapapi/search/poi/PoiBoundSearchOption;)Z
    function searchPoiDetail(P1: JPoiDetailSearchOption): Boolean; cdecl;
    // (Lcom/baidu/mapapi/search/poi/PoiDetailSearchOption;)Z
    function searchPoiIndoor(P1: JPoiIndoorOption): Boolean; cdecl;
    // (Lcom/baidu/mapapi/search/poi/PoiIndoorOption;)Z
    procedure destroy; cdecl; // ()V

    { Property }
  end;

  TJPoiSearch = class(TJavaGenericImport<JPoiSearchClass, JPoiSearch>)
  end;

  JPoiSortTypeClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{3C9CEC63-9771-4637-B5AE-2559FBAD1D29}']
    { static Property Methods }
    { class } function _Getcomprehensive: JPoiSortType;
    // Lcom/baidu/mapapi/search/poi/PoiSortType;
    { class } function _Getdistance_from_near_to_far: JPoiSortType;
    // Lcom/baidu/mapapi/search/poi/PoiSortType;

    { static Methods }
    { class } function values: TJavaObjectArray<JPoiSortType>; cdecl;
    // ()[Lcom/baidu/mapapi/search/poi/PoiSortType;
    { class } function valueOf(P1: JString): JPoiSortType; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/poi/PoiSortType;

    { static Property }
    { class } property comprehensive: JPoiSortType read _Getcomprehensive;
    { class } property distance_from_near_to_far: JPoiSortType
      read _Getdistance_from_near_to_far;
  end;

  [JavaSignature('com/baidu/mapapi/search/poi/PoiSortType')]
  JPoiSortType = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{C21FDF6C-2957-4EFF-BA18-5D4333FC03F0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPoiSortType = class(TJavaGenericImport<JPoiSortTypeClass, JPoiSortType>)
  end;

  JBikingRouteLine_BikingStepClass = interface(JRouteStepClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/RouteStep
    ['{AAB6BD59-16BD-4215-93B9-4BD540A7BFA1}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JBikingRouteLine_BikingStep; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/route/BikingRouteLine$BikingStep')]
  JBikingRouteLine_BikingStep = interface(JRouteStep)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/RouteStep
    ['{DBCE894D-A538-4504-A0CA-99767E6C84C3}']
    { Property Methods }

    { methods }
    function getWayPoints: JList; cdecl; // ()Ljava/util/List;
    function getDirection: Integer; cdecl; // ()I
    procedure setDirection(P1: Integer); cdecl; // (I)V
    function getEntrance: JRouteNode; cdecl;
    // ()Lcom/baidu/mapapi/search/core/RouteNode;
    procedure setEntrance(P1: JRouteNode); cdecl;
    // (Lcom/baidu/mapapi/search/core/RouteNode;)V
    function getExit: JRouteNode; cdecl;
    // ()Lcom/baidu/mapapi/search/core/RouteNode;
    procedure setExit(P1: JRouteNode); cdecl;
    // (Lcom/baidu/mapapi/search/core/RouteNode;)V
    procedure setPathString(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getEntranceInstructions: JString; cdecl; // ()Ljava/lang/String;
    procedure setEntranceInstructions(P1: JString); cdecl;
    // (Ljava/lang/String;)V
    function getExitInstructions: JString; cdecl; // ()Ljava/lang/String;
    procedure setExitInstructions(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getInstructions: JString; cdecl; // ()Ljava/lang/String;
    procedure setInstructions(P1: JString); cdecl; // (Ljava/lang/String;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJBikingRouteLine_BikingStep = class
    (TJavaGenericImport<JBikingRouteLine_BikingStepClass,
    JBikingRouteLine_BikingStep>)
  end;

  JBikingRouteLineClass = interface(JRouteLineClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/RouteLine
    ['{728D30C7-8F17-4B03-B647-797C2635DADF}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JBikingRouteLine; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/route/BikingRouteLine')]
  JBikingRouteLine = interface(JRouteLine)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/RouteLine
    ['{F24E6348-D796-4BBE-AA64-C6D85EEA8F12}']
    { Property Methods }

    { methods }
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; // ()I
    function getAllStep: JList; cdecl; // ()Ljava/util/List;

    { Property }
  end;

  TJBikingRouteLine = class(TJavaGenericImport<JBikingRouteLineClass,
    JBikingRouteLine>)
  end;

  JBikingRoutePlanOptionClass = interface(JObjectClass)
    ['{F675BC84-E70D-48A3-85C1-B5D4FFE94DEE}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBikingRoutePlanOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/route/BikingRoutePlanOption')]
  JBikingRoutePlanOption = interface(JObject)
    ['{2A5A6389-20E9-43BA-BBEF-C2BB1FA1D9C2}']
    { Property Methods }
    function _GetmFrom: JPlanNode; // Lcom/baidu/mapapi/search/route/PlanNode;
    procedure _SetmFrom(amFrom: JPlanNode);
    // (Lcom/baidu/mapapi/search/route/PlanNode;)V
    function _GetmTo: JPlanNode; // Lcom/baidu/mapapi/search/route/PlanNode;
    procedure _SetmTo(amTo: JPlanNode);
    // (Lcom/baidu/mapapi/search/route/PlanNode;)V

    { methods }
    function from(P1: JPlanNode): JBikingRoutePlanOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/PlanNode;)Lcom/baidu/mapapi/search/route/BikingRoutePlanOption;
    function &to(P1: JPlanNode): JBikingRoutePlanOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/PlanNode;)Lcom/baidu/mapapi/search/route/BikingRoutePlanOption;

    { Property }
    property mFrom: JPlanNode read _GetmFrom write _SetmFrom;
    property mTo: JPlanNode read _GetmTo write _SetmTo;
  end;

  TJBikingRoutePlanOption = class
    (TJavaGenericImport<JBikingRoutePlanOptionClass, JBikingRoutePlanOption>)
  end;

  JBikingRouteResultClass = interface(JSearchResultClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{212AEF95-19D4-4424-90CA-13E4AA870BFB}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JBikingRouteResult; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/route/BikingRouteResult')]
  JBikingRouteResult = interface(JSearchResult)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{1BDF64E3-82DA-4E80-9C97-1917EC25893E}']
    { Property Methods }

    { methods }
    function getRouteLines: JList; cdecl; // ()Ljava/util/List;
    procedure setRouteLines(P1: JList); cdecl; // (Ljava/util/List;)V
    function getSuggestAddrInfo: JSuggestAddrInfo; cdecl;
    // ()Lcom/baidu/mapapi/search/route/SuggestAddrInfo;
    procedure setSuggestAddrInfo(P1: JSuggestAddrInfo); cdecl;
    // (Lcom/baidu/mapapi/search/route/SuggestAddrInfo;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJBikingRouteResult = class(TJavaGenericImport<JBikingRouteResultClass,
    JBikingRouteResult>)
  end;

  JDrivingRouteLine_DrivingStepClass = interface(JRouteStepClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/RouteStep
    ['{A915A666-4BA6-48DA-B2B3-819770DC8F6D}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JDrivingRouteLine_DrivingStep; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/route/DrivingRouteLine$DrivingStep')]
  JDrivingRouteLine_DrivingStep = interface(JRouteStep)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/RouteStep
    ['{D02C748F-09B6-4FBA-A63B-F05D94556F30}']
    { Property Methods }

    { methods }
    function getWayPoints: JList; cdecl; // ()Ljava/util/List;
    function getDirection: Integer; cdecl; // ()I
    procedure setDirection(P1: Integer); cdecl; // (I)V
    function getEntrance: JRouteNode; cdecl;
    // ()Lcom/baidu/mapapi/search/core/RouteNode;
    procedure setEntrance(P1: JRouteNode); cdecl;
    // (Lcom/baidu/mapapi/search/core/RouteNode;)V
    function getExit: JRouteNode; cdecl;
    // ()Lcom/baidu/mapapi/search/core/RouteNode;
    procedure setExit(P1: JRouteNode); cdecl;
    // (Lcom/baidu/mapapi/search/core/RouteNode;)V
    procedure setPathString(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getTrafficList: TJavaArray<Integer>; cdecl; // ()[I
    procedure setPathList(P1: JList); cdecl; // (Ljava/util/List;)V
    procedure setTrafficList(P1: TJavaArray<Integer>); cdecl; // ([I)V
    function getEntranceInstructions: JString; cdecl; // ()Ljava/lang/String;
    procedure setEntranceInstructions(P1: JString); cdecl;
    // (Ljava/lang/String;)V
    function getExitInstructions: JString; cdecl; // ()Ljava/lang/String;
    procedure setExitInstructions(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getInstructions: JString; cdecl; // ()Ljava/lang/String;
    procedure setInstructions(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getNumTurns: Integer; cdecl; // ()I
    procedure setNumTurns(P1: Integer); cdecl; // (I)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJDrivingRouteLine_DrivingStep = class
    (TJavaGenericImport<JDrivingRouteLine_DrivingStepClass,
    JDrivingRouteLine_DrivingStep>)
  end;

  JDrivingRouteLineClass = interface(JRouteLineClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/RouteLine
    ['{58496861-9115-40EF-97D8-68BF68B4BD07}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JDrivingRouteLine; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/route/DrivingRouteLine')]
  JDrivingRouteLine = interface(JRouteLine)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/RouteLine
    ['{8FCD71FF-36CC-4CBF-B520-90CAA9D42FA3}']
    { Property Methods }

    { methods }
    function isSupportTraffic: Boolean; cdecl; // Deprecated //()Z
    procedure setSupportTraffic(P1: Boolean); cdecl; // (Z)V
    function getWayPoints: JList; cdecl; // ()Ljava/util/List;
    procedure setWayPoints(P1: JList); cdecl; // (Ljava/util/List;)V
    function getCongestionDistance: Integer; cdecl; // ()I
    procedure setCongestionDistance(P1: Integer); cdecl; // (I)V
    function getLightNum: Integer; cdecl; // ()I
    procedure setLightNum(P1: Integer); cdecl; // (I)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJDrivingRouteLine = class(TJavaGenericImport<JDrivingRouteLineClass,
    JDrivingRouteLine>)
  end;

  JDrivingRoutePlanOption_DrivingPolicyClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{BEED01B4-2CB8-424E-811D-A876153C3495}']
    { static Property Methods }
    { class } function _GetECAR_AVOID_JAM
      : JDrivingRoutePlanOption_DrivingPolicy;
    // Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption$DrivingPolicy;
    { class } function _GetECAR_TIME_FIRST
      : JDrivingRoutePlanOption_DrivingPolicy;
    // Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption$DrivingPolicy;
    { class } function _GetECAR_DIS_FIRST
      : JDrivingRoutePlanOption_DrivingPolicy;
    // Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption$DrivingPolicy;
    { class } function _GetECAR_FEE_FIRST
      : JDrivingRoutePlanOption_DrivingPolicy;
    // Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption$DrivingPolicy;

    { static Methods }
    { class } function values
      : TJavaObjectArray<JDrivingRoutePlanOption_DrivingPolicy>; cdecl;
    // ()[Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption$DrivingPolicy;
    { class } function valueOf(P1: JString)
      : JDrivingRoutePlanOption_DrivingPolicy; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption$DrivingPolicy;

    { static Property }
    { class } property ECAR_AVOID_JAM: JDrivingRoutePlanOption_DrivingPolicy
      read _GetECAR_AVOID_JAM;
    { class } property ECAR_TIME_FIRST: JDrivingRoutePlanOption_DrivingPolicy
      read _GetECAR_TIME_FIRST;
    { class } property ECAR_DIS_FIRST: JDrivingRoutePlanOption_DrivingPolicy
      read _GetECAR_DIS_FIRST;
    { class } property ECAR_FEE_FIRST: JDrivingRoutePlanOption_DrivingPolicy
      read _GetECAR_FEE_FIRST;
  end;

  [JavaSignature
    ('com/baidu/mapapi/search/route/DrivingRoutePlanOption$DrivingPolicy')]
  JDrivingRoutePlanOption_DrivingPolicy = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{DA883782-8668-4731-8024-8B8D93D25428}']
    { Property Methods }

    { methods }
    function getInt: Integer; cdecl; // ()I

    { Property }
  end;

  TJDrivingRoutePlanOption_DrivingPolicy = class
    (TJavaGenericImport<JDrivingRoutePlanOption_DrivingPolicyClass,
    JDrivingRoutePlanOption_DrivingPolicy>)
  end;

  JDrivingRoutePlanOption_DrivingTrafficPolicyClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{00353770-3DC6-4B39-A05F-E26799660DBA}']
    { static Property Methods }
    { class } function _GetROUTE_PATH
      : JDrivingRoutePlanOption_DrivingTrafficPolicy;
    // Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption$DrivingTrafficPolicy;
    { class } function _GetROUTE_PATH_AND_TRAFFIC
      : JDrivingRoutePlanOption_DrivingTrafficPolicy;
    // Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption$DrivingTrafficPolicy;

    { static Methods }
    { class } function values
      : TJavaObjectArray<JDrivingRoutePlanOption_DrivingTrafficPolicy>; cdecl;
    // ()[Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption$DrivingTrafficPolicy;
    { class } function valueOf(P1: JString)
      : JDrivingRoutePlanOption_DrivingTrafficPolicy; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption$DrivingTrafficPolicy;

    { static Property }
    { class } property ROUTE_PATH: JDrivingRoutePlanOption_DrivingTrafficPolicy
      read _GetROUTE_PATH;
    { class } property ROUTE_PATH_AND_TRAFFIC
      : JDrivingRoutePlanOption_DrivingTrafficPolicy
      read _GetROUTE_PATH_AND_TRAFFIC;
  end;

  [JavaSignature
    ('com/baidu/mapapi/search/route/DrivingRoutePlanOption$DrivingTrafficPolicy')
    ]
  JDrivingRoutePlanOption_DrivingTrafficPolicy = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{8CFD7048-8804-4CDB-B1E3-E3864BC04871}']
    { Property Methods }

    { methods }
    function getInt: Integer; cdecl; // ()I

    { Property }
  end;

  TJDrivingRoutePlanOption_DrivingTrafficPolicy = class
    (TJavaGenericImport<JDrivingRoutePlanOption_DrivingTrafficPolicyClass,
    JDrivingRoutePlanOption_DrivingTrafficPolicy>)
  end;

  JDrivingRoutePlanOptionClass = interface(JObjectClass)
    ['{8D9B3DC0-78E1-438E-B679-81DEB47D1979}']
    { static Property Methods }

    { static Methods }
    { class } function init: JDrivingRoutePlanOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/route/DrivingRoutePlanOption')]
  JDrivingRoutePlanOption = interface(JObject)
    ['{D55E5735-5F02-4854-BF88-9CD139BC21E8}']
    { Property Methods }
    function _GetmFrom: JPlanNode; // Lcom/baidu/mapapi/search/route/PlanNode;
    procedure _SetmFrom(amFrom: JPlanNode);
    // (Lcom/baidu/mapapi/search/route/PlanNode;)V
    function _GetmTo: JPlanNode; // Lcom/baidu/mapapi/search/route/PlanNode;
    procedure _SetmTo(amTo: JPlanNode);
    // (Lcom/baidu/mapapi/search/route/PlanNode;)V
    function _GetmCityName: JString; // Ljava/lang/String;
    procedure _SetmCityName(amCityName: JString); // (Ljava/lang/String;)V
    function _GetmPolicy: JDrivingRoutePlanOption_DrivingPolicy;
    // Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption$DrivingPolicy;
    procedure _SetmPolicy(amPolicy: JDrivingRoutePlanOption_DrivingPolicy);
    // (Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption$DrivingPolicy;)V
    function _GetmWayPoints: JList; // Ljava/util/List;
    procedure _SetmWayPoints(amWayPoints: JList); // (Ljava/util/List;)V
    function _GetmtrafficPolicy: JDrivingRoutePlanOption_DrivingTrafficPolicy;
    // Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption$DrivingTrafficPolicy;
    procedure _SetmtrafficPolicy(amtrafficPolicy
      : JDrivingRoutePlanOption_DrivingTrafficPolicy);
    // (Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption$DrivingTrafficPolicy;)V

    { methods }
    function from(P1: JPlanNode): JDrivingRoutePlanOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/PlanNode;)Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption;
    function &to(P1: JPlanNode): JDrivingRoutePlanOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/PlanNode;)Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption;
    function currentCity(P1: JString): JDrivingRoutePlanOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption;
    function passBy(P1: JList): JDrivingRoutePlanOption; cdecl;
    // (Ljava/util/List;)Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption;
    function trafficPolicy(P1: JDrivingRoutePlanOption_DrivingTrafficPolicy)
      : JDrivingRoutePlanOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption$DrivingTrafficPolicy;)Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption;
    function policy(P1: JDrivingRoutePlanOption_DrivingPolicy)
      : JDrivingRoutePlanOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption$DrivingPolicy;)Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption;

    { Property }
    property mFrom: JPlanNode read _GetmFrom write _SetmFrom;
    property mTo: JPlanNode read _GetmTo write _SetmTo;
    property mCityName: JString read _GetmCityName write _SetmCityName;
    property mPolicy: JDrivingRoutePlanOption_DrivingPolicy read _GetmPolicy
      write _SetmPolicy;
    property mWayPoints: JList read _GetmWayPoints write _SetmWayPoints;
    property mtrafficPolicy: JDrivingRoutePlanOption_DrivingTrafficPolicy
      read _GetmtrafficPolicy write _SetmtrafficPolicy;
  end;

  TJDrivingRoutePlanOption = class
    (TJavaGenericImport<JDrivingRoutePlanOptionClass, JDrivingRoutePlanOption>)
  end;

  JDrivingRouteResultClass = interface(JSearchResultClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{0767B53B-7EFA-4D6C-BC04-3818E4672ADF}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JDrivingRouteResult; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/route/DrivingRouteResult')]
  JDrivingRouteResult = interface(JSearchResult)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{063651DA-68D4-4A50-85DF-96A5D5A85D4A}']
    { Property Methods }

    { methods }
    function getTaxiInfo: JTaxiInfo; cdecl;
    // Deprecated //()Lcom/baidu/mapapi/search/core/TaxiInfo;
    function getTaxiInfos: JList; cdecl; // ()Ljava/util/List;
    procedure setTaxiInfos(P1: JList); cdecl; // (Ljava/util/List;)V
    procedure setRouteLines(P1: JList); cdecl; // (Ljava/util/List;)V
    function getRouteLines: JList; cdecl; // ()Ljava/util/List;
    function getSuggestAddrInfo: JSuggestAddrInfo; cdecl;
    // ()Lcom/baidu/mapapi/search/route/SuggestAddrInfo;
    procedure setSuggestAddrInfo(P1: JSuggestAddrInfo); cdecl;
    // (Lcom/baidu/mapapi/search/route/SuggestAddrInfo;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJDrivingRouteResult = class(TJavaGenericImport<JDrivingRouteResultClass,
    JDrivingRouteResult>)
  end;

  JIndoorPlanNodeClass = interface(JObjectClass)
    ['{8BA676BF-189E-4CA4-8BE3-EDA3FA2A855E}']
    { static Property Methods }

    { static Methods }
    { class } function init(P1: JLatLng; P2: JString): JIndoorPlanNode; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/route/IndoorPlanNode')]
  JIndoorPlanNode = interface(JObject)
    ['{8F786B21-A0BE-4D0A-8B5D-69C165060217}']
    { Property Methods }

    { methods }
    function getLocation: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getFloor: JString; cdecl; // ()Ljava/lang/String;

    { Property }
  end;

  TJIndoorPlanNode = class(TJavaGenericImport<JIndoorPlanNodeClass,
    JIndoorPlanNode>)
  end;

  JIndoorRouteLine_IndoorRouteStep_IndoorStepNodeClass = interface(JObjectClass)
    ['{18F8A140-5F90-4CC4-8791-5ABBA41D399A}']
    { static Property Methods }

    { static Methods }
    { class } function init: JIndoorRouteLine_IndoorRouteStep_IndoorStepNode;
      cdecl; // ()V

    { static Property }
  end;

  [JavaSignature
    ('com/baidu/mapapi/search/route/IndoorRouteLine$IndoorRouteStep$IndoorStepNode')
    ]
  JIndoorRouteLine_IndoorRouteStep_IndoorStepNode = interface(JObject)
    ['{1BF2A1F0-0D97-485A-BD76-C4F1472F950A}']
    { Property Methods }

    { methods }
    function getName: JString; cdecl; // ()Ljava/lang/String;
    procedure setName(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getType: Integer; cdecl; // ()I
    procedure setType(P1: Integer); cdecl; // (I)V
    function getDetail: JString; cdecl; // ()Ljava/lang/String;
    procedure setDetail(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getLocation: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    procedure setLocation(P1: JLatLng); cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)V

    { Property }
  end;

  TJIndoorRouteLine_IndoorRouteStep_IndoorStepNode = class
    (TJavaGenericImport<JIndoorRouteLine_IndoorRouteStep_IndoorStepNodeClass,
    JIndoorRouteLine_IndoorRouteStep_IndoorStepNode>)
  end;

  JIndoorRouteLine_IndoorRouteStepClass = interface(JRouteStepClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/RouteStep
    ['{650838F5-37F5-4902-ABF7-6C211D51DDDA}']
    { static Property Methods }

    { static Methods }
    { class } function init: JIndoorRouteLine_IndoorRouteStep; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature
    ('com/baidu/mapapi/search/route/IndoorRouteLine$IndoorRouteStep')]
  JIndoorRouteLine_IndoorRouteStep = interface(JRouteStep)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/RouteStep
    ['{793F26B9-A66C-4095-B358-491211456DB4}']
    { Property Methods }

    { methods }
    function getWayPoints: JList; cdecl; // ()Ljava/util/List;
    function getInstructions: JString; cdecl; // ()Ljava/lang/String;
    procedure setInstructions(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getBuildingId: JString; cdecl; // ()Ljava/lang/String;
    procedure setBuildingId(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getFloorId: JString; cdecl; // ()Ljava/lang/String;
    procedure setFloorId(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getStepNodes: JList; cdecl; // ()Ljava/util/List;
    procedure setStepNodes(P1: JList); cdecl; // (Ljava/util/List;)V
    function getEntrace: JRouteNode; cdecl;
    // ()Lcom/baidu/mapapi/search/core/RouteNode;
    procedure setEntrace(P1: JRouteNode); cdecl;
    // (Lcom/baidu/mapapi/search/core/RouteNode;)V
    function getExit: JRouteNode; cdecl;
    // ()Lcom/baidu/mapapi/search/core/RouteNode;
    procedure setExit(P1: JRouteNode); cdecl;
    // (Lcom/baidu/mapapi/search/core/RouteNode;)V
    procedure setPath(P1: JList); cdecl; // (Ljava/util/List;)V

    { Property }
  end;

  TJIndoorRouteLine_IndoorRouteStep = class
    (TJavaGenericImport<JIndoorRouteLine_IndoorRouteStepClass,
    JIndoorRouteLine_IndoorRouteStep>)
  end;

  JIndoorRouteLineClass = interface(JRouteLineClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/RouteLine
    ['{8108943E-5CA8-4DD7-B2D7-CD51AA8FA0E5}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JIndoorRouteLine; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/route/IndoorRouteLine')]
  JIndoorRouteLine = interface(JRouteLine)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/RouteLine
    ['{C660B445-C2BE-4983-9BD7-ADEEB6A81040}']
    { Property Methods }

    { methods }
    function getAllStep: JList; cdecl; // ()Ljava/util/List;
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJIndoorRouteLine = class(TJavaGenericImport<JIndoorRouteLineClass,
    JIndoorRouteLine>)
  end;

  JIndoorRoutePlanOptionClass = interface(JObjectClass)
    ['{BF45E0AB-443E-4B78-A17A-50A166913B89}']
    { static Property Methods }

    { static Methods }
    { class } function init: JIndoorRoutePlanOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/route/IndoorRoutePlanOption')]
  JIndoorRoutePlanOption = interface(JObject)
    ['{808B3C12-D047-446D-B8DF-A09AEAD88B20}']
    { Property Methods }
    function _GetmFrom: JIndoorPlanNode;
    // Lcom/baidu/mapapi/search/route/IndoorPlanNode;
    procedure _SetmFrom(amFrom: JIndoorPlanNode);
    // (Lcom/baidu/mapapi/search/route/IndoorPlanNode;)V
    function _GetmTo: JIndoorPlanNode;
    // Lcom/baidu/mapapi/search/route/IndoorPlanNode;
    procedure _SetmTo(amTo: JIndoorPlanNode);
    // (Lcom/baidu/mapapi/search/route/IndoorPlanNode;)V

    { methods }
    function from(P1: JIndoorPlanNode): JIndoorRoutePlanOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/IndoorPlanNode;)Lcom/baidu/mapapi/search/route/IndoorRoutePlanOption;
    function &to(P1: JIndoorPlanNode): JIndoorRoutePlanOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/IndoorPlanNode;)Lcom/baidu/mapapi/search/route/IndoorRoutePlanOption;

    { Property }
    property mFrom: JIndoorPlanNode read _GetmFrom write _SetmFrom;
    property mTo: JIndoorPlanNode read _GetmTo write _SetmTo;
  end;

  TJIndoorRoutePlanOption = class
    (TJavaGenericImport<JIndoorRoutePlanOptionClass, JIndoorRoutePlanOption>)
  end;

  JIndoorRouteResultClass = interface(JSearchResultClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{D169A82E-FADC-4261-94EF-F33FDE32F5C4}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JIndoorRouteResult; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/route/IndoorRouteResult')]
  JIndoorRouteResult = interface(JSearchResult)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{AE00CDD5-40C4-4485-B567-2D272938166B}']
    { Property Methods }

    { methods }
    function getRouteLines: JList; cdecl; // ()Ljava/util/List;
    procedure setRouteLines(P1: JList); cdecl; // (Ljava/util/List;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJIndoorRouteResult = class(TJavaGenericImport<JIndoorRouteResultClass,
    JIndoorRouteResult>)
  end;

  JMassTransitRouteLine_TransitStep_StepVehicleInfoTypeClass = interface
    (JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
    ['{FC79D754-CFB3-4399-9C9A-C2492C293EFB}']
    { static Property Methods }
    { class } function _GetESTEP_TRAIN
      : JMassTransitRouteLine_TransitStep_StepVehicleInfoType;
    // Lcom/baidu/mapapi/search/route/MassTransitRouteLine$TransitStep$StepVehicleInfoType;
    { class } function _GetESTEP_PLANE
      : JMassTransitRouteLine_TransitStep_StepVehicleInfoType;
    // Lcom/baidu/mapapi/search/route/MassTransitRouteLine$TransitStep$StepVehicleInfoType;
    { class } function _GetESTEP_BUS
      : JMassTransitRouteLine_TransitStep_StepVehicleInfoType;
    // Lcom/baidu/mapapi/search/route/MassTransitRouteLine$TransitStep$StepVehicleInfoType;
    { class } function _GetESTEP_DRIVING
      : JMassTransitRouteLine_TransitStep_StepVehicleInfoType;
    // Lcom/baidu/mapapi/search/route/MassTransitRouteLine$TransitStep$StepVehicleInfoType;
    { class } function _GetESTEP_WALK
      : JMassTransitRouteLine_TransitStep_StepVehicleInfoType;
    // Lcom/baidu/mapapi/search/route/MassTransitRouteLine$TransitStep$StepVehicleInfoType;
    { class } function _GetESTEP_COACH
      : JMassTransitRouteLine_TransitStep_StepVehicleInfoType;
    // Lcom/baidu/mapapi/search/route/MassTransitRouteLine$TransitStep$StepVehicleInfoType;

    { static Methods }
    { class } function values
      : TJavaObjectArray<JMassTransitRouteLine_TransitStep_StepVehicleInfoType>;
      cdecl; // ()[Lcom/baidu/mapapi/search/route/MassTransitRouteLine$TransitStep$StepVehicleInfoType;
    { class } function valueOf(P1: JString)
      : JMassTransitRouteLine_TransitStep_StepVehicleInfoType; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/route/MassTransitRouteLine$TransitStep$StepVehicleInfoType;

    { static Property }
    { class } property ESTEP_TRAIN
      : JMassTransitRouteLine_TransitStep_StepVehicleInfoType
      read _GetESTEP_TRAIN;
    { class } property ESTEP_PLANE
      : JMassTransitRouteLine_TransitStep_StepVehicleInfoType
      read _GetESTEP_PLANE;
    { class } property ESTEP_BUS
      : JMassTransitRouteLine_TransitStep_StepVehicleInfoType
      read _GetESTEP_BUS;
    { class } property ESTEP_DRIVING
      : JMassTransitRouteLine_TransitStep_StepVehicleInfoType
      read _GetESTEP_DRIVING;
    { class } property ESTEP_WALK
      : JMassTransitRouteLine_TransitStep_StepVehicleInfoType
      read _GetESTEP_WALK;
    { class } property ESTEP_COACH
      : JMassTransitRouteLine_TransitStep_StepVehicleInfoType
      read _GetESTEP_COACH;
  end;

  [JavaSignature
    ('com/baidu/mapapi/search/route/MassTransitRouteLine$TransitStep$StepVehicleInfoType')
    ]
  JMassTransitRouteLine_TransitStep_StepVehicleInfoType = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{4D5B4A95-EE09-482E-8B00-856DE1C31C05}']
    { Property Methods }

    { methods }
    function getInt: Integer; cdecl; // ()I

    { Property }
  end;

  TJMassTransitRouteLine_TransitStep_StepVehicleInfoType = class
    (TJavaGenericImport<
    JMassTransitRouteLine_TransitStep_StepVehicleInfoTypeClass,
    JMassTransitRouteLine_TransitStep_StepVehicleInfoType>)
  end;

  JMassTransitRouteLine_TransitStep_TrafficConditionClass = interface
    (JObjectClass)
    ['{BAE831C8-4FAB-4D9B-A6B4-04E283B8BAFA}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JMassTransitRouteLine_TransitStep_TrafficCondition;
      cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature
    ('com/baidu/mapapi/search/route/MassTransitRouteLine$TransitStep$TrafficCondition')
    ]
  JMassTransitRouteLine_TransitStep_TrafficCondition = interface(JObject)
    ['{C14AECAB-D790-47A8-9636-DDB493816631}']
    { Property Methods }

    { methods }
    function getTrafficStatus: Integer; cdecl; // ()I
    procedure setTrafficStatus(P1: Integer); cdecl; // (I)V
    function getTrafficGeoCnt: Integer; cdecl; // ()I
    procedure setTrafficGeoCnt(P1: Integer); cdecl; // (I)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJMassTransitRouteLine_TransitStep_TrafficCondition = class
    (TJavaGenericImport<JMassTransitRouteLine_TransitStep_TrafficConditionClass,
    JMassTransitRouteLine_TransitStep_TrafficCondition>)
  end;

  JMassTransitRouteLine_TransitStepClass = interface(JRouteStepClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/RouteStep
    ['{475186FB-D188-43AF-9D67-D2EF2FE1878B}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JMassTransitRouteLine_TransitStep; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature
    ('com/baidu/mapapi/search/route/MassTransitRouteLine$TransitStep')]
  JMassTransitRouteLine_TransitStep = interface(JRouteStep)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/RouteStep
    ['{57F1F05F-13CF-449B-BA79-64B9AEBB96D0}']
    { Property Methods }

    { methods }
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; // ()I
    function getTrafficConditions: JList; cdecl; // ()Ljava/util/List;
    procedure setTrafficConditions(P1: JList); cdecl; // (Ljava/util/List;)V
    function getStartLocation: JLatLng; cdecl;
    // ()Lcom/baidu/mapapi/model/LatLng;
    procedure setStartLocation(P1: JLatLng); cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function getEndLocation: JLatLng; cdecl;
    // ()Lcom/baidu/mapapi/model/LatLng;
    procedure setEndLocation(P1: JLatLng); cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function getTrainInfo: JTrainInfo; cdecl;
    // ()Lcom/baidu/mapapi/search/core/TrainInfo;
    procedure setTrainInfo(P1: JTrainInfo); cdecl;
    // (Lcom/baidu/mapapi/search/core/TrainInfo;)V
    function getPlaneInfo: JPlaneInfo; cdecl;
    // ()Lcom/baidu/mapapi/search/core/PlaneInfo;
    procedure setPlaneInfo(P1: JPlaneInfo); cdecl;
    // (Lcom/baidu/mapapi/search/core/PlaneInfo;)V
    function getCoachInfo: JCoachInfo; cdecl;
    // ()Lcom/baidu/mapapi/search/core/CoachInfo;
    procedure setCoachInfo(P1: JCoachInfo); cdecl;
    // (Lcom/baidu/mapapi/search/core/CoachInfo;)V
    function getBusInfo: JBusInfo; cdecl;
    // ()Lcom/baidu/mapapi/search/core/BusInfo;
    procedure setBusInfo(P1: JBusInfo); cdecl;
    // (Lcom/baidu/mapapi/search/core/BusInfo;)V
    function getInstructions: JString; cdecl; // ()Ljava/lang/String;
    procedure setInstructions(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getVehileType
      : JMassTransitRouteLine_TransitStep_StepVehicleInfoType; cdecl;
    // ()Lcom/baidu/mapapi/search/route/MassTransitRouteLine$TransitStep$StepVehicleInfoType;
    procedure setVehileType
      (P1: JMassTransitRouteLine_TransitStep_StepVehicleInfoType); cdecl;
    // (Lcom/baidu/mapapi/search/route/MassTransitRouteLine$TransitStep$StepVehicleInfoType;)V
    procedure setPathString(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getWayPoints: JList; cdecl; // ()Ljava/util/List;

    { Property }
  end;

  TJMassTransitRouteLine_TransitStep = class
    (TJavaGenericImport<JMassTransitRouteLine_TransitStepClass,
    JMassTransitRouteLine_TransitStep>)
  end;

  JMassTransitRouteLineClass = interface(JRouteLineClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/RouteLine
    ['{87EC12B3-5C21-4C1D-BC65-ECA68C0FAED6}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JMassTransitRouteLine; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/route/MassTransitRouteLine')]
  JMassTransitRouteLine = interface(JRouteLine)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/RouteLine
    ['{5FDD9436-87FC-4914-A9CB-C5F77EA25C40}']
    { Property Methods }

    { methods }
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; // ()I
    function getNewSteps: JList; cdecl; // ()Ljava/util/List;
    procedure setNewSteps(P1: JList); cdecl; // (Ljava/util/List;)V
    function getArriveTime: JString; cdecl; // ()Ljava/lang/String;
    procedure setArriveTime(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getPrice: Double; cdecl; // ()D
    procedure setPrice(P1: Double); cdecl; // (D)V
    function getPriceInfo: JList; cdecl; // ()Ljava/util/List;
    procedure setPriceInfo(P1: JList); cdecl; // (Ljava/util/List;)V

    { Property }
  end;

  TJMassTransitRouteLine = class(TJavaGenericImport<JMassTransitRouteLineClass,
    JMassTransitRouteLine>)
  end;

  JMassTransitRoutePlanOption_TacticsIncityClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{37FA9BE3-4A0F-401B-A497-143374CB0353}']
    { static Property Methods }
    { class } function _GetETRANS_SUGGEST
      : JMassTransitRoutePlanOption_TacticsIncity;
    // Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIncity;
    { class } function _GetETRANS_LEAST_TRANSFER
      : JMassTransitRoutePlanOption_TacticsIncity;
    // Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIncity;
    { class } function _GetETRANS_LEAST_WALK
      : JMassTransitRoutePlanOption_TacticsIncity;
    // Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIncity;
    { class } function _GetETRANS_NO_SUBWAY
      : JMassTransitRoutePlanOption_TacticsIncity;
    // Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIncity;
    { class } function _GetETRANS_LEAST_TIME
      : JMassTransitRoutePlanOption_TacticsIncity;
    // Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIncity;
    { class } function _GetETRANS_SUBWAY_FIRST
      : JMassTransitRoutePlanOption_TacticsIncity;
    // Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIncity;

    { static Methods }
    { class } function values
      : TJavaObjectArray<JMassTransitRoutePlanOption_TacticsIncity>; cdecl;
    // ()[Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIncity;
    { class } function valueOf(P1: JString)
      : JMassTransitRoutePlanOption_TacticsIncity; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIncity;

    { static Property }
    { class } property ETRANS_SUGGEST: JMassTransitRoutePlanOption_TacticsIncity
      read _GetETRANS_SUGGEST;
    { class } property ETRANS_LEAST_TRANSFER
      : JMassTransitRoutePlanOption_TacticsIncity
      read _GetETRANS_LEAST_TRANSFER;
    { class } property ETRANS_LEAST_WALK
      : JMassTransitRoutePlanOption_TacticsIncity read _GetETRANS_LEAST_WALK;
    { class } property ETRANS_NO_SUBWAY
      : JMassTransitRoutePlanOption_TacticsIncity read _GetETRANS_NO_SUBWAY;
    { class } property ETRANS_LEAST_TIME
      : JMassTransitRoutePlanOption_TacticsIncity read _GetETRANS_LEAST_TIME;
    { class } property ETRANS_SUBWAY_FIRST
      : JMassTransitRoutePlanOption_TacticsIncity read _GetETRANS_SUBWAY_FIRST;
  end;

  [JavaSignature
    ('com/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIncity')]
  JMassTransitRoutePlanOption_TacticsIncity = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{802ADD48-49D1-45ED-865D-7CDE7DF62A94}']
    { Property Methods }

    { methods }
    function getInt: Integer; cdecl; // ()I

    { Property }
  end;

  TJMassTransitRoutePlanOption_TacticsIncity = class
    (TJavaGenericImport<JMassTransitRoutePlanOption_TacticsIncityClass,
    JMassTransitRoutePlanOption_TacticsIncity>)
  end;

  JMassTransitRoutePlanOption_TacticsIntercityClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{3DD4127A-CAF8-456D-8CFD-AF47F9DD07CB}']
    { static Property Methods }
    { class } function _GetETRANS_LEAST_TIME
      : JMassTransitRoutePlanOption_TacticsIntercity;
    // Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIntercity;
    { class } function _GetETRANS_START_EARLY
      : JMassTransitRoutePlanOption_TacticsIntercity;
    // Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIntercity;
    { class } function _GetETRANS_LEAST_PRICE
      : JMassTransitRoutePlanOption_TacticsIntercity;
    // Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIntercity;

    { static Methods }
    { class } function values
      : TJavaObjectArray<JMassTransitRoutePlanOption_TacticsIntercity>; cdecl;
    // ()[Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIntercity;
    { class } function valueOf(P1: JString)
      : JMassTransitRoutePlanOption_TacticsIntercity; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIntercity;

    { static Property }
    { class } property ETRANS_LEAST_TIME
      : JMassTransitRoutePlanOption_TacticsIntercity read _GetETRANS_LEAST_TIME;
    { class } property ETRANS_START_EARLY
      : JMassTransitRoutePlanOption_TacticsIntercity
      read _GetETRANS_START_EARLY;
    { class } property ETRANS_LEAST_PRICE
      : JMassTransitRoutePlanOption_TacticsIntercity
      read _GetETRANS_LEAST_PRICE;
  end;

  [JavaSignature
    ('com/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIntercity')
    ]
  JMassTransitRoutePlanOption_TacticsIntercity = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{82FC52B4-33A7-4F0B-81A7-86C55A09320F}']
    { Property Methods }

    { methods }
    function getInt: Integer; cdecl; // ()I

    { Property }
  end;

  TJMassTransitRoutePlanOption_TacticsIntercity = class
    (TJavaGenericImport<JMassTransitRoutePlanOption_TacticsIntercityClass,
    JMassTransitRoutePlanOption_TacticsIntercity>)
  end;

  JMassTransitRoutePlanOption_TransTypeIntercityClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{87BCE1BF-D7E5-4D36-9293-EAA3CFD6B2FA}']
    { static Property Methods }
    { class } function _GetETRANS_TRAIN_FIRST
      : JMassTransitRoutePlanOption_TransTypeIntercity;
    // Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TransTypeIntercity;
    { class } function _GetETRANS_PLANE_FIRST
      : JMassTransitRoutePlanOption_TransTypeIntercity;
    // Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TransTypeIntercity;
    { class } function _GetETRANS_COACH_FIRST
      : JMassTransitRoutePlanOption_TransTypeIntercity;
    // Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TransTypeIntercity;

    { static Methods }
    { class } function values
      : TJavaObjectArray<JMassTransitRoutePlanOption_TransTypeIntercity>; cdecl;
    // ()[Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TransTypeIntercity;
    { class } function valueOf(P1: JString)
      : JMassTransitRoutePlanOption_TransTypeIntercity; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TransTypeIntercity;

    { static Property }
    { class } property ETRANS_TRAIN_FIRST
      : JMassTransitRoutePlanOption_TransTypeIntercity
      read _GetETRANS_TRAIN_FIRST;
    { class } property ETRANS_PLANE_FIRST
      : JMassTransitRoutePlanOption_TransTypeIntercity
      read _GetETRANS_PLANE_FIRST;
    { class } property ETRANS_COACH_FIRST
      : JMassTransitRoutePlanOption_TransTypeIntercity
      read _GetETRANS_COACH_FIRST;
  end;

  [JavaSignature
    ('com/baidu/mapapi/search/route/MassTransitRoutePlanOption$TransTypeIntercity')
    ]
  JMassTransitRoutePlanOption_TransTypeIntercity = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{7F79D20D-E067-4662-8D21-A68B27E722AE}']
    { Property Methods }

    { methods }
    function getInt: Integer; cdecl; // ()I

    { Property }
  end;

  TJMassTransitRoutePlanOption_TransTypeIntercity = class
    (TJavaGenericImport<JMassTransitRoutePlanOption_TransTypeIntercityClass,
    JMassTransitRoutePlanOption_TransTypeIntercity>)
  end;

  JMassTransitRoutePlanOptionClass = interface(JObjectClass)
    ['{306D6F4C-37C5-4F1E-B961-8BDFB179CB56}']
    { static Property Methods }

    { static Methods }
    { class } function init: JMassTransitRoutePlanOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/route/MassTransitRoutePlanOption')]
  JMassTransitRoutePlanOption = interface(JObject)
    ['{D8AC77A8-8253-474E-ABFB-7614438D3545}']
    { Property Methods }
    function _GetmFrom: JPlanNode; // Lcom/baidu/mapapi/search/route/PlanNode;
    procedure _SetmFrom(amFrom: JPlanNode);
    // (Lcom/baidu/mapapi/search/route/PlanNode;)V
    function _GetmTo: JPlanNode; // Lcom/baidu/mapapi/search/route/PlanNode;
    procedure _SetmTo(amTo: JPlanNode);
    // (Lcom/baidu/mapapi/search/route/PlanNode;)V
    function _GetmCoordType: JString; // Ljava/lang/String;
    procedure _SetmCoordType(amCoordType: JString); // (Ljava/lang/String;)V
    function _GetmTacticsIncity: JMassTransitRoutePlanOption_TacticsIncity;
    // Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIncity;
    procedure _SetmTacticsIncity(amTacticsIncity
      : JMassTransitRoutePlanOption_TacticsIncity);
    // (Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIncity;)V
    function _GetmTacticsIntercity
      : JMassTransitRoutePlanOption_TacticsIntercity;
    // Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIntercity;
    procedure _SetmTacticsIntercity(amTacticsIntercity
      : JMassTransitRoutePlanOption_TacticsIntercity);
    // (Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIntercity;)V
    function _GetmTransTypeIntercity
      : JMassTransitRoutePlanOption_TransTypeIntercity;
    // Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TransTypeIntercity;
    procedure _SetmTransTypeIntercity(amTransTypeIntercity
      : JMassTransitRoutePlanOption_TransTypeIntercity);
    // (Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TransTypeIntercity;)V
    function _GetmPageSize: Integer; // I
    procedure _SetmPageSize(amPageSize: Integer); // (I)V
    function _GetmPageIndex: Integer; // I
    procedure _SetmPageIndex(amPageIndex: Integer); // (I)V

    { methods }
    function from(P1: JPlanNode): JMassTransitRoutePlanOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/PlanNode;)Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption;
    function &to(P1: JPlanNode): JMassTransitRoutePlanOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/PlanNode;)Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption;
    function coordType(P1: JString): JMassTransitRoutePlanOption; cdecl;
    // Deprecated //(Ljava/lang/String;)Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption;
    function tacticsIncity(P1: JMassTransitRoutePlanOption_TacticsIncity)
      : JMassTransitRoutePlanOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIncity;)Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption;
    function tacticsIntercity(P1: JMassTransitRoutePlanOption_TacticsIntercity)
      : JMassTransitRoutePlanOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TacticsIntercity;)Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption;
    function transtypeintercity
      (P1: JMassTransitRoutePlanOption_TransTypeIntercity)
      : JMassTransitRoutePlanOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption$TransTypeIntercity;)Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption;
    function pageSize(P1: Integer): JMassTransitRoutePlanOption; cdecl;
    // (I)Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption;
    function pageIndex(P1: Integer): JMassTransitRoutePlanOption; cdecl;
    // (I)Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption;

    { Property }
    property mFrom: JPlanNode read _GetmFrom write _SetmFrom;
    property mTo: JPlanNode read _GetmTo write _SetmTo;
    property mCoordType: JString read _GetmCoordType write _SetmCoordType;
    property mTacticsIncity: JMassTransitRoutePlanOption_TacticsIncity
      read _GetmTacticsIncity write _SetmTacticsIncity;
    property mTacticsIntercity: JMassTransitRoutePlanOption_TacticsIntercity
      read _GetmTacticsIntercity write _SetmTacticsIntercity;
    property mTransTypeIntercity: JMassTransitRoutePlanOption_TransTypeIntercity
      read _GetmTransTypeIntercity write _SetmTransTypeIntercity;
    property mPageSize: Integer read _GetmPageSize write _SetmPageSize;
    property mPageIndex: Integer read _GetmPageIndex write _SetmPageIndex;
  end;

  TJMassTransitRoutePlanOption = class
    (TJavaGenericImport<JMassTransitRoutePlanOptionClass,
    JMassTransitRoutePlanOption>)
  end;

  JMassTransitRouteResultClass = interface(JSearchResultClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{A0D81C62-C1FC-4F9B-A164-35E10475C20B}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JMassTransitRouteResult; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/route/MassTransitRouteResult')]
  JMassTransitRouteResult = interface(JSearchResult)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{4CDC5092-9A77-4142-A5E5-EA95E194CFFA}']
    { Property Methods }

    { methods }
    function getTaxiInfo: JTaxiInfo; cdecl;
    // ()Lcom/baidu/mapapi/search/core/TaxiInfo;
    procedure setTaxiInfo(P1: JTaxiInfo); cdecl;
    // (Lcom/baidu/mapapi/search/core/TaxiInfo;)V
    function getOrigin: JTransitResultNode; cdecl;
    // ()Lcom/baidu/mapapi/search/core/TransitResultNode;
    procedure setOrigin(P1: JTransitResultNode); cdecl;
    // (Lcom/baidu/mapapi/search/core/TransitResultNode;)V
    function getDestination: JTransitResultNode; cdecl;
    // ()Lcom/baidu/mapapi/search/core/TransitResultNode;
    procedure setDestination(P1: JTransitResultNode); cdecl;
    // (Lcom/baidu/mapapi/search/core/TransitResultNode;)V
    function getTotal: Integer; cdecl; // ()I
    procedure setTotal(P1: Integer); cdecl; // (I)V
    function getRouteLines: JList; cdecl; // ()Ljava/util/List;
    procedure setRouteLines(P1: JList); cdecl; // (Ljava/util/List;)V
    function getSuggestAddrInfo: JSuggestAddrInfo; cdecl;
    // ()Lcom/baidu/mapapi/search/route/SuggestAddrInfo;
    procedure setSuggestAddrInfo(P1: JSuggestAddrInfo); cdecl;
    // (Lcom/baidu/mapapi/search/route/SuggestAddrInfo;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJMassTransitRouteResult = class
    (TJavaGenericImport<JMassTransitRouteResultClass, JMassTransitRouteResult>)
  end;

  JOnGetRoutePlanResultListenerClass = interface(JObjectClass)
    ['{1D7941C5-11D2-4707-88FE-142323241E44}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/route/OnGetRoutePlanResultListener')]
  JOnGetRoutePlanResultListener = interface(IJavaInstance)
    ['{49F51DA6-BBBD-4F4E-8125-26832B340863}']
    { Property Methods }

    { methods }
    procedure onGetWalkingRouteResult(P1: JWalkingRouteResult); cdecl;
    // (Lcom/baidu/mapapi/search/route/WalkingRouteResult;)V
    procedure onGetTransitRouteResult(P1: JTransitRouteResult); cdecl;
    // (Lcom/baidu/mapapi/search/route/TransitRouteResult;)V
    procedure onGetMassTransitRouteResult(P1: JMassTransitRouteResult); cdecl;
    // (Lcom/baidu/mapapi/search/route/MassTransitRouteResult;)V
    procedure onGetDrivingRouteResult(P1: JDrivingRouteResult); cdecl;
    // (Lcom/baidu/mapapi/search/route/DrivingRouteResult;)V
    procedure onGetIndoorRouteResult(P1: JIndoorRouteResult); cdecl;
    // (Lcom/baidu/mapapi/search/route/IndoorRouteResult;)V
    procedure onGetBikingRouteResult(P1: JBikingRouteResult); cdecl;
    // (Lcom/baidu/mapapi/search/route/BikingRouteResult;)V

    { Property }
  end;

  TJOnGetRoutePlanResultListener = class
    (TJavaGenericImport<JOnGetRoutePlanResultListenerClass,
    JOnGetRoutePlanResultListener>)
  end;

  JPlanNodeClass = interface(JObjectClass)
    ['{DE32C599-4B1C-4F14-B84D-A2BB2BD36A50}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function withLocation(P1: JLatLng): JPlanNode; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/search/route/PlanNode;
    { class } function withCityNameAndPlaceName(P1: JString; P2: JString)
      : JPlanNode; cdecl;
    // (Ljava/lang/String;Ljava/lang/String;)Lcom/baidu/mapapi/search/route/PlanNode;
    { class } function withCityCodeAndPlaceName(P1: Integer; P2: JString)
      : JPlanNode; cdecl;
    // (ILjava/lang/String;)Lcom/baidu/mapapi/search/route/PlanNode;

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/route/PlanNode')]
  JPlanNode = interface(JObject)
    ['{2D566D3C-EDB5-493C-8895-615510B2687B}']
    { Property Methods }

    { methods }
    function getLocation: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getCity: JString; cdecl; // ()Ljava/lang/String;
    function getName: JString; cdecl; // ()Ljava/lang/String;
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJPlanNode = class(TJavaGenericImport<JPlanNodeClass, JPlanNode>)
  end;

  JRoutePlanSearchClass = interface(JObjectClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/a
    ['{D8E8C422-E65E-4966-A301-F6D46DCC332D}']
    { static Property Methods }

    { static Methods }
    { class } function newInstance: JRoutePlanSearch; cdecl;
    // ()Lcom/baidu/mapapi/search/route/RoutePlanSearch;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/route/RoutePlanSearch')]
  JRoutePlanSearch = interface(JObject)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/a
    ['{F64795E8-CA3D-4692-BF7F-D35482B846BE}']
    { Property Methods }

    { methods }
    procedure setOnGetRoutePlanResultListener
      (P1: JOnGetRoutePlanResultListener); cdecl;
    // (Lcom/baidu/mapapi/search/route/OnGetRoutePlanResultListener;)V
    function transitSearch(P1: JTransitRoutePlanOption): Boolean; cdecl;
    // (Lcom/baidu/mapapi/search/route/TransitRoutePlanOption;)Z
    function masstransitSearch(P1: JMassTransitRoutePlanOption): Boolean; cdecl;
    // (Lcom/baidu/mapapi/search/route/MassTransitRoutePlanOption;)Z
    function walkingSearch(P1: JWalkingRoutePlanOption): Boolean; cdecl;
    // (Lcom/baidu/mapapi/search/route/WalkingRoutePlanOption;)Z
    function walkingIndoorSearch(P1: JIndoorRoutePlanOption): Boolean; cdecl;
    // (Lcom/baidu/mapapi/search/route/IndoorRoutePlanOption;)Z
    function drivingSearch(P1: JDrivingRoutePlanOption): Boolean; cdecl;
    // (Lcom/baidu/mapapi/search/route/DrivingRoutePlanOption;)Z
    function bikingSearch(P1: JBikingRoutePlanOption): Boolean; cdecl;
    // (Lcom/baidu/mapapi/search/route/BikingRoutePlanOption;)Z
    procedure destroy; cdecl; // ()V

    { Property }
  end;

  TJRoutePlanSearch = class(TJavaGenericImport<JRoutePlanSearchClass,
    JRoutePlanSearch>)
  end;

  JSuggestAddrInfoClass = interface(JObjectClass)
    ['{5E1F719A-E686-494C-9711-25BEBE31722C}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JSuggestAddrInfo; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/route/SuggestAddrInfo')]
  JSuggestAddrInfo = interface(JObject)
    ['{4C8E9DEC-1BAF-4897-B095-72A7A0F6693A}']
    { Property Methods }

    { methods }
    function getSuggestStartNode: JList; cdecl; // ()Ljava/util/List;
    procedure setSuggestStartNode(P1: JList); cdecl; // (Ljava/util/List;)V
    function getSuggestEndNode: JList; cdecl; // ()Ljava/util/List;
    procedure setSuggestEndNode(P1: JList); cdecl; // (Ljava/util/List;)V
    function getSuggestWpNode: JList; cdecl; // ()Ljava/util/List;
    procedure setSuggestWpNode(P1: JList); cdecl; // (Ljava/util/List;)V
    function getSuggestStartCity: JList; cdecl; // ()Ljava/util/List;
    procedure setSuggestStartCity(P1: JList); cdecl; // (Ljava/util/List;)V
    function getSuggestEndCity: JList; cdecl; // ()Ljava/util/List;
    procedure setSuggestEndCity(P1: JList); cdecl; // (Ljava/util/List;)V
    function getSuggestWpCity: JList; cdecl; // ()Ljava/util/List;
    procedure setSuggestWpCity(P1: JList); cdecl; // (Ljava/util/List;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJSuggestAddrInfo = class(TJavaGenericImport<JSuggestAddrInfoClass,
    JSuggestAddrInfo>)
  end;

 
  JTransitRouteLine_TransitStep_TransitRouteStepTypeClass = interface
    (JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
    ['{AC16E744-E724-45F0-AAEA-79F8498321CE}']
    { static Property Methods }
    { class } function _GetBUSLINE
      : JTransitRouteLine_TransitStep_TransitRouteStepType;
    // Lcom/baidu/mapapi/search/route/TransitRouteLine$TransitStep$TransitRouteStepType;
    { class } function _GetSUBWAY
      : JTransitRouteLine_TransitStep_TransitRouteStepType;
    // Lcom/baidu/mapapi/search/route/TransitRouteLine$TransitStep$TransitRouteStepType;
    { class } function _GetWAKLING
      : JTransitRouteLine_TransitStep_TransitRouteStepType;
    // Lcom/baidu/mapapi/search/route/TransitRouteLine$TransitStep$TransitRouteStepType;

    { static Methods }
    { class } function values
      : TJavaObjectArray<JTransitRouteLine_TransitStep_TransitRouteStepType>;
      cdecl; // ()[Lcom/baidu/mapapi/search/route/TransitRouteLine$TransitStep$TransitRouteStepType;
    { class } function valueOf(P1: JString)
      : JTransitRouteLine_TransitStep_TransitRouteStepType; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/route/TransitRouteLine$TransitStep$TransitRouteStepType;

    { static Property }
    { class } property BUSLINE
      : JTransitRouteLine_TransitStep_TransitRouteStepType read _GetBUSLINE;
    { class } property SUBWAY
      : JTransitRouteLine_TransitStep_TransitRouteStepType read _GetSUBWAY;
    { class } property WAKLING
      : JTransitRouteLine_TransitStep_TransitRouteStepType read _GetWAKLING;
  end;

  [JavaSignature
    ('com/baidu/mapapi/search/route/TransitRouteLine$TransitStep$TransitRouteStepType')
    ]
  JTransitRouteLine_TransitStep_TransitRouteStepType = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{A13DFD54-9DF9-44C2-81A6-B9A970123271}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTransitRouteLine_TransitStep_TransitRouteStepType = class
    (TJavaGenericImport<JTransitRouteLine_TransitStep_TransitRouteStepTypeClass,
    JTransitRouteLine_TransitStep_TransitRouteStepType>)
  end;

  JTransitRouteLine_TransitStepClass = interface(JRouteStepClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/RouteStep
    ['{01E215BE-B15E-4F3F-A60A-4194747BB375}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JTransitRouteLine_TransitStep; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/route/TransitRouteLine$TransitStep')]
  JTransitRouteLine_TransitStep = interface(JRouteStep)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/RouteStep
    ['{7B2BB10E-F929-499E-9A45-BB5C7EEF6B23}']
    { Property Methods }

    { methods }
    function getInstructions: JString; cdecl; // ()Ljava/lang/String;
    procedure setVehicleInfo(P1: JVehicleInfo); cdecl;
    // (Lcom/baidu/mapapi/search/core/VehicleInfo;)V
    procedure setInstructions(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getStepType: JTransitRouteLine_TransitStep_TransitRouteStepType;
      cdecl; // ()Lcom/baidu/mapapi/search/route/TransitRouteLine$TransitStep$TransitRouteStepType;
    procedure setStepType
      (P1: JTransitRouteLine_TransitStep_TransitRouteStepType); cdecl;
    // (Lcom/baidu/mapapi/search/route/TransitRouteLine$TransitStep$TransitRouteStepType;)V
    procedure setPathString(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getWayPoints: JList; cdecl; // ()Ljava/util/List;
    function getEntrance: JRouteNode; cdecl;
    // ()Lcom/baidu/mapapi/search/core/RouteNode;
    procedure setEntrace(P1: JRouteNode); cdecl;
    // (Lcom/baidu/mapapi/search/core/RouteNode;)V
    function getExit: JRouteNode; cdecl;
    // ()Lcom/baidu/mapapi/search/core/RouteNode;
    procedure setExit(P1: JRouteNode); cdecl;
    // (Lcom/baidu/mapapi/search/core/RouteNode;)V
    function getVehicleInfo: JVehicleInfo; cdecl;
    // ()Lcom/baidu/mapapi/search/core/VehicleInfo;
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJTransitRouteLine_TransitStep = class
    (TJavaGenericImport<JTransitRouteLine_TransitStepClass,
    JTransitRouteLine_TransitStep>)
  end;

  JTransitRouteLineClass = interface(JRouteLineClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/RouteLine
    ['{BA41453A-21A2-45F8-8CEC-B060517BA8AB}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JTransitRouteLine; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/route/TransitRouteLine')]
  JTransitRouteLine = interface(JRouteLine)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/RouteLine
    ['{054D5C48-3B8F-4013-9821-561E590A70E4}']
    { Property Methods }

    { methods }
    function getTaxitInfo: JTaxiInfo; cdecl;
    // Deprecated //()Lcom/baidu/mapapi/search/core/TaxiInfo;
    procedure setTaxitInfo(P1: JTaxiInfo); cdecl;
    // (Lcom/baidu/mapapi/search/core/TaxiInfo;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJTransitRouteLine = class(TJavaGenericImport<JTransitRouteLineClass,
    JTransitRouteLine>)
  end;

  JTransitRoutePlanOption_TransitPolicyClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{26FEFB90-5C35-4E1F-A8AB-24A053A2D548}']
    { static Property Methods }
    { class } function _GetEBUS_TIME_FIRST
      : JTransitRoutePlanOption_TransitPolicy;
    // Lcom/baidu/mapapi/search/route/TransitRoutePlanOption$TransitPolicy;
    { class } function _GetEBUS_TRANSFER_FIRST
      : JTransitRoutePlanOption_TransitPolicy;
    // Lcom/baidu/mapapi/search/route/TransitRoutePlanOption$TransitPolicy;
    { class } function _GetEBUS_WALK_FIRST
      : JTransitRoutePlanOption_TransitPolicy;
    // Lcom/baidu/mapapi/search/route/TransitRoutePlanOption$TransitPolicy;
    { class } function _GetEBUS_NO_SUBWAY
      : JTransitRoutePlanOption_TransitPolicy;
    // Lcom/baidu/mapapi/search/route/TransitRoutePlanOption$TransitPolicy;

    { static Methods }
    { class } function values
      : TJavaObjectArray<JTransitRoutePlanOption_TransitPolicy>; cdecl;
    // ()[Lcom/baidu/mapapi/search/route/TransitRoutePlanOption$TransitPolicy;
    { class } function valueOf(P1: JString)
      : JTransitRoutePlanOption_TransitPolicy; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/route/TransitRoutePlanOption$TransitPolicy;

    { static Property }
    { class } property EBUS_TIME_FIRST: JTransitRoutePlanOption_TransitPolicy
      read _GetEBUS_TIME_FIRST;
    { class } property EBUS_TRANSFER_FIRST
      : JTransitRoutePlanOption_TransitPolicy read _GetEBUS_TRANSFER_FIRST;
    { class } property EBUS_WALK_FIRST: JTransitRoutePlanOption_TransitPolicy
      read _GetEBUS_WALK_FIRST;
    { class } property EBUS_NO_SUBWAY: JTransitRoutePlanOption_TransitPolicy
      read _GetEBUS_NO_SUBWAY;
  end;

  [JavaSignature
    ('com/baidu/mapapi/search/route/TransitRoutePlanOption$TransitPolicy')]
  JTransitRoutePlanOption_TransitPolicy = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{79833483-6BAF-49BC-AA04-E155AECBED3C}']
    { Property Methods }

    { methods }
    function getInt: Integer; cdecl; // ()I

    { Property }
  end;

  TJTransitRoutePlanOption_TransitPolicy = class
    (TJavaGenericImport<JTransitRoutePlanOption_TransitPolicyClass,
    JTransitRoutePlanOption_TransitPolicy>)
  end;

  JTransitRoutePlanOptionClass = interface(JObjectClass)
    ['{266344E3-717D-47DD-A57B-83F424B7D7C5}']
    { static Property Methods }

    { static Methods }
    { class } function init: JTransitRoutePlanOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/route/TransitRoutePlanOption')]
  JTransitRoutePlanOption = interface(JObject)
    ['{87AF744B-7F1F-4A5C-B314-36D5511A19A0}']
    { Property Methods }
    function _GetmFrom: JPlanNode; // Lcom/baidu/mapapi/search/route/PlanNode;
    procedure _SetmFrom(amFrom: JPlanNode);
    // (Lcom/baidu/mapapi/search/route/PlanNode;)V
    function _GetmTo: JPlanNode; // Lcom/baidu/mapapi/search/route/PlanNode;
    procedure _SetmTo(amTo: JPlanNode);
    // (Lcom/baidu/mapapi/search/route/PlanNode;)V
    function _GetmCityName: JString; // Ljava/lang/String;
    procedure _SetmCityName(amCityName: JString); // (Ljava/lang/String;)V
    function _GetmPolicy: JTransitRoutePlanOption_TransitPolicy;
    // Lcom/baidu/mapapi/search/route/TransitRoutePlanOption$TransitPolicy;
    procedure _SetmPolicy(amPolicy: JTransitRoutePlanOption_TransitPolicy);
    // (Lcom/baidu/mapapi/search/route/TransitRoutePlanOption$TransitPolicy;)V

    { methods }
    function from(P1: JPlanNode): JTransitRoutePlanOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/PlanNode;)Lcom/baidu/mapapi/search/route/TransitRoutePlanOption;
    function &to(P1: JPlanNode): JTransitRoutePlanOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/PlanNode;)Lcom/baidu/mapapi/search/route/TransitRoutePlanOption;
    function city(P1: JString): JTransitRoutePlanOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/route/TransitRoutePlanOption;
    function policy(P1: JTransitRoutePlanOption_TransitPolicy)
      : JTransitRoutePlanOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/TransitRoutePlanOption$TransitPolicy;)Lcom/baidu/mapapi/search/route/TransitRoutePlanOption;

    { Property }
    property mFrom: JPlanNode read _GetmFrom write _SetmFrom;
    property mTo: JPlanNode read _GetmTo write _SetmTo;
    property mCityName: JString read _GetmCityName write _SetmCityName;
    property mPolicy: JTransitRoutePlanOption_TransitPolicy read _GetmPolicy
      write _SetmPolicy;
  end;

  TJTransitRoutePlanOption = class
    (TJavaGenericImport<JTransitRoutePlanOptionClass, JTransitRoutePlanOption>)
  end;


  JTransitRouteResultClass = interface(JSearchResultClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{90C7840A-AC36-42D5-859A-368843B7A3BF}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JTransitRouteResult; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/route/TransitRouteResult')]
  JTransitRouteResult = interface(JSearchResult)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{9B5D731E-93FC-41EF-82DC-9CB33E231E4D}']
    { Property Methods }

    { methods }
    function getTaxiInfo: JTaxiInfo; cdecl;
    // ()Lcom/baidu/mapapi/search/core/TaxiInfo;
    procedure setTaxiInfo(P1: JTaxiInfo); cdecl;
    // (Lcom/baidu/mapapi/search/core/TaxiInfo;)V
    procedure setRouteLines(P1: JList); cdecl; // (Ljava/util/List;)V
    function getRouteLines: JList; cdecl; // ()Ljava/util/List;
    function getSuggestAddrInfo: JSuggestAddrInfo; cdecl;
    // ()Lcom/baidu/mapapi/search/route/SuggestAddrInfo;
    procedure setSuggestAddrInfo(P1: JSuggestAddrInfo); cdecl;
    // (Lcom/baidu/mapapi/search/route/SuggestAddrInfo;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJTransitRouteResult = class(TJavaGenericImport<JTransitRouteResultClass,
    JTransitRouteResult>)
  end;

  JWalkingRouteLine_WalkingStepClass = interface(JRouteStepClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/RouteStep
    ['{66C84E3D-923B-41B6-BE72-E8E76EFF3643}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JWalkingRouteLine_WalkingStep; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/route/WalkingRouteLine$WalkingStep')]
  JWalkingRouteLine_WalkingStep = interface(JRouteStep)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/RouteStep
    ['{2398CB8D-CC95-4E5E-8AC7-E01117755857}']
    { Property Methods }

    { methods }
    function getWayPoints: JList; cdecl; // ()Ljava/util/List;
    function getDirection: Integer; cdecl; // ()I
    procedure setDirection(P1: Integer); cdecl; // (I)V
    function getEntrance: JRouteNode; cdecl;
    // ()Lcom/baidu/mapapi/search/core/RouteNode;
    procedure setEntrance(P1: JRouteNode); cdecl;
    // (Lcom/baidu/mapapi/search/core/RouteNode;)V
    function getExit: JRouteNode; cdecl;
    // ()Lcom/baidu/mapapi/search/core/RouteNode;
    procedure setExit(P1: JRouteNode); cdecl;
    // (Lcom/baidu/mapapi/search/core/RouteNode;)V
    procedure setPathString(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getEntranceInstructions: JString; cdecl; // ()Ljava/lang/String;
    procedure setEntranceInstructions(P1: JString); cdecl;
    // (Ljava/lang/String;)V
    function getExitInstructions: JString; cdecl; // ()Ljava/lang/String;
    procedure setExitInstructions(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getInstructions: JString; cdecl; // ()Ljava/lang/String;
    procedure setInstructions(P1: JString); cdecl; // (Ljava/lang/String;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJWalkingRouteLine_WalkingStep = class
    (TJavaGenericImport<JWalkingRouteLine_WalkingStepClass,
    JWalkingRouteLine_WalkingStep>)
  end;

  JWalkingRouteLineClass = interface(JRouteLineClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/RouteLine
    ['{6AE03484-B239-4C0F-8A68-A6220753AE96}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JWalkingRouteLine; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/route/WalkingRouteLine')]
  JWalkingRouteLine = interface(JRouteLine)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/RouteLine
    ['{DFFF355D-A17C-4CEB-8757-8A6290592D77}']
    { Property Methods }

    { methods }
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; // ()I
    function getAllStep: JList; cdecl; // ()Ljava/util/List;

    { Property }
  end;

  TJWalkingRouteLine = class(TJavaGenericImport<JWalkingRouteLineClass,
    JWalkingRouteLine>)
  end;

  JWalkingRoutePlanOptionClass = interface(JObjectClass)
    ['{5588B44F-FA9C-4D9B-B6E1-172AC0FEF2D5}']
    { static Property Methods }

    { static Methods }
    { class } function init: JWalkingRoutePlanOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/route/WalkingRoutePlanOption')]
  JWalkingRoutePlanOption = interface(JObject)
    ['{DB1F6EC8-B098-4EAC-B6AD-3EEACB81B3B0}']
    { Property Methods }
    function _GetmFrom: JPlanNode; // Lcom/baidu/mapapi/search/route/PlanNode;
    procedure _SetmFrom(amFrom: JPlanNode);
    // (Lcom/baidu/mapapi/search/route/PlanNode;)V
    function _GetmTo: JPlanNode; // Lcom/baidu/mapapi/search/route/PlanNode;
    procedure _SetmTo(amTo: JPlanNode);
    // (Lcom/baidu/mapapi/search/route/PlanNode;)V

    { methods }
    function from(P1: JPlanNode): JWalkingRoutePlanOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/PlanNode;)Lcom/baidu/mapapi/search/route/WalkingRoutePlanOption;
    function &to(P1: JPlanNode): JWalkingRoutePlanOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/PlanNode;)Lcom/baidu/mapapi/search/route/WalkingRoutePlanOption;

    { Property }
    property mFrom: JPlanNode read _GetmFrom write _SetmFrom;
    property mTo: JPlanNode read _GetmTo write _SetmTo;
  end;

  TJWalkingRoutePlanOption = class
    (TJavaGenericImport<JWalkingRoutePlanOptionClass, JWalkingRoutePlanOption>)
  end;


  JWalkingRouteResultClass = interface(JSearchResultClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{3F3145EB-F083-4033-BB02-5AE3F14FD115}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JWalkingRouteResult; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/route/WalkingRouteResult')]
  JWalkingRouteResult = interface(JSearchResult)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{CC3B6537-DC57-4A99-96F9-D8FB06B45B0E}']
    { Property Methods }

    { methods }
    function getRouteLines: JList; cdecl; // ()Ljava/util/List;
    procedure setRouteLines(P1: JList); cdecl; // (Ljava/util/List;)V
    function getTaxiInfo: JTaxiInfo; cdecl;
    // ()Lcom/baidu/mapapi/search/core/TaxiInfo;
    procedure setTaxiInfo(P1: JTaxiInfo); cdecl;
    // (Lcom/baidu/mapapi/search/core/TaxiInfo;)V
    function getSuggestAddrInfo: JSuggestAddrInfo; cdecl;
    // ()Lcom/baidu/mapapi/search/route/SuggestAddrInfo;
    procedure setSuggestAddrInfo(P1: JSuggestAddrInfo); cdecl;
    // (Lcom/baidu/mapapi/search/route/SuggestAddrInfo;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJWalkingRouteResult = class(TJavaGenericImport<JWalkingRouteResultClass,
    JWalkingRouteResult>)
  end;

  JLocationShareURLOptionClass = interface(JObjectClass)
    ['{2FD48779-CA9D-4231-8EC7-432076B42B30}']
    { static Property Methods }

    { static Methods }
    { class } function init: JLocationShareURLOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/share/LocationShareURLOption')]
  JLocationShareURLOption = interface(JObject)
    ['{5ACCF1E7-5CB0-44CC-B9D9-1532C91D53A9}']
    { Property Methods }
    function _GetmLocation: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _SetmLocation(amLocation: JLatLng);
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function _GetmName: JString; // Ljava/lang/String;
    procedure _SetmName(amName: JString); // (Ljava/lang/String;)V
    function _GetmSnippet: JString; // Ljava/lang/String;
    procedure _SetmSnippet(amSnippet: JString); // (Ljava/lang/String;)V

    { methods }
    function location(P1: JLatLng): JLocationShareURLOption; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/search/share/LocationShareURLOption;
    function name(P1: JString): JLocationShareURLOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/share/LocationShareURLOption;
    function snippet(P1: JString): JLocationShareURLOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/share/LocationShareURLOption;

    { Property }
    property mLocation: JLatLng read _GetmLocation write _SetmLocation;
    property mName: JString read _GetmName write _SetmName;
    property mSnippet: JString read _GetmSnippet write _SetmSnippet;
  end;

  TJLocationShareURLOption = class
    (TJavaGenericImport<JLocationShareURLOptionClass, JLocationShareURLOption>)
  end;

  JOnGetShareUrlResultListenerClass = interface(JObjectClass)
    ['{6621E80C-9F7A-4664-9D8A-6A3AA43F2254}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/share/OnGetShareUrlResultListener')]
  JOnGetShareUrlResultListener = interface(IJavaInstance)
    ['{EA8C70C4-58E7-4B82-9165-2079257426E1}']
    { Property Methods }

    { methods }
    procedure onGetPoiDetailShareUrlResult(P1: JShareUrlResult); cdecl;
    // (Lcom/baidu/mapapi/search/share/ShareUrlResult;)V
    procedure onGetLocationShareUrlResult(P1: JShareUrlResult); cdecl;
    // (Lcom/baidu/mapapi/search/share/ShareUrlResult;)V
    procedure onGetRouteShareUrlResult(P1: JShareUrlResult); cdecl;
    // (Lcom/baidu/mapapi/search/share/ShareUrlResult;)V

    { Property }
  end;

  TJOnGetShareUrlResultListener = class
    (TJavaGenericImport<JOnGetShareUrlResultListenerClass,
    JOnGetShareUrlResultListener>)
  end;

  JPoiDetailShareURLOptionClass = interface(JObjectClass)
    ['{7C34B0E8-6640-4250-BFAF-06DD956C8518}']
    { static Property Methods }

    { static Methods }
    { class } function init: JPoiDetailShareURLOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/share/PoiDetailShareURLOption')]
  JPoiDetailShareURLOption = interface(JObject)
    ['{683A5EAC-3E11-43C3-A80A-30972D538BEF}']
    { Property Methods }
    function _GetmUid: JString; // Ljava/lang/String;
    procedure _SetmUid(amUid: JString); // (Ljava/lang/String;)V

    { methods }
    function poiUid(P1: JString): JPoiDetailShareURLOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/share/PoiDetailShareURLOption;

    { Property }
    property mUid: JString read _GetmUid write _SetmUid;
  end;

  TJPoiDetailShareURLOption = class
    (TJavaGenericImport<JPoiDetailShareURLOptionClass,
    JPoiDetailShareURLOption>)
  end;

  JRouteShareURLOption_RouteShareModeClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{F571BDBC-A92E-4DDF-9DA3-190F985466EB}']
    { static Property Methods }
    { class } function _GetCAR_ROUTE_SHARE_MODE
      : JRouteShareURLOption_RouteShareMode;
    // Lcom/baidu/mapapi/search/share/RouteShareURLOption$RouteShareMode;
    { class } function _GetFOOT_ROUTE_SHARE_MODE
      : JRouteShareURLOption_RouteShareMode;
    // Lcom/baidu/mapapi/search/share/RouteShareURLOption$RouteShareMode;
    { class } function _GetCYCLE_ROUTE_SHARE_MODE
      : JRouteShareURLOption_RouteShareMode;
    // Lcom/baidu/mapapi/search/share/RouteShareURLOption$RouteShareMode;
    { class } function _GetBUS_ROUTE_SHARE_MODE
      : JRouteShareURLOption_RouteShareMode;
    // Lcom/baidu/mapapi/search/share/RouteShareURLOption$RouteShareMode;

    { static Methods }
    { class } function values
      : TJavaObjectArray<JRouteShareURLOption_RouteShareMode>; cdecl;
    // ()[Lcom/baidu/mapapi/search/share/RouteShareURLOption$RouteShareMode;
    { class } function valueOf(P1: JString)
      : JRouteShareURLOption_RouteShareMode; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/share/RouteShareURLOption$RouteShareMode;

    { static Property }
    { class } property CAR_ROUTE_SHARE_MODE: JRouteShareURLOption_RouteShareMode
      read _GetCAR_ROUTE_SHARE_MODE;
    { class } property FOOT_ROUTE_SHARE_MODE
      : JRouteShareURLOption_RouteShareMode read _GetFOOT_ROUTE_SHARE_MODE;
    { class } property CYCLE_ROUTE_SHARE_MODE
      : JRouteShareURLOption_RouteShareMode read _GetCYCLE_ROUTE_SHARE_MODE;
    { class } property BUS_ROUTE_SHARE_MODE: JRouteShareURLOption_RouteShareMode
      read _GetBUS_ROUTE_SHARE_MODE;
  end;

  [JavaSignature
    ('com/baidu/mapapi/search/share/RouteShareURLOption$RouteShareMode')]
  JRouteShareURLOption_RouteShareMode = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{B69CDDC3-BCA2-47E1-A2D8-CF63EA18B22F}']
    { Property Methods }

    { methods }
    function getRouteShareMode: Integer; cdecl; // ()I

    { Property }
  end;

  TJRouteShareURLOption_RouteShareMode = class
    (TJavaGenericImport<JRouteShareURLOption_RouteShareModeClass,
    JRouteShareURLOption_RouteShareMode>)
  end;

  JRouteShareURLOptionClass = interface(JObjectClass)
    ['{FC06F15B-163D-4393-84A8-858B05102666}']
    { static Property Methods }

    { static Methods }
    { class } function init: JRouteShareURLOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/share/RouteShareURLOption')]
  JRouteShareURLOption = interface(JObject)
    ['{10F39441-8A21-4F1D-8A82-AF39D44E0C18}']
    { Property Methods }
    function _GetmFrom: JPlanNode; // Lcom/baidu/mapapi/search/route/PlanNode;
    procedure _SetmFrom(amFrom: JPlanNode);
    // (Lcom/baidu/mapapi/search/route/PlanNode;)V
    function _GetmTo: JPlanNode; // Lcom/baidu/mapapi/search/route/PlanNode;
    procedure _SetmTo(amTo: JPlanNode);
    // (Lcom/baidu/mapapi/search/route/PlanNode;)V
    function _GetmMode: JRouteShareURLOption_RouteShareMode;
    // Lcom/baidu/mapapi/search/share/RouteShareURLOption$RouteShareMode;
    procedure _SetmMode(amMode: JRouteShareURLOption_RouteShareMode);
    // (Lcom/baidu/mapapi/search/share/RouteShareURLOption$RouteShareMode;)V
    function _GetmPn: Integer; // I
    procedure _SetmPn(amPn: Integer); // (I)V
    function _GetmCityCode: Integer; // I
    procedure _SetmCityCode(amCityCode: Integer); // (I)V

    { methods }
    function getmMode: JRouteShareURLOption_RouteShareMode; cdecl;
    // ()Lcom/baidu/mapapi/search/share/RouteShareURLOption$RouteShareMode;
    function from(P1: JPlanNode): JRouteShareURLOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/PlanNode;)Lcom/baidu/mapapi/search/share/RouteShareURLOption;
    function &to(P1: JPlanNode): JRouteShareURLOption; cdecl;
    // (Lcom/baidu/mapapi/search/route/PlanNode;)Lcom/baidu/mapapi/search/share/RouteShareURLOption;
    function pn(P1: Integer): JRouteShareURLOption; cdecl;
    // (I)Lcom/baidu/mapapi/search/share/RouteShareURLOption;
    function cityCode(P1: Integer): JRouteShareURLOption; cdecl;
    // (I)Lcom/baidu/mapapi/search/share/RouteShareURLOption;
    function routMode(P1: JRouteShareURLOption_RouteShareMode)
      : JRouteShareURLOption; cdecl;
    // (Lcom/baidu/mapapi/search/share/RouteShareURLOption$RouteShareMode;)Lcom/baidu/mapapi/search/share/RouteShareURLOption;

    { Property }
    property mFrom: JPlanNode read _GetmFrom write _SetmFrom;
    property mTo: JPlanNode read _GetmTo write _SetmTo;
    property mMode: JRouteShareURLOption_RouteShareMode read _GetmMode
      write _SetmMode;
    property mPn: Integer read _GetmPn write _SetmPn;
    property mCityCode: Integer read _GetmCityCode write _SetmCityCode;
  end;

  TJRouteShareURLOption = class(TJavaGenericImport<JRouteShareURLOptionClass,
    JRouteShareURLOption>)
  end;

 
  JShareUrlResultClass = interface(JSearchResultClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{7A89F9C1-2C7F-4F6E-A8BD-A3E15719AC89}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JShareUrlResult; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/share/ShareUrlResult')]
  JShareUrlResult = interface(JSearchResult)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{348C1901-2B22-4C7E-A8A1-E55E817AFD2A}']
    { Property Methods }

    { methods }
    function getUrl: JString; cdecl; // ()Ljava/lang/String;
    procedure setUrl(P1: JString); cdecl; // (Ljava/lang/String;)V
    procedure setType(P1: Integer); cdecl; // (I)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJShareUrlResult = class(TJavaGenericImport<JShareUrlResultClass,
    JShareUrlResult>)
  end;

  JShareUrlSearchClass = interface(JObjectClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/a
    ['{CCA5EDFD-CF00-4D69-9864-16233AA4F5CA}']
    { static Property Methods }

    { static Methods }
    { class } function newInstance: JShareUrlSearch; cdecl;
    // ()Lcom/baidu/mapapi/search/share/ShareUrlSearch;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/share/ShareUrlSearch')]
  JShareUrlSearch = interface(JObject)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/a
    ['{27E22B37-EFEE-4F93-9F16-7A661271F99E}']
    { Property Methods }

    { methods }
    function requestPoiDetailShareUrl(P1: JPoiDetailShareURLOption): Boolean;
      cdecl; // (Lcom/baidu/mapapi/search/share/PoiDetailShareURLOption;)Z
    function requestLocationShareUrl(P1: JLocationShareURLOption): Boolean;
      cdecl; // (Lcom/baidu/mapapi/search/share/LocationShareURLOption;)Z
    function requestRouteShareUrl(P1: JRouteShareURLOption): Boolean; cdecl;
    // (Lcom/baidu/mapapi/search/share/RouteShareURLOption;)Z
    procedure setOnGetShareUrlResultListener(P1: JOnGetShareUrlResultListener);
      cdecl; // (Lcom/baidu/mapapi/search/share/OnGetShareUrlResultListener;)V
    procedure destroy; cdecl; // ()V

    { Property }
  end;

  TJShareUrlSearch = class(TJavaGenericImport<JShareUrlSearchClass,
    JShareUrlSearch>)
  end;

  JOnGetSuggestionResultListenerClass = interface(JObjectClass)
    ['{E2520B43-50FF-4B14-AF30-D5CA2E404B5E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/sug/OnGetSuggestionResultListener')]
  JOnGetSuggestionResultListener = interface(IJavaInstance)
    ['{F41A4562-CE88-4995-B954-C1AA9097868A}']
    { Property Methods }

    { methods }
    procedure onGetSuggestionResult(P1: JSuggestionResult); cdecl;
    // (Lcom/baidu/mapapi/search/sug/SuggestionResult;)V

    { Property }
  end;

  TJOnGetSuggestionResultListener = class
    (TJavaGenericImport<JOnGetSuggestionResultListenerClass,
    JOnGetSuggestionResultListener>)
  end;


  JSuggestionResult_SuggestionInfoClass = interface(JObjectClass)
    ['{D466F3FC-B5AE-422C-AF51-3A590527F8DD}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JSuggestionResult_SuggestionInfo; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/sug/SuggestionResult$SuggestionInfo')]
  JSuggestionResult_SuggestionInfo = interface(JObject)
    ['{B0833E29-C724-46D8-9126-3F627EE5036C}']
    { Property Methods }
    function _Getkey: JString; // Ljava/lang/String;
    procedure _Setkey(akey: JString); // (Ljava/lang/String;)V
    function _Getcity: JString; // Ljava/lang/String;
    procedure _Setcity(acity: JString); // (Ljava/lang/String;)V
    function _Getdistrict: JString; // Ljava/lang/String;
    procedure _Setdistrict(adistrict: JString); // (Ljava/lang/String;)V
    function _Getpt: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _Setpt(apt: JLatLng); // (Lcom/baidu/mapapi/model/LatLng;)V
    function _Getuid: JString; // Ljava/lang/String;
    procedure _Setuid(auid: JString); // (Ljava/lang/String;)V

    { methods }
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
    property key: JString read _Getkey write _Setkey;
    property city: JString read _Getcity write _Setcity;
    property district: JString read _Getdistrict write _Setdistrict;
    property pt: JLatLng read _Getpt write _Setpt;
    property uid: JString read _Getuid write _Setuid;
  end;

  TJSuggestionResult_SuggestionInfo = class
    (TJavaGenericImport<JSuggestionResult_SuggestionInfoClass,
    JSuggestionResult_SuggestionInfo>)
  end;

  JSuggestionResultClass = interface(JSearchResultClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{79316EA7-8514-4F07-93D0-0731AC556DE1}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JSuggestionResult; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/search/sug/SuggestionResult')]
  JSuggestionResult = interface(JSearchResult)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/SearchResult
    ['{100D99A0-E0D1-4074-9A6C-1865F2987376}']
    { Property Methods }

    { methods }
    function getAllSuggestions: JList; cdecl; // ()Ljava/util/List;
    procedure setSuggestionInfo(P1: JArrayList); cdecl;
    // (Ljava/util/ArrayList;)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJSuggestionResult = class(TJavaGenericImport<JSuggestionResultClass,
    JSuggestionResult>)
  end;

  JSuggestionSearchClass = interface(JObjectClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/search/core/a
    ['{410C6BCA-28FF-44CC-BE0C-6D0BC1613559}']
    { static Property Methods }

    { static Methods }
    { class } function newInstance: JSuggestionSearch; cdecl;
    // ()Lcom/baidu/mapapi/search/sug/SuggestionSearch;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/sug/SuggestionSearch')]
  JSuggestionSearch = interface(JObject)
  // or JObject // SuperSignature: com/baidu/mapapi/search/core/a
    ['{A4581A1D-F5EA-4BC5-A4FC-F65BDC0B2CCD}']
    { Property Methods }

    { methods }
    function requestSuggestion(P1: JSuggestionSearchOption): Boolean; cdecl;
    // (Lcom/baidu/mapapi/search/sug/SuggestionSearchOption;)Z
    procedure setOnGetSuggestionResultListener
      (P1: JOnGetSuggestionResultListener); cdecl;
    // (Lcom/baidu/mapapi/search/sug/OnGetSuggestionResultListener;)V
    procedure destroy; cdecl; // ()V

    { Property }
  end;

  TJSuggestionSearch = class(TJavaGenericImport<JSuggestionSearchClass,
    JSuggestionSearch>)
  end;

  JSuggestionSearchOptionClass = interface(JObjectClass)
    ['{4E4F41B2-388F-4ABC-B449-AD5F8552BF32}']
    { static Property Methods }

    { static Methods }
    { class } function init: JSuggestionSearchOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/search/sug/SuggestionSearchOption')]
  JSuggestionSearchOption = interface(JObject)
    ['{1001FEBF-1654-4AD5-8FB9-C2D61FAF8ADF}']
    { Property Methods }
    function _GetmCity: JString; // Ljava/lang/String;
    procedure _SetmCity(amCity: JString); // (Ljava/lang/String;)V
    function _GetmKeyword: JString; // Ljava/lang/String;
    procedure _SetmKeyword(amKeyword: JString); // (Ljava/lang/String;)V
    function _GetmLocation: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _SetmLocation(amLocation: JLatLng);
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function _GetmCityLimit: JBoolean; // Ljava/lang/Boolean;
    procedure _SetmCityLimit(amCityLimit: JBoolean); // (Ljava/lang/Boolean;)V

    { methods }
    function city(P1: JString): JSuggestionSearchOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/sug/SuggestionSearchOption;
    function keyword(P1: JString): JSuggestionSearchOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/search/sug/SuggestionSearchOption;
    function location(P1: JLatLng): JSuggestionSearchOption; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/search/sug/SuggestionSearchOption;
    function citylimit(P1: JBoolean): JSuggestionSearchOption; cdecl;
    // (Ljava/lang/Boolean;)Lcom/baidu/mapapi/search/sug/SuggestionSearchOption;

    { Property }
    property mCity: JString read _GetmCity write _SetmCity;
    property mKeyword: JString read _GetmKeyword write _SetmKeyword;
    property mLocation: JLatLng read _GetmLocation write _SetmLocation;
    property mCityLimit: JBoolean read _GetmCityLimit write _SetmCityLimit;
  end;

  TJSuggestionSearchOption = class
    (TJavaGenericImport<JSuggestionSearchOptionClass, JSuggestionSearchOption>)
  end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.core.BusInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JBusInfo));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.core.CityInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JCityInfo));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.core.CoachInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JCoachInfo));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.core.PlaneInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JPlaneInfo));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.core.PoiInfo_POITYPE',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JPoiInfo_POITYPE));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.core.PoiInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JPoiInfo));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.core.PriceInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JPriceInfo));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.core.RouteLine_TYPE',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JRouteLine_TYPE));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.core.RouteLine',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JRouteLine));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.core.RouteNode',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JRouteNode));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.core.RouteStep',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JRouteStep));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.core.SearchResult_ERRORNO',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JSearchResult_ERRORNO));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.core.SearchResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JSearchResult));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.core.TaxiInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JTaxiInfo));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.core.TrainInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JTrainInfo));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.core.TransitBaseInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JTransitBaseInfo));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.core.TransitResultNode',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JTransitResultNode));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.core.VehicleInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JVehicleInfo));

  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.busline.BusLineResult_BusStation',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JBusLineResult_BusStation));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.busline.BusLineResult_BusStep',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JBusLineResult_BusStep));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.busline.BusLineResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JBusLineResult));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.busline.BusLineSearch',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JBusLineSearch));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.busline.BusLineSearchOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JBusLineSearchOption));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.busline.OnGetBusLineSearchResultListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.
    JOnGetBusLineSearchResultListener));

  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.district.DistrictResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JDistrictResult));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.district.DistrictSearch',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JDistrictSearch));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.district.DistrictSearchOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JDistrictSearchOption));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.district.OnGetDistricSearchResultListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.
    JOnGetDistricSearchResultListener));

  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.geocode.GeoCodeOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JGeoCodeOption));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.geocode.GeoCoder',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JGeoCoder));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.geocode.GeoCodeResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JGeoCodeResult));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.geocode.OnGetGeoCoderResultListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JOnGetGeoCoderResultListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.geocode.ReverseGeoCodeOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JReverseGeoCodeOption));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.geocode.ReverseGeoCodeResult_AddressComponent',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.
    JReverseGeoCodeResult_AddressComponent));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.geocode.ReverseGeoCodeResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JReverseGeoCodeResult));

  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.poi.OnGetPoiSearchResultListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JOnGetPoiSearchResultListener));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.poi.PoiAddrInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JPoiAddrInfo));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.poi.PoiBoundSearchOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JPoiBoundSearchOption));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.poi.PoiCitySearchOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JPoiCitySearchOption));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.poi.PoiDetailResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JPoiDetailResult));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.poi.PoiDetailSearchOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JPoiDetailSearchOption));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.poi.PoiIndoorInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JPoiIndoorInfo));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.poi.PoiIndoorOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JPoiIndoorOption));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.poi.PoiIndoorResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JPoiIndoorResult));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.poi.PoiNearbySearchOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JPoiNearbySearchOption));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.poi.PoiResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JPoiResult));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.poi.PoiSearch',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JPoiSearch));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.poi.PoiSortType',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JPoiSortType));

  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.BikingRouteLine_BikingStep',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JBikingRouteLine_BikingStep));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.BikingRouteLine',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JBikingRouteLine));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.BikingRoutePlanOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JBikingRoutePlanOption));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.BikingRouteResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JBikingRouteResult));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.DrivingRouteLine_DrivingStep',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JDrivingRouteLine_DrivingStep));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.DrivingRouteLine',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JDrivingRouteLine));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.DrivingRoutePlanOption_DrivingPolicy',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.
    JDrivingRoutePlanOption_DrivingPolicy));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.DrivingRoutePlanOption_DrivingTrafficPolicy',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.
    JDrivingRoutePlanOption_DrivingTrafficPolicy));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.DrivingRoutePlanOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JDrivingRoutePlanOption));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.DrivingRouteResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JDrivingRouteResult));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.IndoorPlanNode',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JIndoorPlanNode));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.IndoorRouteLine_IndoorRouteStep_IndoorStepNode',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.
    JIndoorRouteLine_IndoorRouteStep_IndoorStepNode));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.IndoorRouteLine_IndoorRouteStep',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.
    JIndoorRouteLine_IndoorRouteStep));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.IndoorRouteLine',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JIndoorRouteLine));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.IndoorRoutePlanOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JIndoorRoutePlanOption));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.IndoorRouteResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JIndoorRouteResult));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.MassTransitRouteLine_TransitStep_StepVehicleInfoType',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.
    JMassTransitRouteLine_TransitStep_StepVehicleInfoType));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.MassTransitRouteLine_TransitStep_TrafficCondition',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.
    JMassTransitRouteLine_TransitStep_TrafficCondition));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.MassTransitRouteLine_TransitStep',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.
    JMassTransitRouteLine_TransitStep));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.MassTransitRouteLine',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JMassTransitRouteLine));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.MassTransitRoutePlanOption_TacticsIncity',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.
    JMassTransitRoutePlanOption_TacticsIncity));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.MassTransitRoutePlanOption_TacticsIntercity',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.
    JMassTransitRoutePlanOption_TacticsIntercity));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.MassTransitRoutePlanOption_TransTypeIntercity',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.
    JMassTransitRoutePlanOption_TransTypeIntercity));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.MassTransitRoutePlanOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JMassTransitRoutePlanOption));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.MassTransitRouteResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JMassTransitRouteResult));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.OnGetRoutePlanResultListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JOnGetRoutePlanResultListener));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.search.route.PlanNode',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JPlanNode));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.RoutePlanSearch',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JRoutePlanSearch));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.SuggestAddrInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JSuggestAddrInfo));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.TransitRouteLine_TransitStep_TransitRouteStepType',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.
    JTransitRouteLine_TransitStep_TransitRouteStepType));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.TransitRouteLine_TransitStep',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JTransitRouteLine_TransitStep));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.TransitRouteLine',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JTransitRouteLine));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.TransitRoutePlanOption_TransitPolicy',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.
    JTransitRoutePlanOption_TransitPolicy));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.TransitRoutePlanOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JTransitRoutePlanOption));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.TransitRouteResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JTransitRouteResult));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.WalkingRouteLine_WalkingStep',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JWalkingRouteLine_WalkingStep));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.WalkingRouteLine',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JWalkingRouteLine));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.WalkingRoutePlanOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JWalkingRoutePlanOption));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.route.WalkingRouteResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JWalkingRouteResult));

  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.share.LocationShareURLOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JLocationShareURLOption));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.share.OnGetShareUrlResultListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JOnGetShareUrlResultListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.share.PoiDetailShareURLOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JPoiDetailShareURLOption));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.share.RouteShareURLOption_RouteShareMode',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.
    JRouteShareURLOption_RouteShareMode));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.share.RouteShareURLOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JRouteShareURLOption));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.share.ShareUrlResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JShareUrlResult));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.share.ShareUrlSearch',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JShareUrlSearch));

  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.sug.OnGetSuggestionResultListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JShareUrlSearch));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.sug.SuggestionResult_SuggestionInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.
    JSuggestionResult_SuggestionInfo));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.sug.SuggestionResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JSuggestionResult));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.sug.SuggestionSearch',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JSuggestionSearch));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.search.sug.SuggestionSearchOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.search.JSuggestionSearchOption));
end;

initialization

RegisterTypes;

end.
