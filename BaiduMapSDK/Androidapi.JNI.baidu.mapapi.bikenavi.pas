unit Androidapi.JNI.baidu.mapapi.bikenavi;
// ====================================================
// Android Baidu Map SDK interface
// Package:com.baidu.mapapi.bikenavi
// com.baidu.mapapi.bikenavi.adapter
// com.baidu.mapapi.bikenavi.controllers
// com.baidu.mapapi.bikenavi.model
// com.baidu.mapapi.bikenavi.params
// author:Xubzhlin
// email:371889755@qq.com
//
// date:2017.5.10
// version:4.3.0
// ====================================================

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.baidu.mapapi.model;

type
  // ===== Forward declarations =====

  // com.baidu.mapapi.bikenavi
  JBikeNavigateHelper = interface;
  // com.baidu.mapapi.bikenavi.BikeNavigateHelper

  // com.baidu.mapapi.bikenavi.adapter
  JIBEngineInitListener = interface;
  // com.baidu.mapapi.bikenavi.adapter.IBEngineInitListener
  JIBRouteGuidanceListener = interface;
  // com.baidu.mapapi.bikenavi.adapter.IBRouteGuidanceListener
  JIBRoutePlanListener = interface;
  // com.baidu.mapapi.bikenavi.adapter.IBRoutePlanListener
  JIBTTSPlayer = interface; // com.baidu.mapapi.bikenavi.adapter.IBTTSPlayer

  // com.baidu.mapapi.bikenavi.controllers
  JUnsupportedBikeNaviException = interface;
  // com.baidu.mapapi.bikenavi.controllers.UnsupportedBikeNaviException

  // com.baidu.mapapi.bikenavi.model
  JBikeRouteDetailInfo = interface;
  // com.baidu.mapapi.bikenavi.model.BikeRouteDetailInfo
  JBikeRoutePlanError = interface;
  // com.baidu.mapapi.bikenavi.model.BikeRoutePlanError
  JRouteGuideKind = interface; // com.baidu.mapapi.bikenavi.model.RouteGuideKind

  // com.baidu.mapapi.bikenavi.params
  JBikeNaviLauchParam = interface;
  // com.baidu.mapapi.bikenavi.params.BikeNaviLauchParam

  // ===== Interface declarations =====

  JIBEngineInitListenerClass = interface(JObjectClass)
    ['{6D237FE7-E76B-489F-AFFC-D7A729AA1007}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/bikenavi/adapter/IBEngineInitListener')]
  JIBEngineInitListener = interface(IJavaInstance)
    ['{21DB1D6A-C248-48C7-B1FA-E90E93202B5D}']
    { Property Methods }

    { methods }
    procedure engineInitSuccess; cdecl; // ()V
    procedure engineInitFail; cdecl; // ()V

    { Property }
  end;

  TJIBEngineInitListener = class(TJavaGenericImport<JIBEngineInitListenerClass,
    JIBEngineInitListener>)
  end;

  JIBRouteGuidanceListenerClass = interface(JObjectClass)
    ['{954EC52D-F23B-4FBA-AA73-0542DB99FAD6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/bikenavi/adapter/IBRouteGuidanceListener')]
  JIBRouteGuidanceListener = interface(IJavaInstance)
    ['{CD9BD4E6-AE5E-44AF-B1D0-154DED3B3D11}']
    { Property Methods }

    { methods }
    procedure onRouteGuideIconUpdate(P1: JDrawable); cdecl;
    // (Landroid/graphics/drawable/Drawable;)V
    procedure onRouteGuideKind(P1: JRouteGuideKind); cdecl;
    // (Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;)V
    procedure onRoadGuideTextUpdate(P1: JCharSequence; P2: JCharSequence);
      cdecl; // (Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    procedure onRemainDistanceUpdate(P1: JCharSequence); cdecl;
    // (Ljava/lang/CharSequence;)V
    procedure onRemainTimeUpdate(P1: JCharSequence); cdecl;
    // (Ljava/lang/CharSequence;)V
    procedure onGpsStatusChange(P1: JCharSequence; P2: JDrawable); cdecl;
    // (Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;)V
    procedure onRouteFarAway(P1: JCharSequence; P2: JDrawable); cdecl;
    // (Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;)V
    procedure onRoutePlanYawing(P1: JCharSequence; P2: JDrawable); cdecl;
    // (Ljava/lang/CharSequence;Landroid/graphics/drawable/Drawable;)V
    procedure onReRouteComplete; cdecl; // ()V
    procedure onArriveDest; cdecl; // ()V
    procedure onVibrate; cdecl; // ()V
    procedure onGetRouteDetailInfo(P1: JBikeRouteDetailInfo); cdecl;
    // (Lcom/baidu/mapapi/bikenavi/model/BikeRouteDetailInfo;)V

    { Property }
  end;

  TJIBRouteGuidanceListener = class
    (TJavaGenericImport<JIBRouteGuidanceListenerClass,
    JIBRouteGuidanceListener>)
  end;

  JIBRoutePlanListenerClass = interface(JObjectClass)
    ['{466D5C14-6AEB-40FB-9ED6-99A25C14F4C3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/bikenavi/adapter/IBRoutePlanListener')]
  JIBRoutePlanListener = interface(IJavaInstance)
    ['{CED5B81E-AB1F-43C0-ACCC-118CC1B2D0A6}']
    { Property Methods }

    { methods }
    procedure onRoutePlanStart; cdecl; // ()V
    procedure onRoutePlanSuccess; cdecl; // ()V
    procedure onRoutePlanFail(P1: JBikeRoutePlanError); cdecl;
    // (Lcom/baidu/mapapi/bikenavi/model/BikeRoutePlanError;)V

    { Property }
  end;

  TJIBRoutePlanListener = class(TJavaGenericImport<JIBRoutePlanListenerClass,
    JIBRoutePlanListener>)
  end;

  JIBTTSPlayerClass = interface(JObjectClass)
    ['{24A8F2C5-74C5-43E7-A773-626EBFCB6797}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/bikenavi/adapter/IBTTSPlayer')]
  JIBTTSPlayer = interface(IJavaInstance)
    ['{6C88BAB2-8D4D-425C-8E75-B27BF9E46AB7}']
    { Property Methods }

    { methods }
    function playTTSText(P1: JString; P2: Boolean): Integer; cdecl;
    // (Ljava/lang/String;Z)I

    { Property }
  end;

  TJIBTTSPlayer = class(TJavaGenericImport<JIBTTSPlayerClass, JIBTTSPlayer>)
  end;

  JBikeNavigateHelperClass = interface(JObjectClass)
    ['{821EA284-08D2-458A-9F95-D49DC2CE1E05}']
    { static Property Methods }

    { static Methods }
    { class } function getInstance: JBikeNavigateHelper; cdecl;
    // ()Lcom/baidu/mapapi/bikenavi/BikeNavigateHelper;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/bikenavi/BikeNavigateHelper')]
  JBikeNavigateHelper = interface(JObject)
    ['{1E3DAF72-D237-471B-97CD-A09A5CAB6059}']
    { Property Methods }

    { methods }
    procedure initNaviEngine(context: JActivity;
      engineInitListener: JIBEngineInitListener); cdecl;
    // (Landroid/app/Activity;Lcom/baidu/mapapi/bikenavi/adapter/IBEngineInitListener;)V
    procedure routePlanWithParams(param: JBikeNaviLauchParam;
      routePlanListener: JIBRoutePlanListener); cdecl;
    // (Lcom/baidu/mapapi/bikenavi/params/BikeNaviLauchParam;Lcom/baidu/mapapi/bikenavi/adapter/IBRoutePlanListener;)V
    procedure setRouteGuidanceListener(activity: JActivity;
      routeGuidanceListener: JIBRouteGuidanceListener); cdecl;
    // (Landroid/app/Activity;Lcom/baidu/mapapi/bikenavi/adapter/IBRouteGuidanceListener;)V
    procedure setTTsPlayer(ttsPlayer: JIBTTSPlayer); cdecl;
    // (Lcom/baidu/mapapi/bikenavi/adapter/IBTTSPlayer;)V
    function startBikeNavi(activity: JActivity): Boolean; cdecl;
    // (Landroid/app/Activity;)Z
    function onCreate(activity: JActivity): JView; cdecl;
    // (Landroid/app/Activity;)Landroid/view/View;
    function setNaviMapUp: Boolean; cdecl; // ()Z
    procedure pause; cdecl; // ()V
    procedure resume; cdecl; // ()V
    procedure quit; cdecl; // ()V
    procedure showUIDebuggable(debugStr: JString); cdecl;
    // (Ljava/lang/String;)V

    { Property }
  end;

  TJBikeNavigateHelper = class(TJavaGenericImport<JBikeNavigateHelperClass,
    JBikeNavigateHelper>)
  end;

  JUnsupportedBikeNaviExceptionClass = interface(JRuntimeExceptionClass)
  // or JObjectClass // SuperSignature: java/lang/RuntimeException
    ['{7437BE38-7785-4803-987D-C758001EFE8F}']
    { static Property Methods }

    { static Methods }
    { class } function init: JUnsupportedBikeNaviException; cdecl; overload;
    // ()V
    { class } function init(msg: JString): JUnsupportedBikeNaviException; cdecl;
      overload; // (Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature
    ('com/baidu/mapapi/bikenavi/controllers/UnsupportedBikeNaviException')]
  JUnsupportedBikeNaviException = interface(JRuntimeException)
  // or JObject // SuperSignature: java/lang/RuntimeException
    ['{FF21FA17-479D-46A2-B611-A6F788535B22}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUnsupportedBikeNaviException = class
    (TJavaGenericImport<JUnsupportedBikeNaviExceptionClass,
    JUnsupportedBikeNaviException>)
  end;

  JBikeRouteDetailInfoClass = interface(JObjectClass)
    ['{32C0A59F-455B-4E77-BA64-95BEC9E7E744}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBikeRouteDetailInfo; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/bikenavi/model/BikeRouteDetailInfo')]
  JBikeRouteDetailInfo = interface(JObject)
    ['{AF66B039-5C7D-45FB-94EE-274FEC83F3D4}']
    { Property Methods }
    function _Getspeed: Double; // D
    procedure _Setspeed(aspeed: Double); // (D)V
    function _GetavSpeed: Double; // D
    procedure _SetavSpeed(aavSpeed: Double); // (D)V
    function _GetmaxSpeed: Double; // D
    procedure _SetmaxSpeed(amaxSpeed: Double); // (D)V
    function _Getaltitude: Single; // F
    procedure _Setaltitude(aaltitude: Single); // (F)V
    function _GetdiffAltitude: Single; // F
    procedure _SetdiffAltitude(adiffAltitude: Single); // (F)V

    { methods }
    function getDiffAltitude: Double; cdecl; // ()D
    procedure setDiffAltitude(diffAltitude: Single); cdecl; // (F)V
    function getSpeed: Double; cdecl; // ()D
    procedure setSpeed(speed: Double); cdecl; // (D)V
    function getAvSpeed: Double; cdecl; // ()D
    procedure setAvSpeed(avSpeed: Double); cdecl; // (D)V
    function getMaxSpeed: Double; cdecl; // ()D
    procedure setMaxSpeed(maxSpeed: Double); cdecl; // (D)V
    function getAltitude: Double; cdecl; // ()D
    procedure setAltitude(altitude: Single); cdecl; // (F)V

    { Property }
    property speed: Double read _Getspeed write _Setspeed;
    property avSpeed: Double read _GetavSpeed write _SetavSpeed;
    property maxSpeed: Double read _GetmaxSpeed write _SetmaxSpeed;
    property altitude: Single read _Getaltitude write _Setaltitude;
    property diffAltitude: Single read _GetdiffAltitude write _SetdiffAltitude;
  end;

  TJBikeRouteDetailInfo = class(TJavaGenericImport<JBikeRouteDetailInfoClass,
    JBikeRouteDetailInfo>)
  end;

  JBikeRoutePlanErrorClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{CDD88B01-D4F9-4618-95FC-42870BA0DF50}']
    { static Property Methods }
    { class } function _GetSERVER_UNUSUAL: JBikeRoutePlanError;
    // Lcom/baidu/mapapi/bikenavi/model/BikeRoutePlanError;
    { class } function _GetPARSE_FAIL: JBikeRoutePlanError;
    // Lcom/baidu/mapapi/bikenavi/model/BikeRoutePlanError;
    { class } function _GetNET_ERR: JBikeRoutePlanError;
    // Lcom/baidu/mapapi/bikenavi/model/BikeRoutePlanError;
    { class } function _GetFORWARD_AK_ERROR: JBikeRoutePlanError;
    // Lcom/baidu/mapapi/bikenavi/model/BikeRoutePlanError;

    { static Methods }
    { class } function values: TJavaObjectArray<JBikeRoutePlanError>; cdecl;
    // ()[Lcom/baidu/mapapi/bikenavi/model/BikeRoutePlanError;
    { class } function valueOf(P1: JString): JBikeRoutePlanError; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/bikenavi/model/BikeRoutePlanError;

    { static Property }
    { class } property SERVER_UNUSUAL: JBikeRoutePlanError
      read _GetSERVER_UNUSUAL;
    { class } property PARSE_FAIL: JBikeRoutePlanError read _GetPARSE_FAIL;
    { class } property NET_ERR: JBikeRoutePlanError read _GetNET_ERR;
    { class } property FORWARD_AK_ERROR: JBikeRoutePlanError
      read _GetFORWARD_AK_ERROR;
  end;

  [JavaSignature('com/baidu/mapapi/bikenavi/model/BikeRoutePlanError')]
  JBikeRoutePlanError = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{6A1D6373-92B0-445F-81FA-C3CDCF4D5C5F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBikeRoutePlanError = class(TJavaGenericImport<JBikeRoutePlanErrorClass,
    JBikeRoutePlanError>)
  end;

  JRouteGuideKindClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{824D9460-ED31-4AFB-B0C1-C22CC3C58D9F}']
    { static Property Methods }
    { class } function _GetNE_Maneuver_Kind_Invalid: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Start: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Front: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Right_Front: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Right: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Right_Back: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Left_Back: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Left: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Left_Front: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Right_Front_Straight
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Left_Front_Straight
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Left_PassRoad_Front
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Right_PassRoad_Front
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Left_PassRoad_UTurn
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Right_PassRoad_UTurn
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_LeftDiagonal_PassRoad_Right
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_LeftDiagonal_PassRoad_Right_Front
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_LeftDiagonal_PassRoad_Front
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_LeftDiagonal_PassRoad_Left_Front
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_LeftDiagonal_PassRoad_Left
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_LeftDiagonal_PassRoad_Left_Back
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_RightDiagonal_PassRoad_Left
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_RightDiagonal_PassRoad_Left_Front
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_RightDiagonal_PassRoad_Front
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_RightDiagonal_PassRoad_Right_Front
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_RightDiagonal_PassRoad_Right
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_RightDiagonal_PassRoad_Right_Back
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_PassRoad_Left: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_PassRoad_Right: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Goto_Left_Road: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Goto_Right_Road: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Goto_Left_Road_UTurn
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Goto_Right_Road_UTurn
      : JRouteGuideKind; // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Dest: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_OverlineBridge: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_UndergroundPassage: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Ring: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Park: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Square: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Ladder: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Waypoint: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_WTT_NAV_TURN_LEFT_THREE_LEFT: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_WTT_NAV_TURN_LEFT_THREE_MID: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_WTT_NAV_TURN_LEFT_THREE_RIGHT: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_WTT_NAV_TURN_LEFT_TWO_LEFT: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_WTT_NAV_TURN_LEFT_TWO_RIGHT: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_WTT_NAV_TURN_RIGHT_THREE_LEFT: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_WTT_NAV_TURN_RIGHT_THREE_MID: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_WTT_NAV_TURN_RIGHT_THREE_RIGHT: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_WTT_NAV_TURN_RIGHT_TWO_LEFT: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_WTT_NAV_TURN_RIGHT_TWO_RIGHT: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_WTT_NAV_STRAIGHT_THREE_LEFT: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_WTT_NAV_STRAIGHT_THREE_MID: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_WTT_NAV_STRAIGHT_THREE_RIGHT: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_WTT_NAV_STRAIGHT_TWO_LEFT: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_WTT_NAV_STRAIGHT_TWO_RIGHT: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function _GetNE_Maneuver_Kind_Ferry: JRouteGuideKind;
    // Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;

    { static Methods }
    { class } function values: TJavaObjectArray<JRouteGuideKind>; cdecl;
    // ()[Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;
    { class } function valueOf(P1: JString): JRouteGuideKind; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/bikenavi/model/RouteGuideKind;

    { static Property }
    { class } property NE_Maneuver_Kind_Invalid: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Invalid;
    { class } property NE_Maneuver_Kind_Start: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Start;
    { class } property NE_Maneuver_Kind_Front: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Front;
    { class } property NE_Maneuver_Kind_Right_Front: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Right_Front;
    { class } property NE_Maneuver_Kind_Right: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Right;
    { class } property NE_Maneuver_Kind_Right_Back: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Right_Back;
    { class } property NE_Maneuver_Kind_Left_Back: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Left_Back;
    { class } property NE_Maneuver_Kind_Left: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Left;
    { class } property NE_Maneuver_Kind_Left_Front: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Left_Front;
    { class } property NE_Maneuver_Kind_Right_Front_Straight: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Right_Front_Straight;
    { class } property NE_Maneuver_Kind_Left_Front_Straight: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Left_Front_Straight;
    { class } property NE_Maneuver_Kind_Left_PassRoad_Front: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Left_PassRoad_Front;
    { class } property NE_Maneuver_Kind_Right_PassRoad_Front: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Right_PassRoad_Front;
    { class } property NE_Maneuver_Kind_Left_PassRoad_UTurn: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Left_PassRoad_UTurn;
    { class } property NE_Maneuver_Kind_Right_PassRoad_UTurn: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Right_PassRoad_UTurn;
    { class } property NE_Maneuver_Kind_LeftDiagonal_PassRoad_Right
      : JRouteGuideKind read _GetNE_Maneuver_Kind_LeftDiagonal_PassRoad_Right;
    { class } property NE_Maneuver_Kind_LeftDiagonal_PassRoad_Right_Front
      : JRouteGuideKind
      read _GetNE_Maneuver_Kind_LeftDiagonal_PassRoad_Right_Front;
    { class } property NE_Maneuver_Kind_LeftDiagonal_PassRoad_Front
      : JRouteGuideKind read _GetNE_Maneuver_Kind_LeftDiagonal_PassRoad_Front;
    { class } property NE_Maneuver_Kind_LeftDiagonal_PassRoad_Left_Front
      : JRouteGuideKind
      read _GetNE_Maneuver_Kind_LeftDiagonal_PassRoad_Left_Front;
    { class } property NE_Maneuver_Kind_LeftDiagonal_PassRoad_Left
      : JRouteGuideKind read _GetNE_Maneuver_Kind_LeftDiagonal_PassRoad_Left;
    { class } property NE_Maneuver_Kind_LeftDiagonal_PassRoad_Left_Back
      : JRouteGuideKind
      read _GetNE_Maneuver_Kind_LeftDiagonal_PassRoad_Left_Back;
    { class } property NE_Maneuver_Kind_RightDiagonal_PassRoad_Left
      : JRouteGuideKind read _GetNE_Maneuver_Kind_RightDiagonal_PassRoad_Left;
    { class } property NE_Maneuver_Kind_RightDiagonal_PassRoad_Left_Front
      : JRouteGuideKind
      read _GetNE_Maneuver_Kind_RightDiagonal_PassRoad_Left_Front;
    { class } property NE_Maneuver_Kind_RightDiagonal_PassRoad_Front
      : JRouteGuideKind read _GetNE_Maneuver_Kind_RightDiagonal_PassRoad_Front;
    { class } property NE_Maneuver_Kind_RightDiagonal_PassRoad_Right_Front
      : JRouteGuideKind
      read _GetNE_Maneuver_Kind_RightDiagonal_PassRoad_Right_Front;
    { class } property NE_Maneuver_Kind_RightDiagonal_PassRoad_Right
      : JRouteGuideKind read _GetNE_Maneuver_Kind_RightDiagonal_PassRoad_Right;
    { class } property NE_Maneuver_Kind_RightDiagonal_PassRoad_Right_Back
      : JRouteGuideKind
      read _GetNE_Maneuver_Kind_RightDiagonal_PassRoad_Right_Back;
    { class } property NE_Maneuver_Kind_PassRoad_Left: JRouteGuideKind
      read _GetNE_Maneuver_Kind_PassRoad_Left;
    { class } property NE_Maneuver_Kind_PassRoad_Right: JRouteGuideKind
      read _GetNE_Maneuver_Kind_PassRoad_Right;
    { class } property NE_Maneuver_Kind_Goto_Left_Road: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Goto_Left_Road;
    { class } property NE_Maneuver_Kind_Goto_Right_Road: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Goto_Right_Road;
    { class } property NE_Maneuver_Kind_Goto_Left_Road_UTurn: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Goto_Left_Road_UTurn;
    { class } property NE_Maneuver_Kind_Goto_Right_Road_UTurn: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Goto_Right_Road_UTurn;
    { class } property NE_Maneuver_Kind_Dest: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Dest;
    { class } property NE_Maneuver_Kind_OverlineBridge: JRouteGuideKind
      read _GetNE_Maneuver_Kind_OverlineBridge;
    { class } property NE_Maneuver_Kind_UndergroundPassage: JRouteGuideKind
      read _GetNE_Maneuver_Kind_UndergroundPassage;
    { class } property NE_Maneuver_Kind_Ring: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Ring;
    { class } property NE_Maneuver_Kind_Park: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Park;
    { class } property NE_Maneuver_Kind_Square: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Square;
    { class } property NE_Maneuver_Kind_Ladder: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Ladder;
    { class } property NE_Maneuver_Kind_Waypoint: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Waypoint;
    { class } property NE_WTT_NAV_TURN_LEFT_THREE_LEFT: JRouteGuideKind
      read _GetNE_WTT_NAV_TURN_LEFT_THREE_LEFT;
    { class } property NE_WTT_NAV_TURN_LEFT_THREE_MID: JRouteGuideKind
      read _GetNE_WTT_NAV_TURN_LEFT_THREE_MID;
    { class } property NE_WTT_NAV_TURN_LEFT_THREE_RIGHT: JRouteGuideKind
      read _GetNE_WTT_NAV_TURN_LEFT_THREE_RIGHT;
    { class } property NE_WTT_NAV_TURN_LEFT_TWO_LEFT: JRouteGuideKind
      read _GetNE_WTT_NAV_TURN_LEFT_TWO_LEFT;
    { class } property NE_WTT_NAV_TURN_LEFT_TWO_RIGHT: JRouteGuideKind
      read _GetNE_WTT_NAV_TURN_LEFT_TWO_RIGHT;
    { class } property NE_WTT_NAV_TURN_RIGHT_THREE_LEFT: JRouteGuideKind
      read _GetNE_WTT_NAV_TURN_RIGHT_THREE_LEFT;
    { class } property NE_WTT_NAV_TURN_RIGHT_THREE_MID: JRouteGuideKind
      read _GetNE_WTT_NAV_TURN_RIGHT_THREE_MID;
    { class } property NE_WTT_NAV_TURN_RIGHT_THREE_RIGHT: JRouteGuideKind
      read _GetNE_WTT_NAV_TURN_RIGHT_THREE_RIGHT;
    { class } property NE_WTT_NAV_TURN_RIGHT_TWO_LEFT: JRouteGuideKind
      read _GetNE_WTT_NAV_TURN_RIGHT_TWO_LEFT;
    { class } property NE_WTT_NAV_TURN_RIGHT_TWO_RIGHT: JRouteGuideKind
      read _GetNE_WTT_NAV_TURN_RIGHT_TWO_RIGHT;
    { class } property NE_WTT_NAV_STRAIGHT_THREE_LEFT: JRouteGuideKind
      read _GetNE_WTT_NAV_STRAIGHT_THREE_LEFT;
    { class } property NE_WTT_NAV_STRAIGHT_THREE_MID: JRouteGuideKind
      read _GetNE_WTT_NAV_STRAIGHT_THREE_MID;
    { class } property NE_WTT_NAV_STRAIGHT_THREE_RIGHT: JRouteGuideKind
      read _GetNE_WTT_NAV_STRAIGHT_THREE_RIGHT;
    { class } property NE_WTT_NAV_STRAIGHT_TWO_LEFT: JRouteGuideKind
      read _GetNE_WTT_NAV_STRAIGHT_TWO_LEFT;
    { class } property NE_WTT_NAV_STRAIGHT_TWO_RIGHT: JRouteGuideKind
      read _GetNE_WTT_NAV_STRAIGHT_TWO_RIGHT;
    { class } property NE_Maneuver_Kind_Ferry: JRouteGuideKind
      read _GetNE_Maneuver_Kind_Ferry;
  end;

  [JavaSignature('com/baidu/mapapi/bikenavi/model/RouteGuideKind')]
  JRouteGuideKind = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{FFE3864B-1BEA-48B5-969E-35F1FE93546A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRouteGuideKind = class(TJavaGenericImport<JRouteGuideKindClass,
    JRouteGuideKind>)
  end;

  JBikeNaviLauchParamClass = interface(JObjectClass)
    ['{F75D333A-AE8D-40B3-B38F-3BCB54B00E75}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBikeNaviLauchParam; cdecl; // ()V
    // {class} function create: Ja; cdecl; //()Lcom/baidu/platform/comapi/walknavi/d/a;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/bikenavi/params/BikeNaviLauchParam')]
  JBikeNaviLauchParam = interface(JObject)
    ['{F8C0F775-A4EE-4FE5-BFD7-E916E18691EC}']
    { Property Methods }

    { methods }
    function getEndCityCode: Integer; cdecl; // ()I
    function getStartPt: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getEndPt: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getStartCityCode: Integer; cdecl; // ()I
    function stPt(startPt: JLatLng): JBikeNaviLauchParam; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/bikenavi/params/BikeNaviLauchParam;
    function endPt(endPt: JLatLng): JBikeNaviLauchParam; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/bikenavi/params/BikeNaviLauchParam;
    function stCityCode(startCityCode: Integer): JBikeNaviLauchParam; cdecl;
    // (I)Lcom/baidu/mapapi/bikenavi/params/BikeNaviLauchParam;
    function endCityCode(endCityCode: Integer): JBikeNaviLauchParam; cdecl;
    // (I)Lcom/baidu/mapapi/bikenavi/params/BikeNaviLauchParam;

    { Property }
  end;

  TJBikeNaviLauchParam = class(TJavaGenericImport<JBikeNaviLauchParamClass,
    JBikeNaviLauchParam>)
  end;

implementation

procedure RegisterTypes;
begin

  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.bikenavi.BikeNavigateHelper',
    TypeInfo(Androidapi.JNI.baidu.mapapi.bikenavi.JBikeNavigateHelper));

  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.bikenavi.adapter.IBEngineInitListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.bikenavi.JBikeNavigateHelperClass));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.bikenavi.adapter.IBRouteGuidanceListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.bikenavi.JIBRouteGuidanceListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.bikenavi.adapter.IBRoutePlanListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.bikenavi.JIBRoutePlanListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.bikenavi.adapter.IBTTSPlayer',
    TypeInfo(Androidapi.JNI.baidu.mapapi.bikenavi.JIBTTSPlayer));

  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.bikenavi.controllers.UnsupportedBikeNaviException',
    TypeInfo(Androidapi.JNI.baidu.mapapi.bikenavi.
    JUnsupportedBikeNaviException));

  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.bikenavi.model.BikeRouteDetailInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.bikenavi.JBikeRouteDetailInfo));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.bikenavi.model.BikeRoutePlanError',
    TypeInfo(Androidapi.JNI.baidu.mapapi.bikenavi.JBikeRoutePlanError));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.bikenavi.model.RouteGuideKind',
    TypeInfo(Androidapi.JNI.baidu.mapapi.bikenavi.JRouteGuideKind));

  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.bikenavi.params.BikeNaviLauchParam',
    TypeInfo(Androidapi.JNI.baidu.mapapi.bikenavi.JBikeNaviLauchParam));
end;

initialization

RegisterTypes;

end.
