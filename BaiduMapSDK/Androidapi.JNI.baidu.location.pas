unit Androidapi.JNI.baidu.location;
// ====================================================
// Android Baidu Map SDK interface
// Package:com.baidu.location
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
  Androidapi.JNI.location,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes;

type
  // ===== Forward declarations =====
  JAddress_Builder = interface; // com.baidu.location.Address$Builder
  JAddress = interface; // com.baidu.location.Address
  JBDLocation = interface; // com.baidu.location.BDLocation
  JBDLocationListener = interface; // com.baidu.location.BDLocationListener
  JJni = interface; // com.baidu.location.Jni
  JLLSInterface = interface; // com.baidu.location.LLSInterface
  JLocationClient = interface; // com.baidu.location.LocationClient
  JLocationClientOption_LocationMode = interface;
  // com.baidu.location.LocationClientOption$LocationMode
  JLocationClientOption = interface; // com.baidu.location.LocationClientOption
  JPoi = interface; // com.baidu.location.Poi

  // ===== Interface declarations =====
  JAddress_BuilderClass = interface(JObjectClass)
    ['{18C38796-BD09-457B-ABD4-DC4468D4974F}']
    { static Property Methods }

    { static Methods }
    { class } function init: JAddress_Builder; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/location/Address$Builder')]
  JAddress_Builder = interface(JObject)
    ['{70B013EA-D424-4F39-BBFD-3B06CDFF963C}']
    { Property Methods }

    { methods }
    function country(P1: JString): JAddress_Builder; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/location/Address$Builder;
    function countryCode(P1: JString): JAddress_Builder; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/location/Address$Builder;
    function province(P1: JString): JAddress_Builder; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/location/Address$Builder;
    function city(P1: JString): JAddress_Builder; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/location/Address$Builder;
    function cityCode(P1: JString): JAddress_Builder; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/location/Address$Builder;
    function district(P1: JString): JAddress_Builder; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/location/Address$Builder;
    function street(P1: JString): JAddress_Builder; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/location/Address$Builder;
    function streetNumber(P1: JString): JAddress_Builder; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/location/Address$Builder;
    function build: JAddress; cdecl; // ()Lcom/baidu/location/Address;

    { Property }
  end;

  TJAddress_Builder = class(TJavaGenericImport<JAddress_BuilderClass,
    JAddress_Builder>)
  end;

  JAddressClass = interface(JObjectClass)
    ['{E5847AB4-6C7B-4DDE-8238-FA00711FAF12}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/location/Address')]
  JAddress = interface(JObject)
    ['{2F81FF92-5423-47E3-A267-3E932816D510}']
    { Property Methods }
    function _Getcountry: JString; // Ljava/lang/String;
    procedure _Setcountry(acountry: JString); // (Ljava/lang/String;)V
    function _GetcountryCode: JString; // Ljava/lang/String;
    procedure _SetcountryCode(acountryCode: JString); // (Ljava/lang/String;)V
    function _Getprovince: JString; // Ljava/lang/String;
    procedure _Setprovince(aprovince: JString); // (Ljava/lang/String;)V
    function _Getcity: JString; // Ljava/lang/String;
    procedure _Setcity(acity: JString); // (Ljava/lang/String;)V
    function _GetcityCode: JString; // Ljava/lang/String;
    procedure _SetcityCode(acityCode: JString); // (Ljava/lang/String;)V
    function _Getdistrict: JString; // Ljava/lang/String;
    procedure _Setdistrict(adistrict: JString); // (Ljava/lang/String;)V
    function _Getstreet: JString; // Ljava/lang/String;
    procedure _Setstreet(astreet: JString); // (Ljava/lang/String;)V
    function _GetstreetNumber: JString; // Ljava/lang/String;
    procedure _SetstreetNumber(astreetNumber: JString); // (Ljava/lang/String;)V
    function _Getaddress: JString; // Ljava/lang/String;
    procedure _Setaddress(aaddress: JString); // (Ljava/lang/String;)V

    { methods }

    { Property }
    property country: JString read _Getcountry write _Setcountry;
    property countryCode: JString read _GetcountryCode write _SetcountryCode;
    property province: JString read _Getprovince write _Setprovince;
    property city: JString read _Getcity write _Setcity;
    property cityCode: JString read _GetcityCode write _SetcityCode;
    property district: JString read _Getdistrict write _Setdistrict;
    property street: JString read _Getstreet write _Setstreet;
    property streetNumber: JString read _GetstreetNumber write _SetstreetNumber;
    property address: JString read _Getaddress write _Setaddress;
  end;

  TJAddress = class(TJavaGenericImport<JAddressClass, JAddress>)
  end;

  JBDLocationClass = interface(JObjectClass)
    ['{F71DE0A4-CE6E-4662-B884-6507D3ABF8F5}']
    { static Property Methods }
    { class } function _GetTypeNone: Integer; // I
    { class } function _GetTypeGpsLocation: Integer; // I
    { class } function _GetTypeCriteriaException: Integer; // I
    { class } function _GetTypeNetWorkException: Integer; // I
    { class } function _GetTypeOffLineLocation: Integer; // I
    { class } function _GetTypeOffLineLocationFail: Integer; // I
    { class } function _GetTypeOffLineLocationNetworkFail: Integer; // I
    { class } function _GetTypeNetWorkLocation: Integer; // I
    { class } function _GetTypeCacheLocation: Integer; // I
    { class } function _GetTypeServerError: Integer; // I
    { class } function _GetTypeServerDecryptError: Integer; // I
    { class } function _GetTypeServerCheckKeyError: Integer; // I
    { class } function _GetLOCATION_WHERE_UNKNOW: Integer; // I
    { class } function _GetLOCATION_WHERE_IN_CN: Integer; // I
    { class } function _GetLOCATION_WHERE_OUT_CN: Integer; // I
    { class } function _GetUSER_INDOOR_UNKNOW: Integer; // I
    { class } function _GetUSER_INDDOR_TRUE: Integer; // I
    { class } function _GetUSER_INDOOR_FALSE: Integer; // I
    { class } function _GetINDOOR_LOCATION_NEARBY_SURPPORT_TRUE: Integer; // I
    { class } function _GetINDOOR_LOCATION_SURPPORT_TRUE: Integer; // I
    { class } function _GetINDOOR_LOCATION_SURPPORT_FALSE: Integer; // I
    { class } function _GetINDOOR_LOCATION_SOURCE_UNKNOWN: Integer; // I
    { class } function _GetINDOOR_LOCATION_SOURCE_WIFI: Integer; // I
    { class } function _GetINDOOR_LOCATION_SOURCE_MAGNETIC: Integer; // I
    { class } function _GetINDOOR_LOCATION_SOURCE_BLUETOOTH: Integer; // I
    { class } function _GetINDOOR_LOCATION_SOURCE_SMALLCELLSTATION: Integer;
    // I
    { class } function _GetINDOOR_NETWORK_STATE_HIGH: Integer; // I
    { class } function _GetINDOOR_NETWORK_STATE_MIDDLE: Integer; // I
    { class } function _GetINDOOR_NETWORK_STATE_LOW: Integer; // I
    { class } function _GetOPERATORS_TYPE_UNKONW: Integer; // I
    { class } function _GetOPERATORS_TYPE_MOBILE: Integer; // I
    { class } function _GetOPERATORS_TYPE_UNICOM: Integer; // I
    { class } function _GetOPERATORS_TYPE_TELECOMU: Integer; // I
    { class } function _GetGPS_ACCURACY_GOOD: Integer; // I
    { class } function _GetGPS_ACCURACY_MID: Integer; // I
    { class } function _GetGPS_ACCURACY_BAD: Integer; // I
    { class } function _GetGPS_ACCURACY_UNKNOWN: Integer; // I
    { class } function _GetBDLOCATION_GCJ02_TO_BD09: JString;
    // Ljava/lang/String;
    { class } function _GetBDLOCATION_GCJ02_TO_BD09LL: JString;
    // Ljava/lang/String;
    { class } function _GetBDLOCATION_BD09_TO_GCJ02: JString;
    // Ljava/lang/String;
    { class } function _GetBDLOCATION_BD09LL_TO_GCJ02: JString;
    // Ljava/lang/String;
    { class } function _GetBDLOCATION_WGS84_TO_GCJ02: JString;
    // Ljava/lang/String;
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JBDLocation; cdecl; overload; // ()V
    { class } function init(P1: JBDLocation): JBDLocation; cdecl; overload;
    // (Lcom/baidu/location/BDLocation;)V
    { class } function init(P1: JString): JBDLocation; cdecl; overload;
    // (Ljava/lang/String;)V

    { static Property }
    { class } property TypeNone: Integer read _GetTypeNone;
    { class } property TypeGpsLocation: Integer read _GetTypeGpsLocation;
    { class } property TypeCriteriaException: Integer
      read _GetTypeCriteriaException;
    { class } property TypeNetWorkException: Integer
      read _GetTypeNetWorkException;
    { class } property TypeOffLineLocation: Integer
      read _GetTypeOffLineLocation;
    { class } property TypeOffLineLocationFail: Integer
      read _GetTypeOffLineLocationFail;
    { class } property TypeOffLineLocationNetworkFail: Integer
      read _GetTypeOffLineLocationNetworkFail;
    { class } property TypeNetWorkLocation: Integer
      read _GetTypeNetWorkLocation;
    { class } property TypeCacheLocation: Integer read _GetTypeCacheLocation;
    { class } property TypeServerError: Integer read _GetTypeServerError;
    { class } property TypeServerDecryptError: Integer
      read _GetTypeServerDecryptError;
    { class } property TypeServerCheckKeyError: Integer
      read _GetTypeServerCheckKeyError;
    { class } property LOCATION_WHERE_UNKNOW: Integer
      read _GetLOCATION_WHERE_UNKNOW;
    { class } property LOCATION_WHERE_IN_CN: Integer
      read _GetLOCATION_WHERE_IN_CN;
    { class } property LOCATION_WHERE_OUT_CN: Integer
      read _GetLOCATION_WHERE_OUT_CN;
    { class } property USER_INDOOR_UNKNOW: Integer read _GetUSER_INDOOR_UNKNOW;
    { class } property USER_INDDOR_TRUE: Integer read _GetUSER_INDDOR_TRUE;
    { class } property USER_INDOOR_FALSE: Integer read _GetUSER_INDOOR_FALSE;
    { class } property INDOOR_LOCATION_NEARBY_SURPPORT_TRUE: Integer
      read _GetINDOOR_LOCATION_NEARBY_SURPPORT_TRUE;
    { class } property INDOOR_LOCATION_SURPPORT_TRUE: Integer
      read _GetINDOOR_LOCATION_SURPPORT_TRUE;
    { class } property INDOOR_LOCATION_SURPPORT_FALSE: Integer
      read _GetINDOOR_LOCATION_SURPPORT_FALSE;
    { class } property INDOOR_LOCATION_SOURCE_UNKNOWN: Integer
      read _GetINDOOR_LOCATION_SOURCE_UNKNOWN;
    { class } property INDOOR_LOCATION_SOURCE_WIFI: Integer
      read _GetINDOOR_LOCATION_SOURCE_WIFI;
    { class } property INDOOR_LOCATION_SOURCE_MAGNETIC: Integer
      read _GetINDOOR_LOCATION_SOURCE_MAGNETIC;
    { class } property INDOOR_LOCATION_SOURCE_BLUETOOTH: Integer
      read _GetINDOOR_LOCATION_SOURCE_BLUETOOTH;
    { class } property INDOOR_LOCATION_SOURCE_SMALLCELLSTATION: Integer
      read _GetINDOOR_LOCATION_SOURCE_SMALLCELLSTATION;
    { class } property INDOOR_NETWORK_STATE_HIGH: Integer
      read _GetINDOOR_NETWORK_STATE_HIGH;
    { class } property INDOOR_NETWORK_STATE_MIDDLE: Integer
      read _GetINDOOR_NETWORK_STATE_MIDDLE;
    { class } property INDOOR_NETWORK_STATE_LOW: Integer
      read _GetINDOOR_NETWORK_STATE_LOW;
    { class } property OPERATORS_TYPE_UNKONW: Integer
      read _GetOPERATORS_TYPE_UNKONW;
    { class } property OPERATORS_TYPE_MOBILE: Integer
      read _GetOPERATORS_TYPE_MOBILE;
    { class } property OPERATORS_TYPE_UNICOM: Integer
      read _GetOPERATORS_TYPE_UNICOM;
    { class } property OPERATORS_TYPE_TELECOMU: Integer
      read _GetOPERATORS_TYPE_TELECOMU;
    { class } property GPS_ACCURACY_GOOD: Integer read _GetGPS_ACCURACY_GOOD;
    { class } property GPS_ACCURACY_MID: Integer read _GetGPS_ACCURACY_MID;
    { class } property GPS_ACCURACY_BAD: Integer read _GetGPS_ACCURACY_BAD;
    { class } property GPS_ACCURACY_UNKNOWN: Integer
      read _GetGPS_ACCURACY_UNKNOWN;
    { class } property BDLOCATION_GCJ02_TO_BD09: JString
      read _GetBDLOCATION_GCJ02_TO_BD09;
    { class } property BDLOCATION_GCJ02_TO_BD09LL: JString
      read _GetBDLOCATION_GCJ02_TO_BD09LL;
    { class } property BDLOCATION_BD09_TO_GCJ02: JString
      read _GetBDLOCATION_BD09_TO_GCJ02;
    { class } property BDLOCATION_BD09LL_TO_GCJ02: JString
      read _GetBDLOCATION_BD09LL_TO_GCJ02;
    { class } property BDLOCATION_WGS84_TO_GCJ02: JString
      read _GetBDLOCATION_WGS84_TO_GCJ02;
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/location/BDLocation')]
  JBDLocation = interface(JObject)
    ['{D0D7B959-E0F6-451C-BEA9-D6A68E693D9E}']
    { Property Methods }

    { methods }
    function getPoiList: JList; cdecl; // ()Ljava/util/List;
    procedure setPoiList(P1: JList); cdecl; // (Ljava/util/List;)V
    function isCellChangeFlag: Boolean; cdecl; // ()Z
    function getUserIndoorState: Integer; cdecl; // ()I
    procedure setUserIndoorState(P1: Integer); cdecl; // (I)V
    function getIndoorLocationSurpport: Integer; cdecl; // ()I
    function getIndoorLocationSurpportBuidlingName: JString; cdecl;
    // ()Ljava/lang/String;
    function getIndoorLocationSurpportBuidlingID: JString; cdecl;
    // ()Ljava/lang/String;
    procedure setIndoorLocationSurpport(P1: Integer); cdecl; // (I)V
    function getIndoorNetworkState: Integer; cdecl; // ()I
    procedure setIndoorNetworkState(P1: Integer); cdecl; // (I)V
    function getIndoorLocationSource: Integer; cdecl; // ()I
    procedure setIndoorLocationSource(P1: Integer); cdecl; // (I)V
    function getIndoorSurpportPolygon: JString; cdecl; // ()Ljava/lang/String;
    procedure setIndoorSurpportPolygon(P1: JString); cdecl;
    // (Ljava/lang/String;)V
    function getTime: JString; cdecl; // ()Ljava/lang/String;
    procedure setTime(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getLatitude: Double; cdecl; // ()D
    procedure setLatitude(P1: Double); cdecl; // (D)V
    function getLongitude: Double; cdecl; // ()D
    procedure setLongitude(P1: Double); cdecl; // (D)V
    function getAltitude: Double; cdecl; // ()D
    procedure setAltitude(P1: Double); cdecl; // (D)V
    function getSpeed: Single; cdecl; // ()F
    procedure setSpeed(P1: Single); cdecl; // (F)V
    function getRadius: Single; cdecl; // ()F
    procedure setRadius(P1: Single); cdecl; // (F)V
    function getCoorType: JString; cdecl; // ()Ljava/lang/String;
    procedure setCoorType(P1: JString); cdecl; // (Ljava/lang/String;)V
    procedure setAddrStr(P1: JString); cdecl; // (Ljava/lang/String;)V
    function hasAltitude: Boolean; cdecl; // ()Z
    function hasSpeed: Boolean; cdecl; // ()Z
    function hasRadius: Boolean; cdecl; // ()Z
    procedure setLocType(P1: Integer); cdecl; // (I)V
    function getLocType: Integer; cdecl; // ()I
    function getLocTypeDescription: JString; cdecl; // ()Ljava/lang/String;
    procedure setLocTypeDescription(P1: JString); cdecl;
    // (Ljava/lang/String;)V
    procedure setSatelliteNumber(P1: Integer); cdecl; // (I)V
    function getSatelliteNumber: Integer; cdecl; // ()I
    function getDerect: Single; cdecl; // Deprecated //()F
    function getDirection: Single; cdecl; // ()F
    procedure setDirection(P1: Single); cdecl; // (F)V
    function hasSateNumber: Boolean; cdecl; // ()Z
    function hasAddr: Boolean; cdecl; // ()Z
    function getAddress: JAddress; cdecl; // ()Lcom/baidu/location/Address;
    procedure setAddr(P1: JAddress); cdecl; // (Lcom/baidu/location/Address;)V
    function getAddrStr: JString; cdecl; // ()Ljava/lang/String;
    function getProvince: JString; cdecl; // ()Ljava/lang/String;
    function getCity: JString; cdecl; // ()Ljava/lang/String;
    function getCityCode: JString; cdecl; // ()Ljava/lang/String;
    function getCountry: JString; cdecl; // ()Ljava/lang/String;
    function getCountryCode: JString; cdecl; // ()Ljava/lang/String;
    function getDistrict: JString; cdecl; // ()Ljava/lang/String;
    function getStreet: JString; cdecl; // ()Ljava/lang/String;
    function getStreetNumber: JString; cdecl; // ()Ljava/lang/String;
    function getLocationDescribe: JString; cdecl; // ()Ljava/lang/String;
    procedure setLocationDescribe(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getFloor: JString; cdecl; // ()Ljava/lang/String;
    procedure setFloor(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getBuildingID: JString; cdecl; // ()Ljava/lang/String;
    procedure setBuildingID(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getBuildingName: JString; cdecl; // ()Ljava/lang/String;
    procedure setBuildingName(P1: JString); cdecl; // (Ljava/lang/String;)V
    function isParkAvailable: Integer; cdecl; // ()I
    procedure setParkAvailable(P1: Integer); cdecl; // (I)V
    function isIndoorLocMode: Boolean; cdecl; // ()Z
    procedure setIndoorLocMode(P1: Boolean); cdecl; // (Z)V
    function getLocationWhere: Integer; cdecl; // ()I
    procedure setLocationWhere(P1: Integer); cdecl; // (I)V
    function getGpsAccuracyStatus: Integer; cdecl; // ()I
    procedure setGpsAccuracyStatus(P1: Integer); cdecl; // (I)V
    function getSemaAptag: JString; cdecl; // Deprecated //()Ljava/lang/String;
    function getNetworkLocationType: JString; cdecl; // ()Ljava/lang/String;
    procedure setNetworkLocationType(P1: JString); cdecl;
    // (Ljava/lang/String;)V
    function getOperators: Integer; cdecl; // ()I
    procedure setOperators(P1: Integer); cdecl; // (I)V
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJBDLocation = class(TJavaGenericImport<JBDLocationClass, JBDLocation>)
  end;

  JBDLocationListenerClass = interface(JObjectClass)
    ['{699EB89C-6403-4384-B871-FB32A09D134A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/location/BDLocationListener')]
  JBDLocationListener = interface(IJavaInstance)
    ['{5BB0FC2B-60CD-4D91-BCEF-1848C078AFA9}']
    { Property Methods }

    { methods }
    procedure onReceiveLocation(P1: JBDLocation); cdecl;
    // (Lcom/baidu/location/BDLocation;)V
    procedure onConnectHotSpotMessage(P1: JString; P2: Integer); cdecl;
    // (Ljava/lang/String;I)V

    { Property }
  end;

  TJBDLocationListener = class(TJavaGenericImport<JBDLocationListenerClass,
    JBDLocationListener>)
  end;

  JJniClass = interface(JObjectClass)
    ['{1007C41F-0982-4EBA-8801-DBC35F98FE41}']
    { static Property Methods }

    { static Methods }
    { class } function init: JJni; cdecl; // ()V
    { class } procedure uninstall(P1: JString); cdecl; // (Ljava/lang/String;)V
    { class } function encode(P1: JString): JString; cdecl;
    // (Ljava/lang/String;)Ljava/lang/String;
    { class } function decodeIBeacon(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>)
      : JString; cdecl; // ([B[B)Ljava/lang/String;
    { class } procedure removeSoList(P1: Integer; P2: JString); cdecl;
    // (ILjava/lang/String;)V
    { class } function en1(P1: JString): JString; cdecl;
    // (Ljava/lang/String;)Ljava/lang/String;
    { class } function encode2(P1: JString): JString; cdecl;
    // (Ljava/lang/String;)Ljava/lang/String;
    { class } function encode3(P1: JString): JLong; cdecl;
    // (Ljava/lang/String;)Ljava/lang/Long;
    { class } function getSkyKey: JString; cdecl; // ()Ljava/lang/String;
    { class } function encodeOfflineLocationUpdateRequest(P1: JString): JString;
      cdecl; // (Ljava/lang/String;)Ljava/lang/String;
    { class } function encodeTp4(P1: JString): JString; cdecl;
    // (Ljava/lang/String;)Ljava/lang/String;
    { class } function getGpsSwiftRadius(P1: Single; P2: Double; P3: Double)
      : Double; cdecl; // (FDD)D
    { class } function coorEncrypt(P1: Double; P2: Double; P3: JString)
      : TJavaArray<Double>; cdecl; // (DDLjava/lang/String;)[D
    { class } procedure tr2(P1: JString; P2: JString); cdecl;
    // (Ljava/lang/String;Ljava/lang/String;)V
    { class } function gtr2(P1: JString): JString; cdecl;
    // (Ljava/lang/String;)Ljava/lang/String;

    { static Property }
  end;

  [JavaSignature('com/baidu/location/Jni')]
  JJni = interface(JObject)
    ['{F2F6D06F-9553-4C22-B685-1AC1BD3CAE84}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJJni = class(TJavaGenericImport<JJniClass, JJni>)
  end;

  JLLSInterfaceClass = interface(JObjectClass)
    ['{E940DF44-ED74-424D-9D16-E1A3EA1ECD3C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/location/LLSInterface')]
  JLLSInterface = interface(IJavaInstance)
    ['{0B124C93-B804-42A2-BFB0-3914BE42C8C1}']
    { Property Methods }

    { methods }
    procedure onCreate(P1: JContext); cdecl; // (Landroid/content/Context;)V
    function onStartCommand(P1: JIntent; P2: Integer; P3: Integer): Integer;
      cdecl; // (Landroid/content/Intent;II)I
    function onBind(P1: JIntent): JIBinder; cdecl;
    // (Landroid/content/Intent;)Landroid/os/IBinder;
    function onUnBind(P1: JIntent): Boolean; cdecl;
    // (Landroid/content/Intent;)Z
    procedure onDestroy; cdecl; // ()V
    function getVersion: Double; cdecl; // ()D

    { Property }
  end;

  TJLLSInterface = class(TJavaGenericImport<JLLSInterfaceClass, JLLSInterface>)
  end;

  JLocationClientClass = interface(JObjectClass)
    ['{D951C38B-CD0C-4EF6-BE79-D80C0B8B4398}']
    { static Property Methods }
    { class } function _GetCONNECT_HOT_SPOT_TRUE: Integer; // I
    { class } function _GetCONNECT_HOT_SPOT_FALSE: Integer; // I
    { class } function _GetCONNECT_HOT_SPOT_UNKNOWN: Integer; // I

    { static Methods }
    { class } function init(P1: JContext): JLocationClient; cdecl; overload;
    // (Landroid/content/Context;)V
    { class } function init(P1: JContext; P2: JLocationClientOption)
      : JLocationClient; cdecl; overload;
    // (Landroid/content/Context;Lcom/baidu/location/LocationClientOption;)V
    { class } function getBDLocationInCoorType(P1: JBDLocation; P2: JString)
      : JBDLocation; cdecl;
    // (Lcom/baidu/location/BDLocation;Ljava/lang/String;)Lcom/baidu/location/BDLocation;

    { static Property }
    { class } property CONNECT_HOT_SPOT_TRUE: Integer
      read _GetCONNECT_HOT_SPOT_TRUE;
    { class } property CONNECT_HOT_SPOT_FALSE: Integer
      read _GetCONNECT_HOT_SPOT_FALSE;
    { class } property CONNECT_HOT_SPOT_UNKNOWN: Integer
      read _GetCONNECT_HOT_SPOT_UNKNOWN;
  end;

  [JavaSignature('com/baidu/location/LocationClient')]
  JLocationClient = interface(JObject)
    ['{9803CAEA-1DA3-45BF-90D6-B8671AADA47C}']
    { Property Methods }

    { methods }
    function getLocOption: JLocationClientOption; cdecl;
    // ()Lcom/baidu/location/LocationClientOption;
    procedure setLocOption(P1: JLocationClientOption); cdecl;
    // (Lcom/baidu/location/LocationClientOption;)V
    function updateLocation(P1: JLocation): Boolean; cdecl;
    // (Landroid/location/Location;)Z
    procedure requestNotifyLocation; cdecl; // ()V
    function requestOfflineLocation: Integer; cdecl; // ()I
    function requestLocation: Integer; cdecl; // ()I
    function isStarted: Boolean; cdecl; // ()Z
    function getLastKnownLocation: JBDLocation; cdecl;
    // ()Lcom/baidu/location/BDLocation;
    function getVersion: JString; cdecl; // ()Ljava/lang/String;
    procedure start; cdecl; // ()V
    function requestHotSpotState: Boolean; cdecl; // ()Z
    procedure stop; cdecl; // ()V
    procedure registerNotifyLocationListener(P1: JBDLocationListener); cdecl;
    // (Lcom/baidu/location/BDLocationListener;)V
    procedure registerLocationListener(P1: JBDLocationListener); cdecl;
    // (Lcom/baidu/location/BDLocationListener;)V
    procedure unRegisterLocationListener(P1: JBDLocationListener); cdecl;
    // (Lcom/baidu/location/BDLocationListener;)V
    function getAccessKey: JString; cdecl; // ()Ljava/lang/String;
    procedure onReceiveLocation(P1: JBDLocation); cdecl;
    // (Lcom/baidu/location/BDLocation;)V

    { Property }
  end;

  TJLocationClient = class(TJavaGenericImport<JLocationClientClass,
    JLocationClient>)
  end;

  JLocationClientOption_LocationModeClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{5E6934B8-28E2-4ED8-B25B-11C412E765C5}']
    { static Property Methods }
    { class } function _GetHight_Accuracy: JLocationClientOption_LocationMode;
    // Lcom/baidu/location/LocationClientOption$LocationMode;
    { class } function _GetBattery_Saving: JLocationClientOption_LocationMode;
    // Lcom/baidu/location/LocationClientOption$LocationMode;
    { class } function _GetDevice_Sensors: JLocationClientOption_LocationMode;
    // Lcom/baidu/location/LocationClientOption$LocationMode;

    { static Methods }
    { class } function values
      : TJavaObjectArray<JLocationClientOption_LocationMode>; cdecl;
    // ()[Lcom/baidu/location/LocationClientOption$LocationMode;
    { class } function valueOf(P1: JString): JLocationClientOption_LocationMode;
      cdecl; // (Ljava/lang/String;)Lcom/baidu/location/LocationClientOption$LocationMode;

    { static Property }
    { class } property Hight_Accuracy: JLocationClientOption_LocationMode
      read _GetHight_Accuracy;
    { class } property Battery_Saving: JLocationClientOption_LocationMode
      read _GetBattery_Saving;
    { class } property Device_Sensors: JLocationClientOption_LocationMode
      read _GetDevice_Sensors;
  end;

  [JavaSignature('com/baidu/location/LocationClientOption$LocationMode')]
  JLocationClientOption_LocationMode = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{7FC6015A-EDFE-4F2D-8DEE-D25F1E54634D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLocationClientOption_LocationMode = class
    (TJavaGenericImport<JLocationClientOption_LocationModeClass,
    JLocationClientOption_LocationMode>)
  end;

  JLocationClientOptionClass = interface(JObjectClass)
    ['{BC1486D6-5A8B-4684-A947-4164B6C29B30}']
    { static Property Methods }
    { class } function _GetMIN_SCAN_SPAN: Integer; // I
    { class } function _GetGpsFirst: Integer; // I
    { class } function _GetNetWorkFirst: Integer; // I
    { class } function _GetGpsOnly: Integer; // I
    { class } function _GetLOC_SENSITIVITY_HIGHT: Integer; // I
    { class } function _GetLOC_SENSITIVITY_MIDDLE: Integer; // I
    { class } function _GetLOC_SENSITIVITY_LOW: Integer; // I
    { class } function _GetMIN_AUTO_NOTIFY_INTERVAL: Integer; // I

    { static Methods }
    { class } function init: JLocationClientOption; cdecl; overload; // ()V
    { class } function init(P1: JLocationClientOption): JLocationClientOption;
      cdecl; overload; // (Lcom/baidu/location/LocationClientOption;)V

    { static Property }
    { class } property MIN_SCAN_SPAN: Integer read _GetMIN_SCAN_SPAN;
    { class } property GpsFirst: Integer read _GetGpsFirst;
    { class } property NetWorkFirst: Integer read _GetNetWorkFirst;
    { class } property GpsOnly: Integer read _GetGpsOnly;
    { class } property LOC_SENSITIVITY_HIGHT: Integer
      read _GetLOC_SENSITIVITY_HIGHT;
    { class } property LOC_SENSITIVITY_MIDDLE: Integer
      read _GetLOC_SENSITIVITY_MIDDLE;
    { class } property LOC_SENSITIVITY_LOW: Integer
      read _GetLOC_SENSITIVITY_LOW;
    { class } property MIN_AUTO_NOTIFY_INTERVAL: Integer
      read _GetMIN_AUTO_NOTIFY_INTERVAL;
  end;

  [JavaSignature('com/baidu/location/LocationClientOption')]
  JLocationClientOption = interface(JObject)
    ['{34C7E82D-6F40-4B13-936E-992AAC056AF0}']
    { Property Methods }
    function _GetcoorType: JString; // Ljava/lang/String;
    procedure _SetcoorType(acoorType: JString); // (Ljava/lang/String;)V
    function _GetaddrType: JString; // Ljava/lang/String;
    procedure _SetaddrType(aaddrType: JString); // (Ljava/lang/String;)V
    function _GetopenGps: Boolean; // Z
    procedure _SetopenGps(aopenGps: Boolean); // (Z)V
    function _GetscanSpan: Integer; // I
    procedure _SetscanSpan(ascanSpan: Integer); // (I)V
    function _GettimeOut: Integer; // I
    procedure _SettimeOut(atimeOut: Integer); // (I)V
    function _GetprodName: JString; // Ljava/lang/String;
    procedure _SetprodName(aprodName: JString); // (Ljava/lang/String;)V
    function _Getpriority: Integer; // I
    procedure _Setpriority(apriority: Integer); // (I)V
    function _Getlocation_change_notify: Boolean; // Z
    procedure _Setlocation_change_notify(alocation_change_notify: Boolean);
    // (Z)V
    function _GetdisableLocCache: Boolean; // Z
    procedure _SetdisableLocCache(adisableLocCache: Boolean); // (Z)V
    function _GetenableSimulateGps: Boolean; // Z
    procedure _SetenableSimulateGps(aenableSimulateGps: Boolean); // (Z)V
    function _GetserviceName: JString; // Ljava/lang/String;
    procedure _SetserviceName(aserviceName: JString); // (Ljava/lang/String;)V
    function _GetisIgnoreCacheException: Boolean; // Z
    procedure _SetisIgnoreCacheException(aisIgnoreCacheException: Boolean);
    // (Z)V
    function _GetisIgnoreKillProcess: Boolean; // Z
    procedure _SetisIgnoreKillProcess(aisIgnoreKillProcess: Boolean); // (Z)V
    function _GetmIsNeedDeviceDirect: Boolean; // Z
    procedure _SetmIsNeedDeviceDirect(amIsNeedDeviceDirect: Boolean); // (Z)V
    function _GetisNeedAptag: Boolean; // Z
    procedure _SetisNeedAptag(aisNeedAptag: Boolean); // (Z)V
    function _GetisNeedAptagd: Boolean; // Z
    procedure _SetisNeedAptagd(aisNeedAptagd: Boolean); // (Z)V
    function _GetisNeedPoiRegion: Boolean; // Z
    procedure _SetisNeedPoiRegion(aisNeedPoiRegion: Boolean); // (Z)V
    function _GetisNeedRegular: Boolean; // Z
    procedure _SetisNeedRegular(aisNeedRegular: Boolean); // (Z)V
    function _GetisNeedAltitude: Boolean; // Z
    procedure _SetisNeedAltitude(aisNeedAltitude: Boolean); // (Z)V
    function _GetautoNotifyMaxInterval: Integer; // I
    procedure _SetautoNotifyMaxInterval(aautoNotifyMaxInterval: Integer);
    // (I)V
    function _GetautoNotifyLocSensitivity: Single; // F
    procedure _SetautoNotifyLocSensitivity(aautoNotifyLocSensitivity: Single);
    // (F)V
    function _GetautoNotifyMinTimeInterval: Integer; // I
    procedure _SetautoNotifyMinTimeInterval(aautoNotifyMinTimeInterval
      : Integer); // (I)V
    function _GetautoNotifyMinDistance: Integer; // I
    procedure _SetautoNotifyMinDistance(aautoNotifyMinDistance: Integer);
    // (I)V

    { methods }
    function optionEquals(P1: JLocationClientOption): Boolean; cdecl;
    // (Lcom/baidu/location/LocationClientOption;)Z
    function getCoorType: JString; cdecl; // ()Ljava/lang/String;
    procedure setCoorType(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getAddrType: JString; cdecl; // ()Ljava/lang/String;
    procedure setAddrType(P1: JString); cdecl;
    // Deprecated //(Ljava/lang/String;)V
    procedure setIsNeedAddress(P1: Boolean); cdecl; // (Z)V
    function isOpenGps: Boolean; cdecl; // ()Z
    procedure setOpenGps(P1: Boolean); cdecl; // (Z)V
    function isLocationNotify: Boolean; cdecl; // ()Z
    procedure setLocationNotify(P1: Boolean); cdecl; // (Z)V
    procedure setOpenAutoNotifyMode; cdecl; overload; // ()V
    procedure setOpenAutoNotifyMode(P1: Integer; P2: Integer; P3: Integer);
      cdecl; overload; // (III)V
    function getAutoNotifyMinTimeInterval: Integer; cdecl; // ()I
    function getAutoNotifyMinDistance: Integer; cdecl; // ()I
    function getScanSpan: Integer; cdecl; // ()I
    procedure setScanSpan(P1: Integer); cdecl; // (I)V
    function getTimeOut: Integer; cdecl; // ()I
    procedure setTimeOut(P1: Integer); cdecl; // (I)V
    function getProdName: JString; cdecl; // ()Ljava/lang/String;
    procedure setProdName(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getPriority: Integer; cdecl; // ()I
    procedure setPriority(P1: Integer); cdecl; // Deprecated //(I)V
    procedure setLocationMode(P1: JLocationClientOption_LocationMode); cdecl;
    // (Lcom/baidu/location/LocationClientOption$LocationMode;)V
    function getLocationMode: JLocationClientOption_LocationMode; cdecl;
    // ()Lcom/baidu/location/LocationClientOption$LocationMode;
    procedure setNeedDeviceDirect(P1: Boolean); cdecl; // (Z)V
    function getServiceName: JString; cdecl; // ()Ljava/lang/String;
    procedure setServiceName(P1: JString); cdecl; // (Ljava/lang/String;)V
    procedure setIsNeedLocationDescribe(P1: Boolean); cdecl; // (Z)V
    procedure setIsNeedAltitude(P1: Boolean); cdecl; // (Z)V
    procedure setIsNeedLocationPoiList(P1: Boolean); cdecl; // (Z)V
    procedure setSema(P1: Boolean; P2: Boolean; P3: Boolean); cdecl;
    // Deprecated //(ZZZ)V
    procedure disableCache(P1: Boolean); cdecl; // (Z)V
    function isDisableCache: Boolean; cdecl; // ()Z
    procedure SetIgnoreCacheException(P1: Boolean); cdecl; // (Z)V
    procedure setIgnoreKillProcess(P1: Boolean); cdecl; // (Z)V
    procedure setEnableSimulateGps(P1: Boolean); cdecl; // (Z)V

    { Property }
    property coorType: JString read _GetcoorType write _SetcoorType;
    property addrType: JString read _GetaddrType write _SetaddrType;
    property openGps: Boolean read _GetopenGps write _SetopenGps;
    property scanSpan: Integer read _GetscanSpan write _SetscanSpan;
    property timeOut: Integer read _GettimeOut write _SettimeOut;
    property prodName: JString read _GetprodName write _SetprodName;
    property priority: Integer read _Getpriority write _Setpriority;
    property location_change_notify: Boolean read _Getlocation_change_notify
      write _Setlocation_change_notify;
    property disableLocCache: Boolean read _GetdisableLocCache
      write _SetdisableLocCache;
    property enableSimulateGps: Boolean read _GetenableSimulateGps
      write _SetenableSimulateGps;
    property serviceName: JString read _GetserviceName write _SetserviceName;
    property isIgnoreCacheException: Boolean read _GetisIgnoreCacheException
      write _SetisIgnoreCacheException;
    property isIgnoreKillProcess: Boolean read _GetisIgnoreKillProcess
      write _SetisIgnoreKillProcess;
    property mIsNeedDeviceDirect: Boolean read _GetmIsNeedDeviceDirect
      write _SetmIsNeedDeviceDirect;
    property isNeedAptag: Boolean read _GetisNeedAptag write _SetisNeedAptag;
    property isNeedAptagd: Boolean read _GetisNeedAptagd write _SetisNeedAptagd;
    property isNeedPoiRegion: Boolean read _GetisNeedPoiRegion
      write _SetisNeedPoiRegion;
    property isNeedRegular: Boolean read _GetisNeedRegular
      write _SetisNeedRegular;
    property isNeedAltitude: Boolean read _GetisNeedAltitude
      write _SetisNeedAltitude;
    property autoNotifyMaxInterval: Integer read _GetautoNotifyMaxInterval
      write _SetautoNotifyMaxInterval;
    property autoNotifyLocSensitivity: Single read _GetautoNotifyLocSensitivity
      write _SetautoNotifyLocSensitivity;
    property autoNotifyMinTimeInterval: Integer
      read _GetautoNotifyMinTimeInterval write _SetautoNotifyMinTimeInterval;
    property autoNotifyMinDistance: Integer read _GetautoNotifyMinDistance
      write _SetautoNotifyMinDistance;
  end;

  TJLocationClientOption = class(TJavaGenericImport<JLocationClientOptionClass,
    JLocationClientOption>)
  end;

  JPoiClass = interface(JObjectClass)
    ['{78EAAB9C-E4B7-4999-8618-3751D1D1FCC3}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init(P1: JString; P2: JString; P3: Double): JPoi; cdecl;
    // (Ljava/lang/String;Ljava/lang/String;D)V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/location/Poi')]
  JPoi = interface(JObject)
    ['{6EF42CC1-250D-4555-8C9A-B0B68F60590E}']
    { Property Methods }

    { methods }
    function getId: JString; cdecl; // ()Ljava/lang/String;
    function getRank: Double; cdecl; // ()D
    function getName: JString; cdecl; // ()Ljava/lang/String;
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJPoi = class(TJavaGenericImport<JPoiClass, JPoi>)
  end;

implementation

procedure RegisterTypes;
begin

  TRegTypes.RegisterType('Androidapi.JNI.baidu.location.Address_Builder',
    TypeInfo(Androidapi.JNI.baidu.location.JAddress_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.location.Address',
    TypeInfo(Androidapi.JNI.baidu.location.JAddress));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.location.BDLocation',
    TypeInfo(Androidapi.JNI.baidu.location.JBDLocation));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.location.BDLocationListener',
    TypeInfo(Androidapi.JNI.baidu.location.JBDLocationListener));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.location.Jni',
    TypeInfo(Androidapi.JNI.baidu.location.JJni));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.location.LLSInterface',
    TypeInfo(Androidapi.JNI.baidu.location.JLLSInterface));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.location.LocationClient',
    TypeInfo(Androidapi.JNI.baidu.location.JLocationClient));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.location.LocationClientOption_LocationMode',
    TypeInfo(Androidapi.JNI.baidu.location.JLocationClientOption_LocationMode));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.location.LocationClientOption',
    TypeInfo(Androidapi.JNI.baidu.location.JLocationClientOption));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.location.Poi',
    TypeInfo(Androidapi.JNI.baidu.location.JPoi));
end;

initialization

RegisterTypes;

end.
