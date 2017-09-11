unit Androidapi.JNI.baidu.mapapi.cloud;
// ====================================================
// Android Baidu Map SDK interface
// Package:com.baidu.mapapi.cloud
// author:Xubzhlin
// email:371889755@qq.com
//
// date:2017.5.10
// version:4.3.0
// ====================================================

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.baidu.mapapi.model;

type
  // ===== Forward declarations =====
  JBaseCloudSearchInfo = interface;
  // com.baidu.mapapi.cloud.BaseCloudSearchInfo
  JBaseSearchInfo = interface; // com.baidu.mapapi.cloud.BaseSearchInfo
  JBaseSearchResult = interface; // com.baidu.mapapi.cloud.BaseSearchResult
  JBoundSearchInfo = interface; // com.baidu.mapapi.cloud.BoundSearchInfo
  JCloudEvent_ErrorNo = interface; // com.baidu.mapapi.cloud.CloudEvent$ErrorNo
  JCloudEvent = interface; // com.baidu.mapapi.cloud.CloudEvent
  JCloudListener = interface; // com.baidu.mapapi.cloud.CloudListener
  JCloudManager = interface; // com.baidu.mapapi.cloud.CloudManager
  JCloudPoiInfo = interface; // com.baidu.mapapi.cloud.CloudPoiInfo
  JCloudRgcInfo = interface; // com.baidu.mapapi.cloud.CloudRgcInfo
  JCloudRgcResult_AddressCompents = interface;
  // com.baidu.mapapi.cloud.CloudRgcResult$AddressCompents
  JCloudRgcResult_PoiInfo = interface;
  // com.baidu.mapapi.cloud.CloudRgcResult$PoiInfo
  JCloudRgcResult = interface; // com.baidu.mapapi.cloud.CloudRgcResult
  JCloudSearchResult = interface; // com.baidu.mapapi.cloud.CloudSearchResult
  JDetailSearchInfo = interface; // com.baidu.mapapi.cloud.DetailSearchInfo
  JDetailSearchResult = interface; // com.baidu.mapapi.cloud.DetailSearchResult
  JLocalSearchInfo = interface; // com.baidu.mapapi.cloud.LocalSearchInfo
  JNearbySearchInfo = interface; // com.baidu.mapapi.cloud.NearbySearchInfo
  JVersionInfo = interface; // com.baidu.mapapi.cloud.VersionInfo

  // ===== Interface declarations =====

  JBaseSearchInfoClass = interface(JObjectClass)
    ['{220FEAD0-6C4F-4742-BDFE-D39C8E007782}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBaseSearchInfo; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/cloud/BaseSearchInfo')]
  JBaseSearchInfo = interface(JObject)
    ['{FAD57ACF-F7E1-4684-85FB-E7C42D083F9A}']
    { Property Methods }
    function _Getak: JString; // Ljava/lang/String;
    procedure _Setak(aak: JString); // (Ljava/lang/String;)V
    function _GetgeoTableId: Integer; // I
    procedure _SetgeoTableId(ageoTableId: Integer); // (I)V
    function _Getsn: JString; // Ljava/lang/String;
    procedure _Setsn(asn: JString); // (Ljava/lang/String;)V

    { methods }

    { Property }
    property ak: JString read _Getak write _Setak;
    property geoTableId: Integer read _GetgeoTableId write _SetgeoTableId;
    property sn: JString read _Getsn write _Setsn;
  end;

  TJBaseSearchInfo = class(TJavaGenericImport<JBaseSearchInfoClass,
    JBaseSearchInfo>)
  end;

  JBaseCloudSearchInfoClass = interface(JBaseSearchInfoClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/cloud/BaseSearchInfo
    ['{8A50B310-4234-4E3C-B1DB-40A0197F861B}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBaseCloudSearchInfo; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/cloud/BaseCloudSearchInfo')]
  JBaseCloudSearchInfo = interface(JBaseSearchInfo)
  // or JObject // SuperSignature: com/baidu/mapapi/cloud/BaseSearchInfo
    ['{C7B4F8A1-5DC4-4781-9A6D-8B9B0F15045E}']
    { Property Methods }
    function _Getq: JString; // Ljava/lang/String;
    procedure _Setq(aq: JString); // (Ljava/lang/String;)V
    function _Gettags: JString; // Ljava/lang/String;
    procedure _Settags(atags: JString); // (Ljava/lang/String;)V
    function _Getsortby: JString; // Ljava/lang/String;
    procedure _Setsortby(asortby: JString); // (Ljava/lang/String;)V
    function _Getfilter: JString; // Ljava/lang/String;
    procedure _Setfilter(afilter: JString); // (Ljava/lang/String;)V
    function _GetpageIndex: Integer; // I
    procedure _SetpageIndex(apageIndex: Integer); // (I)V
    function _GetpageSize: Integer; // I
    procedure _SetpageSize(apageSize: Integer); // (I)V

    { methods }

    { Property }
    property q: JString read _Getq write _Setq;
    property tags: JString read _Gettags write _Settags;
    property sortby: JString read _Getsortby write _Setsortby;
    property filter: JString read _Getfilter write _Setfilter;
    property pageIndex: Integer read _GetpageIndex write _SetpageIndex;
    property pageSize: Integer read _GetpageSize write _SetpageSize;
  end;

  TJBaseCloudSearchInfo = class(TJavaGenericImport<JBaseCloudSearchInfoClass,
    JBaseCloudSearchInfo>)
  end;

  JBaseSearchResultClass = interface(JObjectClass)
    ['{CDA43A95-405C-4FF8-B35B-03D9A1EA6BF4}']
    { static Property Methods }
    { class } function _GetSTATUS_CODE_SUCCEED: Integer; // I
    { class } function _GetSTATUS_CODE_RESULT_NOTFOUND: Integer; // I
    { class } function _GetSTATUS_CODE_NETWORK_ERROR: Integer; // I
    { class } function _GetSTATUS_CODE_NETWORK_TIME_OUT: Integer; // I
    { class } function _GetSTATUS_CODE_PERMISSION_UNFINISHED: Integer; // I
    { class } function _GetSTATUS_CODE_SEARVER_ERROR: Integer; // I
    { class } function _GetSTATUS_CODE_PARAM_ERROR: Integer; // I

    { static Methods }
    { class } function init: JBaseSearchResult; cdecl; // ()V

    { static Property }
    { class } property STATUS_CODE_SUCCEED: Integer
      read _GetSTATUS_CODE_SUCCEED;
    { class } property STATUS_CODE_RESULT_NOTFOUND: Integer
      read _GetSTATUS_CODE_RESULT_NOTFOUND;
    { class } property STATUS_CODE_NETWORK_ERROR: Integer
      read _GetSTATUS_CODE_NETWORK_ERROR;
    { class } property STATUS_CODE_NETWORK_TIME_OUT: Integer
      read _GetSTATUS_CODE_NETWORK_TIME_OUT;
    { class } property STATUS_CODE_PERMISSION_UNFINISHED: Integer
      read _GetSTATUS_CODE_PERMISSION_UNFINISHED;
    { class } property STATUS_CODE_SEARVER_ERROR: Integer
      read _GetSTATUS_CODE_SEARVER_ERROR;
    { class } property STATUS_CODE_PARAM_ERROR: Integer
      read _GetSTATUS_CODE_PARAM_ERROR;
  end;

  [JavaSignature('com/baidu/mapapi/cloud/BaseSearchResult')]
  JBaseSearchResult = interface(JObject)
    ['{73FFC57E-7005-4B84-89D2-36A4FFCE8FF7}']
    { Property Methods }
    function _Getstatus: Integer; // I
    procedure _Setstatus(astatus: Integer); // (I)V
    function _Getsize: Integer; // I
    procedure _Setsize(asize: Integer); // (I)V
    function _Gettotal: Integer; // I
    procedure _Settotal(atotal: Integer); // (I)V

    { methods }
    procedure parseFromJSON(P1: JJSONObject); cdecl; // (Lorg/json/JSONObject;)V

    { Property }
    property status: Integer read _Getstatus write _Setstatus;
    property size: Integer read _Getsize write _Setsize;
    property total: Integer read _Gettotal write _Settotal;
  end;

  TJBaseSearchResult = class(TJavaGenericImport<JBaseSearchResultClass,
    JBaseSearchResult>)
  end;

  JBoundSearchInfoClass = interface(JBaseCloudSearchInfoClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/cloud/BaseCloudSearchInfo
    ['{FC1D2486-8C6C-457C-99AF-7B33F9DC4292}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBoundSearchInfo; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/cloud/BoundSearchInfo')]
  JBoundSearchInfo = interface(JBaseCloudSearchInfo)
  // or JObject // SuperSignature: com/baidu/mapapi/cloud/BaseCloudSearchInfo
    ['{4AEB8C49-94D0-4DB7-9CF2-E4E6919E9AA5}']
    { Property Methods }
    function _Getbound: JString; // Ljava/lang/String;
    procedure _Setbound(abound: JString); // (Ljava/lang/String;)V

    { methods }

    { Property }
    property bound: JString read _Getbound write _Setbound;
  end;

  TJBoundSearchInfo = class(TJavaGenericImport<JBoundSearchInfoClass,
    JBoundSearchInfo>)
  end;

  JCloudEvent_ErrorNoClass = interface(JObjectClass)
    ['{8B2FAB87-8364-48B6-A8F5-84B8816C5129}']
    { static Property Methods }
    { class } function _GetSTATUS_CODE_SERVER_ERROR_INTERVAL: Integer; // I
    { class } function _GetSTATUS_CODE_PERMISSION_UNFINISHED: Integer; // I
    { class } function _GetSTATUS_CODE_NETWORK_ERROR: Integer; // I
    { class } function _GetSTATUS_CODE_NETWORK_TIME_OUT: Integer; // I
    { class } function _GetSTATUS_CODE_RESULT_NOTFOUND: Integer; // I

    { static Methods }
    { class } function init(P1: JCloudEvent): JCloudEvent_ErrorNo; cdecl;
    // (Lcom/baidu/mapapi/cloud/CloudEvent;)V

    { static Property }
    { class } property STATUS_CODE_SERVER_ERROR_INTERVAL: Integer
      read _GetSTATUS_CODE_SERVER_ERROR_INTERVAL;
    { class } property STATUS_CODE_PERMISSION_UNFINISHED: Integer
      read _GetSTATUS_CODE_PERMISSION_UNFINISHED;
    { class } property STATUS_CODE_NETWORK_ERROR: Integer
      read _GetSTATUS_CODE_NETWORK_ERROR;
    { class } property STATUS_CODE_NETWORK_TIME_OUT: Integer
      read _GetSTATUS_CODE_NETWORK_TIME_OUT;
    { class } property STATUS_CODE_RESULT_NOTFOUND: Integer
      read _GetSTATUS_CODE_RESULT_NOTFOUND;
  end;

  [JavaSignature('com/baidu/mapapi/cloud/CloudEvent$ErrorNo')]
  JCloudEvent_ErrorNo = interface(JObject)
    ['{010A5D9C-D7CB-45D7-A6AD-24AEBDDF8968}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCloudEvent_ErrorNo = class(TJavaGenericImport<JCloudEvent_ErrorNoClass,
    JCloudEvent_ErrorNo>)
  end;

  JCloudEventClass = interface(JObjectClass)
    ['{44546034-3F77-4458-A76C-5EDC100017A9}']
    { static Property Methods }

    { static Methods }
    { class } function init: JCloudEvent; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/cloud/CloudEvent')]
  JCloudEvent = interface(JObject)
    ['{8BDF1C63-0BE4-4C0C-A363-EFFE58981BBB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCloudEvent = class(TJavaGenericImport<JCloudEventClass, JCloudEvent>)
  end;

  JCloudListenerClass = interface(JObjectClass)
    ['{7E88514B-99D3-4681-BDD0-8489302ACDB8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/cloud/CloudListener')]
  JCloudListener = interface(IJavaInstance)
    ['{D09E0676-EFAE-494D-90E2-1D4E0BEE947E}']
    { Property Methods }

    { methods }
    procedure onGetSearchResult(P1: JCloudSearchResult; P2: Integer); cdecl;
    // (Lcom/baidu/mapapi/cloud/CloudSearchResult;I)V
    procedure onGetDetailSearchResult(P1: JDetailSearchResult; P2: Integer);
      cdecl; // (Lcom/baidu/mapapi/cloud/DetailSearchResult;I)V
    procedure onGetCloudRgcResult(P1: JCloudRgcResult; P2: Integer); cdecl;
    // (Lcom/baidu/mapapi/cloud/CloudRgcResult;I)V

    { Property }
  end;

  TJCloudListener = class(TJavaGenericImport<JCloudListenerClass,
    JCloudListener>)
  end;

  JCloudManagerClass = interface(JObjectClass)
    ['{2F68057A-CD1E-4D71-9D6F-23EECD7CB20E}']
    { static Property Methods }

    { static Methods }
    { class } function init: JCloudManager; cdecl; // ()V
    { class } function getInstance: JCloudManager; cdecl;
    // ()Lcom/baidu/mapapi/cloud/CloudManager;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/cloud/CloudManager')]
  JCloudManager = interface(JObject)
    ['{996AD513-E0F5-435C-A6DF-4E9611508403}']
    { Property Methods }

    { methods }
    procedure init(P1: JCloudListener); cdecl;
    // (Lcom/baidu/mapapi/cloud/CloudListener;)V
    procedure destroy; cdecl; // ()V
    function localSearch(P1: JLocalSearchInfo): Boolean; cdecl;
    // (Lcom/baidu/mapapi/cloud/LocalSearchInfo;)Z
    function nearbySearch(P1: JNearbySearchInfo): Boolean; cdecl;
    // (Lcom/baidu/mapapi/cloud/NearbySearchInfo;)Z
    function boundSearch(P1: JBoundSearchInfo): Boolean; cdecl;
    // (Lcom/baidu/mapapi/cloud/BoundSearchInfo;)Z
    function detailSearch(P1: JDetailSearchInfo): Boolean; cdecl;
    // (Lcom/baidu/mapapi/cloud/DetailSearchInfo;)Z
    function rgcSearch(P1: JCloudRgcInfo): Boolean; cdecl;
    // (Lcom/baidu/mapapi/cloud/CloudRgcInfo;)Z

    { Property }
  end;

  TJCloudManager = class(TJavaGenericImport<JCloudManagerClass, JCloudManager>)
  end;

  JCloudPoiInfoClass = interface(JObjectClass)
    ['{1A00006C-2F88-4B4A-B16B-2A81902E8C31}']
    { static Property Methods }

    { static Methods }
    { class } function init: JCloudPoiInfo; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/cloud/CloudPoiInfo')]
  JCloudPoiInfo = interface(JObject)
    ['{312A7C54-DD68-43F5-96AF-D8B430F04BC0}']
    { Property Methods }
    function _Getuid: Integer; // I
    procedure _Setuid(auid: Integer); // (I)V
    function _GetgeoTableId: Integer; // I
    procedure _SetgeoTableId(ageoTableId: Integer); // (I)V
    function _Gettitle: JString; // Ljava/lang/String;
    procedure _Settitle(atitle: JString); // (Ljava/lang/String;)V
    function _Getaddress: JString; // Ljava/lang/String;
    procedure _Setaddress(aaddress: JString); // (Ljava/lang/String;)V
    function _Getprovince: JString; // Ljava/lang/String;
    procedure _Setprovince(aprovince: JString); // (Ljava/lang/String;)V
    function _Getcity: JString; // Ljava/lang/String;
    procedure _Setcity(acity: JString); // (Ljava/lang/String;)V
    function _Getdistrict: JString; // Ljava/lang/String;
    procedure _Setdistrict(adistrict: JString); // (Ljava/lang/String;)V
    function _Getlatitude: Double; // D
    procedure _Setlatitude(alatitude: Double); // (D)V
    function _Getlongitude: Double; // D
    procedure _Setlongitude(alongitude: Double); // (D)V
    function _Gettags: JString; // Ljava/lang/String;
    procedure _Settags(atags: JString); // (Ljava/lang/String;)V
    function _Getdistance: Integer; // I
    procedure _Setdistance(adistance: Integer); // (I)V
    function _Getdirection: JString; // Ljava/lang/String;
    procedure _Setdirection(adirection: JString); // (Ljava/lang/String;)V
    function _Getweight: Integer; // I
    procedure _Setweight(aweight: Integer); // (I)V
    function _Getextras: JMap; // Ljava/util/Map;
    procedure _Setextras(aextras: JMap); // (Ljava/util/Map;)V

    { methods }

    { Property }
    property uid: Integer read _Getuid write _Setuid;
    property geoTableId: Integer read _GetgeoTableId write _SetgeoTableId;
    property title: JString read _Gettitle write _Settitle;
    property address: JString read _Getaddress write _Setaddress;
    property province: JString read _Getprovince write _Setprovince;
    property city: JString read _Getcity write _Setcity;
    property district: JString read _Getdistrict write _Setdistrict;
    property latitude: Double read _Getlatitude write _Setlatitude;
    property longitude: Double read _Getlongitude write _Setlongitude;
    property tags: JString read _Gettags write _Settags;
    property distance: Integer read _Getdistance write _Setdistance;
    property direction: JString read _Getdirection write _Setdirection;
    property weight: Integer read _Getweight write _Setweight;
    property extras: JMap read _Getextras write _Setextras;
  end;

  TJCloudPoiInfo = class(TJavaGenericImport<JCloudPoiInfoClass, JCloudPoiInfo>)
  end;

  JCloudRgcInfoClass = interface(JObjectClass)
    ['{6589860D-CFAC-4572-972E-D3E00696F83A}']
    { static Property Methods }

    { static Methods }
    { class } function init: JCloudRgcInfo; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/cloud/CloudRgcInfo')]
  JCloudRgcInfo = interface(JObject)
    ['{8E3742A0-4406-4775-903B-EB27937D5921}']
    { Property Methods }
    function _Getlocation: JString; // Ljava/lang/String;
    procedure _Setlocation(alocation: JString); // (Ljava/lang/String;)V
    function _GetgeoTableId: Integer; // I
    procedure _SetgeoTableId(ageoTableId: Integer); // (I)V

    { methods }

    { Property }
    property location: JString read _Getlocation write _Setlocation;
    property geoTableId: Integer read _GetgeoTableId write _SetgeoTableId;
  end;

  TJCloudRgcInfo = class(TJavaGenericImport<JCloudRgcInfoClass, JCloudRgcInfo>)
  end;

  JCloudRgcResult_AddressCompentsClass = interface(JObjectClass)
    ['{20443C2B-A32E-4D91-81AC-58A72BFA4F8F}']
    { static Property Methods }

    { static Methods }
    { class } function init(P1: JCloudRgcResult)
      : JCloudRgcResult_AddressCompents; cdecl;
    // (Lcom/baidu/mapapi/cloud/CloudRgcResult;)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/cloud/CloudRgcResult$AddressCompents')]
  JCloudRgcResult_AddressCompents = interface(JObject)
    ['{CBC999C3-E9A9-4150-86CF-42E014A9E1E0}']
    { Property Methods }
    function _Getcountry: JString; // Ljava/lang/String;
    procedure _Setcountry(acountry: JString); // (Ljava/lang/String;)V
    function _Getprovince: JString; // Ljava/lang/String;
    procedure _Setprovince(aprovince: JString); // (Ljava/lang/String;)V
    function _Getcity: JString; // Ljava/lang/String;
    procedure _Setcity(acity: JString); // (Ljava/lang/String;)V
    function _Getdistrict: JString; // Ljava/lang/String;
    procedure _Setdistrict(adistrict: JString); // (Ljava/lang/String;)V
    function _Getstreet: JString; // Ljava/lang/String;
    procedure _Setstreet(astreet: JString); // (Ljava/lang/String;)V
    function _GetstreetNumber: JString; // Ljava/lang/String;
    procedure _SetstreetNumber(astreetNumber: JString); // (Ljava/lang/String;)V
    function _GetadminAreaCode: Integer; // I
    procedure _SetadminAreaCode(aadminAreaCode: Integer); // (I)V
    function _GetcountryCode: JString; // Ljava/lang/String;
    procedure _SetcountryCode(acountryCode: JString); // (Ljava/lang/String;)V

    { methods }

    { Property }
    property country: JString read _Getcountry write _Setcountry;
    property province: JString read _Getprovince write _Setprovince;
    property city: JString read _Getcity write _Setcity;
    property district: JString read _Getdistrict write _Setdistrict;
    property street: JString read _Getstreet write _Setstreet;
    property streetNumber: JString read _GetstreetNumber write _SetstreetNumber;
    property adminAreaCode: Integer read _GetadminAreaCode
      write _SetadminAreaCode;
    property countryCode: JString read _GetcountryCode write _SetcountryCode;
  end;

  TJCloudRgcResult_AddressCompents = class
    (TJavaGenericImport<JCloudRgcResult_AddressCompentsClass,
    JCloudRgcResult_AddressCompents>)
  end;

  JCloudRgcResult_PoiInfoClass = interface(JObjectClass)
    ['{F7E688C4-9A6D-455B-A8F3-1EB8A54C4E97}']
    { static Property Methods }

    { static Methods }
    { class } function init(P1: JCloudRgcResult): JCloudRgcResult_PoiInfo;
      cdecl; // (Lcom/baidu/mapapi/cloud/CloudRgcResult;)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/cloud/CloudRgcResult$PoiInfo')]
  JCloudRgcResult_PoiInfo = interface(JObject)
    ['{D14231F5-10F8-4E01-9568-B6048B4E49E2}']
    { Property Methods }
    function _Getname: JString; // Ljava/lang/String;
    procedure _Setname(aname: JString); // (Ljava/lang/String;)V
    function _Getuid: JString; // Ljava/lang/String;
    procedure _Setuid(auid: JString); // (Ljava/lang/String;)V
    function _Getaddress: JString; // Ljava/lang/String;
    procedure _Setaddress(aaddress: JString); // (Ljava/lang/String;)V
    function _Gettag: JString; // Ljava/lang/String;
    procedure _Settag(atag: JString); // (Ljava/lang/String;)V
    function _Getlocation: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _Setlocation(alocation: JLatLng);
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function _Getdirection: JString; // Ljava/lang/String;
    procedure _Setdirection(adirection: JString); // (Ljava/lang/String;)V
    function _Getdistance: Integer; // I
    procedure _Setdistance(adistance: Integer); // (I)V

    { methods }
    procedure parseFromJSON(P1: JJSONObject); cdecl; // (Lorg/json/JSONObject;)V

    { Property }
    property name: JString read _Getname write _Setname;
    property uid: JString read _Getuid write _Setuid;
    property address: JString read _Getaddress write _Setaddress;
    property tag: JString read _Gettag write _Settag;
    property location: JLatLng read _Getlocation write _Setlocation;
    property direction: JString read _Getdirection write _Setdirection;
    property distance: Integer read _Getdistance write _Setdistance;
  end;

  TJCloudRgcResult_PoiInfo = class
    (TJavaGenericImport<JCloudRgcResult_PoiInfoClass, JCloudRgcResult_PoiInfo>)
  end;

  JCloudRgcResultClass = interface(JObjectClass)
    ['{8E19DE02-CCDC-407A-A377-2C3B552725C5}']
    { static Property Methods }

    { static Methods }
    { class } function init: JCloudRgcResult; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/cloud/CloudRgcResult')]
  JCloudRgcResult = interface(JObject)
    ['{433BA0F7-9531-48B2-9C23-ECF225C3D415}']
    { Property Methods }
    function _Getstatus: Integer; // I
    procedure _Setstatus(astatus: Integer); // (I)V
    function _Getmessage: JString; // Ljava/lang/String;
    procedure _Setmessage(amessage: JString); // (Ljava/lang/String;)V
    function _Getlocation: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _Setlocation(alocation: JLatLng);
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function _GetaddressCompents: JCloudRgcResult_AddressCompents;
    // Lcom/baidu/mapapi/cloud/CloudRgcResult$AddressCompents;
    procedure _SetaddressCompents(aaddressCompents
      : JCloudRgcResult_AddressCompents);
    // (Lcom/baidu/mapapi/cloud/CloudRgcResult$AddressCompents;)V
    function _GetformattedAddress: JString; // Ljava/lang/String;
    procedure _SetformattedAddress(aformattedAddress: JString);
    // (Ljava/lang/String;)V
    function _Getpois: JList; // Ljava/util/List;
    procedure _Setpois(apois: JList); // (Ljava/util/List;)V
    function _GetcustomPois: JList; // Ljava/util/List;
    procedure _SetcustomPois(acustomPois: JList); // (Ljava/util/List;)V
    function _GetcustomLocationDescription: JString; // Ljava/lang/String;
    procedure _SetcustomLocationDescription(acustomLocationDescription
      : JString); // (Ljava/lang/String;)V
    function _GetrecommendedLocationDescription: JString; // Ljava/lang/String;
    procedure _SetrecommendedLocationDescription(arecommendedLocationDescription
      : JString); // (Ljava/lang/String;)V

    { methods }
    procedure parseFromJSON(P1: JJSONObject); cdecl; // (Lorg/json/JSONObject;)V

    { Property }
    property status: Integer read _Getstatus write _Setstatus;
    property &message: JString read _Getmessage write _Setmessage;
    property location: JLatLng read _Getlocation write _Setlocation;
    property addressCompents: JCloudRgcResult_AddressCompents
      read _GetaddressCompents write _SetaddressCompents;
    property formattedAddress: JString read _GetformattedAddress
      write _SetformattedAddress;
    property pois: JList read _Getpois write _Setpois;
    property customPois: JList read _GetcustomPois write _SetcustomPois;
    property customLocationDescription: JString
      read _GetcustomLocationDescription write _SetcustomLocationDescription;
    property recommendedLocationDescription: JString
      read _GetrecommendedLocationDescription
      write _SetrecommendedLocationDescription;
  end;

  TJCloudRgcResult = class(TJavaGenericImport<JCloudRgcResultClass,
    JCloudRgcResult>)
  end;

  JCloudSearchResultClass = interface(JBaseSearchResultClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/cloud/BaseSearchResult
    ['{7352203E-9110-4927-8999-7A525CA91562}']
    { static Property Methods }

    { static Methods }
    { class } function init: JCloudSearchResult; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/cloud/CloudSearchResult')]
  JCloudSearchResult = interface(JBaseSearchResult)
  // or JObject // SuperSignature: com/baidu/mapapi/cloud/BaseSearchResult
    ['{698F8950-BDA2-46C3-9E5B-06F3953E05EA}']
    { Property Methods }
    function _GetpoiList: JList; // Ljava/util/List;
    procedure _SetpoiList(apoiList: JList); // (Ljava/util/List;)V

    { methods }
    procedure parseFromJSON(P1: JJSONObject); cdecl; // (Lorg/json/JSONObject;)V

    { Property }
    property poiList: JList read _GetpoiList write _SetpoiList;
  end;

  TJCloudSearchResult = class(TJavaGenericImport<JCloudSearchResultClass,
    JCloudSearchResult>)
  end;

  JDetailSearchInfoClass = interface(JBaseSearchInfoClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/cloud/BaseSearchInfo
    ['{174A028F-83CD-4A24-A5C4-B5B7569D7192}']
    { static Property Methods }

    { static Methods }
    { class } function init: JDetailSearchInfo; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/cloud/DetailSearchInfo')]
  JDetailSearchInfo = interface(JBaseSearchInfo)
  // or JObject // SuperSignature: com/baidu/mapapi/cloud/BaseSearchInfo
    ['{F71641B7-BA1C-450B-98ED-5DCE5FEA8098}']
    { Property Methods }
    function _Getuid: Integer; // I
    procedure _Setuid(auid: Integer); // (I)V

    { methods }

    { Property }
    property uid: Integer read _Getuid write _Setuid;
  end;

  TJDetailSearchInfo = class(TJavaGenericImport<JDetailSearchInfoClass,
    JDetailSearchInfo>)
  end;

  JDetailSearchResultClass = interface(JBaseSearchResultClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/cloud/BaseSearchResult
    ['{FA39007E-99DA-4313-8AAA-D1DDCBF99B89}']
    { static Property Methods }

    { static Methods }
    { class } function init: JDetailSearchResult; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/cloud/DetailSearchResult')]
  JDetailSearchResult = interface(JBaseSearchResult)
  // or JObject // SuperSignature: com/baidu/mapapi/cloud/BaseSearchResult
    ['{11DBE823-0463-4AFA-821B-394325EEDF2D}']
    { Property Methods }
    function _GetpoiInfo: JCloudPoiInfo;
    // Lcom/baidu/mapapi/cloud/CloudPoiInfo;
    procedure _SetpoiInfo(apoiInfo: JCloudPoiInfo);
    // (Lcom/baidu/mapapi/cloud/CloudPoiInfo;)V

    { methods }
    procedure parseFromJSON(P1: JJSONObject); cdecl; // (Lorg/json/JSONObject;)V

    { Property }
    property poiInfo: JCloudPoiInfo read _GetpoiInfo write _SetpoiInfo;
  end;

  TJDetailSearchResult = class(TJavaGenericImport<JDetailSearchResultClass,
    JDetailSearchResult>)
  end;

  JLocalSearchInfoClass = interface(JBaseCloudSearchInfoClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/cloud/BaseCloudSearchInfo
    ['{C5CE632B-A264-418F-9B78-0B9BE8B8F7F9}']
    { static Property Methods }

    { static Methods }
    { class } function init: JLocalSearchInfo; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/cloud/LocalSearchInfo')]
  JLocalSearchInfo = interface(JBaseCloudSearchInfo)
  // or JObject // SuperSignature: com/baidu/mapapi/cloud/BaseCloudSearchInfo
    ['{D3FA4D09-F9DA-4F9A-A77F-E0B703EB4990}']
    { Property Methods }
    function _Getregion: JString; // Ljava/lang/String;
    procedure _Setregion(aregion: JString); // (Ljava/lang/String;)V

    { methods }

    { Property }
    property region: JString read _Getregion write _Setregion;
  end;

  TJLocalSearchInfo = class(TJavaGenericImport<JLocalSearchInfoClass,
    JLocalSearchInfo>)
  end;

  JNearbySearchInfoClass = interface(JBaseCloudSearchInfoClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/cloud/BaseCloudSearchInfo
    ['{8FA55B6C-7430-4FE0-8221-8D19A8F1CB8D}']
    { static Property Methods }

    { static Methods }
    { class } function init: JNearbySearchInfo; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/cloud/NearbySearchInfo')]
  JNearbySearchInfo = interface(JBaseCloudSearchInfo)
  // or JObject // SuperSignature: com/baidu/mapapi/cloud/BaseCloudSearchInfo
    ['{5A36A3E4-D4AA-4376-BD3F-1319DE529542}']
    { Property Methods }
    function _Getlocation: JString; // Ljava/lang/String;
    procedure _Setlocation(alocation: JString); // (Ljava/lang/String;)V
    function _Getradius: Integer; // I
    procedure _Setradius(aradius: Integer); // (I)V

    { methods }

    { Property }
    property location: JString read _Getlocation write _Setlocation;
    property radius: Integer read _Getradius write _Setradius;
  end;

  TJNearbySearchInfo = class(TJavaGenericImport<JNearbySearchInfoClass,
    JNearbySearchInfo>)
  end;

  JVersionInfoClass = interface(JObjectClass)
    ['{A506B021-FAFA-4543-9B6E-273198FEEB24}']
    { static Property Methods }
    { class } function _GetVERSION_DESC: JString; // Ljava/lang/String;
    { class } function _GetKIT_NAME: JString; // Ljava/lang/String;

    { static Methods }
    { class } function init: JVersionInfo; cdecl; // ()V
    { class } function getApiVersion: JString; cdecl; // ()Ljava/lang/String;
    { class } function getVersionDesc: JString; cdecl; // ()Ljava/lang/String;
    { class } function getKitName: JString; cdecl; // ()Ljava/lang/String;

    { static Property }
    { class } property VERSION_DESC: JString read _GetVERSION_DESC;
    { class } property KIT_NAME: JString read _GetKIT_NAME;
  end;

  [JavaSignature('com/baidu/mapapi/cloud/VersionInfo')]
  JVersionInfo = interface(JObject)
    ['{491C70D3-8B28-4676-B6FE-D57DF0398485}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJVersionInfo = class(TJavaGenericImport<JVersionInfoClass, JVersionInfo>)
  end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.cloud.BaseSearchInfoClass',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.JBaseSearchInfoClass));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.cloud.BaseSearchInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.JBaseSearchInfo));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.cloud.BaseSearchResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.JBaseSearchResult));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.cloud.BoundSearchInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.JBoundSearchInfo));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.cloud.CloudEvent_ErrorNo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.JCloudEvent_ErrorNo));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.cloud.CloudEvent',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.JCloudEvent));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.cloud.CloudListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.JCloudListener));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.cloud.CloudManager',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.JCloudManager));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.cloud.CloudPoiInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.JCloudPoiInfo));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.cloud.CloudRgcInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.JCloudRgcInfo));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.cloud.CloudRgcResult_AddressCompents',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.
    JCloudRgcResult_AddressCompents));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.cloud.CloudRgcResult_PoiInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.JCloudRgcResult_PoiInfo));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.cloud.CloudRgcResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.JCloudRgcResult));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.cloud.CloudSearchResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.JCloudSearchResult));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.cloud.DetailSearchInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.JDetailSearchInfo));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.cloud.DetailSearchResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.JDetailSearchResult));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.cloud.LocalSearchInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.JLocalSearchInfo));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.cloud.NearbySearchInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.JNearbySearchInfo));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.cloud.VersionInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.cloud.JVersionInfo));
end;

initialization

RegisterTypes;

end.
