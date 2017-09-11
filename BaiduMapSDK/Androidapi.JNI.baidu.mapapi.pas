unit Androidapi.JNI.baidu.mapapi;
// ====================================================
// Android Baidu Map SDK interface
// package:com.baidu.map
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
  Androidapi.JNI.JavaTypes;

type
  // ===== Forward declarations =====
  JModuleName = interface; // com.baidu.mapapi.ModuleName
  JCoordType = interface; // com.baidu.mapapi.CoordType
  JOpenLogUtil = interface; // com.baidu.mapapi.OpenLogUtil
  JSDKInitializer = interface; // com.baidu.mapapi.SDKInitializer
  JVersionInfo = interface; // com.baidu.mapapi.VersionInfo

  // ===== Interface declarations =====
  JModuleNameClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{5A2265E6-B6DE-42CA-8AFE-47412DC4349D}']
    { static Property Methods }
    { class } function _GetTILE_OVERLAY_MODULE: JModuleName;
    // Lcom/baidu/mapapi/ModuleName;

    { static Methods }
    { class } function values: TJavaObjectArray<JModuleName>; cdecl;
    // ()[Lcom/baidu/mapapi/ModuleName;
    { class } function valueOf(P1: JString): JModuleName; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/ModuleName;

    { static Property }
    { class } property TILE_OVERLAY_MODULE: JModuleName
      read _GetTILE_OVERLAY_MODULE;
  end;

  [JavaSignature('com/baidu/mapapi/ModuleName')]
  JModuleName = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
    ['{BD0F990B-9259-48A5-A32E-2261F11EBC6D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJModuleName = class(TJavaGenericImport<JModuleNameClass, JModuleName>)
  end;

  JCoordTypeClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{86BFBB2A-F389-4A52-B20F-080E02FB81CA}']
    { static Property Methods }
    { class } function _GetGCJ02: JCoordType; // Lcom/baidu/mapapi/CoordType;
    { class } function _GetBD09LL: JCoordType; // Lcom/baidu/mapapi/CoordType;

    { static Methods }
    { class } function values: TJavaObjectArray<JCoordType>; cdecl;
    // ()[Lcom/baidu/mapapi/CoordType;
    { class } function valueOf(P1: JString): JCoordType; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/CoordType;

    { static Property }
    { class } property GCJ02: JCoordType read _GetGCJ02;
    { class } property BD09LL: JCoordType read _GetBD09LL;
  end;

  [JavaSignature('com/baidu/mapapi/CoordType')]
  JCoordType = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
    ['{E5150E18-2A84-4DC2-B27A-5D61CC468C05}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCoordType = class(TJavaGenericImport<JCoordTypeClass, JCoordType>)
  end;

  JOpenLogUtilClass = interface(JObjectClass)
    ['{DF528496-713C-439F-A144-31796C17EE8E}']
    { static Property Methods }

    { static Methods }
    { class } function init: JOpenLogUtil; cdecl; // ()V
    { class } procedure setModuleLogEnable(P1: JModuleName; P2: Boolean); cdecl;
    // (Lcom/baidu/mapapi/ModuleName;Z)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/OpenLogUtil')]
  JOpenLogUtil = interface(JObject)
    ['{10EB569C-CE7E-4C32-970D-558F359268AF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOpenLogUtil = class(TJavaGenericImport<JOpenLogUtilClass, JOpenLogUtil>)
  end;

  JSDKInitializerClass = interface(JObjectClass)
    ['{DFDA0430-82FB-479C-A3C9-D0C41599A584}']
    { static Property Methods }
    { class } function _GetSDK_BROADTCAST_ACTION_STRING_PERMISSION_CHECK_OK
      : JString; // Ljava/lang/String;
    { class } function _GetSDK_BROADTCAST_ACTION_STRING_PERMISSION_CHECK_ERROR
      : JString; // Ljava/lang/String;
    { class } function _GetSDK_BROADCAST_ACTION_STRING_NETWORK_ERROR: JString;
    // Ljava/lang/String;
    { class } function _GetSDK_BROADTCAST_INTENT_EXTRA_INFO_KEY_ERROR_CODE
      : JString; // Ljava/lang/String;

    { static Methods }
    { class } procedure initialize(P1: JString; P2: JContext); cdecl; overload;
    // (Ljava/lang/String;Landroid/content/Context;)V
    { class } procedure initialize(P1: JContext); cdecl; overload;
    // (Landroid/content/Context;)V
    { class } procedure setCoordType(P1: JCoordType); cdecl;
    // (Lcom/baidu/mapapi/CoordType;)V
    { class } function getCoordType: JCoordType; cdecl;
    // ()Lcom/baidu/mapapi/CoordType;

    { static Property }
    { class } property SDK_BROADTCAST_ACTION_STRING_PERMISSION_CHECK_OK: JString
      read _GetSDK_BROADTCAST_ACTION_STRING_PERMISSION_CHECK_OK;
    { class } property SDK_BROADTCAST_ACTION_STRING_PERMISSION_CHECK_ERROR
      : JString read _GetSDK_BROADTCAST_ACTION_STRING_PERMISSION_CHECK_ERROR;
    { class } property SDK_BROADCAST_ACTION_STRING_NETWORK_ERROR: JString
      read _GetSDK_BROADCAST_ACTION_STRING_NETWORK_ERROR;
    { class } property SDK_BROADTCAST_INTENT_EXTRA_INFO_KEY_ERROR_CODE: JString
      read _GetSDK_BROADTCAST_INTENT_EXTRA_INFO_KEY_ERROR_CODE;
  end;

  [JavaSignature('com/baidu/mapapi/SDKInitializer')]
  JSDKInitializer = interface(JObject)
    ['{923EE9EC-8263-4B37-BA23-A133CD5AD160}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSDKInitializer = class(TJavaGenericImport<JSDKInitializerClass,
    JSDKInitializer>)
  end;

  JVersionInfoClass = interface(JObjectClass)
    ['{B972F96C-B230-481E-BFD2-EE44BF51764B}']
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

  [JavaSignature('com/baidu/mapapi/VersionInfo')]
  JVersionInfo = interface(JObject)
    ['{F6A60A24-D42D-4924-9F1A-483F0DA9BBAE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJVersionInfo = class(TJavaGenericImport<JVersionInfoClass, JVersionInfo>)
  end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.ModuleName',
    TypeInfo(Androidapi.JNI.baidu.mapapi.JModuleName));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.CoordType',
    TypeInfo(Androidapi.JNI.baidu.mapapi.JCoordType));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.OpenLogUtil',
    TypeInfo(Androidapi.JNI.baidu.mapapi.JOpenLogUtil));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.SDKInitializer',
    TypeInfo(Androidapi.JNI.baidu.mapapi.JSDKInitializer));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.VersionInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.JVersionInfo));
end;

initialization

RegisterTypes;

end.
