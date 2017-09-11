unit Androidapi.JNI.baidu.mapapi.navi;
// ====================================================
// Android Baidu Map SDK interface
// Package:com.baidu.mapapi.navi
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
  JBaiduMapAppNotSupportNaviException = interface;
  // com.baidu.mapapi.navi.BaiduMapAppNotSupportNaviException
  JBaiduMapNavigation = interface; // com.baidu.mapapi.navi.BaiduMapNavigation
  JIllegalNaviArgumentException = interface;
  // com.baidu.mapapi.navi.IllegalNaviArgumentException
  JNaviParaOption = interface; // com.baidu.mapapi.navi.NaviParaOption

  // ===== Interface declarations =====

  JBaiduMapAppNotSupportNaviExceptionClass = interface(JRuntimeExceptionClass)
  // or JObjectClass // SuperSignature: java/lang/RuntimeException
    ['{4D4B436F-5E09-4151-B03B-89C622775139}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBaiduMapAppNotSupportNaviException; cdecl;
      overload; // ()V
    { class } function init(P1: JString): JBaiduMapAppNotSupportNaviException;
      cdecl; overload; // (Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/navi/BaiduMapAppNotSupportNaviException')]
  JBaiduMapAppNotSupportNaviException = interface(JRuntimeException)
  // or JObject // SuperSignature: java/lang/RuntimeException
    ['{2BB8FA48-D2E4-4F0E-B948-86399AC77919}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBaiduMapAppNotSupportNaviException = class
    (TJavaGenericImport<JBaiduMapAppNotSupportNaviExceptionClass,
    JBaiduMapAppNotSupportNaviException>)
  end;

  JBaiduMapNavigationClass = interface(JObjectClass)
    ['{FDBC02D1-448F-4BE2-86B0-1BDD0DE3735F}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBaiduMapNavigation; cdecl; // ()V
    { class } procedure setSupportWebNavi(P1: Boolean); cdecl; // (Z)V
    { class } function openBaiduMapNavi(P1: JNaviParaOption; P2: JContext)
      : Boolean; cdecl;
    // (Lcom/baidu/mapapi/navi/NaviParaOption;Landroid/content/Context;)Z
    { class } function openBaiduMapWalkNavi(P1: JNaviParaOption; P2: JContext)
      : Boolean; cdecl;
    // (Lcom/baidu/mapapi/navi/NaviParaOption;Landroid/content/Context;)Z
    { class } function openBaiduMapWalkNaviAR(P1: JNaviParaOption; P2: JContext)
      : Boolean; cdecl;
    // (Lcom/baidu/mapapi/navi/NaviParaOption;Landroid/content/Context;)Z
    { class } function openBaiduMapBikeNavi(P1: JNaviParaOption; P2: JContext)
      : Boolean; cdecl;
    // (Lcom/baidu/mapapi/navi/NaviParaOption;Landroid/content/Context;)Z
    { class } procedure openWebBaiduMapNavi(P1: JNaviParaOption; P2: JContext);
      cdecl; // Deprecated //(Lcom/baidu/mapapi/navi/NaviParaOption;Landroid/content/Context;)V
    { class } procedure finish(P1: JContext); cdecl;
    // (Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/navi/BaiduMapNavigation')]
  JBaiduMapNavigation = interface(JObject)
    ['{7DED77E8-455E-41E3-9EE7-BD95723E5AD0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBaiduMapNavigation = class(TJavaGenericImport<JBaiduMapNavigationClass,
    JBaiduMapNavigation>)
  end;

  JIllegalNaviArgumentExceptionClass = interface(JRuntimeExceptionClass)
  // or JObjectClass // SuperSignature: java/lang/RuntimeException
    ['{371253B2-DC86-4614-8DDA-06239709DC87}']
    { static Property Methods }

    { static Methods }
    { class } function init: JIllegalNaviArgumentException; cdecl; overload;
    // ()V
    { class } function init(P1: JString): JIllegalNaviArgumentException; cdecl;
      overload; // (Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/navi/IllegalNaviArgumentException')]
  JIllegalNaviArgumentException = interface(JRuntimeException)
  // or JObject // SuperSignature: java/lang/RuntimeException
    ['{ACCF4A5B-29CA-4506-9CCC-8E50F1A272E2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIllegalNaviArgumentException = class
    (TJavaGenericImport<JIllegalNaviArgumentExceptionClass,
    JIllegalNaviArgumentException>)
  end;

  JNaviParaOptionClass = interface(JObjectClass)
    ['{A331635B-7074-4F26-A25B-6C84F3FACAA1}']
    { static Property Methods }

    { static Methods }
    { class } function init: JNaviParaOption; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/navi/NaviParaOption')]
  JNaviParaOption = interface(JObject)
    ['{AAD88A83-FDF1-484A-8BA1-599235650ECC}']
    { Property Methods }

    { methods }
    function startPoint(P1: JLatLng): JNaviParaOption; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/navi/NaviParaOption;
    function startName(P1: JString): JNaviParaOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/navi/NaviParaOption;
    function endPoint(P1: JLatLng): JNaviParaOption; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/navi/NaviParaOption;
    function endName(P1: JString): JNaviParaOption; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/navi/NaviParaOption;
    function getStartPoint: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getEndPoint: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getStartName: JString; cdecl; // ()Ljava/lang/String;
    function getEndName: JString; cdecl; // ()Ljava/lang/String;

    { Property }
  end;

  TJNaviParaOption = class(TJavaGenericImport<JNaviParaOptionClass,
    JNaviParaOption>)
  end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.navi.BaiduMapAppNotSupportNaviException',
    TypeInfo(Androidapi.JNI.baidu.mapapi.navi.
    JBaiduMapAppNotSupportNaviException));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.navi.BaiduMapNavigation',
    TypeInfo(Androidapi.JNI.baidu.mapapi.navi.JBaiduMapNavigation));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.navi.IllegalNaviArgumentException',
    TypeInfo(Androidapi.JNI.baidu.mapapi.navi.JIllegalNaviArgumentException));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.navi.NaviParaOption',
    TypeInfo(Androidapi.JNI.baidu.mapapi.navi.JNaviParaOption));
end;

initialization

RegisterTypes;

end.
