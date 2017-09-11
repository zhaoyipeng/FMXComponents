unit Androidapi.JNI.baidu.mapapi.radar;
// ====================================================
// Android Baidu Map SDK interface
// Package:com.baidu.mapapi.radar
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
  Androidapi.JNI.os,
  Androidapi.JNI.JavaUtil,
  Androidapi.JNI.baidu.mapapi.model;

type
  // ===== Forward declarations =====
  JRadarNearbyInfo = interface; // com.baidu.mapapi.radar.RadarNearbyInfo
  JRadarNearbyResult = interface; // com.baidu.mapapi.radar.RadarNearbyResult
  JRadarNearbySearchOption = interface;
  // com.baidu.mapapi.radar.RadarNearbySearchOption
  JRadarNearbySearchSortType = interface;
  // com.baidu.mapapi.radar.RadarNearbySearchSortType
  JRadarSearchError = interface; // com.baidu.mapapi.radar.RadarSearchError
  JRadarSearchListener = interface;
  // com.baidu.mapapi.radar.RadarSearchListener
  JRadarSearchManager = interface; // com.baidu.mapapi.radar.RadarSearchManager
  JRadarUploadInfo = interface; // com.baidu.mapapi.radar.RadarUploadInfo
  JRadarUploadInfoCallback = interface;
  // com.baidu.mapapi.radar.RadarUploadInfoCallback
  JVersionInfo = interface; // com.baidu.mapapi.radar.VersionInfo

  // ===== Interface declarations =====

  JRadarNearbyInfoClass = interface(JObjectClass)
    ['{3CCB86AF-83DC-4DC3-960E-5F2800ECD082}']
    { static Property Methods }

    { static Methods }
    { class } function init: JRadarNearbyInfo; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/radar/RadarNearbyInfo')]
  JRadarNearbyInfo = interface(JObject)
    ['{83EFE542-6338-4211-A84E-B24E4C7B2CE6}']
    { Property Methods }
    function _GetuserID: JString; // Ljava/lang/String;
    procedure _SetuserID(auserID: JString); // (Ljava/lang/String;)V
    function _Getpt: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _Setpt(apt: JLatLng); // (Lcom/baidu/mapapi/model/LatLng;)V
    function _Getdistance: Integer; // I
    procedure _Setdistance(adistance: Integer); // (I)V
    function _GettimeStamp: JDate; // Ljava/util/Date;
    procedure _SettimeStamp(atimeStamp: JDate); // (Ljava/util/Date;)V
    function _GetmobileName: JString; // Ljava/lang/String;
    procedure _SetmobileName(amobileName: JString); // (Ljava/lang/String;)V
    function _GetmobileOS: JString; // Ljava/lang/String;
    procedure _SetmobileOS(amobileOS: JString); // (Ljava/lang/String;)V
    function _Getcomments: JString; // Ljava/lang/String;
    procedure _Setcomments(acomments: JString); // (Ljava/lang/String;)V

    { methods }

    { Property }
    property userID: JString read _GetuserID write _SetuserID;
    property pt: JLatLng read _Getpt write _Setpt;
    property distance: Integer read _Getdistance write _Setdistance;
    property timeStamp: JDate read _GettimeStamp write _SettimeStamp;
    property mobileName: JString read _GetmobileName write _SetmobileName;
    property mobileOS: JString read _GetmobileOS write _SetmobileOS;
    property comments: JString read _Getcomments write _Setcomments;
  end;

  TJRadarNearbyInfo = class(TJavaGenericImport<JRadarNearbyInfoClass,
    JRadarNearbyInfo>)
  end;

  JRadarNearbyResultClass = interface(JObjectClass)
    ['{14B03763-43D2-477F-A932-538D2B08C8BA}']
    { static Property Methods }

    { static Methods }
    { class } function init: JRadarNearbyResult; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/radar/RadarNearbyResult')]
  JRadarNearbyResult = interface(JObject)
    ['{BE56D3DB-D4BD-49FA-AE82-DB47E54C6BEA}']
    { Property Methods }
    function _GetinfoList: JList; // Ljava/util/List;
    procedure _SetinfoList(ainfoList: JList); // (Ljava/util/List;)V
    function _GettotalNum: Integer; // I
    procedure _SettotalNum(atotalNum: Integer); // (I)V
    function _GetpageIndex: Integer; // I
    procedure _SetpageIndex(apageIndex: Integer); // (I)V
    function _GetpageNum: Integer; // I
    procedure _SetpageNum(apageNum: Integer); // (I)V

    { methods }

    { Property }
    property infoList: JList read _GetinfoList write _SetinfoList;
    property totalNum: Integer read _GettotalNum write _SettotalNum;
    property pageIndex: Integer read _GetpageIndex write _SetpageIndex;
    property pageNum: Integer read _GetpageNum write _SetpageNum;
  end;

  TJRadarNearbyResult = class(TJavaGenericImport<JRadarNearbyResultClass,
    JRadarNearbyResult>)
  end;

  JRadarNearbySearchOptionClass = interface(JObjectClass)
    ['{09FB5FA2-19E2-4D13-A86A-4C39D04C5608}']
    { static Property Methods }

    { static Methods }
    { class } function init: JRadarNearbySearchOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/radar/RadarNearbySearchOption')]
  JRadarNearbySearchOption = interface(JObject)
    ['{DCF462EF-9187-476B-B1E8-8DD7A492839B}']
    { Property Methods }
    function _GetmRadius: Integer; // I
    procedure _SetmRadius(amRadius: Integer); // (I)V
    function _GetmPageNum: Integer; // I
    procedure _SetmPageNum(amPageNum: Integer); // (I)V
    function _GetmCenterPt: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _SetmCenterPt(amCenterPt: JLatLng);
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function _GetmPageCapacity: Integer; // I
    procedure _SetmPageCapacity(amPageCapacity: Integer); // (I)V
    function _GetsortType: JRadarNearbySearchSortType;
    // Lcom/baidu/mapapi/radar/RadarNearbySearchSortType;
    procedure _SetsortType(asortType: JRadarNearbySearchSortType);
    // (Lcom/baidu/mapapi/radar/RadarNearbySearchSortType;)V
    function _GetmStart: JDate; // Ljava/util/Date;
    procedure _SetmStart(amStart: JDate); // (Ljava/util/Date;)V
    function _GetmEnd: JDate; // Ljava/util/Date;
    procedure _SetmEnd(amEnd: JDate); // (Ljava/util/Date;)V

    { methods }
    function centerPt(P1: JLatLng): JRadarNearbySearchOption; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/radar/RadarNearbySearchOption;
    function timeRange(P1: JDate; P2: JDate): JRadarNearbySearchOption; cdecl;
    // (Ljava/util/Date;Ljava/util/Date;)Lcom/baidu/mapapi/radar/RadarNearbySearchOption;
    function sortType(P1: JRadarNearbySearchSortType): JRadarNearbySearchOption;
      cdecl; // (Lcom/baidu/mapapi/radar/RadarNearbySearchSortType;)Lcom/baidu/mapapi/radar/RadarNearbySearchOption;
    function radius(P1: Integer): JRadarNearbySearchOption; cdecl;
    // (I)Lcom/baidu/mapapi/radar/RadarNearbySearchOption;
    function pageNum(P1: Integer): JRadarNearbySearchOption; cdecl;
    // (I)Lcom/baidu/mapapi/radar/RadarNearbySearchOption;
    function pageCapacity(P1: Integer): JRadarNearbySearchOption; cdecl;
    // (I)Lcom/baidu/mapapi/radar/RadarNearbySearchOption;

    { Property }
    property mRadius: Integer read _GetmRadius write _SetmRadius;
    property mPageNum: Integer read _GetmPageNum write _SetmPageNum;
    property mCenterPt: JLatLng read _GetmCenterPt write _SetmCenterPt;
    property mPageCapacity: Integer read _GetmPageCapacity
      write _SetmPageCapacity;
    property _sortType: JRadarNearbySearchSortType read _GetsortType
      write _SetsortType;
    property mStart: JDate read _GetmStart write _SetmStart;
    property mEnd: JDate read _GetmEnd write _SetmEnd;
  end;

  TJRadarNearbySearchOption = class
    (TJavaGenericImport<JRadarNearbySearchOptionClass,
    JRadarNearbySearchOption>)
  end;

  JRadarNearbySearchSortTypeClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{C1935387-37E4-4734-ADC1-BE999DD98F67}']
    { static Property Methods }
    { class } function _Getdistance_from_near_to_far
      : JRadarNearbySearchSortType;
    // Lcom/baidu/mapapi/radar/RadarNearbySearchSortType;
    { class } function _Getdistance_from_far_to_near
      : JRadarNearbySearchSortType;
    // Lcom/baidu/mapapi/radar/RadarNearbySearchSortType;
    { class } function _Gettime_from_past_to_recent: JRadarNearbySearchSortType;
    // Lcom/baidu/mapapi/radar/RadarNearbySearchSortType;
    { class } function _Gettime_from_recent_to_past: JRadarNearbySearchSortType;
    // Lcom/baidu/mapapi/radar/RadarNearbySearchSortType;

    { static Methods }
    { class } function values: TJavaObjectArray<JRadarNearbySearchSortType>;
      cdecl; // ()[Lcom/baidu/mapapi/radar/RadarNearbySearchSortType;
    { class } function valueOf(P1: JString): JRadarNearbySearchSortType; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/radar/RadarNearbySearchSortType;

    { static Property }
    { class } property distance_from_near_to_far: JRadarNearbySearchSortType
      read _Getdistance_from_near_to_far;
    { class } property distance_from_far_to_near: JRadarNearbySearchSortType
      read _Getdistance_from_far_to_near;
    { class } property time_from_past_to_recent: JRadarNearbySearchSortType
      read _Gettime_from_past_to_recent;
    { class } property time_from_recent_to_past: JRadarNearbySearchSortType
      read _Gettime_from_recent_to_past;
  end;

  [JavaSignature('com/baidu/mapapi/radar/RadarNearbySearchSortType')]
  JRadarNearbySearchSortType = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{82C711B7-67B9-40FC-828F-C97695EF5D07}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRadarNearbySearchSortType = class
    (TJavaGenericImport<JRadarNearbySearchSortTypeClass,
    JRadarNearbySearchSortType>)
  end;

  JRadarSearchErrorClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{48249E9B-191E-45BA-A92B-961A224A73A7}']
    { static Property Methods }
    { class } function _GetRADAR_NO_ERROR: JRadarSearchError;
    // Lcom/baidu/mapapi/radar/RadarSearchError;
    { class } function _GetRADAR_NO_RESULT: JRadarSearchError;
    // Lcom/baidu/mapapi/radar/RadarSearchError;
    { class } function _GetRADAR_AK_NOT_BIND: JRadarSearchError;
    // Lcom/baidu/mapapi/radar/RadarSearchError;
    { class } function _GetRADAR_NETWORK_ERROR: JRadarSearchError;
    // Lcom/baidu/mapapi/radar/RadarSearchError;
    { class } function _GetRADAR_NETWORK_TIMEOUT: JRadarSearchError;
    // Lcom/baidu/mapapi/radar/RadarSearchError;
    { class } function _GetRADAR_AK_ERROR: JRadarSearchError;
    // Lcom/baidu/mapapi/radar/RadarSearchError;
    { class } function _GetRADAR_USERID_NOT_EXIST: JRadarSearchError;
    // Lcom/baidu/mapapi/radar/RadarSearchError;
    { class } function _GetRADAR_FORBID_BY_USER: JRadarSearchError;
    // Lcom/baidu/mapapi/radar/RadarSearchError;
    { class } function _GetRADAR_FORBID_BY_ADMIN: JRadarSearchError;
    // Lcom/baidu/mapapi/radar/RadarSearchError;
    { class } function _GetRADAR_PERMISSION_UNFINISHED: JRadarSearchError;
    // Lcom/baidu/mapapi/radar/RadarSearchError;

    { static Methods }
    { class } function values: TJavaObjectArray<JRadarSearchError>; cdecl;
    // ()[Lcom/baidu/mapapi/radar/RadarSearchError;
    { class } function valueOf(P1: JString): JRadarSearchError; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/radar/RadarSearchError;

    { static Property }
    { class } property RADAR_NO_ERROR: JRadarSearchError
      read _GetRADAR_NO_ERROR;
    { class } property RADAR_NO_RESULT: JRadarSearchError
      read _GetRADAR_NO_RESULT;
    { class } property RADAR_AK_NOT_BIND: JRadarSearchError
      read _GetRADAR_AK_NOT_BIND;
    { class } property RADAR_NETWORK_ERROR: JRadarSearchError
      read _GetRADAR_NETWORK_ERROR;
    { class } property RADAR_NETWORK_TIMEOUT: JRadarSearchError
      read _GetRADAR_NETWORK_TIMEOUT;
    { class } property RADAR_AK_ERROR: JRadarSearchError
      read _GetRADAR_AK_ERROR;
    { class } property RADAR_USERID_NOT_EXIST: JRadarSearchError
      read _GetRADAR_USERID_NOT_EXIST;
    { class } property RADAR_FORBID_BY_USER: JRadarSearchError
      read _GetRADAR_FORBID_BY_USER;
    { class } property RADAR_FORBID_BY_ADMIN: JRadarSearchError
      read _GetRADAR_FORBID_BY_ADMIN;
    { class } property RADAR_PERMISSION_UNFINISHED: JRadarSearchError
      read _GetRADAR_PERMISSION_UNFINISHED;
  end;

  [JavaSignature('com/baidu/mapapi/radar/RadarSearchError')]
  JRadarSearchError = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{6F98D0F7-5DDA-48BB-8217-1BE9EB32921B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRadarSearchError = class(TJavaGenericImport<JRadarSearchErrorClass,
    JRadarSearchError>)
  end;

  JRadarSearchListenerClass = interface(JObjectClass)
    ['{24967415-1C11-44F4-A035-91BA06223F00}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/radar/RadarSearchListener')]
  JRadarSearchListener = interface(IJavaInstance)
    ['{A205FD74-12C3-4B07-B268-CE90D9F68F38}']
    { Property Methods }

    { methods }
    procedure onGetNearbyInfoList(P1: JRadarNearbyResult;
      P2: JRadarSearchError); cdecl;
    // (Lcom/baidu/mapapi/radar/RadarNearbyResult;Lcom/baidu/mapapi/radar/RadarSearchError;)V
    procedure onGetUploadState(P1: JRadarSearchError); cdecl;
    // (Lcom/baidu/mapapi/radar/RadarSearchError;)V
    procedure onGetClearInfoState(P1: JRadarSearchError); cdecl;
    // (Lcom/baidu/mapapi/radar/RadarSearchError;)V

    { Property }
  end;

  TJRadarSearchListener = class(TJavaGenericImport<JRadarSearchListenerClass,
    JRadarSearchListener>)
  end;

  JRadarSearchManagerClass = interface(JObjectClass)
    ['{87D15B9E-5F90-48AE-A267-D8F43E8F7BAA}']
    { static Property Methods }

    { static Methods }
    { class } function getInstance: JRadarSearchManager; cdecl;
    // ()Lcom/baidu/mapapi/radar/RadarSearchManager;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/radar/RadarSearchManager')]
  JRadarSearchManager = interface(JObject)
    ['{B144A34F-BB5F-4FE8-8A21-8A2CB9C69E92}']
    { Property Methods }

    { methods }
    procedure setUserID(P1: JString); cdecl; // (Ljava/lang/String;)V
    procedure clearUserInfo; cdecl; // ()V
    function nearbyInfoRequest(P1: JRadarNearbySearchOption): Boolean; cdecl;
    // (Lcom/baidu/mapapi/radar/RadarNearbySearchOption;)Z
    procedure startUploadAuto(P1: JRadarUploadInfoCallback; P2: Integer); cdecl;
    // (Lcom/baidu/mapapi/radar/RadarUploadInfoCallback;I)V
    procedure stopUploadAuto; cdecl; // ()V
    procedure addNearbyInfoListener(P1: JRadarSearchListener); cdecl;
    // (Lcom/baidu/mapapi/radar/RadarSearchListener;)V
    procedure removeNearbyInfoListener(P1: JRadarSearchListener); cdecl;
    // (Lcom/baidu/mapapi/radar/RadarSearchListener;)V
    function uploadInfoRequest(P1: JRadarUploadInfo): Boolean; cdecl;
    // (Lcom/baidu/mapapi/radar/RadarUploadInfo;)Z
    procedure destroy; cdecl; // ()V

    { Property }
  end;

  TJRadarSearchManager = class(TJavaGenericImport<JRadarSearchManagerClass,
    JRadarSearchManager>)
  end;

  JRadarUploadInfoClass = interface(JObjectClass)
    ['{57DA55A6-A66F-4B22-88F2-ED3A35AFE9B7}']
    { static Property Methods }

    { static Methods }
    { class } function init: JRadarUploadInfo; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/radar/RadarUploadInfo')]
  JRadarUploadInfo = interface(JObject)
    ['{FA0EFFD9-C8E0-499A-8D6F-EA50C0EF6B87}']
    { Property Methods }
    function _Getpt: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _Setpt(apt: JLatLng); // (Lcom/baidu/mapapi/model/LatLng;)V
    function _Getcomments: JString; // Ljava/lang/String;
    procedure _Setcomments(acomments: JString); // (Ljava/lang/String;)V

    { methods }

    { Property }
    property pt: JLatLng read _Getpt write _Setpt;
    property comments: JString read _Getcomments write _Setcomments;
  end;

  TJRadarUploadInfo = class(TJavaGenericImport<JRadarUploadInfoClass,
    JRadarUploadInfo>)
  end;

  JRadarUploadInfoCallbackClass = interface(JObjectClass)
    ['{CE586459-B577-4F54-9A91-7672E2E6BA58}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/radar/RadarUploadInfoCallback')]
  JRadarUploadInfoCallback = interface(IJavaInstance)
    ['{4486AE12-279E-4683-B0E0-F680BB3F426F}']
    { Property Methods }

    { methods }
    function onUploadInfoCallback: JRadarUploadInfo; cdecl;
    // ()Lcom/baidu/mapapi/radar/RadarUploadInfo;

    { Property }
  end;

  TJRadarUploadInfoCallback = class
    (TJavaGenericImport<JRadarUploadInfoCallbackClass,
    JRadarUploadInfoCallback>)
  end;

  JVersionInfoClass = interface(JObjectClass)
    ['{5D991709-73F8-4FA0-B74E-B1B02BAD81BF}']
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

  [JavaSignature('com/baidu/mapapi/radar/VersionInfo')]
  JVersionInfo = interface(JObject)
    ['{CD9A38D4-493E-46FB-BF2C-88DD0C1AD55D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJVersionInfo = class(TJavaGenericImport<JVersionInfoClass, JVersionInfo>)
  end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.radar.RadarNearbyInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.radar.JRadarNearbyInfo));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.radar.RadarNearbyResult',
    TypeInfo(Androidapi.JNI.baidu.mapapi.radar.JRadarNearbyResult));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.radar.RadarNearbySearchOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.radar.JRadarNearbySearchOption));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.radar.RadarNearbySearchSortType',
    TypeInfo(Androidapi.JNI.baidu.mapapi.radar.JRadarNearbySearchSortType));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.radar.RadarSearchError',
    TypeInfo(Androidapi.JNI.baidu.mapapi.radar.JRadarSearchError));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.radar.RadarSearchListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.radar.JRadarSearchListener));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.radar.RadarSearchManager',
    TypeInfo(Androidapi.JNI.baidu.mapapi.radar.JRadarSearchManager));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.radar.RadarUploadInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.radar.JRadarUploadInfo));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.radar.RadarUploadInfoCallback',
    TypeInfo(Androidapi.JNI.baidu.mapapi.radar.JRadarUploadInfoCallback));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.radar.VersionInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.radar.JVersionInfo));
end;

initialization

RegisterTypes;

end.
