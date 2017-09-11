unit Androidapi.JNI.baidu.navisdk;
// ====================================================
// Android Baidu Map SDK interface
// Package:com.baidu.navisdk.adapter
// com.baidu.navisdk.adapter.base
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
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes;

type
  // ===== Forward declarations =====
  // com.baidu.navisdk.adapter
  JBaiduNaviCommonModule_BaiduNaviCommonViewConstans = interface;
  // com.baidu.navisdk.adapter.BaiduNaviCommonModule$BaiduNaviCommonViewConstans
  JBaiduNaviCommonModule = interface;
  // com.baidu.navisdk.adapter.BaiduNaviCommonModule
  JBaiduNaviManager_NavEventListener = interface;
  // com.baidu.navisdk.adapter.BaiduNaviManager$NavEventListener
  JBaiduNaviManager_NaviInitListener = interface;
  // com.baidu.navisdk.adapter.BaiduNaviManager$NaviInitListener
  JBaiduNaviManager_RoutePlanListener = interface;
  // com.baidu.navisdk.adapter.BaiduNaviManager$RoutePlanListener
  JBaiduNaviManager_RoutePlanPreference = interface;
  // com.baidu.navisdk.adapter.BaiduNaviManager$RoutePlanPreference
  JBaiduNaviManager_TTSPlayMsgType = interface;
  // com.baidu.navisdk.adapter.BaiduNaviManager$TTSPlayMsgType
  JBaiduNaviManager_TTSPlayStateListener = interface;
  // com.baidu.navisdk.adapter.BaiduNaviManager$TTSPlayStateListener
  JBaiduNaviManager = interface; // com.baidu.navisdk.adapter.BaiduNaviManager
  JBNaviBaseCallback = interface; // com.baidu.navisdk.adapter.BNaviBaseCallback
  JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_BNaviInnerTTSCallbackConstants =
    interface;
  // com.baidu.navisdk.adapter.BNaviBaseCallbackModel$BNaviBaseCallbackConstants$BNaviInnerTTSCallbackConstants
  JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_BNaviTTSCallbackConstants =
    interface;
  // com.baidu.navisdk.adapter.BNaviBaseCallbackModel$BNaviBaseCallbackConstants$BNaviTTSCallbackConstants
  JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_NavigationListenerConstants =
    interface;
  // com.baidu.navisdk.adapter.BNaviBaseCallbackModel$BNaviBaseCallbackConstants$NavigationListenerConstants
  JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_NaviInitListenerConstants =
    interface;
  // com.baidu.navisdk.adapter.BNaviBaseCallbackModel$BNaviBaseCallbackConstants$NaviInitListenerConstants
  JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_RoutePlanListenerConstants =
    interface;
  // com.baidu.navisdk.adapter.BNaviBaseCallbackModel$BNaviBaseCallbackConstants$RoutePlanListenerConstants
  JBNaviBaseCallbackModel_BNaviBaseCallbackConstants = interface;
  // com.baidu.navisdk.adapter.BNaviBaseCallbackModel$BNaviBaseCallbackConstants
  JBNaviBaseCallbackModel = interface;
  // com.baidu.navisdk.adapter.BNaviBaseCallbackModel
  JBNaviCommonModuleCallback = interface;
  // com.baidu.navisdk.adapter.BNaviCommonModuleCallback
  JBNaviCommonModuleController_SDKListenerMatchingException = interface;
  // com.baidu.navisdk.adapter.BNaviCommonModuleController$SDKListenerMatchingException
  JBNaviCommonModuleController = interface;
  // com.baidu.navisdk.adapter.BNaviCommonModuleController
  JBNaviCommonParams_BNEnlargeRoadKey = interface;
  // com.baidu.navisdk.adapter.BNaviCommonParams$BNEnlargeRoadKey
  JBNaviCommonParams_BNGuideKey = interface;
  // com.baidu.navisdk.adapter.BNaviCommonParams$BNGuideKey
  JBNaviCommonParams_BNRouteInfoKey = interface;
  // com.baidu.navisdk.adapter.BNaviCommonParams$BNRouteInfoKey
  JBNaviCommonParams_MessageType = interface;
  // com.baidu.navisdk.adapter.BNaviCommonParams$MessageType
  JBNaviCommonParams = interface; // com.baidu.navisdk.adapter.BNaviCommonParams
  JBNaviSettingManager_DayNightMode = interface;
  // com.baidu.navisdk.adapter.BNaviSettingManager$DayNightMode
  JBNaviSettingManager_HUDMode = interface;
  // com.baidu.navisdk.adapter.BNaviSettingManager$HUDMode
  JBNaviSettingManager_PowerSaveMode = interface;
  // com.baidu.navisdk.adapter.BNaviSettingManager$PowerSaveMode
  JBNaviSettingManager_PreViewRoadCondition = interface;
  // com.baidu.navisdk.adapter.BNaviSettingManager$PreViewRoadCondition
  JBNaviSettingManager_RealRoadCondition = interface;
  // com.baidu.navisdk.adapter.BNaviSettingManager$RealRoadCondition
  JBNaviSettingManager_VoiceMode = interface;
  // com.baidu.navisdk.adapter.BNaviSettingManager$VoiceMode
  JBNaviSettingManager = interface;
  // com.baidu.navisdk.adapter.BNaviSettingManager
  JBNCommonSettingParam = interface;
  // com.baidu.navisdk.adapter.BNCommonSettingParam
  JBNOuterLogUtil = interface; // com.baidu.navisdk.adapter.BNOuterLogUtil
  JBNOuterTTSPlayerCallback = interface;
  // com.baidu.navisdk.adapter.BNOuterTTSPlayerCallback
  JBNRouteGuideManager_CustomizedLayerItem = interface;
  // com.baidu.navisdk.adapter.BNRouteGuideManager$CustomizedLayerItem
  JBNRouteGuideManager_OnNavigationListener = interface;
  // com.baidu.navisdk.adapter.BNRouteGuideManager$OnNavigationListener
  JBNRouteGuideManager_VoiceMode = interface;
  // com.baidu.navisdk.adapter.BNRouteGuideManager$VoiceMode
  JBNRouteGuideManager = interface;
  // com.baidu.navisdk.adapter.BNRouteGuideManager
  JBNRoutePlanNode_CoordinateType = interface;
  // com.baidu.navisdk.adapter.BNRoutePlanNode$CoordinateType
  JBNRoutePlanNode = interface; // com.baidu.navisdk.adapter.BNRoutePlanNode
  JCommandDeclare = interface; // com.baidu.navisdk.adapter.CommandDeclare
  JNaviModuleFactory = interface; // com.baidu.navisdk.adapter.NaviModuleFactory
  JNaviModuleImpl_BNaviCommonModuleConstants = interface;
  // com.baidu.navisdk.adapter.NaviModuleImpl$BNaviCommonModuleConstants
  JNaviModuleImpl = interface; // com.baidu.navisdk.adapter.NaviModuleImpl
  JPackageUtil = interface; // com.baidu.navisdk.adapter.PackageUtil

  // com.baidu.navisdk.adapter.base
  JBaiduNaviSDKLoader = interface;
  // com.baidu.navisdk.adapter.base.BaiduNaviSDKLoader
  JBaiduNaviSDKProxy = interface;
  // com.baidu.navisdk.adapter.base.BaiduNaviSDKProxy

  // ===== Interface declarations =====
  JBaiduNaviCommonModule_BaiduNaviCommonViewConstansClass = interface
    (JObjectClass)
    ['{E8630E16-94A0-4FA9-9091-379043D586BE}']
    { static Property Methods }
    { class } function _GetRouteGuideType: Integer; // I

    { static Methods }

    { static Property }
    { class } property RouteGuideType: Integer read _GetRouteGuideType;
  end;

  [JavaSignature
    ('com/baidu/navisdk/adapter/BaiduNaviCommonModule$BaiduNaviCommonViewConstans')
    ]
  JBaiduNaviCommonModule_BaiduNaviCommonViewConstans = interface(IJavaInstance)
    ['{8B851C95-030E-40E9-929D-2C3355E0AD5D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBaiduNaviCommonModule_BaiduNaviCommonViewConstans = class
    (TJavaGenericImport<JBaiduNaviCommonModule_BaiduNaviCommonViewConstansClass,
    JBaiduNaviCommonModule_BaiduNaviCommonViewConstans>)
  end;

  JBaiduNaviCommonModuleClass = interface(JObjectClass)
    ['{00DDEE59-A42D-449E-B950-D74A7099DA8E}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBaiduNaviCommonModule; cdecl; // ()V
    { class } function onCommonMessageBack(what: Integer; arg1: Integer;
      arg2: Integer; mDataBundle: Integer; P5: JBundle): JObject; cdecl;
    // (IIIILandroid/os/Bundle;)Ljava/lang/Object;

    { static Property }
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BaiduNaviCommonModule')]
  JBaiduNaviCommonModule = interface(JObject)
    ['{7A99E897-0D8D-4AE4-8939-A7766CAEB35E}']
    { Property Methods }

    { methods }
    procedure initModule(moduleType: Integer; mActivity: JActivity;
      callbackType: Integer; mBNaviBaseCallback: JBNaviBaseCallback); cdecl;
    // (ILandroid/app/Activity;ILcom/baidu/navisdk/adapter/BNaviBaseCallback;)V
    procedure onCreate; cdecl; // ()V
    procedure onResume; cdecl; // ()V
    procedure onStart; cdecl; // ()V
    procedure onPause; cdecl; // ()V
    procedure onStop; cdecl; // ()V
    function getView: JView; cdecl; // ()Landroid/view/View;
    procedure onConfigurationChanged(newConfig: JConfiguration); cdecl;
    // (Landroid/content/res/Configuration;)V
    procedure onDestroy; cdecl; // ()V
    procedure onBackPressed; cdecl; overload; // ()V
    procedure onBackPressed(showDialog: Boolean); cdecl; overload; // (Z)V
    procedure setModuleParams(methodType: Integer; dataBundle: JBundle); cdecl;
    // (ILandroid/os/Bundle;)V
    function getModuleInfo(methodType: Integer; dataBundle: JBundle): JObject;
      cdecl; // (ILandroid/os/Bundle;)Ljava/lang/Object;

    { Property }
  end;

  TJBaiduNaviCommonModule = class
    (TJavaGenericImport<JBaiduNaviCommonModuleClass, JBaiduNaviCommonModule>)
  end;

  JBaiduNaviManager_NavEventListenerClass = interface(JObjectClass)
    ['{9DF11708-DBC3-4285-96CD-EA152A5DEEA8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BaiduNaviManager$NavEventListener')]
  JBaiduNaviManager_NavEventListener = interface(IJavaInstance)
    ['{05D6A5E5-548E-4A09-93FB-9925E3A7D20E}']
    { Property Methods }

    { methods }
    procedure onCommonEventCall(P1: Integer; P2: Integer; P3: Integer;
      P4: JBundle); cdecl; // (IIILandroid/os/Bundle;)V

    { Property }
  end;

  TJBaiduNaviManager_NavEventListener = class
    (TJavaGenericImport<JBaiduNaviManager_NavEventListenerClass,
    JBaiduNaviManager_NavEventListener>)
  end;

  JBaiduNaviManager_NaviInitListenerClass = interface(JObjectClass)
    ['{0DD325DA-E10A-4127-B0D8-DBCFA2895363}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BaiduNaviManager$NaviInitListener')]
  JBaiduNaviManager_NaviInitListener = interface(IJavaInstance)
    ['{4A0BB137-92AD-4297-990B-616205EA46BE}']
    { Property Methods }

    { methods }
    procedure onAuthResult(P1: Integer; P2: JString); cdecl;
    // (ILjava/lang/String;)V
    procedure initStart; cdecl; // ()V
    procedure initSuccess; cdecl; // ()V
    procedure initFailed; cdecl; // ()V

    { Property }
  end;

  TJBaiduNaviManager_NaviInitListener = class
    (TJavaGenericImport<JBaiduNaviManager_NaviInitListenerClass,
    JBaiduNaviManager_NaviInitListener>)
  end;

  JBaiduNaviManager_RoutePlanListenerClass = interface(JObjectClass)
    ['{998C895C-996D-4C6F-8DD0-23ADDE08E61F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature
    ('com/baidu/navisdk/adapter/BaiduNaviManager$RoutePlanListener')]
  JBaiduNaviManager_RoutePlanListener = interface(IJavaInstance)
    ['{21BDF4D7-11CB-454B-B338-B01B7BECF227}']
    { Property Methods }

    { methods }
    procedure onJumpToNavigator; cdecl; // ()V
    procedure onRoutePlanFailed; cdecl; // ()V

    { Property }
  end;

  TJBaiduNaviManager_RoutePlanListener = class
    (TJavaGenericImport<JBaiduNaviManager_RoutePlanListenerClass,
    JBaiduNaviManager_RoutePlanListener>)
  end;

  JBaiduNaviManager_RoutePlanPreferenceClass = interface(JObjectClass)
    ['{02EF20F5-FBEF-4190-B675-E610D6375B9E}']
    { static Property Methods }
    { class } function _GetROUTE_PLAN_MOD_RECOMMEND: Integer; // I
    { class } function _GetROUTE_PLAN_MOD_MIN_TIME: Integer; // I
    { class } function _GetROUTE_PLAN_MOD_MIN_DIST: Integer; // I
    { class } function _GetROUTE_PLAN_MOD_MIN_TOLL: Integer; // I
    { class } function _GetROUTE_PLAN_MOD_AVOID_TAFFICJAM: Integer; // I

    { static Methods }

    { static Property }
    { class } property ROUTE_PLAN_MOD_RECOMMEND: Integer
      read _GetROUTE_PLAN_MOD_RECOMMEND;
    { class } property ROUTE_PLAN_MOD_MIN_TIME: Integer
      read _GetROUTE_PLAN_MOD_MIN_TIME;
    { class } property ROUTE_PLAN_MOD_MIN_DIST: Integer
      read _GetROUTE_PLAN_MOD_MIN_DIST;
    { class } property ROUTE_PLAN_MOD_MIN_TOLL: Integer
      read _GetROUTE_PLAN_MOD_MIN_TOLL;
    { class } property ROUTE_PLAN_MOD_AVOID_TAFFICJAM: Integer
      read _GetROUTE_PLAN_MOD_AVOID_TAFFICJAM;
  end;

  [JavaSignature
    ('com/baidu/navisdk/adapter/BaiduNaviManager$RoutePlanPreference')]
  JBaiduNaviManager_RoutePlanPreference = interface(IJavaInstance)
    ['{757793DA-EF6C-4C48-B397-0E0EF75EC4E4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBaiduNaviManager_RoutePlanPreference = class
    (TJavaGenericImport<JBaiduNaviManager_RoutePlanPreferenceClass,
    JBaiduNaviManager_RoutePlanPreference>)
  end;

  JBaiduNaviManager_TTSPlayMsgTypeClass = interface(JObjectClass)
    ['{A60B9C57-A0F9-4754-92F3-6026CD32C49C}']
    { static Property Methods }
    { class } function _GetPLAY_START_MSG: Integer; // I
    { class } function _GetPLAY_END_MSG: Integer; // I

    { static Methods }

    { static Property }
    { class } property PLAY_START_MSG: Integer read _GetPLAY_START_MSG;
    { class } property PLAY_END_MSG: Integer read _GetPLAY_END_MSG;
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BaiduNaviManager$TTSPlayMsgType')]
  JBaiduNaviManager_TTSPlayMsgType = interface(IJavaInstance)
    ['{2D0A734C-89B1-493D-AFB0-751CED535C8D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBaiduNaviManager_TTSPlayMsgType = class
    (TJavaGenericImport<JBaiduNaviManager_TTSPlayMsgTypeClass,
    JBaiduNaviManager_TTSPlayMsgType>)
  end;

  JBaiduNaviManager_TTSPlayStateListenerClass = interface(JObjectClass)
    ['{4F7AFF64-5041-4186-A809-D8BCA8D4CBE2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature
    ('com/baidu/navisdk/adapter/BaiduNaviManager$TTSPlayStateListener')]
  JBaiduNaviManager_TTSPlayStateListener = interface(IJavaInstance)
    ['{B85B4CD3-D8F9-4A34-AA60-87264F0FE0CB}']
    { Property Methods }

    { methods }
    procedure playStart; cdecl; // ()V
    procedure playEnd; cdecl; // ()V

    { Property }
  end;

  TJBaiduNaviManager_TTSPlayStateListener = class
    (TJavaGenericImport<JBaiduNaviManager_TTSPlayStateListenerClass,
    JBaiduNaviManager_TTSPlayStateListener>)
  end;

  JBaiduNaviManagerClass = interface(JObjectClass)
    ['{A7CB0510-044F-4EC9-AB81-28CC6E0398E1}']
    { static Property Methods }

    { static Methods }
    { class } function getInstance: JBaiduNaviManager; cdecl;
    // ()Lcom/baidu/navisdk/adapter/BaiduNaviManager;
    { class } function isNaviInited: Boolean; cdecl; // ()Z
    { class } function isNaviSoLoadSuccess: Boolean; cdecl; // ()Z

    { static Property }
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BaiduNaviManager')]
  JBaiduNaviManager = interface(JObject)
    ['{EEC82ABD-A6DC-4EB2-A597-80D388C5AEDD}']
    { Property Methods }

    { methods }
    procedure init(activity: JActivity; sdcardRootPath: JString;
      appFolderName: JString;
      naviInitListener: JBaiduNaviManager_NaviInitListener;
      ttsCallback: JBNOuterTTSPlayerCallback); cdecl; overload;
    // Deprecated //(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Lcom/baidu/navisdk/adapter/BaiduNaviManager$NaviInitListener;Lcom/baidu/navisdk/adapter/BNOuterTTSPlayerCallback;)V
    procedure init(activity: JActivity; sdcardRootPath: JString;
      appFolderName: JString;
      naviInitListener: JBaiduNaviManager_NaviInitListener;
      ttsCallback: JBNOuterTTSPlayerCallback; ttsHandler: JHandler;
      ttsStateListener: JBaiduNaviManager_TTSPlayStateListener); cdecl;
      overload; // (Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Lcom/baidu/navisdk/adapter/BaiduNaviManager$NaviInitListener;Lcom/baidu/navisdk/adapter/BNOuterTTSPlayerCallback;Landroid/os/Handler;Lcom/baidu/navisdk/adapter/BaiduNaviManager$TTSPlayStateListener;)V
    function versionReplace(activity: JActivity): Boolean; cdecl;
    // (Landroid/app/Activity;)Z
    function launchNavigator(activity: JActivity; nodes: JList;
      preference: Integer; isGPSNav: Boolean;
      listener: JBaiduNaviManager_RoutePlanListener): Boolean; cdecl; overload;
    // (Landroid/app/Activity;Ljava/util/List;IZLcom/baidu/navisdk/adapter/BaiduNaviManager$RoutePlanListener;)Z
    function launchNavigator(activity: JActivity; nodes: JList;
      preference: Integer; isGPSNav: Boolean;
      listener: JBaiduNaviManager_RoutePlanListener;
      msgListerner: JBaiduNaviManager_NavEventListener): Boolean; cdecl;
      overload; // (Landroid/app/Activity;Ljava/util/List;IZLcom/baidu/navisdk/adapter/BaiduNaviManager$RoutePlanListener;Lcom/baidu/navisdk/adapter/BaiduNaviManager$NavEventListener;)Z
    procedure uninit; cdecl; // ()V

    { Property }
  end;

  TJBaiduNaviManager = class(TJavaGenericImport<JBaiduNaviManagerClass,
    JBaiduNaviManager>)
  end;

  JBNaviBaseCallbackClass = interface(JObjectClass)
    ['{D0C9A828-93CE-4E21-B519-D08D9CA41D5B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNaviBaseCallback')]
  JBNaviBaseCallback = interface(IJavaInstance)
    ['{3DDB7E7A-7ABB-4F2C-B455-31FD3BDA833B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviBaseCallback = class(TJavaGenericImport<JBNaviBaseCallbackClass,
    JBNaviBaseCallback>)
  end;

  JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_BNaviInnerTTSCallbackConstantsClass =
    interface(JObjectClass)
    ['{DEE829BB-B181-4B11-BB71-F06944BC28C3}']
    { static Property Methods }
    { class } function _GetTTS_PLAY_START: Integer; // I
    { class } function _GetTTS_PLAY_END: Integer; // I

    { static Methods }

    { static Property }
    { class } property TTS_PLAY_START: Integer read _GetTTS_PLAY_START;
    { class } property TTS_PLAY_END: Integer read _GetTTS_PLAY_END;
  end;

  [JavaSignature
    ('com/baidu/navisdk/adapter/BNaviBaseCallbackModel$BNaviBaseCallbackConstants$BNaviInnerTTSCallbackConstants')
    ]
  JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_BNaviInnerTTSCallbackConstants =
    interface(IJavaInstance)
    ['{79145E10-11FA-4090-A4A4-B802B14D2591}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviBaseCallbackModel_BNaviBaseCallbackConstants_BNaviInnerTTSCallbackConstants =
    class(TJavaGenericImport<
    JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_BNaviInnerTTSCallbackConstantsClass,
    JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_BNaviInnerTTSCallbackConstants>)
  end;

  JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_BNaviTTSCallbackConstantsClass =
    interface(JObjectClass)
    ['{0D05C766-5693-4026-8282-1719EB87E2D6}']
    { static Property Methods }
    { class } function _GetTTS_GET_STATE: Integer; // I
    { class } function _GetTTS_INIT: Integer; // I
    { class } function _GetTTS_PAUSE: Integer; // I
    { class } function _GetTTS_PHONE_CALLING: Integer; // I
    { class } function _GetTTS_PHONE_HANGUP: Integer; // I
    { class } function _GetTTS_PLAY_TEXT: Integer; // I
    { class } function _GetTTS_RELEASE_PLAYER: Integer; // I
    { class } function _GetTTS_RESUME: Integer; // I
    { class } function _GetTTS_STOP: Integer; // I
    { class } function _GetSPEECH_CONTENT: JString; // Ljava/lang/String;

    { static Methods }

    { static Property }
    { class } property TTS_GET_STATE: Integer read _GetTTS_GET_STATE;
    { class } property TTS_INIT: Integer read _GetTTS_INIT;
    { class } property TTS_PAUSE: Integer read _GetTTS_PAUSE;
    { class } property TTS_PHONE_CALLING: Integer read _GetTTS_PHONE_CALLING;
    { class } property TTS_PHONE_HANGUP: Integer read _GetTTS_PHONE_HANGUP;
    { class } property TTS_PLAY_TEXT: Integer read _GetTTS_PLAY_TEXT;
    { class } property TTS_RELEASE_PLAYER: Integer read _GetTTS_RELEASE_PLAYER;
    { class } property TTS_RESUME: Integer read _GetTTS_RESUME;
    { class } property TTS_STOP: Integer read _GetTTS_STOP;
    { class } property SPEECH_CONTENT: JString read _GetSPEECH_CONTENT;
  end;

  [JavaSignature
    ('com/baidu/navisdk/adapter/BNaviBaseCallbackModel$BNaviBaseCallbackConstants$BNaviTTSCallbackConstants')
    ]
  JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_BNaviTTSCallbackConstants =
    interface(IJavaInstance)
    ['{D5D9DBD6-94C6-423E-A411-E9D03BEA972C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviBaseCallbackModel_BNaviBaseCallbackConstants_BNaviTTSCallbackConstants =
    class(TJavaGenericImport<
    JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_BNaviTTSCallbackConstantsClass,
    JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_BNaviTTSCallbackConstants>)
  end;

  JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_NavigationListenerConstantsClass =
    interface(JObjectClass)
    ['{982A668C-30C3-4EB6-8B21-AAB91F5B5603}']
    { static Property Methods }
    { class } function _GetNAVI_NOTIFY_OTHER_ACTION: Integer; // I
    { class } function _GetNAVI_GUID_END: Integer; // I
    { class } function _GetNAVIGATION_ACTION_TYPE: JString;
    // Ljava/lang/String;
    { class } function _GetNAVIGATION_OBJ: JString; // Ljava/lang/String;

    { static Methods }

    { static Property }
    { class } property NAVI_NOTIFY_OTHER_ACTION: Integer
      read _GetNAVI_NOTIFY_OTHER_ACTION;
    { class } property NAVI_GUID_END: Integer read _GetNAVI_GUID_END;
    { class } property NAVIGATION_ACTION_TYPE: JString
      read _GetNAVIGATION_ACTION_TYPE;
    { class } property NAVIGATION_OBJ: JString read _GetNAVIGATION_OBJ;
  end;

  [JavaSignature
    ('com/baidu/navisdk/adapter/BNaviBaseCallbackModel$BNaviBaseCallbackConstants$NavigationListenerConstants')
    ]
  JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_NavigationListenerConstants =
    interface(IJavaInstance)
    ['{06C2CFB9-9E58-40CE-87ED-ACEDBED2427C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviBaseCallbackModel_BNaviBaseCallbackConstants_NavigationListenerConstants =
    class(TJavaGenericImport<
    JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_NavigationListenerConstantsClass,
    JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_NavigationListenerConstants>)
  end;

  JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_NaviInitListenerConstantsClass =
    interface(JObjectClass)
    ['{5AE995D5-156D-44B7-8D08-94FC95242263}']
    { static Property Methods }
    { class } function _GetNAVI_INIT_FAILED: Integer; // I
    { class } function _GetNAVI_INIT_START: Integer; // I
    { class } function _GetNAVI_INIT_SUCCESS: Integer; // I
    { class } function _GetNAVI_ONAUTH_RESULT: Integer; // I
    { class } function _GetAUTH_MAG: JString; // Ljava/lang/String;

    { static Methods }

    { static Property }
    { class } property NAVI_INIT_FAILED: Integer read _GetNAVI_INIT_FAILED;
    { class } property NAVI_INIT_START: Integer read _GetNAVI_INIT_START;
    { class } property NAVI_INIT_SUCCESS: Integer read _GetNAVI_INIT_SUCCESS;
    { class } property NAVI_ONAUTH_RESULT: Integer read _GetNAVI_ONAUTH_RESULT;
    { class } property AUTH_MAG: JString read _GetAUTH_MAG;
  end;

  [JavaSignature
    ('com/baidu/navisdk/adapter/BNaviBaseCallbackModel$BNaviBaseCallbackConstants$NaviInitListenerConstants')
    ]
  JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_NaviInitListenerConstants =
    interface(IJavaInstance)
    ['{4D89CB7E-A8CE-46FE-9AA0-F02DD9124803}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviBaseCallbackModel_BNaviBaseCallbackConstants_NaviInitListenerConstants =
    class(TJavaGenericImport<
    JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_NaviInitListenerConstantsClass,
    JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_NaviInitListenerConstants>)
  end;

  JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_RoutePlanListenerConstantsClass =
    interface(JObjectClass)
    ['{1B250194-93FB-45B3-9464-3A27A63BB9E9}']
    { static Property Methods }
    { class } function _GetRPLAN_JUMP_NAVI: Integer; // I
    { class } function _GetRPLAN_FAILED: Integer; // I

    { static Methods }

    { static Property }
    { class } property RPLAN_JUMP_NAVI: Integer read _GetRPLAN_JUMP_NAVI;
    { class } property RPLAN_FAILED: Integer read _GetRPLAN_FAILED;
  end;

  [JavaSignature
    ('com/baidu/navisdk/adapter/BNaviBaseCallbackModel$BNaviBaseCallbackConstants$RoutePlanListenerConstants')
    ]
  JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_RoutePlanListenerConstants =
    interface(IJavaInstance)
    ['{E4678D4E-D2B3-4C79-8DB5-62E3215B418D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviBaseCallbackModel_BNaviBaseCallbackConstants_RoutePlanListenerConstants =
    class(TJavaGenericImport<
    JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_RoutePlanListenerConstantsClass,
    JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_RoutePlanListenerConstants>)
  end;

  JBNaviBaseCallbackModel_BNaviBaseCallbackConstantsClass = interface
    (JObjectClass)
    ['{45EC5F9C-4500-496E-AD9D-C6A88938D19A}']
    { static Property Methods }
    { class } function _GetCALLBACK_TTS_TYPE: Integer; // I
    { class } function _GetCALLBACK_INNERTTS_TYPE: Integer; // I
    { class } function _GetCALLBACK_NAVI_INIT_TYPE: Integer; // I
    { class } function _GetCALLBACK_ROUTEPLAN_TYPE: Integer; // I
    { class } function _GetCALLBACK_ROUTEGUIDE_TYPE: Integer; // I
    { class } function _GetCALLBACK_GUIDE_MSG_TYPE: Integer; // I

    { static Methods }

    { static Property }
    { class } property CALLBACK_TTS_TYPE: Integer read _GetCALLBACK_TTS_TYPE;
    { class } property CALLBACK_INNERTTS_TYPE: Integer
      read _GetCALLBACK_INNERTTS_TYPE;
    { class } property CALLBACK_NAVI_INIT_TYPE: Integer
      read _GetCALLBACK_NAVI_INIT_TYPE;
    { class } property CALLBACK_ROUTEPLAN_TYPE: Integer
      read _GetCALLBACK_ROUTEPLAN_TYPE;
    { class } property CALLBACK_ROUTEGUIDE_TYPE: Integer
      read _GetCALLBACK_ROUTEGUIDE_TYPE;
    { class } property CALLBACK_GUIDE_MSG_TYPE: Integer
      read _GetCALLBACK_GUIDE_MSG_TYPE;
  end;

  [JavaSignature
    ('com/baidu/navisdk/adapter/BNaviBaseCallbackModel$BNaviBaseCallbackConstants')
    ]
  JBNaviBaseCallbackModel_BNaviBaseCallbackConstants = interface(IJavaInstance)
    ['{E9BFD646-6C3A-412A-B47F-37E50F8AC538}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviBaseCallbackModel_BNaviBaseCallbackConstants = class
    (TJavaGenericImport<JBNaviBaseCallbackModel_BNaviBaseCallbackConstantsClass,
    JBNaviBaseCallbackModel_BNaviBaseCallbackConstants>)
  end;

  JBNaviBaseCallbackModelClass = interface(JObjectClass)
    ['{5E6DA3D4-267B-4383-8DF2-2FB1E26864F5}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBNaviBaseCallbackModel; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNaviBaseCallbackModel')]
  JBNaviBaseCallbackModel = interface(JObject)
    ['{116E2151-252A-4003-AA4C-EACC90A1D744}']
    { Property Methods }

    { methods }
    procedure initModel; cdecl; // ()V
    function getCallbackClassByType(aType: Integer): Jlang_Class; cdecl;
    // (I)Ljava/lang/Class;

    { Property }
  end;

  TJBNaviBaseCallbackModel = class
    (TJavaGenericImport<JBNaviBaseCallbackModelClass, JBNaviBaseCallbackModel>)
  end;

  JBNaviCommonModuleCallbackClass = interface(JObjectClass)
    ['{2BDA86E5-2746-4666-BD11-2609122E92DC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNaviCommonModuleCallback')]
  JBNaviCommonModuleCallback = interface(IJavaInstance)
    ['{9DCDB82E-E56A-49E7-9353-1E8E58AC3E52}']
    { Property Methods }

    { methods }
    function onCommonMessageBack(P1: Integer; P2: Integer; P3: Integer;
      P4: Integer; P5: JBundle): JObject; cdecl;
    // (IIIILandroid/os/Bundle;)Ljava/lang/Object;

    { Property }
  end;

  TJBNaviCommonModuleCallback = class
    (TJavaGenericImport<JBNaviCommonModuleCallbackClass,
    JBNaviCommonModuleCallback>)
  end;

  JBNaviCommonModuleController_SDKListenerMatchingExceptionClass = interface
    (JExceptionClass) // or JObjectClass // SuperSignature: java/lang/Exception
    ['{D3B43243-A4A7-41D1-A348-1277EFEEE767}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature
    ('com/baidu/navisdk/adapter/BNaviCommonModuleController$SDKListenerMatchingException')
    ]
  JBNaviCommonModuleController_SDKListenerMatchingException = interface
    (JException) // or JObject // SuperSignature: java/lang/Exception
    ['{4168D40D-47D4-4083-A7F3-AD53F333425C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviCommonModuleController_SDKListenerMatchingException = class
    (TJavaGenericImport<
    JBNaviCommonModuleController_SDKListenerMatchingExceptionClass,
    JBNaviCommonModuleController_SDKListenerMatchingException>)
  end;

  JBNaviCommonModuleControllerClass = interface(JObjectClass)
    ['{A7FE93CC-0F19-4688-A2D8-DA04D0AE716D}']
    { static Property Methods }

    { static Methods }
    { class } function getInstance: JBNaviCommonModuleController; cdecl;
    // ()Lcom/baidu/navisdk/adapter/BNaviCommonModuleController;

    { static Property }
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNaviCommonModuleController')]
  JBNaviCommonModuleController = interface(JObject)
    ['{687727B0-87F3-47A1-A9CE-F872109B5AB2}']
    { Property Methods }
    function _GetmBNOuterTTSPlayerCallback: JBNOuterTTSPlayerCallback;
    // Lcom/baidu/navisdk/adapter/BNOuterTTSPlayerCallback;
    procedure _SetmBNOuterTTSPlayerCallback(amBNOuterTTSPlayerCallback
      : JBNOuterTTSPlayerCallback);
    // (Lcom/baidu/navisdk/adapter/BNOuterTTSPlayerCallback;)V

    { methods }
    procedure registerCallbackInterface(callbackType: Integer;
      mBNaviBaseCallback: JBNaviBaseCallback); cdecl;
    // (ILcom/baidu/navisdk/adapter/BNaviBaseCallback;)V
    procedure unregisterCallbackInterface(callbackType: Integer;
      mBNaviBaseCallback: JBNaviBaseCallback); cdecl; overload;
    // Deprecated //(ILcom/baidu/navisdk/adapter/BNaviBaseCallback;)V
    procedure unregisterCallbackInterface(callbackType: Integer); cdecl;
      overload; // (I)V
    function onCommonMessageBack(aType: Integer; what: Integer; arg1: Integer;
      arg2: Integer; mDataBundle: JBundle): JObject; cdecl;
    // (IIIILandroid/os/Bundle;)Ljava/lang/Object;

    { Property }
    property mBNOuterTTSPlayerCallback: JBNOuterTTSPlayerCallback
      read _GetmBNOuterTTSPlayerCallback write _SetmBNOuterTTSPlayerCallback;
  end;

  TJBNaviCommonModuleController = class
    (TJavaGenericImport<JBNaviCommonModuleControllerClass,
    JBNaviCommonModuleController>)
  end;

  JBNaviCommonParams_BNEnlargeRoadKeyClass = interface(JObjectClass)
    ['{F3559023-E175-40E9-A5E5-BA321E6CEC18}']
    { static Property Methods }
    { class } function _GetENLARGE_TYPE: JString; // Ljava/lang/String;
    { class } function _GetRASTERMAPTYPE_DERECTBOARD: Integer; // I
    { class } function _GetRASTERMAPTYPE_GRID: Integer; // I
    { class } function _GetARROW_IMAGE: JString; // Ljava/lang/String;
    { class } function _GetBACKGROUND_IMAGE: JString; // Ljava/lang/String;
    { class } function _GetREMAIN_DISTANCE: JString; // Ljava/lang/String;
    { class } function _GetROAD_NAME: JString; // Ljava/lang/String;
    { class } function _GetDRIVE_PROGRESS: JString; // Ljava/lang/String;

    { static Methods }
    { class } function init: JBNaviCommonParams_BNEnlargeRoadKey; cdecl; // ()V

    { static Property }
    { class } property ENLARGE_TYPE: JString read _GetENLARGE_TYPE;
    { class } property RASTERMAPTYPE_DERECTBOARD: Integer
      read _GetRASTERMAPTYPE_DERECTBOARD;
    { class } property RASTERMAPTYPE_GRID: Integer read _GetRASTERMAPTYPE_GRID;
    { class } property ARROW_IMAGE: JString read _GetARROW_IMAGE;
    { class } property BACKGROUND_IMAGE: JString read _GetBACKGROUND_IMAGE;
    { class } property REMAIN_DISTANCE: JString read _GetREMAIN_DISTANCE;
    { class } property ROAD_NAME: JString read _GetROAD_NAME;
    { class } property DRIVE_PROGRESS: JString read _GetDRIVE_PROGRESS;
  end;

  [JavaSignature
    ('com/baidu/navisdk/adapter/BNaviCommonParams$BNEnlargeRoadKey')]
  JBNaviCommonParams_BNEnlargeRoadKey = interface(JObject)
    ['{C878DC13-91AA-4A43-8396-FB34A448E378}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviCommonParams_BNEnlargeRoadKey = class
    (TJavaGenericImport<JBNaviCommonParams_BNEnlargeRoadKeyClass,
    JBNaviCommonParams_BNEnlargeRoadKey>)
  end;

  JBNaviCommonParams_BNGuideKeyClass = interface(JObjectClass)
    ['{E103640B-02F7-445C-B2D9-BE7E2BE6DD0A}']
    { static Property Methods }
    { class } function _GetCURRENT_ROAD_NAME: JString; // Ljava/lang/String;
    { class } function _GetNEXT_ROAD_NAME: JString; // Ljava/lang/String;
    { class } function _GetTROAD_TURN_DISTANCE: JString; // Ljava/lang/String;
    { class } function _GetROAD_TURN_ICON: JString; // Ljava/lang/String;
    { class } function _GetIS_ALONG: JString; // Ljava/lang/String;
    { class } function _GetTOTAL_REMAIN_DISTANCE: JString; // Ljava/lang/String;
    { class } function _GetTOTAL_REMAIN_TIME: JString; // Ljava/lang/String;
    { class } function _GetFIRST_SERVICE_NAME: JString; // Ljava/lang/String;
    { class } function _GetFIRST_SERVICE_TIME: JString; // Ljava/lang/String;
    { class } function _GetSECOND_SERVICE_NAME: JString; // Ljava/lang/String;
    { class } function _GetSECOND_SERVICE_TIME: JString; // Ljava/lang/String;

    { static Methods }
    { class } function init: JBNaviCommonParams_BNGuideKey; cdecl; // ()V

    { static Property }
    { class } property CURRENT_ROAD_NAME: JString read _GetCURRENT_ROAD_NAME;
    { class } property NEXT_ROAD_NAME: JString read _GetNEXT_ROAD_NAME;
    { class } property TROAD_TURN_DISTANCE: JString
      read _GetTROAD_TURN_DISTANCE;
    { class } property ROAD_TURN_ICON: JString read _GetROAD_TURN_ICON;
    { class } property IS_ALONG: JString read _GetIS_ALONG;
    { class } property TOTAL_REMAIN_DISTANCE: JString
      read _GetTOTAL_REMAIN_DISTANCE;
    { class } property TOTAL_REMAIN_TIME: JString read _GetTOTAL_REMAIN_TIME;
    { class } property FIRST_SERVICE_NAME: JString read _GetFIRST_SERVICE_NAME;
    { class } property FIRST_SERVICE_TIME: JString read _GetFIRST_SERVICE_TIME;
    { class } property SECOND_SERVICE_NAME: JString
      read _GetSECOND_SERVICE_NAME;
    { class } property SECOND_SERVICE_TIME: JString
      read _GetSECOND_SERVICE_TIME;
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNaviCommonParams$BNGuideKey')]
  JBNaviCommonParams_BNGuideKey = interface(JObject)
    ['{D1B5F0EE-CD5B-4B2B-9A4E-3ABE93849249}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviCommonParams_BNGuideKey = class
    (TJavaGenericImport<JBNaviCommonParams_BNGuideKeyClass,
    JBNaviCommonParams_BNGuideKey>)
  end;

  JBNaviCommonParams_BNRouteInfoKeyClass = interface(JObjectClass)
    ['{1BCF1007-63DF-4A15-ADBA-2E46DCF46A55}']
    { static Property Methods }
    { class } function _GetTOTAL_DISTANCE: JString; // Ljava/lang/String;
    { class } function _GetTOTAL_TIME: JString; // Ljava/lang/String;
    { class } function _GetTOLL_FESS: JString; // Ljava/lang/String;
    { class } function _GetTRAFFIC_LIGHT: JString; // Ljava/lang/String;
    { class } function _GetGAS_MONEY: JString; // Ljava/lang/String;

    { static Methods }
    { class } function init: JBNaviCommonParams_BNRouteInfoKey; cdecl; // ()V

    { static Property }
    { class } property TOTAL_DISTANCE: JString read _GetTOTAL_DISTANCE;
    { class } property TOTAL_TIME: JString read _GetTOTAL_TIME;
    { class } property TOLL_FESS: JString read _GetTOLL_FESS;
    { class } property TRAFFIC_LIGHT: JString read _GetTRAFFIC_LIGHT;
    { class } property GAS_MONEY: JString read _GetGAS_MONEY;
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNaviCommonParams$BNRouteInfoKey')]
  JBNaviCommonParams_BNRouteInfoKey = interface(JObject)
    ['{8DF21D64-F896-4F40-A8D6-9B8F9316D886}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviCommonParams_BNRouteInfoKey = class
    (TJavaGenericImport<JBNaviCommonParams_BNRouteInfoKeyClass,
    JBNaviCommonParams_BNRouteInfoKey>)
  end;

  JBNaviCommonParams_MessageTypeClass = interface(JObjectClass)
    ['{AB4BB8E9-AF68-48BD-8AD3-7584C8407E75}']
    { static Property Methods }
    { class } function _GetRASTERMAPTYPE_DERECTBOARD: Integer; // I
    { class } function _GetRASTERMAPTYPE_GRID: Integer; // I
    { class } function _GetEVENT_NAVIGATING_STATE_BEGIN: Integer; // I
    { class } function _GetEVENT_NAVIGATING_STATE_END: Integer; // I
    { class } function _GetEVENT_GPS_LOCATED: Integer; // I
    { class } function _GetEVENT_GPS_DISMISS: Integer; // I
    { class } function _GetEVENT_ROUTEPLAN_BEGIN: Integer; // I
    { class } function _GetEVENT_ROUTEPLAN_END: Integer; // I
    { class } function _GetEVENT_ROUTEPLAN_SUCCESS: Integer; // I
    { class } function _GetEVENT_ROUTEPLAN_FAILED: Integer; // I
    { class } function _GetEVENT_AVOID_TRAFFIC_TIPS: Integer; // I
    { class } function _GetEVENT_AVOID_TRAFFIC_SWITCH: Integer; // I
    { class } function _GetEVENT_AVOID_TRAFFIC_EJECT: Integer; // I
    { class } function _GetEVENT_AVOID_TRAFFIC_SWITCH_SUCCESS: Integer; // I
    { class } function _GetEVENT_AVOID_TRAFFIC_SWITCH_FAILED: Integer; // I
    { class } function _GetEVENT_ON_YAW_SUCCESS: Integer; // I
    { class } function _GetEVENT_ROAD_TURN_ICON_UPDATE: Integer; // I
    { class } function _GetEVENT_ROAD_TURN_DISTANCE_UPDATE: Integer; // I
    { class } function _GetEVENT_ROAD_NEXT_ROAD_NAME: Integer; // I
    { class } function _GetEVENT_ROAD_CURRENT_ROAD_NAME: Integer; // I
    { class } function _GetEVENT_REMAIN_DISTANCE_UPDATE: Integer; // I
    { class } function _GetEVENT_REMAIN_TIME_UPDATE: Integer; // I
    { class } function _GetEVENT_RASTER_MAP_SHOW: Integer; // I
    { class } function _GetEVENT_RASTER_MAP_UPDATE: Integer; // I
    { class } function _GetEVENT_RASTER_MAP_HIDE: Integer; // I
    { class } function _GetEVENT_ROUTE_PLAN_SUCCESS: Integer; // I
    { class } function _GetEVENT_SERVICE_AREA_UPDATE: Integer; // I
    { class } function _GetEVENT_CURRENT_SPEED: Integer; // I
    { class } function _GetEVENT_ALONG_UPDATE: Integer; // I
    { class } function _GetEVENT_CURRENT_MILES: Integer; // I

    { static Methods }
    { class } function init: JBNaviCommonParams_MessageType; cdecl; // ()V

    { static Property }
    { class } property RASTERMAPTYPE_DERECTBOARD: Integer
      read _GetRASTERMAPTYPE_DERECTBOARD;
    { class } property RASTERMAPTYPE_GRID: Integer read _GetRASTERMAPTYPE_GRID;
    { class } property EVENT_NAVIGATING_STATE_BEGIN: Integer
      read _GetEVENT_NAVIGATING_STATE_BEGIN;
    { class } property EVENT_NAVIGATING_STATE_END: Integer
      read _GetEVENT_NAVIGATING_STATE_END;
    { class } property EVENT_GPS_LOCATED: Integer read _GetEVENT_GPS_LOCATED;
    { class } property EVENT_GPS_DISMISS: Integer read _GetEVENT_GPS_DISMISS;
    { class } property EVENT_ROUTEPLAN_BEGIN: Integer
      read _GetEVENT_ROUTEPLAN_BEGIN;
    { class } property EVENT_ROUTEPLAN_END: Integer
      read _GetEVENT_ROUTEPLAN_END;
    { class } property EVENT_ROUTEPLAN_SUCCESS: Integer
      read _GetEVENT_ROUTEPLAN_SUCCESS;
    { class } property EVENT_ROUTEPLAN_FAILED: Integer
      read _GetEVENT_ROUTEPLAN_FAILED;
    { class } property EVENT_AVOID_TRAFFIC_TIPS: Integer
      read _GetEVENT_AVOID_TRAFFIC_TIPS;
    { class } property EVENT_AVOID_TRAFFIC_SWITCH: Integer
      read _GetEVENT_AVOID_TRAFFIC_SWITCH;
    { class } property EVENT_AVOID_TRAFFIC_EJECT: Integer
      read _GetEVENT_AVOID_TRAFFIC_EJECT;
    { class } property EVENT_AVOID_TRAFFIC_SWITCH_SUCCESS: Integer
      read _GetEVENT_AVOID_TRAFFIC_SWITCH_SUCCESS;
    { class } property EVENT_AVOID_TRAFFIC_SWITCH_FAILED: Integer
      read _GetEVENT_AVOID_TRAFFIC_SWITCH_FAILED;
    { class } property EVENT_ON_YAW_SUCCESS: Integer
      read _GetEVENT_ON_YAW_SUCCESS;
    { class } property EVENT_ROAD_TURN_ICON_UPDATE: Integer
      read _GetEVENT_ROAD_TURN_ICON_UPDATE;
    { class } property EVENT_ROAD_TURN_DISTANCE_UPDATE: Integer
      read _GetEVENT_ROAD_TURN_DISTANCE_UPDATE;
    { class } property EVENT_ROAD_NEXT_ROAD_NAME: Integer
      read _GetEVENT_ROAD_NEXT_ROAD_NAME;
    { class } property EVENT_ROAD_CURRENT_ROAD_NAME: Integer
      read _GetEVENT_ROAD_CURRENT_ROAD_NAME;
    { class } property EVENT_REMAIN_DISTANCE_UPDATE: Integer
      read _GetEVENT_REMAIN_DISTANCE_UPDATE;
    { class } property EVENT_REMAIN_TIME_UPDATE: Integer
      read _GetEVENT_REMAIN_TIME_UPDATE;
    { class } property EVENT_RASTER_MAP_SHOW: Integer
      read _GetEVENT_RASTER_MAP_SHOW;
    { class } property EVENT_RASTER_MAP_UPDATE: Integer
      read _GetEVENT_RASTER_MAP_UPDATE;
    { class } property EVENT_RASTER_MAP_HIDE: Integer
      read _GetEVENT_RASTER_MAP_HIDE;
    { class } property EVENT_ROUTE_PLAN_SUCCESS: Integer
      read _GetEVENT_ROUTE_PLAN_SUCCESS;
    { class } property EVENT_SERVICE_AREA_UPDATE: Integer
      read _GetEVENT_SERVICE_AREA_UPDATE;
    { class } property EVENT_CURRENT_SPEED: Integer
      read _GetEVENT_CURRENT_SPEED;
    { class } property EVENT_ALONG_UPDATE: Integer read _GetEVENT_ALONG_UPDATE;
    { class } property EVENT_CURRENT_MILES: Integer
      read _GetEVENT_CURRENT_MILES;
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNaviCommonParams$MessageType')]
  JBNaviCommonParams_MessageType = interface(JObject)
    ['{D308B2A9-6A78-4C91-90F7-E530F056C3F5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviCommonParams_MessageType = class
    (TJavaGenericImport<JBNaviCommonParams_MessageTypeClass,
    JBNaviCommonParams_MessageType>)
  end;

  JBNaviCommonParamsClass = interface(JObjectClass)
    ['{2E269830-457D-4B9D-81DC-A67449109F84}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBNaviCommonParams; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNaviCommonParams')]
  JBNaviCommonParams = interface(JObject)
    ['{766B5BDE-4F9F-451F-A72B-CD1B91B3A2AE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviCommonParams = class(TJavaGenericImport<JBNaviCommonParamsClass,
    JBNaviCommonParams>)
  end;

  JBNaviSettingManager_DayNightModeClass = interface(JObjectClass)
    ['{1DD6CEB7-AAAE-4C85-A930-8F4869332E8F}']
    { static Property Methods }
    { class } function _GetDAY_NIGHT_MODE_NIGHT: Integer; // I
    { class } function _GetDAY_NIGHT_MODE_DAY: Integer; // I
    { class } function _GetDAY_NIGHT_MODE_AUTO: Integer; // I

    { static Methods }

    { static Property }
    { class } property DAY_NIGHT_MODE_NIGHT: Integer
      read _GetDAY_NIGHT_MODE_NIGHT;
    { class } property DAY_NIGHT_MODE_DAY: Integer read _GetDAY_NIGHT_MODE_DAY;
    { class } property DAY_NIGHT_MODE_AUTO: Integer
      read _GetDAY_NIGHT_MODE_AUTO;
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNaviSettingManager$DayNightMode')]
  JBNaviSettingManager_DayNightMode = interface(IJavaInstance)
    ['{6F508E16-A9CD-43BB-AC1A-B5A07D633524}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviSettingManager_DayNightMode = class
    (TJavaGenericImport<JBNaviSettingManager_DayNightModeClass,
    JBNaviSettingManager_DayNightMode>)
  end;

  JBNaviSettingManager_HUDModeClass = interface(JObjectClass)
    ['{EFFEE53C-C156-489B-A32C-75CEA63396E3}']
    { static Property Methods }
    { class } function _GetHUD_ENTER: Integer; // I
    { class } function _GetHUD_LEAVE: Integer; // I

    { static Methods }

    { static Property }
    { class } property HUD_ENTER: Integer read _GetHUD_ENTER;
    { class } property HUD_LEAVE: Integer read _GetHUD_LEAVE;
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNaviSettingManager$HUDMode')]
  JBNaviSettingManager_HUDMode = interface(IJavaInstance)
    ['{57D3F887-66F4-41BB-A80D-C85546ED634D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviSettingManager_HUDMode = class
    (TJavaGenericImport<JBNaviSettingManager_HUDModeClass,
    JBNaviSettingManager_HUDMode>)
  end;

  JBNaviSettingManager_PowerSaveModeClass = interface(JObjectClass)
    ['{B2C54713-6ECD-49D1-A78E-68F117729B4B}']
    { static Property Methods }
    { class } function _GetAUTO_MODE: Integer; // I
    { class } function _GetENABLE_MODE: Integer; // I
    { class } function _GetDISABLE_MODE: Integer; // I

    { static Methods }

    { static Property }
    { class } property AUTO_MODE: Integer read _GetAUTO_MODE;
    { class } property ENABLE_MODE: Integer read _GetENABLE_MODE;
    { class } property DISABLE_MODE: Integer read _GetDISABLE_MODE;
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNaviSettingManager$PowerSaveMode')]
  JBNaviSettingManager_PowerSaveMode = interface(IJavaInstance)
    ['{9C0A5492-CBD0-4012-808B-5EDAC725F3BA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviSettingManager_PowerSaveMode = class
    (TJavaGenericImport<JBNaviSettingManager_PowerSaveModeClass,
    JBNaviSettingManager_PowerSaveMode>)
  end;

  JBNaviSettingManager_PreViewRoadConditionClass = interface(JObjectClass)
    ['{BD1276F5-5494-4FE7-894F-F7E792BD2A8D}']
    { static Property Methods }
    { class } function _GetROAD_CONDITION_BAR_SHOW_OFF: Integer; // I
    { class } function _GetROAD_CONDITION_BAR_SHOW_ON: Integer; // I

    { static Methods }

    { static Property }
    { class } property ROAD_CONDITION_BAR_SHOW_OFF: Integer
      read _GetROAD_CONDITION_BAR_SHOW_OFF;
    { class } property ROAD_CONDITION_BAR_SHOW_ON: Integer
      read _GetROAD_CONDITION_BAR_SHOW_ON;
  end;

  [JavaSignature
    ('com/baidu/navisdk/adapter/BNaviSettingManager$PreViewRoadCondition')]
  JBNaviSettingManager_PreViewRoadCondition = interface(IJavaInstance)
    ['{0CB5DD7D-1A5E-45BB-9FE1-6DFE877AC96F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviSettingManager_PreViewRoadCondition = class
    (TJavaGenericImport<JBNaviSettingManager_PreViewRoadConditionClass,
    JBNaviSettingManager_PreViewRoadCondition>)
  end;

  JBNaviSettingManager_RealRoadConditionClass = interface(JObjectClass)
    ['{9671E168-A995-409D-B941-1008F215E3F0}']
    { static Property Methods }
    { class } function _GetNAVI_ITS_ON: Integer; // I
    { class } function _GetNAVI_ITS_OFF: Integer; // I

    { static Methods }

    { static Property }
    { class } property NAVI_ITS_ON: Integer read _GetNAVI_ITS_ON;
    { class } property NAVI_ITS_OFF: Integer read _GetNAVI_ITS_OFF;
  end;

  [JavaSignature
    ('com/baidu/navisdk/adapter/BNaviSettingManager$RealRoadCondition')]
  JBNaviSettingManager_RealRoadCondition = interface(IJavaInstance)
    ['{B4E4167B-4B19-4DC8-B068-9673F3C929CC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviSettingManager_RealRoadCondition = class
    (TJavaGenericImport<JBNaviSettingManager_RealRoadConditionClass,
    JBNaviSettingManager_RealRoadCondition>)
  end;

  JBNaviSettingManager_VoiceModeClass = interface(JObjectClass)
    ['{25A1F90E-B14C-4C0C-A2C7-BA9F90636ABE}']
    { static Property Methods }
    { class } function _GetVeteran: Integer; // I
    { class } function _GetNovice: Integer; // I
    { class } function _GetQuite: Integer; // I

    { static Methods }

    { static Property }
    { class } property Veteran: Integer read _GetVeteran;
    { class } property Novice: Integer read _GetNovice;
    { class } property Quite: Integer read _GetQuite;
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNaviSettingManager$VoiceMode')]
  JBNaviSettingManager_VoiceMode = interface(IJavaInstance)
    ['{929F0C21-C72C-4AFD-83BF-DB09991FE4D9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviSettingManager_VoiceMode = class
    (TJavaGenericImport<JBNaviSettingManager_VoiceModeClass,
    JBNaviSettingManager_VoiceMode>)
  end;

  JBNaviSettingManagerClass = interface(JObjectClass)
    ['{F637F63F-7D67-44BF-9D2D-508C041E193E}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBNaviSettingManager; cdecl; // ()V
    { class } procedure setVoiceMode(P1: Integer); cdecl; // (I)V
    { class } procedure setShowTotalRoadConditionBar(P1: Integer); cdecl;
    // (I)V
    { class } procedure setDayNightMode(P1: Integer); cdecl; // (I)V
    { class } procedure setPowerSaveMode(P1: Integer); cdecl;
    // Deprecated //(I)V
    { class } procedure setNaviSdkParam(P1: JBundle); cdecl;
    // (Landroid/os/Bundle;)V
    { class } procedure setIsAutoQuitWhenArrived(P1: Boolean); cdecl; // (Z)V
    { class } procedure setRealRoadCondition(P1: Integer); cdecl; // (I)V
    { class } procedure setHUDState(P1: Boolean); cdecl; // (Z)V

    { static Property }
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNaviSettingManager')]
  JBNaviSettingManager = interface(JObject)
    ['{74353E26-3BD9-4D15-B259-3E68DFAC594E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNaviSettingManager = class(TJavaGenericImport<JBNaviSettingManagerClass,
    JBNaviSettingManager>)
  end;

  JBNCommonSettingParamClass = interface(JObjectClass)
    ['{5923C25B-B74D-4F89-9BE3-3B78D9C89D37}']
    { static Property Methods }
    { class } function _GetTTS_APP_ID: JString; // Ljava/lang/String;

    { static Methods }
    { class } function init: JBNCommonSettingParam; cdecl; // ()V

    { static Property }
    { class } property TTS_APP_ID: JString read _GetTTS_APP_ID;
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNCommonSettingParam')]
  JBNCommonSettingParam = interface(JObject)
    ['{8E54BB40-E980-4381-917C-093037BF3938}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNCommonSettingParam = class(TJavaGenericImport<JBNCommonSettingParamClass,
    JBNCommonSettingParam>)
  end;

  JBNOuterLogUtilClass = interface(JObjectClass)
    ['{FC75498A-9354-447A-8830-62FF200D4C4C}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBNOuterLogUtil; cdecl; // ()V
    { class } procedure setLogSwitcher(P1: Boolean); cdecl; // (Z)V
    { class } procedure d(str: JString; ste: JString); cdecl;
    // (Ljava/lang/String;Ljava/lang/String;)V
    { class } function getLogSwitcher: Boolean; cdecl; // ()Z

    { static Property }
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNOuterLogUtil')]
  JBNOuterLogUtil = interface(JObject)
    ['{F20D13C5-D312-4F17-B99D-2240E50B4C28}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNOuterLogUtil = class(TJavaGenericImport<JBNOuterLogUtilClass,
    JBNOuterLogUtil>)
  end;

  JBNOuterTTSPlayerCallbackClass = interface(JObjectClass)
    ['{B6B0697A-2A3B-401E-AE59-6456BA8A8B70}']
    { static Property Methods }
    { class } function _GetPLAYER_STATE_NOT_INIT: Integer; // I
    { class } function _GetPLAYER_STATE_IDLE: Integer; // I
    { class } function _GetPLAYER_STATE_PLAYING: Integer; // I
    { class } function _GetPLAYER_STATE_PAUSE: Integer; // I
    { class } function _GetPLAYER_STATE_ERROR: Integer; // I

    { static Methods }

    { static Property }
    { class } property PLAYER_STATE_NOT_INIT: Integer
      read _GetPLAYER_STATE_NOT_INIT;
    { class } property PLAYER_STATE_IDLE: Integer read _GetPLAYER_STATE_IDLE;
    { class } property PLAYER_STATE_PLAYING: Integer
      read _GetPLAYER_STATE_PLAYING;
    { class } property PLAYER_STATE_PAUSE: Integer read _GetPLAYER_STATE_PAUSE;
    { class } property PLAYER_STATE_ERROR: Integer read _GetPLAYER_STATE_ERROR;
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNOuterTTSPlayerCallback')]
  JBNOuterTTSPlayerCallback = interface(IJavaInstance)
    ['{424C5B6E-C4E1-4649-BC7A-CB1E48E7F84F}']
    { Property Methods }

    { methods }
    function getTTSState: Integer; cdecl; // ()I
    function playTTSText(P1: JString; P2: Integer): Integer; cdecl;
    // (Ljava/lang/String;I)I
    procedure phoneCalling; cdecl; // ()V
    procedure phoneHangUp; cdecl; // ()V
    procedure initTTSPlayer; cdecl; // ()V
    procedure releaseTTSPlayer; cdecl; // ()V
    procedure stopTTS; cdecl; // ()V
    procedure resumeTTS; cdecl; // ()V
    procedure pauseTTS; cdecl; // ()V

    { Property }
  end;

  TJBNOuterTTSPlayerCallback = class
    (TJavaGenericImport<JBNOuterTTSPlayerCallbackClass,
    JBNOuterTTSPlayerCallback>)
  end;

  JBNRouteGuideManager_CustomizedLayerItemClass = interface(JObjectClass)
    ['{31369C43-FF96-46ED-8A03-DE863223C96A}']
    { static Property Methods }
    { class } function _GetALIGN_CENTER: Integer; // I
    { class } function _GetALIGN_BOTTON: Integer; // I
    { class } function _GetALIGN_TOP: Integer; // I

    { static Methods }
    { class } function init(longitude: Double; latitude: Double;
      P3: JBNRoutePlanNode_CoordinateType; markerDrawable: JDrawable;
      coordinateType: Integer): JBNRouteGuideManager_CustomizedLayerItem; cdecl;
    // (DDLcom/baidu/navisdk/adapter/BNRoutePlanNode$CoordinateType;Landroid/graphics/drawable/Drawable;I)V

    { static Property }
    { class } property ALIGN_CENTER: Integer read _GetALIGN_CENTER;
    { class } property ALIGN_BOTTON: Integer read _GetALIGN_BOTTON;
    { class } property ALIGN_TOP: Integer read _GetALIGN_TOP;
  end;

  [JavaSignature
    ('com/baidu/navisdk/adapter/BNRouteGuideManager$CustomizedLayerItem')]
  JBNRouteGuideManager_CustomizedLayerItem = interface(JObject)
    ['{A2EF186C-9DF9-45AB-BF7A-6A816651E349}']
    { Property Methods }

    { methods }
    function getLongitude: Double; cdecl; // ()D
    function getLatitude: Double; cdecl; // ()D
    function getCoordinateType: JBNRoutePlanNode_CoordinateType; cdecl;
    // ()Lcom/baidu/navisdk/adapter/BNRoutePlanNode$CoordinateType;
    function getMarkerDrawable: JDrawable; cdecl;
    // ()Landroid/graphics/drawable/Drawable;
    function getAlignType: Integer; cdecl; // ()I
    function isValid: Boolean; cdecl; // ()Z

    { Property }
  end;

  TJBNRouteGuideManager_CustomizedLayerItem = class
    (TJavaGenericImport<JBNRouteGuideManager_CustomizedLayerItemClass,
    JBNRouteGuideManager_CustomizedLayerItem>)
  end;

  JBNRouteGuideManager_OnNavigationListenerClass = interface(JObjectClass)
    ['{06F646AC-FE01-4CB2-A2CD-D4F0F75D0634}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature
    ('com/baidu/navisdk/adapter/BNRouteGuideManager$OnNavigationListener')]
  JBNRouteGuideManager_OnNavigationListener = interface(IJavaInstance)
    ['{FF8B6333-B907-4451-BF64-3302453A8094}']
    { Property Methods }

    { methods }
    procedure onNaviGuideEnd; cdecl; // ()V
    procedure notifyOtherAction(P1: Integer; P2: Integer; P3: Integer;
      P4: JObject); cdecl; // (IIILjava/lang/Object;)V

    { Property }
  end;

  TJBNRouteGuideManager_OnNavigationListener = class
    (TJavaGenericImport<JBNRouteGuideManager_OnNavigationListenerClass,
    JBNRouteGuideManager_OnNavigationListener>)
  end;

  JBNRouteGuideManager_VoiceModeClass = interface(JObjectClass)
    ['{914C4386-B30B-4DA0-890F-E1546D31006D}']
    { static Property Methods }
    { class } function _GetNovice: Integer; // I
    { class } function _GetVeteran: Integer; // I
    { class } function _GetQuite: Integer; // I

    { static Methods }

    { static Property }
    { class } property Novice: Integer read _GetNovice;
    { class } property Veteran: Integer read _GetVeteran;
    { class } property Quite: Integer read _GetQuite;
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNRouteGuideManager$VoiceMode')]
  JBNRouteGuideManager_VoiceMode = interface(IJavaInstance)
    ['{9E730B84-F62A-4605-8FF9-5B95C731477C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNRouteGuideManager_VoiceMode = class
    (TJavaGenericImport<JBNRouteGuideManager_VoiceModeClass,
    JBNRouteGuideManager_VoiceMode>)
  end;

  JBNRouteGuideManagerClass = interface(JObjectClass)
    ['{0D2C7AB5-B671-40C8-B61E-A0CAF8E58F30}']
    { static Property Methods }

    { static Methods }
    { class } function getInstance: JBNRouteGuideManager; cdecl;
    // ()Lcom/baidu/navisdk/adapter/BNRouteGuideManager;

    { static Property }
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNRouteGuideManager')]
  JBNRouteGuideManager = interface(JObject)
    ['{C7278FC4-D96B-4E4E-B4BE-04C55E5B96E6}']
    { Property Methods }

    { methods }
    function onCreate(activity: JActivity;
      listener: JBNRouteGuideManager_OnNavigationListener): JView; cdecl;
    // (Landroid/app/Activity;Lcom/baidu/navisdk/adapter/BNRouteGuideManager$OnNavigationListener;)Landroid/view/View;
    procedure onResume; cdecl; // ()V
    procedure onConfigurationChanged(newConfig: JConfiguration); cdecl;
    // (Landroid/content/res/Configuration;)V
    procedure onPause; cdecl; // ()V
    procedure onStop; cdecl; // ()V
    procedure onDestroy; cdecl; // ()V
    procedure onBackPressed(showQuitDialog: Boolean); cdecl; // (Z)V
    procedure onStart; cdecl; // ()V
    procedure forceQuitNaviWithoutDialog; cdecl; // ()V
    procedure setVoiceModeInNavi(voiceMode: Integer); cdecl; // (I)V
    function resetEndNodeInNavi(newEndNode: JBNRoutePlanNode): Boolean; cdecl;
    // (Lcom/baidu/navisdk/adapter/BNRoutePlanNode;)Z
    procedure showCustomizedLayer(show: Boolean); cdecl; // (Z)V
    procedure setCustomizedLayerItems(items: JList); cdecl;
    // (Ljava/util/List;)V

    { Property }
  end;

  TJBNRouteGuideManager = class(TJavaGenericImport<JBNRouteGuideManagerClass,
    JBNRouteGuideManager>)
  end;

  JBNRoutePlanNode_CoordinateTypeClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{AD8DE0A8-9EC4-47F6-8D90-721A958302BA}']
    { static Property Methods }
    { class } function _GetGCJ02: JBNRoutePlanNode_CoordinateType;
    // Lcom/baidu/navisdk/adapter/BNRoutePlanNode$CoordinateType;
    { class } function _GetBD09_MC: JBNRoutePlanNode_CoordinateType;
    // Lcom/baidu/navisdk/adapter/BNRoutePlanNode$CoordinateType;
    { class } function _GetWGS84: JBNRoutePlanNode_CoordinateType;
    // Lcom/baidu/navisdk/adapter/BNRoutePlanNode$CoordinateType;
    { class } function _GetBD09LL: JBNRoutePlanNode_CoordinateType;
    // Lcom/baidu/navisdk/adapter/BNRoutePlanNode$CoordinateType;

    { static Methods }
    { class } function values
      : TJavaObjectArray<JBNRoutePlanNode_CoordinateType>; cdecl;
    // ()[Lcom/baidu/navisdk/adapter/BNRoutePlanNode$CoordinateType;
    { class } function valueOf(P1: JString): JBNRoutePlanNode_CoordinateType;
      cdecl; // (Ljava/lang/String;)Lcom/baidu/navisdk/adapter/BNRoutePlanNode$CoordinateType;

    { static Property }
    { class } property GCJ02: JBNRoutePlanNode_CoordinateType read _GetGCJ02;
    { class } property BD09_MC: JBNRoutePlanNode_CoordinateType
      read _GetBD09_MC;
    { class } property WGS84: JBNRoutePlanNode_CoordinateType read _GetWGS84;
    { class } property BD09LL: JBNRoutePlanNode_CoordinateType read _GetBD09LL;
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNRoutePlanNode$CoordinateType')]
  JBNRoutePlanNode_CoordinateType = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{12EF06C3-1F2B-4F4A-93DF-FEA1C143DA37}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBNRoutePlanNode_CoordinateType = class
    (TJavaGenericImport<JBNRoutePlanNode_CoordinateTypeClass,
    JBNRoutePlanNode_CoordinateType>)
  end;

  JBNRoutePlanNodeClass = interface(JObjectClass)
    ['{49847462-80DA-4A9C-8D09-C59E19E4EECE}']
    { static Property Methods }
    { class } function _GetFROM_MAP_POINT: Integer; // I

    { static Methods }
    { class } function init(longitude: Double; latitude: Double; P3: JString;
      description: JString): JBNRoutePlanNode; cdecl; overload;
    // (DDLjava/lang/String;Ljava/lang/String;)V
    { class } function init(longitude: Double; latitude: Double; P3: JString;
      description: JString; name: JBNRoutePlanNode_CoordinateType)
      : JBNRoutePlanNode; cdecl; overload;
    // (DDLjava/lang/String;Ljava/lang/String;Lcom/baidu/navisdk/adapter/BNRoutePlanNode$CoordinateType;)V

    { static Property }
    { class } property FROM_MAP_POINT: Integer read _GetFROM_MAP_POINT;
  end;

  [JavaSignature('com/baidu/navisdk/adapter/BNRoutePlanNode')]
  JBNRoutePlanNode = interface(JObject)
    ['{F00D3FBD-8BFA-45B3-8362-256201DE6752}']
    { Property Methods }

    { methods }
    function getName: JString; cdecl; // ()Ljava/lang/String;
    function getDescription: JString; cdecl; // ()Ljava/lang/String;
    function getLatitude: Double; cdecl; // ()D
    function getLongitude: Double; cdecl; // ()D
    function getDistrictID: Integer; cdecl; // ()I
    function getCoordinateType: JBNRoutePlanNode_CoordinateType; cdecl;
    // ()Lcom/baidu/navisdk/adapter/BNRoutePlanNode$CoordinateType;

    { Property }
  end;

  TJBNRoutePlanNode = class(TJavaGenericImport<JBNRoutePlanNodeClass,
    JBNRoutePlanNode>)
  end;

  JCommandDeclareClass = interface(JObjectClass)
    ['{204B1455-DF63-4081-BFC3-D5D0FD49B4BD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/navisdk/adapter/CommandDeclare')]
  JCommandDeclare = interface(IJavaInstance)
    ['{6C62736E-C0C6-42AC-9404-CBFFCDB4AC05}']
    { Property Methods }

    { methods }
    function value: Jlang_Class; cdecl; // ()Ljava/lang/Class;

    { Property }
  end;

  TJCommandDeclare = class(TJavaGenericImport<JCommandDeclareClass,
    JCommandDeclare>)
  end;

  JNaviModuleFactoryClass = interface(JObjectClass)
    ['{59FBE3F6-6E38-417D-82CA-D219F9A1F5AE}']
    { static Property Methods }

    { static Methods }
    { class } function init: JNaviModuleFactory; cdecl; // ()V
    { class } function getNaviModuleManager: JNaviModuleImpl; cdecl;
    // ()Lcom/baidu/navisdk/adapter/NaviModuleImpl;

    { static Property }
  end;

  [JavaSignature('com/baidu/navisdk/adapter/NaviModuleFactory')]
  JNaviModuleFactory = interface(JObject)
    ['{F528982F-89DF-4573-AA05-7B57F635DB55}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJNaviModuleFactory = class(TJavaGenericImport<JNaviModuleFactoryClass,
    JNaviModuleFactory>)
  end;

  JNaviModuleImpl_BNaviCommonModuleConstantsClass = interface(JObjectClass)
    ['{D73A9FCC-FAEC-4FAA-BDF0-FE60AF3CC393}']
    { static Property Methods }
    { class } function _GetROUTE_GUIDE_MODULE: Integer; // I

    { static Methods }

    { static Property }
    { class } property ROUTE_GUIDE_MODULE: Integer read _GetROUTE_GUIDE_MODULE;
  end;

  [JavaSignature
    ('com/baidu/navisdk/adapter/NaviModuleImpl$BNaviCommonModuleConstants')]
  JNaviModuleImpl_BNaviCommonModuleConstants = interface(IJavaInstance)
    ['{C8E80482-FAC8-4EBF-A93D-25F05C371982}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJNaviModuleImpl_BNaviCommonModuleConstants = class
    (TJavaGenericImport<JNaviModuleImpl_BNaviCommonModuleConstantsClass,
    JNaviModuleImpl_BNaviCommonModuleConstants>)
  end;

  JNaviModuleImplClass = interface(JObjectClass)
    ['{EE8C5B2B-D311-4945-8255-D538D79B39D0}']
    { static Property Methods }

    { static Methods }
    { class } function init: JNaviModuleImpl; cdecl; // ()V
    { class } function getInstance: JNaviModuleImpl; cdecl;
    // ()Lcom/baidu/navisdk/adapter/NaviModuleImpl;

    { static Property }
  end;

  [JavaSignature('com/baidu/navisdk/adapter/NaviModuleImpl')]
  JNaviModuleImpl = interface(JObject)
    ['{955CBC08-6645-4460-A2D9-945F1437CB44}']
    { Property Methods }

    { methods }
    function getView(mouduleType: Integer): JView; cdecl;
    // (I)Landroid/view/View;
    function getNaviCommonModule(moduleType: Integer; mActivity: JActivity;
      callbackType: Integer; mBNaviBaseCallback: JBNaviBaseCallback)
      : JBaiduNaviCommonModule; cdecl;
    // (ILandroid/app/Activity;ILcom/baidu/navisdk/adapter/BNaviBaseCallback;)Lcom/baidu/navisdk/adapter/BaiduNaviCommonModule;

    { Property }
  end;

  TJNaviModuleImpl = class(TJavaGenericImport<JNaviModuleImplClass,
    JNaviModuleImpl>)
  end;

  JPackageUtilClass = interface(JObjectClass)
    ['{73A284E8-FBD8-4C04-898A-1CA3E443ADEC}']
    { static Property Methods }

    { static Methods }
    { class } function init: JPackageUtil; cdecl; overload; // ()V
    { class } procedure init(P1: JContext); cdecl; overload;
    // (Landroid/content/Context;)V
    { class } function getCurrentCPUTypeBak: JString; cdecl;
    // ()Ljava/lang/String;
    { class } function getNativeSoPathBak: JString; cdecl;
    // ()Ljava/lang/String;
    { class } function getSdcardDir: JString; cdecl; // ()Ljava/lang/String;
    { class } function getCurResPath: JString; cdecl; // ()Ljava/lang/String;
    { class } function getNewResPath: JString; cdecl; // ()Ljava/lang/String;
    { class } function getBakResPath: JString; cdecl; // ()Ljava/lang/String;
    { class } function getCurResFlag: Boolean; cdecl; // ()Z
    { class } function getBakResFlag: Boolean; cdecl; // ()Z
    { class } function getNewResFlag: Boolean; cdecl; // ()Z
    { class } function getNativeSoPath: JString; cdecl; // ()Ljava/lang/String;
    { class } function getSDCardResPath: JString; cdecl; // ()Ljava/lang/String;
    { class } procedure setNewResFlag(P1: Boolean); cdecl; // (Z)V
    { class } procedure setBakResFlag(P1: Boolean); cdecl; // (Z)V
    { class } procedure setCurResFlag(P1: Boolean); cdecl; // (Z)V
    { class } function getCurrentCPUType: JString; cdecl;
    // ()Ljava/lang/String;
    { class } procedure uninit; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/navisdk/adapter/PackageUtil')]
  JPackageUtil = interface(JObject)
    ['{6C114446-A24D-42C4-A89C-FF59D2FC9D64}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPackageUtil = class(TJavaGenericImport<JPackageUtilClass, JPackageUtil>)
  end;

  JBaiduNaviSDKLoaderClass = interface(JObjectClass)
    ['{D0306841-D4F2-4A52-8243-82A402E82335}']
    { static Property Methods }
    { class } function _GetclsLoader: JClassLoader; // Ljava/lang/ClassLoader;

    { static Methods }
    { class } function init: JBaiduNaviSDKLoader; cdecl; // ()V
    { class } function load(P1: JContext): Boolean; cdecl;
    // (Landroid/content/Context;)Z
    { class } function getSDKClassLoader: JClassLoader; cdecl;
    // ()Ljava/lang/ClassLoader;

    { static Property }
    { class } property clsLoader: JClassLoader read _GetclsLoader;
  end;

  [JavaSignature('com/baidu/navisdk/adapter/base/BaiduNaviSDKLoader')]
  JBaiduNaviSDKLoader = interface(JObject)
    ['{04BF9FD6-B946-4382-9D70-EC3B71A2D80F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBaiduNaviSDKLoader = class(TJavaGenericImport<JBaiduNaviSDKLoaderClass,
    JBaiduNaviSDKLoader>)
  end;

  JBaiduNaviSDKProxyClass = interface(JObjectClass)
    ['{ED627359-7AFA-49FD-A729-8B92C7CEB4DD}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBaiduNaviSDKProxy; cdecl; overload; // ()V
    { class } procedure init(sdcardRootPath: JActivity; appFolderName: JString;
      nativeSoPath: JString; cpuType: JString; ttsCallback: JString;
      P6: JBNOuterTTSPlayerCallback); cdecl; overload;
    // (Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/baidu/navisdk/adapter/BNOuterTTSPlayerCallback;)V
    { class } procedure init(sdcardRootPath: JActivity; appFolderName: JString;
      nativeSoPath: JString; cpuType: JString; ttsCallback: JString;
      ttsHandler: JBNOuterTTSPlayerCallback; initMtd: JHandler); cdecl;
      overload; // (Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/baidu/navisdk/adapter/BNOuterTTSPlayerCallback;Landroid/os/Handler;)V
    { class } function initBaiduNaviSDKStub: Boolean; cdecl; // ()Z
    { class } function isNaviInited: Boolean; cdecl; // ()Z
    { class } function isNaviSoLoadSuccess: Boolean; cdecl; // ()Z
    { class } procedure uninit; cdecl; // ()V
    { class } function launchNavigator(nodes: JActivity; preference: JList;
      isGPSNav: Integer; P4: Boolean): Boolean; cdecl; overload;
    // (Landroid/app/Activity;Ljava/util/List;IZ)Z
    { class } function launchNavigator(nodes: JActivity; preference: JList;
      isGPSNav: Integer; listener: Boolean;
      launchNavigatorMtd: JBaiduNaviManager_NavEventListener): Boolean; cdecl;
      overload; // (Landroid/app/Activity;Ljava/util/List;IZLcom/baidu/navisdk/adapter/BaiduNaviManager$NavEventListener;)Z
    { class } procedure onNaviGuideEnd; cdecl; // ()V
    { class } procedure notifyOtherAction(arg1: JInteger; arg2: JInteger;
      obj: JInteger; P4: JObject); cdecl;
    // (Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Object;)V
    { class } procedure routeGuideForceQuitNaviWithoutDialog; cdecl; // ()V
    { class } procedure routeGuideSetVoiceModeInNavi(P1: JInteger); cdecl;
    // (Ljava/lang/Integer;)V
    { class } function routeGuideResetEndNodeInNavi
      (routeGuideResetEndNodeInNaviMtd: JBNRoutePlanNode): Boolean; cdecl;
    // (Lcom/baidu/navisdk/adapter/BNRoutePlanNode;)Z
    { class } procedure routeGuideShowCustomizedLayer(P1: JBoolean); cdecl;
    // (Ljava/lang/Boolean;)V
    { class } procedure routeGuideSetCustomizedLayerItems
      (setCustomizedLayerItemsMtd: JList); cdecl; // (Ljava/util/List;)V
    { class } procedure setNewResFlag(P1: JBoolean); cdecl;
    // (Ljava/lang/Boolean;)V
    { class } function getNewResPath: JString; cdecl; // ()Ljava/lang/String;
    { class } function getSDCardResPath: JString; cdecl; // ()Ljava/lang/String;
    { class } function getCurResPath: JString; cdecl; // ()Ljava/lang/String;
    { class } function onCreate(moduleType: JActivity; onCreateMtd: JInteger)
      : JView; cdecl;
    // (Landroid/app/Activity;Ljava/lang/Integer;)Landroid/view/View;
    { class } procedure onResume(P1: JInteger); cdecl; // (Ljava/lang/Integer;)V
    { class } procedure onStart(P1: JInteger); cdecl; // (Ljava/lang/Integer;)V
    { class } procedure onPause(P1: JInteger); cdecl; // (Ljava/lang/Integer;)V
    { class } procedure onStop(P1: JInteger); cdecl; // (Ljava/lang/Integer;)V
    { class } procedure onDestroy(P1: JInteger); cdecl;
    // (Ljava/lang/Integer;)V
    { class } procedure onBackPressed(P1: JInteger); cdecl; overload;
    // (Ljava/lang/Integer;)V
    { class } procedure onConfigurationChanged(newConfig: JInteger;
      P2: JConfiguration); cdecl;
    // (Ljava/lang/Integer;Landroid/content/res/Configuration;)V
    { class } function onCommonMessageBack(what: JInteger; arg1: JInteger;
      arg2: JInteger; mDataBundle: JInteger; P5: JBundle): JObject; cdecl;
    // (Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Landroid/os/Bundle;)Ljava/lang/Object;
    { class } procedure onBackPressed(showDialog: JInteger; P2: JBoolean);
      cdecl; overload; // (Ljava/lang/Integer;Ljava/lang/Boolean;)V
    { class } procedure setModuleParams(methodType: JInteger;
      dataBundle: JInteger; P3: JBundle); cdecl;
    // (Ljava/lang/Integer;Ljava/lang/Integer;Landroid/os/Bundle;)V
    { class } function getModuleInfo(methodType: JInteger; dataBundle: JInteger;
      P3: JBundle): JObject; cdecl;
    // (Ljava/lang/Integer;Ljava/lang/Integer;Landroid/os/Bundle;)Ljava/lang/Object;
    { class } procedure setLogSwitcher(P1: JBoolean); cdecl;
    // (Ljava/lang/Boolean;)V
    { class } procedure setIsUsingOldShell; cdecl; // ()V
    { class } procedure setIsOldLaunch; cdecl; // ()V
    { class } procedure setVoiceMode(P1: JInteger); cdecl;
    // (Ljava/lang/Integer;)V
    { class } procedure setShowTotalRoadConditionBar(P1: JInteger); cdecl;
    // (Ljava/lang/Integer;)V
    { class } procedure setDayNightMode(P1: JInteger); cdecl;
    // (Ljava/lang/Integer;)V
    { class } procedure setPowerSaveMode(P1: JInteger); cdecl;
    // (Ljava/lang/Integer;)V
    { class } procedure setNaviSdkParam(P1: JBundle); cdecl;
    // (Landroid/os/Bundle;)V
    { class } procedure setIsAutoQuitWhenArrived(P1: Boolean); cdecl; // (Z)V
    { class } procedure setRealRoadCondition(P1: JInteger); cdecl;
    // (Ljava/lang/Integer;)V
    { class } procedure setHUDState(P1: Boolean); cdecl; // (Z)V
    { class } function getCurrentVersion: JString; cdecl;
    // ()Ljava/lang/String;

    { static Property }
  end;

  [JavaSignature('com/baidu/navisdk/adapter/base/BaiduNaviSDKProxy')]
  JBaiduNaviSDKProxy = interface(JObject)
    ['{21233F39-E58F-4845-AED3-945C2BF51760}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBaiduNaviSDKProxy = class(TJavaGenericImport<JBaiduNaviSDKProxyClass,
    JBaiduNaviSDKProxy>)
  end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBaiduNaviCommonModule_BaiduNaviCommonViewConstans',
    TypeInfo(Androidapi.JNI.baidu.navisdk.
    JBaiduNaviCommonModule_BaiduNaviCommonViewConstans));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBaiduNaviCommonModule',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBaiduNaviCommonModule));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBaiduNaviManager_NavEventListener',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBaiduNaviManager_NavEventListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBaiduNaviManager_NaviInitListener',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBaiduNaviManager_NaviInitListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBaiduNaviManager_RoutePlanListener',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBaiduNaviManager_RoutePlanListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBaiduNaviManager_RoutePlanPreference',
    TypeInfo(Androidapi.JNI.baidu.navisdk.
    JBaiduNaviManager_RoutePlanPreference));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBaiduNaviManager_TTSPlayMsgType',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBaiduNaviManager_TTSPlayMsgType));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBaiduNaviManager_TTSPlayStateListener',
    TypeInfo(Androidapi.JNI.baidu.navisdk.
    JBaiduNaviManager_TTSPlayStateListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBaiduNaviManager',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBaiduNaviManager));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviBaseCallback',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNaviBaseCallback));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_BNaviInnerTTSCallbackConstants',
    TypeInfo(Androidapi.JNI.baidu.navisdk.
    JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_BNaviInnerTTSCallbackConstants)
    );
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_BNaviTTSCallbackConstants',
    TypeInfo(Androidapi.JNI.baidu.navisdk.
    JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_BNaviTTSCallbackConstants)
    );
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_NavigationListenerConstants',
    TypeInfo(Androidapi.JNI.baidu.navisdk.
    JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_NavigationListenerConstants)
    );
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_NaviInitListenerConstants',
    TypeInfo(Androidapi.JNI.baidu.navisdk.
    JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_NaviInitListenerConstants)
    );
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_RoutePlanListenerConstants',
    TypeInfo(Androidapi.JNI.baidu.navisdk.
    JBNaviBaseCallbackModel_BNaviBaseCallbackConstants_RoutePlanListenerConstants)
    );
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviBaseCallbackModel_BNaviBaseCallbackConstants',
    TypeInfo(Androidapi.JNI.baidu.navisdk.
    JBNaviBaseCallbackModel_BNaviBaseCallbackConstants));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviBaseCallbackModel',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNaviBaseCallbackModel));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviCommonModuleCallback',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNaviCommonModuleCallback));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviCommonModuleController_SDKListenerMatchingException',
    TypeInfo(Androidapi.JNI.baidu.navisdk.
    JBNaviCommonModuleController_SDKListenerMatchingException));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviCommonModuleController',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNaviCommonModuleController));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviCommonParams_BNEnlargeRoadKey',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNaviCommonParams_BNEnlargeRoadKey));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviCommonParams_BNGuideKey',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNaviCommonParams_BNGuideKey));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviCommonParams_BNRouteInfoKey',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNaviCommonParams_BNRouteInfoKey));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviCommonParams_MessageType',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNaviCommonParams_MessageType));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviCommonParams',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNaviCommonParams));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviSettingManager_DayNightMode',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNaviSettingManager_DayNightMode));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviSettingManager_HUDMode',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNaviSettingManager_HUDMode));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviSettingManager_PowerSaveMode',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNaviSettingManager_PowerSaveMode));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviSettingManager_PreViewRoadCondition',
    TypeInfo(Androidapi.JNI.baidu.navisdk.
    JBNaviSettingManager_PreViewRoadCondition));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviSettingManager_RealRoadCondition',
    TypeInfo(Androidapi.JNI.baidu.navisdk.
    JBNaviSettingManager_RealRoadCondition));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviSettingManager_VoiceMode',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNaviSettingManager_VoiceMode));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNaviSettingManager',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNaviSettingManager));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNCommonSettingParam',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNCommonSettingParam));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.navisdk.adapter.JBNOuterLogUtil',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNOuterLogUtil));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNOuterTTSPlayerCallback',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNOuterTTSPlayerCallback));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNRouteGuideManager_CustomizedLayerItem',
    TypeInfo(Androidapi.JNI.baidu.navisdk.
    JBNRouteGuideManager_CustomizedLayerItem));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNRouteGuideManager_OnNavigationListener',
    TypeInfo(Androidapi.JNI.baidu.navisdk.
    JBNRouteGuideManager_OnNavigationListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNRouteGuideManager_VoiceMode',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNRouteGuideManager_VoiceMode));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNRouteGuideManager',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNRouteGuideManager));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNRoutePlanNode_CoordinateType',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNRoutePlanNode_CoordinateType));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JBNRoutePlanNode',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBNRoutePlanNode));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.navisdk.adapter.JCommandDeclare',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JCommandDeclare));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JNaviModuleFactory',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JNaviModuleFactory));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.JNaviModuleImpl_BNaviCommonModuleConstants',
    TypeInfo(Androidapi.JNI.baidu.navisdk.
    JNaviModuleImpl_BNaviCommonModuleConstants));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.navisdk.adapter.JNaviModuleImpl',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JNaviModuleImpl));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.navisdk.adapter.JPackageUtil',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JPackageUtil));

  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.base.JBaiduNaviSDKLoader',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBaiduNaviSDKLoader));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.navisdk.adapter.base.JBaiduNaviSDKProxy',
    TypeInfo(Androidapi.JNI.baidu.navisdk.JBaiduNaviSDKProxy));
end;

initialization

RegisterTypes;

end.
