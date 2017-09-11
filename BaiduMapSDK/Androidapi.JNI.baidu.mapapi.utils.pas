unit Androidapi.JNI.baidu.mapapi.utils;
// ====================================================
// Android Baidu Map SDK interface
// Package:com.baidu.mapapi.Util
// com.baidu.mapapi.Util.poi
// com.baidu.mapapi.Util.route
// author:Xubzhlin
// email:371889755@qq.com
//
// date:2017.5.10
// version:4.3.0
// ====================================================

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.baidu.mapapi.model;

type
  // ===== Forward declarations =====
  // com.baidu.mapapi.utils
  JAreaUtil = interface; // com.baidu.mapapi.utils.AreaUtil
  JCoordinateConverter_CoordType = interface;
  // com.baidu.mapapi.utils.CoordinateConverter$CoordType
  JCoordinateConverter = interface;
  // com.baidu.mapapi.utils.CoordinateConverter
  JDistanceUtil = interface; // com.baidu.mapapi.utils.DistanceUtil
  JOpenClientUtil = interface; // com.baidu.mapapi.utils.OpenClientUtil
  JSpatialRelationUtil = interface;
  // com.baidu.mapapi.utils.SpatialRelationUtil

  // com.baidu.mapapi.utils.poi
  JBaiduMapPoiSearch = interface;
  // com.baidu.mapapi.utils.poi.BaiduMapPoiSearch
  JDispathcPoiData = interface; // com.baidu.mapapi.utils.poi.DispathcPoiData
  JIllegalPoiSearchArgumentException = interface;
  // com.baidu.mapapi.utils.poi.IllegalPoiSearchArgumentException
  JPoiParaOption = interface; // com.baidu.mapapi.utils.poi.PoiParaOption

  // com.baidu.mapapi.utils.route
  JBaiduMapRoutePlan = interface;
  // com.baidu.mapapi.utils.route.BaiduMapRoutePlan
  JIllegalRoutePlanArgumentException = interface;
  // com.baidu.mapapi.utils.route.IllegalRoutePlanArgumentException
  JRouteParaOption_EBusStrategyType = interface;
  // com.baidu.mapapi.utils.route.RouteParaOption$EBusStrategyType
  JRouteParaOption = interface; // com.baidu.mapapi.utils.route.RouteParaOption

  // ===== Interface declarations =====
  JAreaUtilClass = interface(JObjectClass)
    ['{3AB67741-AFA9-4D51-96EB-6C6AA6A59563}']
    { static Property Methods }

    { static Methods }
    { class } function init: JAreaUtil; cdecl; // ()V
    { class } function calculateArea(P1: JLatLng; P2: JLatLng): Double; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;Lcom/baidu/mapapi/model/LatLng;)D

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/utils/AreaUtil')]
  JAreaUtil = interface(JObject)
    ['{A5465D3E-61B9-4F46-8445-80E1A14D9D2A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAreaUtil = class(TJavaGenericImport<JAreaUtilClass, JAreaUtil>)
  end;

  JCoordinateConverter_CoordTypeClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{9ADFE2EB-AE93-4B2B-9605-E4B0C28CF860}']
    { static Property Methods }
    { class } function _GetGPS: JCoordinateConverter_CoordType;
    // Lcom/baidu/mapapi/utils/CoordinateConverter$CoordType;
    { class } function _GetCOMMON: JCoordinateConverter_CoordType;
    // Lcom/baidu/mapapi/utils/CoordinateConverter$CoordType;

    { static Methods }
    { class } function values: TJavaObjectArray<JCoordinateConverter_CoordType>;
      cdecl; // ()[Lcom/baidu/mapapi/utils/CoordinateConverter$CoordType;
    { class } function valueOf(P1: JString): JCoordinateConverter_CoordType;
      cdecl; // (Ljava/lang/String;)Lcom/baidu/mapapi/utils/CoordinateConverter$CoordType;

    { static Property }
    { class } property GPS: JCoordinateConverter_CoordType read _GetGPS;
    { class } property COMMON: JCoordinateConverter_CoordType read _GetCOMMON;
  end;

  [JavaSignature('com/baidu/mapapi/utils/CoordinateConverter$CoordType')]
  JCoordinateConverter_CoordType = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{EB2059E7-BC2C-4627-A27E-2D243F735230}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCoordinateConverter_CoordType = class
    (TJavaGenericImport<JCoordinateConverter_CoordTypeClass,
    JCoordinateConverter_CoordType>)
  end;

  JCoordinateConverterClass = interface(JObjectClass)
    ['{0D603D1E-BCF6-4FBF-89E7-7F2185E52981}']
    { static Property Methods }

    { static Methods }
    { class } function init: JCoordinateConverter; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/utils/CoordinateConverter')]
  JCoordinateConverter = interface(JObject)
    ['{36063CDC-AC67-4867-83B4-73DAF8073FB8}']
    { Property Methods }

    { methods }
    function coord(P1: JLatLng): JCoordinateConverter; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/utils/CoordinateConverter;
    function from(P1: JCoordinateConverter_CoordType): JCoordinateConverter;
      cdecl; // (Lcom/baidu/mapapi/utils/CoordinateConverter$CoordType;)Lcom/baidu/mapapi/utils/CoordinateConverter;
    function convert: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;

    { Property }
  end;

  TJCoordinateConverter = class(TJavaGenericImport<JCoordinateConverterClass,
    JCoordinateConverter>)
  end;

  JDistanceUtilClass = interface(JObjectClass)
    ['{0E406181-7171-4EBB-84CC-93AE1CB94378}']
    { static Property Methods }

    { static Methods }
    { class } function init: JDistanceUtil; cdecl; // ()V
    { class } function getDistance(P1: JLatLng; P2: JLatLng): Double; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;Lcom/baidu/mapapi/model/LatLng;)D

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/utils/DistanceUtil')]
  JDistanceUtil = interface(JObject)
    ['{D12423B5-F62C-49B1-9C5D-3183D10BA139}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDistanceUtil = class(TJavaGenericImport<JDistanceUtilClass, JDistanceUtil>)
  end;

  JOpenClientUtilClass = interface(JObjectClass)
    ['{298B9856-A090-4688-8724-8B71DC79214E}']
    { static Property Methods }

    { static Methods }
    { class } function init: JOpenClientUtil; cdecl; // ()V
    { class } function getBaiduMapVersion(P1: JContext): Integer; cdecl;
    // (Landroid/content/Context;)I
    { class } procedure getLatestBaiduMapApp(P1: JContext); cdecl;
    // (Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/utils/OpenClientUtil')]
  JOpenClientUtil = interface(JObject)
    ['{4A57E914-40DE-4464-A8E0-DCE34E842E80}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOpenClientUtil = class(TJavaGenericImport<JOpenClientUtilClass,
    JOpenClientUtil>)
  end;

  JSpatialRelationUtilClass = interface(JObjectClass)
    ['{B5756D43-EDAB-466F-A542-F66DE07BCD2A}']
    { static Property Methods }

    { static Methods }
    { class } function init: JSpatialRelationUtil; cdecl; // ()V
    { class } function isPolygonContainsPoint(P1: JList; P2: JLatLng): Boolean;
      cdecl; // (Ljava/util/List;Lcom/baidu/mapapi/model/LatLng;)Z
    { class } function isCircleContainsPoint(P1: JLatLng; P2: Integer;
      P3: JLatLng): Boolean; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;ILcom/baidu/mapapi/model/LatLng;)Z
    { class } function getNearestPointFromLine(P1: JList; P2: JLatLng): JLatLng;
      cdecl; // (Ljava/util/List;Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLng;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/utils/SpatialRelationUtil')]
  JSpatialRelationUtil = interface(JObject)
    ['{71141786-725F-44FC-B31C-8D38DA8D716F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSpatialRelationUtil = class(TJavaGenericImport<JSpatialRelationUtilClass,
    JSpatialRelationUtil>)
  end;

  JBaiduMapPoiSearchClass = interface(JObjectClass)
    ['{7A12291D-E492-4566-9E04-2FE5AE03DEE8}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBaiduMapPoiSearch; cdecl; // ()V
    { class } procedure setSupportWebPoi(P1: Boolean); cdecl; // (Z)V
    { class } function openBaiduMapPoiDetialsPage(P1: JPoiParaOption;
      P2: JContext): Boolean; cdecl;
    // (Lcom/baidu/mapapi/utils/poi/PoiParaOption;Landroid/content/Context;)Z
    { class } function openBaiduMapPoiNearbySearch(P1: JPoiParaOption;
      P2: JContext): Boolean; cdecl;
    // (Lcom/baidu/mapapi/utils/poi/PoiParaOption;Landroid/content/Context;)Z
    { class } procedure openBaiduMapPanoShow(P1: JString; P2: JContext); cdecl;
    // (Ljava/lang/String;Landroid/content/Context;)V
    { class } function dispatchPoiToBaiduMap(P1: JList; P2: JContext): Boolean;
      cdecl; // (Ljava/util/List;Landroid/content/Context;)Z
    { class } procedure finish(P1: JContext); cdecl;
    // (Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/utils/poi/BaiduMapPoiSearch')]
  JBaiduMapPoiSearch = interface(JObject)
    ['{76D8420B-146D-4F8D-A47D-BBA92A5D5387}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBaiduMapPoiSearch = class(TJavaGenericImport<JBaiduMapPoiSearchClass,
    JBaiduMapPoiSearch>)
  end;

  JDispathcPoiDataClass = interface(JObjectClass)
    ['{4F858E7A-614B-4AA8-9B21-C788BED0630A}']
    { static Property Methods }

    { static Methods }
    { class } function init: JDispathcPoiData; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/utils/poi/DispathcPoiData')]
  JDispathcPoiData = interface(JObject)
    ['{81599728-5DAC-4978-9826-CF7EE25C5BD2}']
    { Property Methods }
    function _Getname: JString; // Ljava/lang/String;
    procedure _Setname(aname: JString); // (Ljava/lang/String;)V
    function _Getpt: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _Setpt(apt: JLatLng); // (Lcom/baidu/mapapi/model/LatLng;)V
    function _Getaddr: JString; // Ljava/lang/String;
    procedure _Setaddr(aaddr: JString); // (Ljava/lang/String;)V
    function _Getuid: JString; // Ljava/lang/String;
    procedure _Setuid(auid: JString); // (Ljava/lang/String;)V

    { methods }

    { Property }
    property name: JString read _Getname write _Setname;
    property pt: JLatLng read _Getpt write _Setpt;
    property addr: JString read _Getaddr write _Setaddr;
    property uid: JString read _Getuid write _Setuid;
  end;

  TJDispathcPoiData = class(TJavaGenericImport<JDispathcPoiDataClass,
    JDispathcPoiData>)
  end;

  JIllegalPoiSearchArgumentExceptionClass = interface(JRuntimeExceptionClass)
  // or JObjectClass // SuperSignature: java/lang/RuntimeException
    ['{F252C897-17A1-46ED-9189-9DACBE007503}']
    { static Property Methods }

    { static Methods }
    { class } function init: JIllegalPoiSearchArgumentException; cdecl;
      overload; // ()V
    { class } function init(P1: JString): JIllegalPoiSearchArgumentException;
      cdecl; overload; // (Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature
    ('com/baidu/mapapi/utils/poi/IllegalPoiSearchArgumentException')]
  JIllegalPoiSearchArgumentException = interface(JRuntimeException)
  // or JObject // SuperSignature: java/lang/RuntimeException
    ['{3E1654A6-12F7-4E14-8353-C4D07AB8FF84}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIllegalPoiSearchArgumentException = class
    (TJavaGenericImport<JIllegalPoiSearchArgumentExceptionClass,
    JIllegalPoiSearchArgumentException>)
  end;

  JPoiParaOptionClass = interface(JObjectClass)
    ['{4642F0E8-6B3A-4CE7-8A84-15F50A8D9239}']
    { static Property Methods }

    { static Methods }
    { class } function init: JPoiParaOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/utils/poi/PoiParaOption')]
  JPoiParaOption = interface(JObject)
    ['{C385A942-C4A5-4150-8B6D-772414818A2E}']
    { Property Methods }

    { methods }
    function uid(P1: JString): JPoiParaOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/utils/poi/PoiParaOption;
    function getUid: JString; cdecl; // ()Ljava/lang/String;
    function key(P1: JString): JPoiParaOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/utils/poi/PoiParaOption;
    function getKey: JString; cdecl; // ()Ljava/lang/String;
    function center(P1: JLatLng): JPoiParaOption; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/utils/poi/PoiParaOption;
    function getCenter: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function radius(P1: Integer): JPoiParaOption; cdecl;
    // (I)Lcom/baidu/mapapi/utils/poi/PoiParaOption;
    function getRadius: Integer; cdecl; // ()I

    { Property }
  end;

  TJPoiParaOption = class(TJavaGenericImport<JPoiParaOptionClass,
    JPoiParaOption>)
  end;

  JBaiduMapRoutePlanClass = interface(JObjectClass)
    ['{D1BC4617-DC37-48B0-89B1-900D96B3AE3F}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBaiduMapRoutePlan; cdecl; // ()V
    { class } procedure setSupportWebRoute(P1: Boolean); cdecl; // (Z)V
    { class } function openBaiduMapWalkingRoute(P1: JRouteParaOption;
      P2: JContext): Boolean; cdecl;
    // (Lcom/baidu/mapapi/utils/route/RouteParaOption;Landroid/content/Context;)Z
    { class } function openBaiduMapTransitRoute(P1: JRouteParaOption;
      P2: JContext): Boolean; cdecl;
    // (Lcom/baidu/mapapi/utils/route/RouteParaOption;Landroid/content/Context;)Z
    { class } procedure finish(P1: JContext); cdecl;
    // (Landroid/content/Context;)V
    { class } function openBaiduMapDrivingRoute(P1: JRouteParaOption;
      P2: JContext): Boolean; cdecl;
    // (Lcom/baidu/mapapi/utils/route/RouteParaOption;Landroid/content/Context;)Z

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/utils/route/BaiduMapRoutePlan')]
  JBaiduMapRoutePlan = interface(JObject)
    ['{0930CDE1-6300-4C50-8869-CE770663B81F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBaiduMapRoutePlan = class(TJavaGenericImport<JBaiduMapRoutePlanClass,
    JBaiduMapRoutePlan>)
  end;

  JIllegalRoutePlanArgumentExceptionClass = interface(JRuntimeExceptionClass)
  // or JObjectClass // SuperSignature: java/lang/RuntimeException
    ['{4468739D-B5B9-49B7-8258-DC355184009A}']
    { static Property Methods }

    { static Methods }
    { class } function init: JIllegalRoutePlanArgumentException; cdecl;
      overload; // ()V
    { class } function init(P1: JString): JIllegalRoutePlanArgumentException;
      cdecl; overload; // (Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature
    ('com/baidu/mapapi/utils/route/IllegalRoutePlanArgumentException')]
  JIllegalRoutePlanArgumentException = interface(JRuntimeException)
  // or JObject // SuperSignature: java/lang/RuntimeException
    ['{543D9166-C36E-40EA-B07C-040E730FAF04}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIllegalRoutePlanArgumentException = class
    (TJavaGenericImport<JIllegalRoutePlanArgumentExceptionClass,
    JIllegalRoutePlanArgumentException>)
  end;

  JRouteParaOption_EBusStrategyTypeClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{26F6E372-8559-45D0-A2F8-9A91D46CA5D0}']
    { static Property Methods }
    { class } function _Getbus_time_first: JRouteParaOption_EBusStrategyType;
    // Lcom/baidu/mapapi/utils/route/RouteParaOption$EBusStrategyType;
    { class } function _Getbus_transfer_little
      : JRouteParaOption_EBusStrategyType;
    // Lcom/baidu/mapapi/utils/route/RouteParaOption$EBusStrategyType;
    { class } function _Getbus_walk_little: JRouteParaOption_EBusStrategyType;
    // Lcom/baidu/mapapi/utils/route/RouteParaOption$EBusStrategyType;
    { class } function _Getbus_no_subway: JRouteParaOption_EBusStrategyType;
    // Lcom/baidu/mapapi/utils/route/RouteParaOption$EBusStrategyType;
    { class } function _Getbus_recommend_way: JRouteParaOption_EBusStrategyType;
    // Lcom/baidu/mapapi/utils/route/RouteParaOption$EBusStrategyType;

    { static Methods }
    { class } function values
      : TJavaObjectArray<JRouteParaOption_EBusStrategyType>; cdecl;
    // ()[Lcom/baidu/mapapi/utils/route/RouteParaOption$EBusStrategyType;
    { class } function valueOf(P1: JString): JRouteParaOption_EBusStrategyType;
      cdecl; // (Ljava/lang/String;)Lcom/baidu/mapapi/utils/route/RouteParaOption$EBusStrategyType;

    { static Property }
    { class } property bus_time_first: JRouteParaOption_EBusStrategyType
      read _Getbus_time_first;
    { class } property bus_transfer_little: JRouteParaOption_EBusStrategyType
      read _Getbus_transfer_little;
    { class } property bus_walk_little: JRouteParaOption_EBusStrategyType
      read _Getbus_walk_little;
    { class } property bus_no_subway: JRouteParaOption_EBusStrategyType
      read _Getbus_no_subway;
    { class } property bus_recommend_way: JRouteParaOption_EBusStrategyType
      read _Getbus_recommend_way;
  end;

  [JavaSignature
    ('com/baidu/mapapi/utils/route/RouteParaOption$EBusStrategyType')]
  JRouteParaOption_EBusStrategyType = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{55109E17-D7EC-4EA0-821B-E6275B321AB9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRouteParaOption_EBusStrategyType = class
    (TJavaGenericImport<JRouteParaOption_EBusStrategyTypeClass,
    JRouteParaOption_EBusStrategyType>)
  end;

  JRouteParaOptionClass = interface(JObjectClass)
    ['{E33912EC-5032-43C8-94AC-5F9F6B6F872B}']
    { static Property Methods }

    { static Methods }
    { class } function init: JRouteParaOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/utils/route/RouteParaOption')]
  JRouteParaOption = interface(JObject)
    ['{413CC5A1-4BFB-4223-A0C0-248913CDC9D9}']
    { Property Methods }

    { methods }
    function startPoint(P1: JLatLng): JRouteParaOption; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/utils/route/RouteParaOption;
    function getStartPoint: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function endPoint(P1: JLatLng): JRouteParaOption; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/utils/route/RouteParaOption;
    function getEndPoint: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function startName(P1: JString): JRouteParaOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/utils/route/RouteParaOption;
    function getStartName: JString; cdecl; // ()Ljava/lang/String;
    function endName(P1: JString): JRouteParaOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/utils/route/RouteParaOption;
    function getEndName: JString; cdecl; // ()Ljava/lang/String;
    function busStrategyType(P1: JRouteParaOption_EBusStrategyType)
      : JRouteParaOption; cdecl;
    // (Lcom/baidu/mapapi/utils/route/RouteParaOption$EBusStrategyType;)Lcom/baidu/mapapi/utils/route/RouteParaOption;
    function getBusStrategyType: JRouteParaOption_EBusStrategyType; cdecl;
    // ()Lcom/baidu/mapapi/utils/route/RouteParaOption$EBusStrategyType;
    function cityName(P1: JString): JRouteParaOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/utils/route/RouteParaOption;
    function getCityName: JString; cdecl; // ()Ljava/lang/String;

    { Property }
  end;

  TJRouteParaOption = class(TJavaGenericImport<JRouteParaOptionClass,
    JRouteParaOption>)
  end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.baidu.utils.AreaUtil',
    TypeInfo(Androidapi.JNI.baidu.mapapi.utils.JAreaUtil));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.utils.CoordinateConverter_CoordType',
    TypeInfo(Androidapi.JNI.baidu.mapapi.utils.JCoordinateConverter_CoordType));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.utils.CoordinateConverter',
    TypeInfo(Androidapi.JNI.baidu.mapapi.utils.JCoordinateConverter));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.utils.DistanceUtil',
    TypeInfo(Androidapi.JNI.baidu.mapapi.utils.JDistanceUtil));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.utils.OpenClientUtil',
    TypeInfo(Androidapi.JNI.baidu.mapapi.utils.JOpenClientUtil));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.utils.SpatialRelationUtil',
    TypeInfo(Androidapi.JNI.baidu.mapapi.utils.JSpatialRelationUtil));

  TRegTypes.RegisterType('Androidapi.JNI.baidu.utils.poi.BaiduMapPoiSearch',
    TypeInfo(Androidapi.JNI.baidu.mapapi.utils.JBaiduMapPoiSearch));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.utils.poi.DispathcPoiData',
    TypeInfo(Androidapi.JNI.baidu.mapapi.utils.JDispathcPoiData));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.utils.poi.IllegalPoiSearchArgumentException',
    TypeInfo(Androidapi.JNI.baidu.mapapi.utils.
    JIllegalPoiSearchArgumentException));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.utils.poi.PoiParaOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.utils.JPoiParaOption));

  TRegTypes.RegisterType('Androidapi.JNI.baidu.utils.route.BaiduMapRoutePlan',
    TypeInfo(Androidapi.JNI.baidu.mapapi.utils.JBaiduMapRoutePlan));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.utils.route.IllegalRoutePlanArgumentException',
    TypeInfo(Androidapi.JNI.baidu.mapapi.utils.
    JIllegalRoutePlanArgumentException));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.utils.route.RouteParaOption_EBusStrategyType',
    TypeInfo(Androidapi.JNI.baidu.mapapi.utils.
    JRouteParaOption_EBusStrategyType));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.utils.route.RouteParaOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.utils.JRouteParaOption));
end;

initialization

RegisterTypes;

end.
