unit Androidapi.JNI.baidu.mapapi.map;
// ====================================================
// Android Baidu Map SDK interface
// Package:com.baidu.mapapi.map
// com.baidu.mapapi.map.offline
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
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.os,
  Androidapi.JNI.App,
  Androidapi.JNI.Util,
  Androidapi.JNI.JavaUtil,
  Androidapi.JNI.Widget,
  Androidapi.JNI.baidu.mapapi.model;

type
  // ===== Forward declarations =====
  JOverlay = interface; // com.baidu.mapapi.map.Overlay
  JOverlayOptions = interface; // com.baidu.mapapi.map.OverlayOptions

  JArc = interface; // com.baidu.mapapi.map.Arc
  JArcOptions = interface; // com.baidu.mapapi.map.ArcOptions

  JBaiduMap_OnBaseIndoorMapListener = interface;
  // com.baidu.mapapi.map.BaiduMap$OnBaseIndoorMapListener
  JBaiduMap_OnMapClickListener = interface;
  // com.baidu.mapapi.map.BaiduMap$OnMapClickListener
  JBaiduMap_OnMapDoubleClickListener = interface;
  // com.baidu.mapapi.map.BaiduMap$OnMapDoubleClickListener
  JBaiduMap_OnMapDrawFrameCallback = interface;
  // com.baidu.mapapi.map.BaiduMap$OnMapDrawFrameCallback
  JBaiduMap_OnMapLoadedCallback = interface;
  // com.baidu.mapapi.map.BaiduMap$OnMapLoadedCallback
  JBaiduMap_OnMapLongClickListener = interface;
  // com.baidu.mapapi.map.BaiduMap$OnMapLongClickListener
  JBaiduMap_OnMapRenderCallback = interface;
  // com.baidu.mapapi.map.BaiduMap$OnMapRenderCallback
  JBaiduMap_OnMapStatusChangeListener = interface;
  // com.baidu.mapapi.map.BaiduMap$OnMapStatusChangeListener
  JBaiduMap_OnMapTouchListener = interface;
  // com.baidu.mapapi.map.BaiduMap$OnMapTouchListener
  JBaiduMap_OnMarkerClickListener = interface;
  // com.baidu.mapapi.map.BaiduMap$OnMarkerClickListener
  JBaiduMap_OnMarkerDragListener = interface;
  // com.baidu.mapapi.map.BaiduMap$OnMarkerDragListener
  JBaiduMap_OnMyLocationClickListener = interface;
  // com.baidu.mapapi.map.BaiduMap$OnMyLocationClickListener
  JBaiduMap_OnPolylineClickListener = interface;
  // com.baidu.mapapi.map.BaiduMap$OnPolylineClickListener
  JBaiduMap_SnapshotReadyCallback = interface;
  // com.baidu.mapapi.map.BaiduMap$SnapshotReadyCallback

  JBaiduMap = interface; // com.baidu.mapapi.map.BaiduMap
  JBaiduMapOptions = interface; // com.baidu.mapapi.map.BaiduMapOptions
  JBitmapDescriptor = interface; // com.baidu.mapapi.map.BitmapDescriptor
  JBitmapDescriptorFactory = interface;
  // com.baidu.mapapi.map.BitmapDescriptorFactory
  JCircle = interface; // com.baidu.mapapi.map.Circle
  JCircleOptions = interface; // com.baidu.mapapi.map.CircleOptions
  JDot = interface; // com.baidu.mapapi.map.Dot
  JDotOptions = interface; // com.baidu.mapapi.map.DotOptions
  JFileTileProvider = interface; // com.baidu.mapapi.map.FileTileProvider
  JGradient = interface; // com.baidu.mapapi.map.Gradient
  JGroundOverlay = interface; // com.baidu.mapapi.map.GroundOverlay
  JGroundOverlayOptions = interface;
  // com.baidu.mapapi.map.GroundOverlayOptions
  JHeatMap_Builder = interface; // com.baidu.mapapi.map.HeatMap$Builder
  JHeatMap = interface; // com.baidu.mapapi.map.HeatMap
  JInfoWindow_OnInfoWindowClickListener = interface;
  // com.baidu.mapapi.map.InfoWindow$OnInfoWindowClickListener
  JInfoWindow = interface; // com.baidu.mapapi.map.InfoWindow
  JItemizedOverlay = interface; // com.baidu.mapapi.map.ItemizedOverlay
  JLogoPosition = interface; // com.baidu.mapapi.map.LogoPosition
  JMapBaseIndoorMapInfo_SwitchFloorError = interface;
  // com.baidu.mapapi.map.MapBaseIndoorMapInfo$SwitchFloorError
  JMapBaseIndoorMapInfo = interface;
  // com.baidu.mapapi.map.MapBaseIndoorMapInfo
  JMapFragment = interface; // com.baidu.mapapi.map.MapFragment
  JMapPoi = interface; // com.baidu.mapapi.map.MapPoi

  JMapStatus_Builder = interface; // com.baidu.mapapi.map.MapStatus$Builder
  JMapStatus = interface; // com.baidu.mapapi.map.MapStatus
  JMapStatusUpdate = interface; // com.baidu.mapapi.map.MapStatusUpdate
  JMapStatusUpdateFactory = interface;
  // com.baidu.mapapi.map.MapStatusUpdateFactory
  JMapView = interface; // com.baidu.mapapi.map.MapView
  JMapViewLayoutParams_Builder = interface;
  // com.baidu.mapapi.map.MapViewLayoutParams$Builder
  JMapViewLayoutParams_ELayoutMode = interface;
  // com.baidu.mapapi.map.MapViewLayoutParams$ELayoutMode
  JMapViewLayoutParams = interface; // com.baidu.mapapi.map.MapViewLayoutParams
  JMarker = interface; // com.baidu.mapapi.map.Marker
  JMarkerOptions_MarkerAnimateType = interface;
  // com.baidu.mapapi.map.MarkerOptions$MarkerAnimateType
  JMarkerOptions = interface; // com.baidu.mapapi.map.MarkerOptions
  JMyLocationConfiguration_LocationMode = interface;
  // com.baidu.mapapi.map.MyLocationConfiguration$LocationMode
  JMyLocationConfiguration = interface;
  // com.baidu.mapapi.map.MyLocationConfiguration
  JMyLocationData_Builder = interface;
  // com.baidu.mapapi.map.MyLocationData$Builder
  JMyLocationData = interface; // com.baidu.mapapi.map.MyLocationData

  JMKOfflineMap = interface; // com.baidu.mapapi.map.offline.MKOfflineMap
  JMKOfflineMapListener = interface;
  // com.baidu.mapapi.map.offline.MKOfflineMapListener
  JMKOLSearchRecord = interface;
  // com.baidu.mapapi.map.offline.MKOLSearchRecord
  JMKOLUpdateElement = interface;
  // com.baidu.mapapi.map.offline.MKOLUpdateElement
  JOfflineMapUtil = interface; // com.baidu.mapapi.map.offline.OfflineMapUtil

  JPolygon = interface; // com.baidu.mapapi.map.Polygon
  JPolygonOptions = interface; // com.baidu.mapapi.map.PolygonOptions
  JPolyline = interface; // com.baidu.mapapi.map.Polyline
  JPolylineOptions = interface; // com.baidu.mapapi.map.PolylineOptions
  JProjection = interface; // com.baidu.mapapi.map.Projection
  JStroke = interface; // com.baidu.mapapi.map.Stroke
  JSupportMapFragment = interface; // com.baidu.mapapi.map.SupportMapFragment

  JSwipeDismissTouchListener = interface;
  // com.baidu.mapapi.map.SwipeDismissTouchListener

  JSwipeDismissView = interface; // com.baidu.mapapi.map.SwipeDismissView
  JText = interface; // com.baidu.mapapi.map.Text
  JTextOptions = interface; // com.baidu.mapapi.map.TextOptions
  JTextureMapFragment = interface; // com.baidu.mapapi.map.TextureMapFragment

  JTextureMapView = interface; // com.baidu.mapapi.map.TextureMapView
  JTextureSupportMapFragment = interface;
  // com.baidu.mapapi.map.TextureSupportMapFragment
  JTile = interface; // com.baidu.mapapi.map.Tile

  JTileOverlay = interface; // com.baidu.mapapi.map.TileOverlay
  JTileOverlayOptions = interface; // com.baidu.mapapi.map.TileOverlayOptions
  JTileProvider = interface; // com.baidu.mapapi.map.TileProvider
  JUiSettings = interface; // com.baidu.mapapi.map.UiSettings
  JUrlTileProvider = interface; // com.baidu.mapapi.map.UrlTileProvider

  JWearMapView_AnimationTask = interface;
  // com.baidu.mapapi.map.WearMapView$AnimationTask

  JWearMapView_OnDismissCallback = interface;
  // com.baidu.mapapi.map.WearMapView$OnDismissCallback
  JWearMapView = interface; // com.baidu.mapapi.map.WearMapView
  JWeightedLatLng = interface; // com.baidu.mapapi.map.WeightedLatLng
  JWinRound = interface; // com.baidu.mapapi.map.WinRound

  // ===== Interface declarations =====

  JOverlayClass = interface(JObjectClass)
    ['{BB14D2B8-282B-499E-A8CB-717350750B8D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/Overlay')]
  JOverlay = interface(JObject)
    ['{12571A7E-51FD-4226-8319-AAFC93AA012F}']
    { Property Methods }
    // function _Gettype: Jh; //Lcom/baidu/platform/comapi/map/h;
    // procedure _Settype(atype: Jh); //(Lcom/baidu/platform/comapi/map/h;)V

    { methods }
    function isVisible: Boolean; cdecl; // ()Z
    procedure setVisible(P1: Boolean); cdecl; // (Z)V
    function getZIndex: Integer; cdecl; // ()I
    procedure setZIndex(P1: Integer); cdecl; // (I)V
    function getExtraInfo: JBundle; cdecl; // ()Landroid/os/Bundle;
    procedure setExtraInfo(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    procedure remove; cdecl; // ()V

    { Property }
    // property &type: Jh read _Gettype write _Settype;
  end;

  TJOverlay = class(TJavaGenericImport<JOverlayClass, JOverlay>)
  end;

  JOverlayOptionsClass = interface(JObjectClass)
    ['{5A45EF44-6124-4697-A3B2-7AFFBAE27BC5}']
    { static Property Methods }

    { static Methods }
    { class } function init: JOverlayOptions; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/OverlayOptions')]
  JOverlayOptions = interface(JObject)
    ['{7D1854B8-FC8A-4B13-B5C4-2E2055265A03}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOverlayOptions = class(TJavaGenericImport<JOverlayOptionsClass,
    JOverlayOptions>)
  end;

  JArcClass = interface(JOverlayClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/map/Overlay
    ['{C612D174-72B4-4245-AC27-5B2A7DEC5E41}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/Arc')]
  JArc = interface(JOverlay)
  // or JObject // SuperSignature: com/baidu/mapapi/map/Overlay
    ['{149303FE-EB01-4F18-9061-C0F360867FA4}']
    { Property Methods }

    { methods }
    function getColor: Integer; cdecl; // ()I
    function getStartPoint: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getMiddlePoint: JLatLng; cdecl;
    // ()Lcom/baidu/mapapi/model/LatLng;
    function getEndPoint: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getWidth: Integer; cdecl; // ()I
    procedure setColor(P1: Integer); cdecl; // (I)V
    procedure setPoints(P1: JLatLng; P2: JLatLng; P3: JLatLng); cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;Lcom/baidu/mapapi/model/LatLng;Lcom/baidu/mapapi/model/LatLng;)V
    procedure setWidth(P1: Integer); cdecl; // (I)V

    { Property }
  end;

  TJArc = class(TJavaGenericImport<JArcClass, JArc>)
  end;

  JArcOptionsClass = interface(JOverlayOptionsClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/map/OverlayOptions
    ['{3ECAB972-26A3-4862-B97E-E2246FD9795A}']
    { static Property Methods }

    { static Methods }
    { class } function init: JArcOptions; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/ArcOptions')]
  JArcOptions = interface(JOverlayOptions)
  // or JObject // SuperSignature: com/baidu/mapapi/map/OverlayOptions
    ['{B47A0ACB-505B-4E4B-91AB-4D3CADD30B13}']
    { Property Methods }

    { methods }
    function getColor: Integer; cdecl; // ()I
    function getStartPoint: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getMiddlePoint: JLatLng; cdecl;
    // ()Lcom/baidu/mapapi/model/LatLng;
    function getEndPoint: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getWidth: Integer; cdecl; // ()I
    function color(P1: Integer): JArcOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/ArcOptions;
    function points(P1: JLatLng; P2: JLatLng; P3: JLatLng): JArcOptions; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;Lcom/baidu/mapapi/model/LatLng;Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/map/ArcOptions;
    function width(P1: Integer): JArcOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/ArcOptions;
    function visible(P1: Boolean): JArcOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/ArcOptions;
    function isVisible: Boolean; cdecl; // ()Z
    function zIndex(P1: Integer): JArcOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/ArcOptions;
    function getZIndex: Integer; cdecl; // ()I
    function extraInfo(P1: JBundle): JArcOptions; cdecl;
    // (Landroid/os/Bundle;)Lcom/baidu/mapapi/map/ArcOptions;
    function getExtraInfo: JBundle; cdecl; // ()Landroid/os/Bundle;

    { Property }
  end;

  TJArcOptions = class(TJavaGenericImport<JArcOptionsClass, JArcOptions>)
  end;

  JBaiduMap_OnBaseIndoorMapListenerClass = interface(JObjectClass)
    ['{382324B9-1C68-4955-A51F-BCE84758A4C5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/BaiduMap$OnBaseIndoorMapListener')]
  JBaiduMap_OnBaseIndoorMapListener = interface(IJavaInstance)
    ['{F3CC4C4D-7E5C-45FB-B7CC-B6CC8D5EA095}']
    { Property Methods }

    { methods }
    procedure onBaseIndoorMapMode(P1: Boolean; P2: JMapBaseIndoorMapInfo);
      cdecl; // (ZLcom/baidu/mapapi/map/MapBaseIndoorMapInfo;)V

    { Property }
  end;

  TJBaiduMap_OnBaseIndoorMapListener = class
    (TJavaGenericImport<JBaiduMap_OnBaseIndoorMapListenerClass,
    JBaiduMap_OnBaseIndoorMapListener>)
  end;

  JBaiduMap_OnMapClickListenerClass = interface(JObjectClass)
    ['{CF78278C-30E4-46C5-8F24-AC7A9BA4977B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/BaiduMap$OnMapClickListener')]
  JBaiduMap_OnMapClickListener = interface(IJavaInstance)
    ['{1B83A250-00B9-410E-BFDC-E26092B5009F}']
    { Property Methods }

    { methods }
    procedure onMapClick(P1: JLatLng); cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function onMapPoiClick(P1: JMapPoi): Boolean; cdecl;
    // (Lcom/baidu/mapapi/map/MapPoi;)Z

    { Property }
  end;

  TJBaiduMap_OnMapClickListener = class
    (TJavaGenericImport<JBaiduMap_OnMapClickListenerClass,
    JBaiduMap_OnMapClickListener>)
  end;

  JBaiduMap_OnMapDoubleClickListenerClass = interface(JObjectClass)
    ['{3EB671FD-DCBA-4CD7-958E-52E0C9808E09}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/BaiduMap$OnMapDoubleClickListener')]
  JBaiduMap_OnMapDoubleClickListener = interface(IJavaInstance)
    ['{16D5A1B2-1E15-4F6E-92DB-BD7ECB2F035A}']
    { Property Methods }

    { methods }
    procedure onMapDoubleClick(P1: JLatLng); cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)V

    { Property }
  end;

  TJBaiduMap_OnMapDoubleClickListener = class
    (TJavaGenericImport<JBaiduMap_OnMapDoubleClickListenerClass,
    JBaiduMap_OnMapDoubleClickListener>)
  end;

  JBaiduMap_OnMapDrawFrameCallbackClass = interface(JObjectClass)
    ['{DB6980C7-DEF1-41DD-BC58-5177F670D4A4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/BaiduMap$OnMapDrawFrameCallback')]
  JBaiduMap_OnMapDrawFrameCallback = interface(IJavaInstance)
    ['{ED215643-D900-4A64-B91B-DACD453820F7}']
    { Property Methods }

    { methods }
    procedure onMapDrawFrame(P1: JGL10; P2: JMapStatus); cdecl; overload;
    // Deprecated //(Ljavax/microedition/khronos/opengles/GL10;Lcom/baidu/mapapi/map/MapStatus;)V
    procedure onMapDrawFrame(P1: JMapStatus); cdecl; overload;
    // (Lcom/baidu/mapapi/map/MapStatus;)V

    { Property }
  end;

  TJBaiduMap_OnMapDrawFrameCallback = class
    (TJavaGenericImport<JBaiduMap_OnMapDrawFrameCallbackClass,
    JBaiduMap_OnMapDrawFrameCallback>)
  end;

  JBaiduMap_OnMapLoadedCallbackClass = interface(JObjectClass)
    ['{C9CDF158-F979-4458-B110-19BAE93B83A8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/BaiduMap$OnMapLoadedCallback')]
  JBaiduMap_OnMapLoadedCallback = interface(IJavaInstance)
    ['{B7EA2C3F-2B71-4E6C-A034-4BE87EF1E2EC}']
    { Property Methods }

    { methods }
    procedure onMapLoaded; cdecl; // ()V

    { Property }
  end;

  TJBaiduMap_OnMapLoadedCallback = class
    (TJavaGenericImport<JBaiduMap_OnMapLoadedCallbackClass,
    JBaiduMap_OnMapLoadedCallback>)
  end;

  JBaiduMap_OnMapLongClickListenerClass = interface(JObjectClass)
    ['{67108442-5B8C-41F6-9535-606051671E07}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/BaiduMap$OnMapLongClickListener')]
  JBaiduMap_OnMapLongClickListener = interface(IJavaInstance)
    ['{5E332D08-8577-4805-BFB3-EEE2E8757D46}']
    { Property Methods }

    { methods }
    procedure onMapLongClick(P1: JLatLng); cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)V

    { Property }
  end;

  TJBaiduMap_OnMapLongClickListener = class
    (TJavaGenericImport<JBaiduMap_OnMapLongClickListenerClass,
    JBaiduMap_OnMapLongClickListener>)
  end;

  JBaiduMap_OnMapRenderCallbackClass = interface(JObjectClass)
    ['{5FC99AB0-25E3-4D22-B8AB-EFFFFC1BDD28}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/BaiduMap$OnMapRenderCallback')]
  JBaiduMap_OnMapRenderCallback = interface(IJavaInstance)
    ['{03D7563A-6AFA-4F87-9F1E-63D348ECA556}']
    { Property Methods }

    { methods }
    procedure onMapRenderFinished; cdecl; // ()V

    { Property }
  end;

  TJBaiduMap_OnMapRenderCallback = class
    (TJavaGenericImport<JBaiduMap_OnMapRenderCallbackClass,
    JBaiduMap_OnMapRenderCallback>)
  end;

  JBaiduMap_OnMapStatusChangeListenerClass = interface(JObjectClass)
    ['{1747CF11-CF3C-486B-87D3-243D1DD18B77}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/BaiduMap$OnMapStatusChangeListener')]
  JBaiduMap_OnMapStatusChangeListener = interface(IJavaInstance)
    ['{2E390E95-20A8-4643-B61B-FD004338ACB1}']
    { Property Methods }

    { methods }
    procedure onMapStatusChangeStart(P1: JMapStatus); cdecl;
    // (Lcom/baidu/mapapi/map/MapStatus;)V
    procedure onMapStatusChange(P1: JMapStatus); cdecl;
    // (Lcom/baidu/mapapi/map/MapStatus;)V
    procedure onMapStatusChangeFinish(P1: JMapStatus); cdecl;
    // (Lcom/baidu/mapapi/map/MapStatus;)V

    { Property }
  end;

  TJBaiduMap_OnMapStatusChangeListener = class
    (TJavaGenericImport<JBaiduMap_OnMapStatusChangeListenerClass,
    JBaiduMap_OnMapStatusChangeListener>)
  end;

  JBaiduMap_OnMapTouchListenerClass = interface(JObjectClass)
    ['{A3D1AC85-E06B-482C-AFB3-BCB9EFDF9553}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/BaiduMap$OnMapTouchListener')]
  JBaiduMap_OnMapTouchListener = interface(IJavaInstance)
    ['{0D6F3A2D-6CBE-468B-9EB5-BC64F00F3B54}']
    { Property Methods }

    { methods }
    procedure onTouch(P1: JMotionEvent); cdecl; // (Landroid/view/MotionEvent;)V

    { Property }
  end;

  TJBaiduMap_OnMapTouchListener = class
    (TJavaGenericImport<JBaiduMap_OnMapTouchListenerClass,
    JBaiduMap_OnMapTouchListener>)
  end;

  JBaiduMap_OnMarkerClickListenerClass = interface(JObjectClass)
    ['{9E73BD8E-5832-4319-ACEC-49F91D203C9B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/BaiduMap$OnMarkerClickListener')]
  JBaiduMap_OnMarkerClickListener = interface(IJavaInstance)
    ['{FA771E3E-CC5E-4958-B95D-D2C7A759260D}']
    { Property Methods }

    { methods }
    function onMarkerClick(P1: JMarker): Boolean; cdecl;
    // (Lcom/baidu/mapapi/map/Marker;)Z

    { Property }
  end;

  TJBaiduMap_OnMarkerClickListener = class
    (TJavaGenericImport<JBaiduMap_OnMarkerClickListenerClass,
    JBaiduMap_OnMarkerClickListener>)
  end;

  JBaiduMap_OnMarkerDragListenerClass = interface(JObjectClass)
    ['{B30FFFEC-2141-4242-AA13-8E2223DF96D6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/BaiduMap$OnMarkerDragListener')]
  JBaiduMap_OnMarkerDragListener = interface(IJavaInstance)
    ['{8E2174B8-2D3C-47A1-8EC5-04279880A424}']
    { Property Methods }

    { methods }
    procedure onMarkerDrag(P1: JMarker); cdecl;
    // (Lcom/baidu/mapapi/map/Marker;)V
    procedure onMarkerDragEnd(P1: JMarker); cdecl;
    // (Lcom/baidu/mapapi/map/Marker;)V
    procedure onMarkerDragStart(P1: JMarker); cdecl;
    // (Lcom/baidu/mapapi/map/Marker;)V

    { Property }
  end;

  TJBaiduMap_OnMarkerDragListener = class
    (TJavaGenericImport<JBaiduMap_OnMarkerDragListenerClass,
    JBaiduMap_OnMarkerDragListener>)
  end;

  JBaiduMap_OnMyLocationClickListenerClass = interface(JObjectClass)
    ['{E30563D1-DAE5-4646-993A-4322A0CCB8E3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/BaiduMap$OnMyLocationClickListener')]
  JBaiduMap_OnMyLocationClickListener = interface(IJavaInstance)
    ['{945467C5-3C8F-43A1-822C-A0E4571F61B8}']
    { Property Methods }

    { methods }
    function onMyLocationClick: Boolean; cdecl; // ()Z

    { Property }
  end;

  TJBaiduMap_OnMyLocationClickListener = class
    (TJavaGenericImport<JBaiduMap_OnMyLocationClickListenerClass,
    JBaiduMap_OnMyLocationClickListener>)
  end;

  JBaiduMap_OnPolylineClickListenerClass = interface(JObjectClass)
    ['{106C795C-EAF6-4F32-8735-411A32FB45A2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/BaiduMap$OnPolylineClickListener')]
  JBaiduMap_OnPolylineClickListener = interface(IJavaInstance)
    ['{C0E31034-7F43-4399-B8FD-CFBC23C19561}']
    { Property Methods }

    { methods }
    function onPolylineClick(P1: JPolyline): Boolean; cdecl;
    // (Lcom/baidu/mapapi/map/Polyline;)Z

    { Property }
  end;

  TJBaiduMap_OnPolylineClickListener = class
    (TJavaGenericImport<JBaiduMap_OnPolylineClickListenerClass,
    JBaiduMap_OnPolylineClickListener>)
  end;

  JBaiduMap_SnapshotReadyCallbackClass = interface(JObjectClass)
    ['{D72CCD80-B3F2-49E5-B3EE-A19E7B5A96FE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/BaiduMap$SnapshotReadyCallback')]
  JBaiduMap_SnapshotReadyCallback = interface(IJavaInstance)
    ['{0E5BCB72-0C88-4A46-AF17-016165E85027}']
    { Property Methods }

    { methods }
    procedure onSnapshotReady(P1: JBitmap); cdecl;
    // (Landroid/graphics/Bitmap;)V

    { Property }
  end;

  TJBaiduMap_SnapshotReadyCallback = class
    (TJavaGenericImport<JBaiduMap_SnapshotReadyCallbackClass,
    JBaiduMap_SnapshotReadyCallback>)
  end;

  JBaiduMapClass = interface(JObjectClass)
    ['{A9A5DA6E-3075-454F-AE2C-BB0BE20C6E70}']
    { static Property Methods }
    { class } function _GetMAP_TYPE_NORMAL: Integer; // I
    { class } function _GetMAP_TYPE_SATELLITE: Integer; // I
    { class } function _GetMAP_TYPE_NONE: Integer; // I

    { static Methods }

    { static Property }
    { class } property MAP_TYPE_NORMAL: Integer read _GetMAP_TYPE_NORMAL;
    { class } property MAP_TYPE_SATELLITE: Integer read _GetMAP_TYPE_SATELLITE;
    { class } property MAP_TYPE_NONE: Integer read _GetMAP_TYPE_NONE;
  end;

  [JavaSignature('com/baidu/mapapi/map/BaiduMap')]
  JBaiduMap = interface(JObject)
    ['{A0E844F3-0925-43FA-825E-EC3D02EF059A}']
    { Property Methods }

    { methods }
    function addOverlay(P1: JOverlayOptions): JOverlay; cdecl;
    // (Lcom/baidu/mapapi/map/OverlayOptions;)Lcom/baidu/mapapi/map/Overlay;
    function addOverlays(P1: JList): JList; cdecl;
    // (Ljava/util/List;)Ljava/util/List;
    function getMarkersInBounds(P1: JLatLngBounds): JList; cdecl;
    // (Lcom/baidu/mapapi/model/LatLngBounds;)Ljava/util/List;
    procedure clear; cdecl; // ()V
    procedure setMapStatus(P1: JMapStatusUpdate); cdecl;
    // (Lcom/baidu/mapapi/map/MapStatusUpdate;)V
    function getMapStatus: JMapStatus; cdecl;
    // ()Lcom/baidu/mapapi/map/MapStatus;
    function getMapStatusLimit: JLatLngBounds; cdecl;
    // ()Lcom/baidu/mapapi/model/LatLngBounds;
    procedure setMapStatusLimits(P1: JLatLngBounds); cdecl;
    // (Lcom/baidu/mapapi/model/LatLngBounds;)V
    procedure animateMapStatus(P1: JMapStatusUpdate; P2: Integer); cdecl;
      overload; // (Lcom/baidu/mapapi/map/MapStatusUpdate;I)V
    procedure animateMapStatus(P1: JMapStatusUpdate); cdecl; overload;
    // (Lcom/baidu/mapapi/map/MapStatusUpdate;)V
    procedure setMapType(P1: Integer); cdecl; // (I)V
    function getMapType: Integer; cdecl; // ()I
    function getMaxZoomLevel: Single; cdecl; // ()F
    procedure setMaxAndMinZoomLevel(P1: Single; P2: Single); cdecl; // (FF)V
    function getMinZoomLevel: Single; cdecl; // ()F
    function getProjection: JProjection; cdecl;
    // ()Lcom/baidu/mapapi/map/Projection;
    function getUiSettings: JUiSettings; cdecl;
    // ()Lcom/baidu/mapapi/map/UiSettings;
    procedure setBuildingsEnabled(P1: Boolean); cdecl; // (Z)V
    function isBuildingsEnabled: Boolean; cdecl; // ()Z
    procedure setMyLocationEnabled(P1: Boolean); cdecl; // (Z)V
    function isMyLocationEnabled: Boolean; cdecl; // ()Z
    procedure setMyLocationData(P1: JMyLocationData); cdecl;
    // (Lcom/baidu/mapapi/map/MyLocationData;)V
    function getLocationData: JMyLocationData; cdecl;
    // ()Lcom/baidu/mapapi/map/MyLocationData;
    procedure setMyLocationConfiguration(P1: JMyLocationConfiguration); cdecl;
    // (Lcom/baidu/mapapi/map/MyLocationConfiguration;)V
    procedure setMyLocationConfigeration(P1: JMyLocationConfiguration); cdecl;
    // Deprecated //(Lcom/baidu/mapapi/map/MyLocationConfiguration;)V
    function getLocationConfiguration: JMyLocationConfiguration; cdecl;
    // ()Lcom/baidu/mapapi/map/MyLocationConfiguration;
    function getLocationConfigeration: JMyLocationConfiguration; cdecl;
    // Deprecated //()Lcom/baidu/mapapi/map/MyLocationConfiguration;
    procedure addHeatMap(P1: JHeatMap); cdecl;
    // (Lcom/baidu/mapapi/map/HeatMap;)V
    procedure setBaiduHeatMapEnabled(P1: Boolean); cdecl; // (Z)V
    procedure setIndoorEnable(P1: Boolean); cdecl; // (Z)V
    procedure setCompassPosition(P1: JPoint); cdecl;
    // (Landroid/graphics/Point;)V
    procedure setCompassIcon(P1: JBitmap); cdecl;
    // (Landroid/graphics/Bitmap;)V
    function getCompassPosition: JPoint; cdecl; // ()Landroid/graphics/Point;
    function isBaiduHeatMapEnabled: Boolean; cdecl; // ()Z
    function isSupportBaiduHeatMap: Boolean; cdecl; // ()Z
    procedure setTrafficEnabled(P1: Boolean); cdecl; // (Z)V
    function isTrafficEnabled: Boolean; cdecl; // ()Z
    procedure showMapPoi(P1: Boolean); cdecl; // (Z)V
    procedure showMapIndoorPoi(P1: Boolean); cdecl; // (Z)V
    procedure setPadding(P1: Integer; P2: Integer; P3: Integer; P4: Integer);
      cdecl; // Deprecated //(IIII)V
    procedure setViewPadding(P1: Integer; P2: Integer; P3: Integer;
      P4: Integer); cdecl; // (IIII)V
    procedure snapshot(P1: JBaiduMap_SnapshotReadyCallback); cdecl;
    // (Lcom/baidu/mapapi/map/BaiduMap$SnapshotReadyCallback;)V
    procedure snapshotScope(P1: JRect; P2: JBaiduMap_SnapshotReadyCallback);
      cdecl; // (Landroid/graphics/Rect;Lcom/baidu/mapapi/map/BaiduMap$SnapshotReadyCallback;)V
    procedure showInfoWindow(P1: JInfoWindow); cdecl;
    // (Lcom/baidu/mapapi/map/InfoWindow;)V
    procedure hideInfoWindow; cdecl; // ()V
    procedure setOnMapStatusChangeListener
      (P1: JBaiduMap_OnMapStatusChangeListener); cdecl;
    // (Lcom/baidu/mapapi/map/BaiduMap$OnMapStatusChangeListener;)V
    procedure setOnMapTouchListener(P1: JBaiduMap_OnMapTouchListener); cdecl;
    // (Lcom/baidu/mapapi/map/BaiduMap$OnMapTouchListener;)V
    procedure setOnMapClickListener(P1: JBaiduMap_OnMapClickListener); cdecl;
    // (Lcom/baidu/mapapi/map/BaiduMap$OnMapClickListener;)V
    procedure setOnMapLoadedCallback(P1: JBaiduMap_OnMapLoadedCallback); cdecl;
    // (Lcom/baidu/mapapi/map/BaiduMap$OnMapLoadedCallback;)V
    procedure setOnMapRenderCallbadk(P1: JBaiduMap_OnMapRenderCallback); cdecl;
    // (Lcom/baidu/mapapi/map/BaiduMap$OnMapRenderCallback;)V
    procedure setOnMapDoubleClickListener
      (P1: JBaiduMap_OnMapDoubleClickListener); cdecl;
    // (Lcom/baidu/mapapi/map/BaiduMap$OnMapDoubleClickListener;)V
    procedure setOnMapLongClickListener(P1: JBaiduMap_OnMapLongClickListener);
      cdecl; // (Lcom/baidu/mapapi/map/BaiduMap$OnMapLongClickListener;)V
    procedure setOnPolylineClickListener(P1: JBaiduMap_OnPolylineClickListener);
      cdecl; // (Lcom/baidu/mapapi/map/BaiduMap$OnPolylineClickListener;)V
    procedure setOnMarkerClickListener(P1: JBaiduMap_OnMarkerClickListener);
      cdecl; // (Lcom/baidu/mapapi/map/BaiduMap$OnMarkerClickListener;)V
    procedure setOnMarkerDragListener(P1: JBaiduMap_OnMarkerDragListener);
      cdecl; // (Lcom/baidu/mapapi/map/BaiduMap$OnMarkerDragListener;)V
    procedure setOnMyLocationClickListener
      (P1: JBaiduMap_OnMyLocationClickListener); cdecl;
    // (Lcom/baidu/mapapi/map/BaiduMap$OnMyLocationClickListener;)V
    procedure setOnMapDrawFrameCallback(P1: JBaiduMap_OnMapDrawFrameCallback);
      cdecl; // (Lcom/baidu/mapapi/map/BaiduMap$OnMapDrawFrameCallback;)V
    procedure setOnBaseIndoorMapListener(P1: JBaiduMap_OnBaseIndoorMapListener);
      cdecl; // (Lcom/baidu/mapapi/map/BaiduMap$OnBaseIndoorMapListener;)V
    function getFocusedBaseIndoorMapInfo: JMapBaseIndoorMapInfo; cdecl;
    // ()Lcom/baidu/mapapi/map/MapBaseIndoorMapInfo;
    function switchBaseIndoorMapFloor(P1: JString; P2: JString)
      : JMapBaseIndoorMapInfo_SwitchFloorError; cdecl;
    // (Ljava/lang/String;Ljava/lang/String;)Lcom/baidu/mapapi/map/MapBaseIndoorMapInfo$SwitchFloorError;
    function isBaseIndoorMapMode: Boolean; cdecl; // ()Z
    procedure removeMarkerClickListener(P1: JBaiduMap_OnMarkerClickListener);
      cdecl; // (Lcom/baidu/mapapi/map/BaiduMap$OnMarkerClickListener;)V
    function addTileLayer(P1: JTileOverlayOptions): JTileOverlay; cdecl;
    // (Lcom/baidu/mapapi/map/TileOverlayOptions;)Lcom/baidu/mapapi/map/TileOverlay;

    { Property }
  end;

  TJBaiduMap = class(TJavaGenericImport<JBaiduMapClass, JBaiduMap>)
  end;

  JBaiduMapOptionsClass = interface(JObjectClass)
    ['{1B2FC838-0B9A-4A9A-93EF-0C8785226645}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JBaiduMapOptions; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/map/BaiduMapOptions')]
  JBaiduMapOptions = interface(JObject)
    ['{27E9E003-87DF-41F8-8D79-0AC39DF15AA7}']
    { Property Methods }

    { methods }
    function mapStatus(P1: JMapStatus): JBaiduMapOptions; cdecl;
    // (Lcom/baidu/mapapi/map/MapStatus;)Lcom/baidu/mapapi/map/BaiduMapOptions;
    function compassEnabled(P1: Boolean): JBaiduMapOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/BaiduMapOptions;
    function mapType(P1: Integer): JBaiduMapOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/BaiduMapOptions;
    function rotateGesturesEnabled(P1: Boolean): JBaiduMapOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/BaiduMapOptions;
    function scrollGesturesEnabled(P1: Boolean): JBaiduMapOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/BaiduMapOptions;
    function overlookingGesturesEnabled(P1: Boolean): JBaiduMapOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/BaiduMapOptions;
    function zoomControlsEnabled(P1: Boolean): JBaiduMapOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/BaiduMapOptions;
    function zoomGesturesEnabled(P1: Boolean): JBaiduMapOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/BaiduMapOptions;
    function scaleControlEnabled(P1: Boolean): JBaiduMapOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/BaiduMapOptions;
    function scaleControlPosition(P1: JPoint): JBaiduMapOptions; cdecl;
    // (Landroid/graphics/Point;)Lcom/baidu/mapapi/map/BaiduMapOptions;
    function zoomControlsPosition(P1: JPoint): JBaiduMapOptions; cdecl;
    // (Landroid/graphics/Point;)Lcom/baidu/mapapi/map/BaiduMapOptions;
    function logoPosition(P1: JLogoPosition): JBaiduMapOptions; cdecl;
    // (Lcom/baidu/mapapi/map/LogoPosition;)Lcom/baidu/mapapi/map/BaiduMapOptions;
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
  end;

  TJBaiduMapOptions = class(TJavaGenericImport<JBaiduMapOptionsClass,
    JBaiduMapOptions>)
  end;

  JBitmapDescriptorClass = interface(JObjectClass)
    ['{E1DE53F7-D204-47DB-8F3B-3BB8F240EBEC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/BitmapDescriptor')]
  JBitmapDescriptor = interface(JObject)
    ['{AE03517A-F567-4B13-855B-2273AF751E97}']
    { Property Methods }

    { methods }
    function getBitmap: JBitmap; cdecl; // ()Landroid/graphics/Bitmap;
    procedure recycle; cdecl; // ()V

    { Property }
  end;

  TJBitmapDescriptor = class(TJavaGenericImport<JBitmapDescriptorClass,
    JBitmapDescriptor>)
  end;

  JBitmapDescriptorFactoryClass = interface(JObjectClass)
    ['{DC2A06D3-5FED-4110-9FE9-CECDAB5A8185}']
    { static Property Methods }

    { static Methods }
    { class } function init: JBitmapDescriptorFactory; cdecl; // ()V
    { class } function fromAsset(P1: JString): JBitmapDescriptor; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/map/BitmapDescriptor;
    { class } function fromAssetWithDpi(P1: JString): JBitmapDescriptor; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/map/BitmapDescriptor;
    { class } function fromBitmap(P1: JBitmap): JBitmapDescriptor; cdecl;
    // (Landroid/graphics/Bitmap;)Lcom/baidu/mapapi/map/BitmapDescriptor;
    { class } function fromFile(P1: JString): JBitmapDescriptor; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/map/BitmapDescriptor;
    { class } function fromPath(P1: JString): JBitmapDescriptor; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/map/BitmapDescriptor;
    { class } function fromResource(P1: Integer): JBitmapDescriptor; cdecl;
    // (I)Lcom/baidu/mapapi/map/BitmapDescriptor;
    { class } function fromView(P1: JView): JBitmapDescriptor; cdecl;
    // (Landroid/view/View;)Lcom/baidu/mapapi/map/BitmapDescriptor;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/BitmapDescriptorFactory')]
  JBitmapDescriptorFactory = interface(JObject)
    ['{8A97DC39-6A47-4C5B-9502-0C5C4796E386}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBitmapDescriptorFactory = class
    (TJavaGenericImport<JBitmapDescriptorFactoryClass,
    JBitmapDescriptorFactory>)
  end;

  JCircleClass = interface(JOverlayClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/map/Overlay
    ['{BE4AA822-6259-4ED6-9115-ACCF5B2C1D2F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/Circle')]
  JCircle = interface(JOverlay)
  // or JObject // SuperSignature: com/baidu/mapapi/map/Overlay
    ['{4B77F271-BB34-4D83-9F6C-A64650EC3772}']
    { Property Methods }

    { methods }
    function getCenter: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getFillColor: Integer; cdecl; // ()I
    function getRadius: Integer; cdecl; // ()I
    function getStroke: JStroke; cdecl; // ()Lcom/baidu/mapapi/map/Stroke;
    procedure setCenter(P1: JLatLng); cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)V
    procedure setFillColor(P1: Integer); cdecl; // (I)V
    procedure setRadius(P1: Integer); cdecl; // (I)V
    procedure setStroke(P1: JStroke); cdecl; // (Lcom/baidu/mapapi/map/Stroke;)V

    { Property }
  end;

  TJCircle = class(TJavaGenericImport<JCircleClass, JCircle>)
  end;

  JCircleOptionsClass = interface(JOverlayOptionsClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/map/OverlayOptions
    ['{81D57DB8-3BCF-4758-A6CF-DCC0355442DD}']
    { static Property Methods }

    { static Methods }
    { class } function init: JCircleOptions; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/CircleOptions')]
  JCircleOptions = interface(JOverlayOptions)
  // or JObject // SuperSignature: com/baidu/mapapi/map/OverlayOptions
    ['{4462318B-458D-4CC3-B090-693BA4E99E6B}']
    { Property Methods }

    { methods }
    function getCenter: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getFillColor: Integer; cdecl; // ()I
    function getRadius: Integer; cdecl; // ()I
    function getStroke: JStroke; cdecl; // ()Lcom/baidu/mapapi/map/Stroke;
    function center(P1: JLatLng): JCircleOptions; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/map/CircleOptions;
    function fillColor(P1: Integer): JCircleOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/CircleOptions;
    function radius(P1: Integer): JCircleOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/CircleOptions;
    function stroke(P1: JStroke): JCircleOptions; cdecl;
    // (Lcom/baidu/mapapi/map/Stroke;)Lcom/baidu/mapapi/map/CircleOptions;
    function visible(P1: Boolean): JCircleOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/CircleOptions;
    function isVisible: Boolean; cdecl; // ()Z
    function zIndex(P1: Integer): JCircleOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/CircleOptions;
    function getZIndex: Integer; cdecl; // ()I
    function extraInfo(P1: JBundle): JCircleOptions; cdecl;
    // (Landroid/os/Bundle;)Lcom/baidu/mapapi/map/CircleOptions;
    function getExtraInfo: JBundle; cdecl; // ()Landroid/os/Bundle;

    { Property }
  end;

  TJCircleOptions = class(TJavaGenericImport<JCircleOptionsClass,
    JCircleOptions>)
  end;

  JDotClass = interface(JOverlayClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/map/Overlay
    ['{0774DE87-5129-431F-991F-0C20E937ACFC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/Dot')]
  JDot = interface(JOverlay)
  // or JObject // SuperSignature: com/baidu/mapapi/map/Overlay
    ['{95F9D196-A23B-4FE4-8A64-39EB26C02449}']
    { Property Methods }

    { methods }
    function getCenter: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getColor: Integer; cdecl; // ()I
    function getRadius: Integer; cdecl; // ()I
    procedure setCenter(P1: JLatLng); cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)V
    procedure setColor(P1: Integer); cdecl; // (I)V
    procedure setRadius(P1: Integer); cdecl; // (I)V

    { Property }
  end;

  TJDot = class(TJavaGenericImport<JDotClass, JDot>)
  end;

  JDotOptionsClass = interface(JOverlayOptionsClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/map/OverlayOptions
    ['{ACC7BF8D-B568-4935-8014-A8A2639B0E93}']
    { static Property Methods }

    { static Methods }
    { class } function init: JDotOptions; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/DotOptions')]
  JDotOptions = interface(JOverlayOptions)
  // or JObject // SuperSignature: com/baidu/mapapi/map/OverlayOptions
    ['{09387713-2135-4AD0-9E26-638C7F06ECEE}']
    { Property Methods }

    { methods }
    function getCenter: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getColor: Integer; cdecl; // ()I
    function getRadius: Integer; cdecl; // ()I
    function center(P1: JLatLng): JDotOptions; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/map/DotOptions;
    function color(P1: Integer): JDotOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/DotOptions;
    function radius(P1: Integer): JDotOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/DotOptions;
    function visible(P1: Boolean): JDotOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/DotOptions;
    function isVisible: Boolean; cdecl; // ()Z
    function zIndex(P1: Integer): JDotOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/DotOptions;
    function getZIndex: Integer; cdecl; // ()I
    function extraInfo(P1: JBundle): JDotOptions; cdecl;
    // (Landroid/os/Bundle;)Lcom/baidu/mapapi/map/DotOptions;
    function getExtraInfo: JBundle; cdecl; // ()Landroid/os/Bundle;

    { Property }
  end;

  TJDotOptions = class(TJavaGenericImport<JDotOptionsClass, JDotOptions>)
  end;

  JFileTileProviderClass = interface(JObjectClass)
    ['{6A3613B6-28BF-4589-9B35-C672BBE994D5}']
    { static Property Methods }

    { static Methods }
    { class } function init: JFileTileProvider; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/FileTileProvider')]
  JFileTileProvider = interface(JObject)
    ['{96081A49-0B7D-4C0B-A383-62DCF1F30967}']
    { Property Methods }

    { methods }
    function getTile(P1: Integer; P2: Integer; P3: Integer): JTile; cdecl;
    // (III)Lcom/baidu/mapapi/map/Tile;

    { Property }
  end;

  TJFileTileProvider = class(TJavaGenericImport<JFileTileProviderClass,
    JFileTileProvider>)
  end;

  JGradientClass = interface(JObjectClass)
    ['{6226665E-9D01-4034-A12C-53E8D9CB10D2}']
    { static Property Methods }

    { static Methods }
    { class } function init(P1: TJavaArray<Integer>; P2: TJavaArray<Single>)
      : JGradient; cdecl; // ([I[F)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/Gradient')]
  JGradient = interface(JObject)
    ['{ACD0D819-B393-4C68-9896-DE9B78D040F1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGradient = class(TJavaGenericImport<JGradientClass, JGradient>)
  end;

  JGroundOverlayClass = interface(JOverlayClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/map/Overlay
    ['{0F63207C-22E4-4ADC-8BF0-EAF5CA6B98C5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/GroundOverlay')]
  JGroundOverlay = interface(JOverlay)
  // or JObject // SuperSignature: com/baidu/mapapi/map/Overlay
    ['{EA2F0293-1113-450D-98E9-9A4D9CB554E2}']
    { Property Methods }

    { methods }
    procedure setImage(P1: JBitmapDescriptor); cdecl;
    // (Lcom/baidu/mapapi/map/BitmapDescriptor;)V
    function getImage: JBitmapDescriptor; cdecl;
    // ()Lcom/baidu/mapapi/map/BitmapDescriptor;
    procedure setPosition(P1: JLatLng); cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function getPosition: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    procedure setDimensions(P1: Integer); cdecl; overload; // (I)V
    procedure setDimensions(P1: Integer; P2: Integer); cdecl; overload; // (II)V
    function getWidth: Double; cdecl; // ()D
    function getHeight: Double; cdecl; // ()D
    procedure setAnchor(P1: Single; P2: Single); cdecl; // (FF)V
    function getAnchorX: Single; cdecl; // ()F
    function getAnchorY: Single; cdecl; // ()F
    procedure setPositionFromBounds(P1: JLatLngBounds); cdecl;
    // (Lcom/baidu/mapapi/model/LatLngBounds;)V
    function getBounds: JLatLngBounds; cdecl;
    // ()Lcom/baidu/mapapi/model/LatLngBounds;
    procedure setTransparency(P1: Single); cdecl; // (F)V
    function getTransparency: Single; cdecl; // ()F

    { Property }
  end;

  TJGroundOverlay = class(TJavaGenericImport<JGroundOverlayClass,
    JGroundOverlay>)
  end;

  JGroundOverlayOptionsClass = interface(JOverlayOptionsClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/map/OverlayOptions
    ['{B101619E-3F20-49B1-88F3-E4B472745A51}']
    { static Property Methods }

    { static Methods }
    { class } function init: JGroundOverlayOptions; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/GroundOverlayOptions')]
  JGroundOverlayOptions = interface(JOverlayOptions)
  // or JObject // SuperSignature: com/baidu/mapapi/map/OverlayOptions
    ['{A1A72C76-7DD7-403D-953D-D5CC2D105BF8}']
    { Property Methods }

    { methods }
    function image(P1: JBitmapDescriptor): JGroundOverlayOptions; cdecl;
    // (Lcom/baidu/mapapi/map/BitmapDescriptor;)Lcom/baidu/mapapi/map/GroundOverlayOptions;
    function getImage: JBitmapDescriptor; cdecl;
    // ()Lcom/baidu/mapapi/map/BitmapDescriptor;
    function position(P1: JLatLng): JGroundOverlayOptions; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/map/GroundOverlayOptions;
    function getPosition: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function dimensions(P1: Integer): JGroundOverlayOptions; cdecl; overload;
    // (I)Lcom/baidu/mapapi/map/GroundOverlayOptions;
    function dimensions(P1: Integer; P2: Integer): JGroundOverlayOptions; cdecl;
      overload; // (II)Lcom/baidu/mapapi/map/GroundOverlayOptions;
    function getWidth: Integer; cdecl; // ()I
    function getHeight: Integer; cdecl; // ()I
    function anchor(P1: Single; P2: Single): JGroundOverlayOptions; cdecl;
    // (FF)Lcom/baidu/mapapi/map/GroundOverlayOptions;
    function getAnchorX: Single; cdecl; // ()F
    function getAnchorY: Single; cdecl; // ()F
    function positionFromBounds(P1: JLatLngBounds): JGroundOverlayOptions;
      cdecl; // (Lcom/baidu/mapapi/model/LatLngBounds;)Lcom/baidu/mapapi/map/GroundOverlayOptions;
    function getBounds: JLatLngBounds; cdecl;
    // ()Lcom/baidu/mapapi/model/LatLngBounds;
    function transparency(P1: Single): JGroundOverlayOptions; cdecl;
    // (F)Lcom/baidu/mapapi/map/GroundOverlayOptions;
    function getTransparency: Single; cdecl; // ()F
    function visible(P1: Boolean): JGroundOverlayOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/GroundOverlayOptions;
    function isVisible: Boolean; cdecl; // ()Z
    function zIndex(P1: Integer): JGroundOverlayOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/GroundOverlayOptions;
    function getZIndex: Integer; cdecl; // ()I
    function extraInfo(P1: JBundle): JGroundOverlayOptions; cdecl;
    // (Landroid/os/Bundle;)Lcom/baidu/mapapi/map/GroundOverlayOptions;
    function getExtraInfo: JBundle; cdecl; // ()Landroid/os/Bundle;

    { Property }
  end;

  TJGroundOverlayOptions = class(TJavaGenericImport<JGroundOverlayOptionsClass,
    JGroundOverlayOptions>)
  end;

  JHeatMap_BuilderClass = interface(JObjectClass)
    ['{77CE4B69-FB87-4460-AC03-001215CF2B29}']
    { static Property Methods }

    { static Methods }
    { class } function init: JHeatMap_Builder; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/HeatMap$Builder')]
  JHeatMap_Builder = interface(JObject)
    ['{FF774600-114F-48C5-9100-615421177750}']
    { Property Methods }

    { methods }
    function data(P1: JCollection): JHeatMap_Builder; cdecl;
    // (Ljava/util/Collection;)Lcom/baidu/mapapi/map/HeatMap$Builder;
    function weightedData(P1: JCollection): JHeatMap_Builder; cdecl;
    // (Ljava/util/Collection;)Lcom/baidu/mapapi/map/HeatMap$Builder;
    function radius(P1: Integer): JHeatMap_Builder; cdecl;
    // (I)Lcom/baidu/mapapi/map/HeatMap$Builder;
    function gradient(P1: JGradient): JHeatMap_Builder; cdecl;
    // (Lcom/baidu/mapapi/map/Gradient;)Lcom/baidu/mapapi/map/HeatMap$Builder;
    function opacity(P1: Double): JHeatMap_Builder; cdecl;
    // (D)Lcom/baidu/mapapi/map/HeatMap$Builder;
    function build: JHeatMap; cdecl; // ()Lcom/baidu/mapapi/map/HeatMap;

    { Property }
  end;

  TJHeatMap_Builder = class(TJavaGenericImport<JHeatMap_BuilderClass,
    JHeatMap_Builder>)
  end;

  JHeatMapClass = interface(JObjectClass)
    ['{3F5BC6D1-5627-4864-8939-E46B4A84059F}']
    { static Property Methods }
    { class } function _GetDEFAULT_RADIUS: Integer; // I
    { class } function _GetDEFAULT_OPACITY: Double; // D
    { class } function _GetDEFAULT_GRADIENT: JGradient;
    // Lcom/baidu/mapapi/map/Gradient;

    { static Methods }

    { static Property }
    { class } property DEFAULT_RADIUS: Integer read _GetDEFAULT_RADIUS;
    { class } property DEFAULT_OPACITY: Double read _GetDEFAULT_OPACITY;
    { class } property DEFAULT_GRADIENT: JGradient read _GetDEFAULT_GRADIENT;
  end;

  [JavaSignature('com/baidu/mapapi/map/HeatMap')]
  JHeatMap = interface(JObject)
    ['{A0538D7D-6A04-4F97-9204-B97FBC0DC6DD}']
    { Property Methods }

    { methods }
    procedure removeHeatMap; cdecl; // ()V

    { Property }
  end;

  TJHeatMap = class(TJavaGenericImport<JHeatMapClass, JHeatMap>)
  end;

  JInfoWindow_OnInfoWindowClickListenerClass = interface(JObjectClass)
    ['{CCA4872C-2CA8-4CED-8D54-C4FF4F7D9C8E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/InfoWindow$OnInfoWindowClickListener')]
  JInfoWindow_OnInfoWindowClickListener = interface(IJavaInstance)
    ['{9D283882-E495-4312-A6C6-3E4EFB994716}']
    { Property Methods }

    { methods }
    procedure onInfoWindowClick; cdecl; // ()V

    { Property }
  end;

  TJInfoWindow_OnInfoWindowClickListener = class
    (TJavaGenericImport<JInfoWindow_OnInfoWindowClickListenerClass,
    JInfoWindow_OnInfoWindowClickListener>)
  end;

  JInfoWindowClass = interface(JObjectClass)
    ['{430C10C7-AE4B-4C50-8FD0-8C70CB9FF22F}']
    { static Property Methods }

    { static Methods }
    { class } function init(P1: JView; P2: JLatLng; P3: Integer): JInfoWindow;
      cdecl; overload; // (Landroid/view/View;Lcom/baidu/mapapi/model/LatLng;I)V
    { class } function init(P1: JBitmapDescriptor; P2: JLatLng; P3: Integer;
      P4: JInfoWindow_OnInfoWindowClickListener): JInfoWindow; cdecl; overload;
    // (Lcom/baidu/mapapi/map/BitmapDescriptor;Lcom/baidu/mapapi/model/LatLng;ILcom/baidu/mapapi/map/InfoWindow$OnInfoWindowClickListener;)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/InfoWindow')]
  JInfoWindow = interface(JObject)
    ['{A556C372-1FFC-4008-A84A-1FF4053A4D54}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJInfoWindow = class(TJavaGenericImport<JInfoWindowClass, JInfoWindow>)
  end;

  JItemizedOverlayClass = interface(JOverlayClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/map/Overlay
    ['{EB7B86C9-61D4-4796-B9DA-55E9009BFAF3}']
    { static Property Methods }

    { static Methods }
    { class } function init(P1: JDrawable; P2: JMapView): JItemizedOverlay;
      cdecl; // (Landroid/graphics/drawable/Drawable;Lcom/baidu/mapapi/map/MapView;)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/ItemizedOverlay')]
  JItemizedOverlay = interface(JOverlay)
  // or JObject // SuperSignature: com/baidu/mapapi/map/Overlay
    ['{35367BA4-E328-4AA0-9214-F1D8F196401C}']
    { Property Methods }

    { methods }
    procedure addItem(P1: JOverlayOptions); cdecl;
    // (Lcom/baidu/mapapi/map/OverlayOptions;)V
    procedure reAddAll; cdecl; // ()V
    procedure removeAll; cdecl; // ()V

    { Property }
  end;

  TJItemizedOverlay = class(TJavaGenericImport<JItemizedOverlayClass,
    JItemizedOverlay>)
  end;

  JLogoPositionClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{E34587BA-83EA-4563-A082-9AC4F1D729D3}']
    { static Property Methods }
    { class } function _GetlogoPostionleftBottom: JLogoPosition;
    // Lcom/baidu/mapapi/map/LogoPosition;
    { class } function _GetlogoPostionleftTop: JLogoPosition;
    // Lcom/baidu/mapapi/map/LogoPosition;
    { class } function _GetlogoPostionCenterBottom: JLogoPosition;
    // Lcom/baidu/mapapi/map/LogoPosition;
    { class } function _GetlogoPostionCenterTop: JLogoPosition;
    // Lcom/baidu/mapapi/map/LogoPosition;
    { class } function _GetlogoPostionRightBottom: JLogoPosition;
    // Lcom/baidu/mapapi/map/LogoPosition;
    { class } function _GetlogoPostionRightTop: JLogoPosition;
    // Lcom/baidu/mapapi/map/LogoPosition;

    { static Methods }
    { class } function values: TJavaObjectArray<JLogoPosition>; cdecl;
    // ()[Lcom/baidu/mapapi/map/LogoPosition;
    { class } function valueOf(P1: JString): JLogoPosition; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/map/LogoPosition;

    { static Property }
    { class } property logoPostionleftBottom: JLogoPosition
      read _GetlogoPostionleftBottom;
    { class } property logoPostionleftTop: JLogoPosition
      read _GetlogoPostionleftTop;
    { class } property logoPostionCenterBottom: JLogoPosition
      read _GetlogoPostionCenterBottom;
    { class } property logoPostionCenterTop: JLogoPosition
      read _GetlogoPostionCenterTop;
    { class } property logoPostionRightBottom: JLogoPosition
      read _GetlogoPostionRightBottom;
    { class } property logoPostionRightTop: JLogoPosition
      read _GetlogoPostionRightTop;
  end;

  [JavaSignature('com/baidu/mapapi/map/LogoPosition')]
  JLogoPosition = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{0B6D721B-3636-4685-821B-F8C270E1ABB8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLogoPosition = class(TJavaGenericImport<JLogoPositionClass, JLogoPosition>)
  end;

  JMapBaseIndoorMapInfo_SwitchFloorErrorClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{EFCF8E79-B7BF-4F47-9D6D-19C165424100}']
    { static Property Methods }
    { class } function _GetSWITCH_OK: JMapBaseIndoorMapInfo_SwitchFloorError;
    // Lcom/baidu/mapapi/map/MapBaseIndoorMapInfo$SwitchFloorError;
    { class } function _GetFLOOR_INFO_ERROR
      : JMapBaseIndoorMapInfo_SwitchFloorError;
    // Lcom/baidu/mapapi/map/MapBaseIndoorMapInfo$SwitchFloorError;
    { class } function _GetFLOOR_OVERLFLOW
      : JMapBaseIndoorMapInfo_SwitchFloorError;
    // Lcom/baidu/mapapi/map/MapBaseIndoorMapInfo$SwitchFloorError;
    { class } function _GetFOCUSED_ID_ERROR
      : JMapBaseIndoorMapInfo_SwitchFloorError;
    // Lcom/baidu/mapapi/map/MapBaseIndoorMapInfo$SwitchFloorError;
    { class } function _GetSWITCH_ERROR: JMapBaseIndoorMapInfo_SwitchFloorError;
    // Lcom/baidu/mapapi/map/MapBaseIndoorMapInfo$SwitchFloorError;

    { static Methods }
    { class } function values
      : TJavaObjectArray<JMapBaseIndoorMapInfo_SwitchFloorError>; cdecl;
    // ()[Lcom/baidu/mapapi/map/MapBaseIndoorMapInfo$SwitchFloorError;
    { class } function valueOf(P1: JString)
      : JMapBaseIndoorMapInfo_SwitchFloorError; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/map/MapBaseIndoorMapInfo$SwitchFloorError;

    { static Property }
    { class } property SWITCH_OK: JMapBaseIndoorMapInfo_SwitchFloorError
      read _GetSWITCH_OK;
    { class } property FLOOR_INFO_ERROR: JMapBaseIndoorMapInfo_SwitchFloorError
      read _GetFLOOR_INFO_ERROR;
    { class } property FLOOR_OVERLFLOW: JMapBaseIndoorMapInfo_SwitchFloorError
      read _GetFLOOR_OVERLFLOW;
    { class } property FOCUSED_ID_ERROR: JMapBaseIndoorMapInfo_SwitchFloorError
      read _GetFOCUSED_ID_ERROR;
    { class } property SWITCH_ERROR: JMapBaseIndoorMapInfo_SwitchFloorError
      read _GetSWITCH_ERROR;
  end;

  [JavaSignature('com/baidu/mapapi/map/MapBaseIndoorMapInfo$SwitchFloorError')]
  JMapBaseIndoorMapInfo_SwitchFloorError = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{91257E96-FE63-4127-9925-BA42B093521D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMapBaseIndoorMapInfo_SwitchFloorError = class
    (TJavaGenericImport<JMapBaseIndoorMapInfo_SwitchFloorErrorClass,
    JMapBaseIndoorMapInfo_SwitchFloorError>)
  end;

  JMapBaseIndoorMapInfoClass = interface(JObjectClass)
    ['{F994C350-6F28-474E-8ED6-B3C7BDA90F05}']
    { static Property Methods }

    { static Methods }
    { class } function init: JMapBaseIndoorMapInfo; cdecl; overload; // ()V
    { class } function init(P1: JString; P2: JString; P3: JArrayList)
      : JMapBaseIndoorMapInfo; cdecl; overload;
    // (Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    { class } function init(P1: JMapBaseIndoorMapInfo): JMapBaseIndoorMapInfo;
      cdecl; overload; // (Lcom/baidu/mapapi/map/MapBaseIndoorMapInfo;)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/MapBaseIndoorMapInfo')]
  JMapBaseIndoorMapInfo = interface(JObject)
    ['{4DDD4D9F-F42E-43C8-95A8-06B82DF9B86B}']
    { Property Methods }

    { methods }
    function getID: JString; cdecl; // ()Ljava/lang/String;
    function getCurFloor: JString; cdecl; // ()Ljava/lang/String;
    function getFloors: JArrayList; cdecl; // ()Ljava/util/ArrayList;

    { Property }
  end;

  TJMapBaseIndoorMapInfo = class(TJavaGenericImport<JMapBaseIndoorMapInfoClass,
    JMapBaseIndoorMapInfo>)
  end;

  JMapFragmentClass = interface(JFragmentClass)
  // or JObjectClass // SuperSignature: android/app/Fragment
    ['{442CFC62-DCBF-4509-AFD0-474B6C348936}']
    { static Property Methods }

    { static Methods }
    { class } function init: JMapFragment; cdecl; // ()V
    { class } function newInstance: JMapFragment; cdecl; overload;
    // ()Lcom/baidu/mapapi/map/MapFragment;
    { class } function newInstance(P1: JBaiduMapOptions): JMapFragment; cdecl;
      overload; // (Lcom/baidu/mapapi/map/BaiduMapOptions;)Lcom/baidu/mapapi/map/MapFragment;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/MapFragment')]
  JMapFragment = interface(JFragment)
  // or JObject // SuperSignature: android/app/Fragment
    ['{396F52DC-E04D-4491-BC55-075EA45720D4}']
    { Property Methods }

    { methods }
    function getBaiduMap: JBaiduMap; cdecl; // ()Lcom/baidu/mapapi/map/BaiduMap;
    function getMapView: JMapView; cdecl; // ()Lcom/baidu/mapapi/map/MapView;
    procedure onAttach(P1: JActivity); cdecl; // (Landroid/app/Activity;)V
    procedure onCreate(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    function onCreateView(P1: JLayoutInflater; P2: JViewGroup; P3: JBundle)
      : JView; cdecl;
    // (Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    procedure onViewCreated(P1: JView; P2: JBundle); cdecl;
    // (Landroid/view/View;Landroid/os/Bundle;)V
    procedure onActivityCreated(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    procedure onStart; cdecl; // ()V
    procedure onResume; cdecl; // ()V
    procedure onSaveInstanceState(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    procedure onPause; cdecl; // ()V
    procedure onStop; cdecl; // ()V
    procedure onDestroyView; cdecl; // ()V
    procedure onDestroy; cdecl; // ()V
    procedure onDetach; cdecl; // ()V
    procedure onConfigurationChanged(P1: JConfiguration); cdecl;
    // (Landroid/content/res/Configuration;)V

    { Property }
  end;

  TJMapFragment = class(TJavaGenericImport<JMapFragmentClass, JMapFragment>)
  end;

  JMapPoiClass = interface(JObjectClass)
    ['{B9BD26F4-8479-4EE9-8161-7549136962CF}']
    { static Property Methods }

    { static Methods }
    { class } function init: JMapPoi; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/MapPoi')]
  JMapPoi = interface(JObject)
    ['{3CD04844-3F73-4C1B-8084-A7BB9134CA8F}']
    { Property Methods }

    { methods }
    function getUid: JString; cdecl; // ()Ljava/lang/String;
    function getName: JString; cdecl; // ()Ljava/lang/String;
    function getPosition: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;

    { Property }
  end;

  TJMapPoi = class(TJavaGenericImport<JMapPoiClass, JMapPoi>)
  end;

  JMapStatus_BuilderClass = interface(JObjectClass)
    ['{39B47674-5E59-40EB-BFA8-587ABDEA5BD3}']
    { static Property Methods }

    { static Methods }
    { class } function init: JMapStatus_Builder; cdecl; overload; // ()V
    { class } function init(P1: JMapStatus): JMapStatus_Builder; cdecl;
      overload; // (Lcom/baidu/mapapi/map/MapStatus;)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/MapStatus$Builder')]
  JMapStatus_Builder = interface(JObject)
    ['{E4DE4E80-CBAD-46A4-AD8F-E3488886A956}']
    { Property Methods }

    { methods }
    function rotate(P1: Single): JMapStatus_Builder; cdecl;
    // (F)Lcom/baidu/mapapi/map/MapStatus$Builder;
    function target(P1: JLatLng): JMapStatus_Builder; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/map/MapStatus$Builder;
    function overlook(P1: Single): JMapStatus_Builder; cdecl;
    // (F)Lcom/baidu/mapapi/map/MapStatus$Builder;
    function zoom(P1: Single): JMapStatus_Builder; cdecl;
    // (F)Lcom/baidu/mapapi/map/MapStatus$Builder;
    function targetScreen(P1: JPoint): JMapStatus_Builder; cdecl;
    // (Landroid/graphics/Point;)Lcom/baidu/mapapi/map/MapStatus$Builder;
    function build: JMapStatus; cdecl; // ()Lcom/baidu/mapapi/map/MapStatus;

    { Property }
  end;

  TJMapStatus_Builder = class(TJavaGenericImport<JMapStatus_BuilderClass,
    JMapStatus_Builder>)
  end;

  JMapStatusClass = interface(JObjectClass)
    ['{FCCF62B8-84D5-416A-B298-7942F3A5318C}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/map/MapStatus')]
  JMapStatus = interface(JObject)
    ['{B4C2F8AC-7E18-40E9-B87F-F12315CF241F}']
    { Property Methods }
    function _Getrotate: Single; // F
    procedure _Setrotate(arotate: Single); // (F)V
    function _Gettarget: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _Settarget(atarget: JLatLng);
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function _Getoverlook: Single; // F
    procedure _Setoverlook(aoverlook: Single); // (F)V
    function _Getzoom: Single; // F
    procedure _Setzoom(azoom: Single); // (F)V
    function _GettargetScreen: JPoint; // Landroid/graphics/Point;
    procedure _SettargetScreen(atargetScreen: JPoint);
    // (Landroid/graphics/Point;)V
    function _Getbound: JLatLngBounds; // Lcom/baidu/mapapi/model/LatLngBounds;
    procedure _Setbound(abound: JLatLngBounds);
    // (Lcom/baidu/mapapi/model/LatLngBounds;)V
    function _GetwinRound: JWinRound; // Lcom/baidu/mapapi/map/WinRound;
    procedure _SetwinRound(awinRound: JWinRound);
    // (Lcom/baidu/mapapi/map/WinRound;)V

    { methods }
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V
    function toString: JString; cdecl; // ()Ljava/lang/String;

    { Property }
    property rotate: Single read _Getrotate write _Setrotate;
    property target: JLatLng read _Gettarget write _Settarget;
    property overlook: Single read _Getoverlook write _Setoverlook;
    property zoom: Single read _Getzoom write _Setzoom;
    property targetScreen: JPoint read _GettargetScreen write _SettargetScreen;
    property bound: JLatLngBounds read _Getbound write _Setbound;
    property winRound: JWinRound read _GetwinRound write _SetwinRound;
  end;

  TJMapStatus = class(TJavaGenericImport<JMapStatusClass, JMapStatus>)
  end;

  JMapStatusUpdateClass = interface(JObjectClass)
    ['{DEACB854-5E8F-40E4-AF05-74A4567D9515}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/MapStatusUpdate')]
  JMapStatusUpdate = interface(JObject)
    ['{6225FAD1-3E37-45CC-9102-025B81BFBEB4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMapStatusUpdate = class(TJavaGenericImport<JMapStatusUpdateClass,
    JMapStatusUpdate>)
  end;

  JMapStatusUpdateFactoryClass = interface(JObjectClass)
    ['{9E9A8043-0EA6-4BD6-98C5-50E355668A37}']
    { static Property Methods }

    { static Methods }
    { class } function newMapStatus(P1: JMapStatus): JMapStatusUpdate; cdecl;
    // (Lcom/baidu/mapapi/map/MapStatus;)Lcom/baidu/mapapi/map/MapStatusUpdate;
    { class } function newLatLng(P1: JLatLng): JMapStatusUpdate; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/map/MapStatusUpdate;
    { class } function newLatLngBounds(P1: JLatLngBounds): JMapStatusUpdate;
      cdecl; overload;
    // (Lcom/baidu/mapapi/model/LatLngBounds;)Lcom/baidu/mapapi/map/MapStatusUpdate;
    { class } function newLatLngBounds(P1: JLatLngBounds; P2: Integer;
      P3: Integer): JMapStatusUpdate; cdecl; overload;
    // (Lcom/baidu/mapapi/model/LatLngBounds;II)Lcom/baidu/mapapi/map/MapStatusUpdate;
    { class } function newLatLngZoom(P1: JLatLng; P2: Single): JMapStatusUpdate;
      cdecl; // (Lcom/baidu/mapapi/model/LatLng;F)Lcom/baidu/mapapi/map/MapStatusUpdate;
    { class } function scrollBy(P1: Integer; P2: Integer): JMapStatusUpdate;
      cdecl; // (II)Lcom/baidu/mapapi/map/MapStatusUpdate;
    { class } function zoomBy(P1: Single): JMapStatusUpdate; cdecl; overload;
    // (F)Lcom/baidu/mapapi/map/MapStatusUpdate;
    { class } function zoomBy(P1: Single; P2: JPoint): JMapStatusUpdate; cdecl;
      overload; // (FLandroid/graphics/Point;)Lcom/baidu/mapapi/map/MapStatusUpdate;
    { class } function zoomIn: JMapStatusUpdate; cdecl;
    // ()Lcom/baidu/mapapi/map/MapStatusUpdate;
    { class } function zoomOut: JMapStatusUpdate; cdecl;
    // ()Lcom/baidu/mapapi/map/MapStatusUpdate;
    { class } function zoomTo(P1: Single): JMapStatusUpdate; cdecl;
    // (F)Lcom/baidu/mapapi/map/MapStatusUpdate;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/MapStatusUpdateFactory')]
  JMapStatusUpdateFactory = interface(JObject)
    ['{CB08DA78-1824-416D-8FA8-56A1392144CA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMapStatusUpdateFactory = class
    (TJavaGenericImport<JMapStatusUpdateFactoryClass, JMapStatusUpdateFactory>)
  end;

  JMapViewClass = interface(JViewGroupClass)
  // or JObjectClass // SuperSignature: android/view/ViewGroup
    ['{AE511252-8A6B-4354-BF1D-5294FF7C6182}']
    { static Property Methods }

    { static Methods }
    { class } function init(P1: JContext): JMapView; cdecl; overload;
    // (Landroid/content/Context;)V
    { class } function init(P1: JContext; P2: JAttributeSet): JMapView; cdecl;
      overload; // (Landroid/content/Context;Landroid/util/AttributeSet;)V
    { class } function init(P1: JContext; P2: JAttributeSet; P3: Integer)
      : JMapView; cdecl; overload;
    // (Landroid/content/Context;Landroid/util/AttributeSet;I)V
    { class } function init(P1: JContext; P2: JBaiduMapOptions): JMapView;
      cdecl; overload;
    // (Landroid/content/Context;Lcom/baidu/mapapi/map/BaiduMapOptions;)V
    { class } procedure setCustomMapStylePath(P1: JString); cdecl;
    // (Ljava/lang/String;)V
    { class } procedure setMapCustomEnable(P1: Boolean); cdecl; // (Z)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/MapView')]
  JMapView = interface(JViewGroup)
  // or JObject // SuperSignature: android/view/ViewGroup
    ['{0DEB3711-218E-4B6A-B7EE-91F10EFC656A}']
    { Property Methods }

    { methods }
    function getMap: JBaiduMap; cdecl; // ()Lcom/baidu/mapapi/map/BaiduMap;
    procedure onDestroy; cdecl; // ()V
    procedure setLogoPosition(P1: JLogoPosition); cdecl;
    // (Lcom/baidu/mapapi/map/LogoPosition;)V
    function getLogoPosition: JLogoPosition; cdecl;
    // ()Lcom/baidu/mapapi/map/LogoPosition;
    function getMapLevel: Integer; cdecl; // ()I
    procedure onPause; cdecl; // ()V
    procedure onResume; cdecl; // ()V
    procedure addView(P1: JView; P2: JViewGroup_LayoutParams); cdecl;
    // (Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    procedure removeView(P1: JView); cdecl; // (Landroid/view/View;)V
    procedure setPadding(P1: Integer; P2: Integer; P3: Integer; P4: Integer);
      cdecl; // (IIII)V
    procedure showZoomControls(P1: Boolean); cdecl; // (Z)V
    procedure setZoomControlsPosition(P1: JPoint); cdecl;
    // (Landroid/graphics/Point;)V
    procedure showScaleControl(P1: Boolean); cdecl; // (Z)V
    function getScaleControlViewWidth: Integer; cdecl; // ()I
    function getScaleControlViewHeight: Integer; cdecl; // ()I
    procedure setScaleControlPosition(P1: JPoint); cdecl;
    // (Landroid/graphics/Point;)V
    procedure onSaveInstanceState(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    procedure onCreate(P1: JContext; P2: JBundle); cdecl;
    // (Landroid/content/Context;Landroid/os/Bundle;)V
    procedure setZOrderMediaOverlay(P1: Boolean); cdecl; // (Z)V
    procedure setUpViewEventToMapView(P1: JMotionEvent); cdecl;
    // (Landroid/view/MotionEvent;)V
    procedure handleTouchDown(P1: Single; P2: Single); cdecl; // (FF)V
    function handleTouchUp(P1: Single; P2: Single): Boolean; cdecl; // (FF)Z
    function inRangeOfView(P1: Single; P2: Single): Boolean; cdecl; // (FF)Z
    function handleMultiTouch(P1: Single; P2: Single; P3: Single; P4: Single)
      : Boolean; cdecl; // (FFFF)Z
    function handleTouchMove(P1: Single; P2: Single): Boolean; cdecl; // (FF)Z

    { Property }
  end;

  TJMapView = class(TJavaGenericImport<JMapViewClass, JMapView>)
  end;

  JMapViewLayoutParams_BuilderClass = interface(JObjectClass)
    ['{D904642C-4BFB-4DAF-9A1B-8F019EA38A5A}']
    { static Property Methods }

    { static Methods }
    { class } function init: JMapViewLayoutParams_Builder; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/MapViewLayoutParams$Builder')]
  JMapViewLayoutParams_Builder = interface(JObject)
    ['{A7A3D7D8-8CE4-4645-BFAE-80B250163633}']
    { Property Methods }

    { methods }
    function build: JMapViewLayoutParams; cdecl;
    // ()Lcom/baidu/mapapi/map/MapViewLayoutParams;
    function width(P1: Integer): JMapViewLayoutParams_Builder; cdecl;
    // (I)Lcom/baidu/mapapi/map/MapViewLayoutParams$Builder;
    function height(P1: Integer): JMapViewLayoutParams_Builder; cdecl;
    // (I)Lcom/baidu/mapapi/map/MapViewLayoutParams$Builder;
    function align(P1: Integer; P2: Integer): JMapViewLayoutParams_Builder;
      cdecl; // (II)Lcom/baidu/mapapi/map/MapViewLayoutParams$Builder;
    function position(P1: JLatLng): JMapViewLayoutParams_Builder; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/map/MapViewLayoutParams$Builder;
    function point(P1: JPoint): JMapViewLayoutParams_Builder; cdecl;
    // (Landroid/graphics/Point;)Lcom/baidu/mapapi/map/MapViewLayoutParams$Builder;
    function layoutMode(P1: JMapViewLayoutParams_ELayoutMode)
      : JMapViewLayoutParams_Builder; cdecl;
    // (Lcom/baidu/mapapi/map/MapViewLayoutParams$ELayoutMode;)Lcom/baidu/mapapi/map/MapViewLayoutParams$Builder;
    function yOffset(P1: Integer): JMapViewLayoutParams_Builder; cdecl;
    // (I)Lcom/baidu/mapapi/map/MapViewLayoutParams$Builder;

    { Property }
  end;

  TJMapViewLayoutParams_Builder = class
    (TJavaGenericImport<JMapViewLayoutParams_BuilderClass,
    JMapViewLayoutParams_Builder>)
  end;

  JMapViewLayoutParams_ELayoutModeClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{23D8508F-94A9-4D04-9B97-2FEB64365C7A}']
    { static Property Methods }
    { class } function _GetmapMode: JMapViewLayoutParams_ELayoutMode;
    // Lcom/baidu/mapapi/map/MapViewLayoutParams$ELayoutMode;
    { class } function _GetabsoluteMode: JMapViewLayoutParams_ELayoutMode;
    // Lcom/baidu/mapapi/map/MapViewLayoutParams$ELayoutMode;

    { static Methods }
    { class } function values
      : TJavaObjectArray<JMapViewLayoutParams_ELayoutMode>; cdecl;
    // ()[Lcom/baidu/mapapi/map/MapViewLayoutParams$ELayoutMode;
    { class } function valueOf(P1: JString): JMapViewLayoutParams_ELayoutMode;
      cdecl; // (Ljava/lang/String;)Lcom/baidu/mapapi/map/MapViewLayoutParams$ELayoutMode;

    { static Property }
    { class } property mapMode: JMapViewLayoutParams_ELayoutMode
      read _GetmapMode;
    { class } property absoluteMode: JMapViewLayoutParams_ELayoutMode
      read _GetabsoluteMode;
  end;

  [JavaSignature('com/baidu/mapapi/map/MapViewLayoutParams$ELayoutMode')]
  JMapViewLayoutParams_ELayoutMode = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{D1614B0D-B7FB-4608-A9A9-3B65246E4F1D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMapViewLayoutParams_ELayoutMode = class
    (TJavaGenericImport<JMapViewLayoutParams_ELayoutModeClass,
    JMapViewLayoutParams_ELayoutMode>)
  end;

  JMapViewLayoutParamsClass = interface(JViewGroup_LayoutParamsClass)
  // or JObjectClass // SuperSignature: android/view/ViewGroup$LayoutParams
    ['{4C8DC97E-0E39-4F72-9034-507DA3F23572}']
    { static Property Methods }
    { class } function _GetALIGN_LEFT: Integer; // I
    { class } function _GetALIGN_RIGHT: Integer; // I
    { class } function _GetALIGN_CENTER_HORIZONTAL: Integer; // I
    { class } function _GetALIGN_TOP: Integer; // I
    { class } function _GetALIGN_BOTTOM: Integer; // I
    { class } function _GetALIGN_CENTER_VERTICAL: Integer; // I

    { static Methods }

    { static Property }
    { class } property ALIGN_LEFT: Integer read _GetALIGN_LEFT;
    { class } property ALIGN_RIGHT: Integer read _GetALIGN_RIGHT;
    { class } property ALIGN_CENTER_HORIZONTAL: Integer
      read _GetALIGN_CENTER_HORIZONTAL;
    { class } property ALIGN_TOP: Integer read _GetALIGN_TOP;
    { class } property ALIGN_BOTTOM: Integer read _GetALIGN_BOTTOM;
    { class } property ALIGN_CENTER_VERTICAL: Integer
      read _GetALIGN_CENTER_VERTICAL;
  end;

  [JavaSignature('com/baidu/mapapi/map/MapViewLayoutParams')]
  JMapViewLayoutParams = interface(JViewGroup_LayoutParams)
  // or JObject // SuperSignature: android/view/ViewGroup$LayoutParams
    ['{3BC086EB-F1D3-4680-8FD8-D94B07DFBEDD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMapViewLayoutParams = class(TJavaGenericImport<JMapViewLayoutParamsClass,
    JMapViewLayoutParams>)
  end;

  JMarkerClass = interface(JOverlayClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/map/Overlay
    ['{DCC5373B-3899-4730-A174-57DDB555CA20}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/Marker')]
  JMarker = interface(JOverlay)
  // or JObject // SuperSignature: com/baidu/mapapi/map/Overlay
    ['{4293F0CE-0DB6-4882-90D2-551B3E09CFD6}']
    { Property Methods }

    { methods }
    procedure setIcon(P1: JBitmapDescriptor); cdecl;
    // (Lcom/baidu/mapapi/map/BitmapDescriptor;)V
    function getIcon: JBitmapDescriptor; cdecl;
    // ()Lcom/baidu/mapapi/map/BitmapDescriptor;
    procedure setIcons(P1: JArrayList); cdecl; // (Ljava/util/ArrayList;)V
    function getIcons: JArrayList; cdecl; // ()Ljava/util/ArrayList;
    procedure setPeriod(P1: Integer); cdecl; // (I)V
    procedure setAlpha(P1: Single); cdecl; // (F)V
    function getAlpha: Single; cdecl; // ()F
    function getPeriod: Integer; cdecl; // ()I
    procedure setToTop; cdecl; // ()V
    procedure setPosition(P1: JLatLng); cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function getPosition: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    procedure setPerspective(P1: Boolean); cdecl; // (Z)V
    function isPerspective: Boolean; cdecl; // ()Z
    procedure setDraggable(P1: Boolean); cdecl; // (Z)V
    function isDraggable: Boolean; cdecl; // ()Z
    function isFlat: Boolean; cdecl; // ()Z
    procedure setFlat(P1: Boolean); cdecl; // (Z)V
    procedure setAnchor(P1: Single; P2: Single); cdecl; // (FF)V
    function getAnchorX: Single; cdecl; // ()F
    function getAnchorY: Single; cdecl; // ()F
    procedure setRotate(P1: Single); cdecl; // (F)V
    function getRotate: Single; cdecl; // ()F
    procedure setTitle(P1: JString); cdecl; // (Ljava/lang/String;)V
    function getTitle: JString; cdecl; // ()Ljava/lang/String;

    { Property }
  end;

  TJMarker = class(TJavaGenericImport<JMarkerClass, JMarker>)
  end;

  JMarkerOptions_MarkerAnimateTypeClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{CB9405FB-2028-497E-820D-6A3555A8AB8A}']
    { static Property Methods }
    { class } function _Getnone: JMarkerOptions_MarkerAnimateType;
    // Lcom/baidu/mapapi/map/MarkerOptions$MarkerAnimateType;
    { class } function _Getdrop: JMarkerOptions_MarkerAnimateType;
    // Lcom/baidu/mapapi/map/MarkerOptions$MarkerAnimateType;
    { class } function _Getgrow: JMarkerOptions_MarkerAnimateType;
    // Lcom/baidu/mapapi/map/MarkerOptions$MarkerAnimateType;

    { static Methods }
    { class } function values
      : TJavaObjectArray<JMarkerOptions_MarkerAnimateType>; cdecl;
    // ()[Lcom/baidu/mapapi/map/MarkerOptions$MarkerAnimateType;
    { class } function valueOf(P1: JString): JMarkerOptions_MarkerAnimateType;
      cdecl; // (Ljava/lang/String;)Lcom/baidu/mapapi/map/MarkerOptions$MarkerAnimateType;

    { static Property }
    { class } property none: JMarkerOptions_MarkerAnimateType read _Getnone;
    { class } property drop: JMarkerOptions_MarkerAnimateType read _Getdrop;
    { class } property grow: JMarkerOptions_MarkerAnimateType read _Getgrow;
  end;

  [JavaSignature('com/baidu/mapapi/map/MarkerOptions$MarkerAnimateType')]
  JMarkerOptions_MarkerAnimateType = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{25A861FA-07DD-4D15-AE4A-58AC3B8A002C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMarkerOptions_MarkerAnimateType = class
    (TJavaGenericImport<JMarkerOptions_MarkerAnimateTypeClass,
    JMarkerOptions_MarkerAnimateType>)
  end;

  JMarkerOptionsClass = interface(JOverlayOptionsClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/map/OverlayOptions
    ['{A39BBBC3-ABC1-426C-9B82-8CCBAE75E711}']
    { static Property Methods }

    { static Methods }
    { class } function init: JMarkerOptions; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/MarkerOptions')]
  JMarkerOptions = interface(JOverlayOptions)
  // or JObject // SuperSignature: com/baidu/mapapi/map/OverlayOptions
    ['{E668BDF1-6A45-47A2-884E-12CB6C19CA80}']
    { Property Methods }

    { methods }
    function icon(P1: JBitmapDescriptor): JMarkerOptions; cdecl;
    // (Lcom/baidu/mapapi/map/BitmapDescriptor;)Lcom/baidu/mapapi/map/MarkerOptions;
    function animateType(P1: JMarkerOptions_MarkerAnimateType): JMarkerOptions;
      cdecl; // (Lcom/baidu/mapapi/map/MarkerOptions$MarkerAnimateType;)Lcom/baidu/mapapi/map/MarkerOptions;
    function getAnimateType: JMarkerOptions_MarkerAnimateType; cdecl;
    // ()Lcom/baidu/mapapi/map/MarkerOptions$MarkerAnimateType;
    function alpha(P1: Single): JMarkerOptions; cdecl;
    // (F)Lcom/baidu/mapapi/map/MarkerOptions;
    function getAlpha: Single; cdecl; // ()F
    function getIcon: JBitmapDescriptor; cdecl;
    // ()Lcom/baidu/mapapi/map/BitmapDescriptor;
    function icons(P1: JArrayList): JMarkerOptions; cdecl;
    // (Ljava/util/ArrayList;)Lcom/baidu/mapapi/map/MarkerOptions;
    function getIcons: JArrayList; cdecl; // ()Ljava/util/ArrayList;
    function period(P1: Integer): JMarkerOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/MarkerOptions;
    function getPeriod: Integer; cdecl; // ()I
    function position(P1: JLatLng): JMarkerOptions; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/map/MarkerOptions;
    function getPosition: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function perspective(P1: Boolean): JMarkerOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/MarkerOptions;
    function isPerspective: Boolean; cdecl; // ()Z
    function draggable(P1: Boolean): JMarkerOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/MarkerOptions;
    function isFlat: Boolean; cdecl; // ()Z
    function flat(P1: Boolean): JMarkerOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/MarkerOptions;
    function isDraggable: Boolean; cdecl; // ()Z
    function anchor(P1: Single; P2: Single): JMarkerOptions; cdecl;
    // (FF)Lcom/baidu/mapapi/map/MarkerOptions;
    function getAnchorX: Single; cdecl; // ()F
    function getAnchorY: Single; cdecl; // ()F
    function rotate(P1: Single): JMarkerOptions; cdecl;
    // (F)Lcom/baidu/mapapi/map/MarkerOptions;
    function getRotate: Single; cdecl; // ()F
    function title(P1: JString): JMarkerOptions; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/map/MarkerOptions;
    function getTitle: JString; cdecl; // ()Ljava/lang/String;
    function visible(P1: Boolean): JMarkerOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/MarkerOptions;
    function isVisible: Boolean; cdecl; // ()Z
    function zIndex(P1: Integer): JMarkerOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/MarkerOptions;
    function getZIndex: Integer; cdecl; // ()I
    function extraInfo(P1: JBundle): JMarkerOptions; cdecl;
    // (Landroid/os/Bundle;)Lcom/baidu/mapapi/map/MarkerOptions;
    function getExtraInfo: JBundle; cdecl; // ()Landroid/os/Bundle;

    { Property }
  end;

  TJMarkerOptions = class(TJavaGenericImport<JMarkerOptionsClass,
    JMarkerOptions>)
  end;

  JMyLocationConfiguration_LocationModeClass = interface(JEnumClass)
  // or JObjectClass // SuperSignature: java/lang/Enum
    ['{F13BFBC1-CE00-4E09-B483-E6D979AAFA1A}']
    { static Property Methods }
    { class } function _GetNORMAL: JMyLocationConfiguration_LocationMode;
    // Lcom/baidu/mapapi/map/MyLocationConfiguration$LocationMode;
    { class } function _GetFOLLOWING: JMyLocationConfiguration_LocationMode;
    // Lcom/baidu/mapapi/map/MyLocationConfiguration$LocationMode;
    { class } function _GetCOMPASS: JMyLocationConfiguration_LocationMode;
    // Lcom/baidu/mapapi/map/MyLocationConfiguration$LocationMode;

    { static Methods }
    { class } function values
      : TJavaObjectArray<JMyLocationConfiguration_LocationMode>; cdecl;
    // ()[Lcom/baidu/mapapi/map/MyLocationConfiguration$LocationMode;
    { class } function valueOf(P1: JString)
      : JMyLocationConfiguration_LocationMode; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/map/MyLocationConfiguration$LocationMode;

    { static Property }
    { class } property NORMAL: JMyLocationConfiguration_LocationMode
      read _GetNORMAL;
    { class } property FOLLOWING: JMyLocationConfiguration_LocationMode
      read _GetFOLLOWING;
    { class } property COMPASS: JMyLocationConfiguration_LocationMode
      read _GetCOMPASS;
  end;

  [JavaSignature('com/baidu/mapapi/map/MyLocationConfiguration$LocationMode')]
  JMyLocationConfiguration_LocationMode = interface(JEnum)
  // or JObject // SuperSignature: java/lang/Enum
    ['{871D3E81-C8B8-46D5-9E11-271B981CB103}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMyLocationConfiguration_LocationMode = class
    (TJavaGenericImport<JMyLocationConfiguration_LocationModeClass,
    JMyLocationConfiguration_LocationMode>)
  end;

  JMyLocationConfigurationClass = interface(JObjectClass)
    ['{60C8BD10-573E-41FC-9EA1-B196493EF76C}']
    { static Property Methods }

    { static Methods }
    { class } function init(P1: JMyLocationConfiguration_LocationMode;
      P2: Boolean; P3: JBitmapDescriptor; P4: Integer; P5: Integer)
      : JMyLocationConfiguration; cdecl; overload;
    // (Lcom/baidu/mapapi/map/MyLocationConfiguration$LocationMode;ZLcom/baidu/mapapi/map/BitmapDescriptor;II)V
    { class } function init(P1: JMyLocationConfiguration_LocationMode;
      P2: Boolean; P3: JBitmapDescriptor): JMyLocationConfiguration; cdecl;
      overload; // (Lcom/baidu/mapapi/map/MyLocationConfiguration$LocationMode;ZLcom/baidu/mapapi/map/BitmapDescriptor;)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/MyLocationConfiguration')]
  JMyLocationConfiguration = interface(JObject)
    ['{10F8D5EE-AA4C-4A88-B5F5-33F8CB563726}']
    { Property Methods }
    function _GetlocationMode: JMyLocationConfiguration_LocationMode;
    // Lcom/baidu/mapapi/map/MyLocationConfiguration$LocationMode;
    procedure _SetlocationMode(alocationMode
      : JMyLocationConfiguration_LocationMode);
    // (Lcom/baidu/mapapi/map/MyLocationConfiguration$LocationMode;)V
    function _GetenableDirection: Boolean; // Z
    procedure _SetenableDirection(aenableDirection: Boolean); // (Z)V
    function _GetcustomMarker: JBitmapDescriptor;
    // Lcom/baidu/mapapi/map/BitmapDescriptor;
    procedure _SetcustomMarker(acustomMarker: JBitmapDescriptor);
    // (Lcom/baidu/mapapi/map/BitmapDescriptor;)V
    function _GetaccuracyCircleFillColor: Integer; // I
    procedure _SetaccuracyCircleFillColor(aaccuracyCircleFillColor: Integer);
    // (I)V
    function _GetaccuracyCircleStrokeColor: Integer; // I
    procedure _SetaccuracyCircleStrokeColor(aaccuracyCircleStrokeColor
      : Integer); // (I)V

    { methods }

    { Property }
    property locationMode: JMyLocationConfiguration_LocationMode
      read _GetlocationMode write _SetlocationMode;
    property enableDirection: Boolean read _GetenableDirection
      write _SetenableDirection;
    property customMarker: JBitmapDescriptor read _GetcustomMarker
      write _SetcustomMarker;
    property accuracyCircleFillColor: Integer read _GetaccuracyCircleFillColor
      write _SetaccuracyCircleFillColor;
    property accuracyCircleStrokeColor: Integer
      read _GetaccuracyCircleStrokeColor write _SetaccuracyCircleStrokeColor;
  end;

  TJMyLocationConfiguration = class
    (TJavaGenericImport<JMyLocationConfigurationClass,
    JMyLocationConfiguration>)
  end;

  JMyLocationData_BuilderClass = interface(JObjectClass)
    ['{50D001CB-71BC-4C83-BEE3-184AACD79D86}']
    { static Property Methods }

    { static Methods }
    { class } function init: JMyLocationData_Builder; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/MyLocationData$Builder')]
  JMyLocationData_Builder = interface(JObject)
    ['{5AFF9954-BBD5-49B1-8CA6-4069FFE8B2BC}']
    { Property Methods }

    { methods }
    function latitude(P1: Double): JMyLocationData_Builder; cdecl;
    // (D)Lcom/baidu/mapapi/map/MyLocationData$Builder;
    function longitude(P1: Double): JMyLocationData_Builder; cdecl;
    // (D)Lcom/baidu/mapapi/map/MyLocationData$Builder;
    function speed(P1: Single): JMyLocationData_Builder; cdecl;
    // (F)Lcom/baidu/mapapi/map/MyLocationData$Builder;
    function direction(P1: Single): JMyLocationData_Builder; cdecl;
    // (F)Lcom/baidu/mapapi/map/MyLocationData$Builder;
    function accuracy(P1: Single): JMyLocationData_Builder; cdecl;
    // (F)Lcom/baidu/mapapi/map/MyLocationData$Builder;
    function satellitesNum(P1: Integer): JMyLocationData_Builder; cdecl;
    // (I)Lcom/baidu/mapapi/map/MyLocationData$Builder;
    function build: JMyLocationData; cdecl;
    // ()Lcom/baidu/mapapi/map/MyLocationData;

    { Property }
  end;

  TJMyLocationData_Builder = class
    (TJavaGenericImport<JMyLocationData_BuilderClass, JMyLocationData_Builder>)
  end;

  JMyLocationDataClass = interface(JObjectClass)
    ['{6F949B6E-CEAA-42A8-A4E9-FFE91871285A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/MyLocationData')]
  JMyLocationData = interface(JObject)
    ['{798FDA84-A6C4-4F5A-B576-D00B2A720D54}']
    { Property Methods }
    function _Getlatitude: Double; // D
    procedure _Setlatitude(alatitude: Double); // (D)V
    function _Getlongitude: Double; // D
    procedure _Setlongitude(alongitude: Double); // (D)V
    function _Getspeed: Single; // F
    procedure _Setspeed(aspeed: Single); // (F)V
    function _Getdirection: Single; // F
    procedure _Setdirection(adirection: Single); // (F)V
    function _Getaccuracy: Single; // F
    procedure _Setaccuracy(aaccuracy: Single); // (F)V
    function _GetsatellitesNum: Integer; // I
    procedure _SetsatellitesNum(asatellitesNum: Integer); // (I)V

    { methods }

    { Property }
    property latitude: Double read _Getlatitude write _Setlatitude;
    property longitude: Double read _Getlongitude write _Setlongitude;
    property speed: Single read _Getspeed write _Setspeed;
    property direction: Single read _Getdirection write _Setdirection;
    property accuracy: Single read _Getaccuracy write _Setaccuracy;
    property satellitesNum: Integer read _GetsatellitesNum
      write _SetsatellitesNum;
  end;

  TJMyLocationData = class(TJavaGenericImport<JMyLocationDataClass,
    JMyLocationData>)
  end;

  JMKOfflineMapClass = interface(JObjectClass)
    ['{F00AAE25-70DB-4B21-9167-EFFD0E6BF277}']
    { static Property Methods }
    { class } function _GetTYPE_NEW_OFFLINE: Integer; // I
    { class } function _GetTYPE_DOWNLOAD_UPDATE: Integer; // I
    { class } function _GetTYPE_NETWORK_ERROR: Integer; // I
    { class } function _GetTYPE_VER_UPDATE: Integer; // I

    { static Methods }
    { class } function init: JMKOfflineMap; cdecl; // ()V

    { static Property }
    { class } property TYPE_NEW_OFFLINE: Integer read _GetTYPE_NEW_OFFLINE;
    { class } property TYPE_DOWNLOAD_UPDATE: Integer
      read _GetTYPE_DOWNLOAD_UPDATE;
    { class } property TYPE_NETWORK_ERROR: Integer read _GetTYPE_NETWORK_ERROR;
    { class } property TYPE_VER_UPDATE: Integer read _GetTYPE_VER_UPDATE;
  end;

  [JavaSignature('com/baidu/mapapi/map/offline/MKOfflineMap')]
  JMKOfflineMap = interface(JObject)
    ['{6F9304E8-3EA4-4306-9CD3-DDE099D20600}']
    { Property Methods }

    { methods }
    function init(P1: JMKOfflineMapListener): Boolean; cdecl;
    // (Lcom/baidu/mapapi/map/offline/MKOfflineMapListener;)Z
    function start(P1: Integer): Boolean; cdecl; // (I)Z
    function update(P1: Integer): Boolean; cdecl; // (I)Z
    function pause(P1: Integer): Boolean; cdecl; // (I)Z
    procedure destroy; cdecl; // ()V
    function remove(P1: Integer): Boolean; cdecl; // (I)Z
    function getHotCityList: JArrayList; cdecl; // ()Ljava/util/ArrayList;
    function getOfflineCityList: JArrayList; cdecl; // ()Ljava/util/ArrayList;
    function searchCity(P1: JString): JArrayList; cdecl;
    // (Ljava/lang/String;)Ljava/util/ArrayList;
    function getAllUpdateInfo: JArrayList; cdecl; // ()Ljava/util/ArrayList;
    function getUpdateInfo(P1: Integer): JMKOLUpdateElement; cdecl;
    // (I)Lcom/baidu/mapapi/map/offline/MKOLUpdateElement;
    function importOfflineData: Integer; cdecl; overload; // Deprecated //()I
    function importOfflineData(P1: Boolean): Integer; cdecl; overload;
    // Deprecated //(Z)I

    { Property }
  end;

  TJMKOfflineMap = class(TJavaGenericImport<JMKOfflineMapClass, JMKOfflineMap>)
  end;

  JMKOfflineMapListenerClass = interface(JObjectClass)
    ['{3FBA4889-6682-453E-8C7C-29A7F7A9BAE2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/offline/MKOfflineMapListener')]
  JMKOfflineMapListener = interface(IJavaInstance)
    ['{4B0578D9-AF6A-45E7-BB71-02F49BB5BF29}']
    { Property Methods }

    { methods }
    procedure onGetOfflineMapState(P1: Integer; P2: Integer); cdecl; // (II)V

    { Property }
  end;

  TJMKOfflineMapListener = class(TJavaGenericImport<JMKOfflineMapListenerClass,
    JMKOfflineMapListener>)
  end;

  JMKOLSearchRecordClass = interface(JObjectClass)
    ['{99A25868-3443-48B6-9698-23ADF5BE448D}']
    { static Property Methods }

    { static Methods }
    { class } function init: JMKOLSearchRecord; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/offline/MKOLSearchRecord')]
  JMKOLSearchRecord = interface(JObject)
    ['{43DD3697-7C44-4D17-A2B4-F285A55AAB94}']
    { Property Methods }
    function _GetcityID: Integer; // I
    procedure _SetcityID(acityID: Integer); // (I)V
    function _Getsize: Integer; // I
    procedure _Setsize(asize: Integer); // (I)V
    function _GetcityName: JString; // Ljava/lang/String;
    procedure _SetcityName(acityName: JString); // (Ljava/lang/String;)V
    function _GetcityType: Integer; // I
    procedure _SetcityType(acityType: Integer); // (I)V
    function _GetchildCities: JArrayList; // Ljava/util/ArrayList;
    procedure _SetchildCities(achildCities: JArrayList);
    // (Ljava/util/ArrayList;)V

    { methods }

    { Property }
    property cityID: Integer read _GetcityID write _SetcityID;
    property size: Integer read _Getsize write _Setsize;
    property cityName: JString read _GetcityName write _SetcityName;
    property cityType: Integer read _GetcityType write _SetcityType;
    property childCities: JArrayList read _GetchildCities write _SetchildCities;
  end;

  TJMKOLSearchRecord = class(TJavaGenericImport<JMKOLSearchRecordClass,
    JMKOLSearchRecord>)
  end;

  JMKOLUpdateElementClass = interface(JObjectClass)
    ['{F7B48230-0CD2-41AA-8FDC-AD376232BEE7}']
    { static Property Methods }
    { class } function _GetUNDEFINED: Integer; // I
    { class } function _GetDOWNLOADING: Integer; // I
    { class } function _GetWAITING: Integer; // I
    { class } function _GetSUSPENDED: Integer; // I
    { class } function _GetFINISHED: Integer; // I
    { class } function _GeteOLDSMd5Error: Integer; // I
    { class } function _GeteOLDSNetError: Integer; // I
    { class } function _GeteOLDSIOError: Integer; // I
    { class } function _GeteOLDSWifiError: Integer; // I
    { class } function _GeteOLDSFormatError: Integer; // I
    { class } function _GeteOLDSInstalling: Integer; // I

    { static Methods }
    { class } function init: JMKOLUpdateElement; cdecl; // ()V

    { static Property }
    { class } property UNDEFINED: Integer read _GetUNDEFINED;
    { class } property DOWNLOADING: Integer read _GetDOWNLOADING;
    { class } property WAITING: Integer read _GetWAITING;
    { class } property SUSPENDED: Integer read _GetSUSPENDED;
    { class } property FINISHED: Integer read _GetFINISHED;
    { class } property eOLDSMd5Error: Integer read _GeteOLDSMd5Error;
    { class } property eOLDSNetError: Integer read _GeteOLDSNetError;
    { class } property eOLDSIOError: Integer read _GeteOLDSIOError;
    { class } property eOLDSWifiError: Integer read _GeteOLDSWifiError;
    { class } property eOLDSFormatError: Integer read _GeteOLDSFormatError;
    { class } property eOLDSInstalling: Integer read _GeteOLDSInstalling;
  end;

  [JavaSignature('com/baidu/mapapi/map/offline/MKOLUpdateElement')]
  JMKOLUpdateElement = interface(JObject)
    ['{B08D2D34-226D-4B39-9DCB-2C7E7FA91445}']
    { Property Methods }
    function _GetcityID: Integer; // I
    procedure _SetcityID(acityID: Integer); // (I)V
    function _GetcityName: JString; // Ljava/lang/String;
    procedure _SetcityName(acityName: JString); // (Ljava/lang/String;)V
    function _Getratio: Integer; // I
    procedure _Setratio(aratio: Integer); // (I)V
    function _Getstatus: Integer; // I
    procedure _Setstatus(astatus: Integer); // (I)V
    function _GetgeoPt: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _SetgeoPt(ageoPt: JLatLng); // (Lcom/baidu/mapapi/model/LatLng;)V
    function _Getsize: Integer; // I
    procedure _Setsize(asize: Integer); // (I)V
    function _Getserversize: Integer; // I
    procedure _Setserversize(aserversize: Integer); // (I)V
    function _Getlevel: Integer; // I
    procedure _Setlevel(alevel: Integer); // (I)V
    function _Getupdate: Boolean; // Z
    procedure _Setupdate(aupdate: Boolean); // (Z)V

    { methods }

    { Property }
    property cityID: Integer read _GetcityID write _SetcityID;
    property cityName: JString read _GetcityName write _SetcityName;
    property ratio: Integer read _Getratio write _Setratio;
    property status: Integer read _Getstatus write _Setstatus;
    property geoPt: JLatLng read _GetgeoPt write _SetgeoPt;
    property size: Integer read _Getsize write _Setsize;
    property serversize: Integer read _Getserversize write _Setserversize;
    property level: Integer read _Getlevel write _Setlevel;
    property update: Boolean read _Getupdate write _Setupdate;
  end;

  TJMKOLUpdateElement = class(TJavaGenericImport<JMKOLUpdateElementClass,
    JMKOLUpdateElement>)
  end;

  JOfflineMapUtilClass = interface(JObjectClass)
    ['{DC7B1A24-F7DF-48FA-AF5A-0224BD6541BB}']
    { static Property Methods }

    { static Methods }
    { class } function init: JOfflineMapUtil; cdecl; // ()V
    // {class} function getSearchRecordFromLocalCityInfo(P1: Js): JMKOLSearchRecord; cdecl; //(Lcom/baidu/platform/comapi/map/s;)Lcom/baidu/mapapi/map/offline/MKOLSearchRecord;
    // {class} function getUpdatElementFromLocalMapElement(P1: Ju): JMKOLUpdateElement; cdecl; //(Lcom/baidu/platform/comapi/map/u;)Lcom/baidu/mapapi/map/offline/MKOLUpdateElement;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/offline/OfflineMapUtil')]
  JOfflineMapUtil = interface(JObject)
    ['{D259EFC6-6F6C-4078-A3DB-8697537F78A1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOfflineMapUtil = class(TJavaGenericImport<JOfflineMapUtilClass,
    JOfflineMapUtil>)
  end;

  JPolygonClass = interface(JOverlayClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/map/Overlay
    ['{DE131AF8-FA52-4F32-A507-EA76EF35805C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/Polygon')]
  JPolygon = interface(JOverlay)
  // or JObject // SuperSignature: com/baidu/mapapi/map/Overlay
    ['{9513BAFD-B87F-454D-8DFA-81A7830C42EC}']
    { Property Methods }

    { methods }
    function getFillColor: Integer; cdecl; // ()I
    function getPoints: JList; cdecl; // ()Ljava/util/List;
    function getStroke: JStroke; cdecl; // ()Lcom/baidu/mapapi/map/Stroke;
    procedure setFillColor(P1: Integer); cdecl; // (I)V
    procedure setPoints(P1: JList); cdecl; // (Ljava/util/List;)V
    procedure setStroke(P1: JStroke); cdecl; // (Lcom/baidu/mapapi/map/Stroke;)V

    { Property }
  end;

  TJPolygon = class(TJavaGenericImport<JPolygonClass, JPolygon>)
  end;

  JPolygonOptionsClass = interface(JOverlayOptionsClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/map/OverlayOptions
    ['{FBCADEDB-6C0A-4D6C-AE86-056107E1AD2A}']
    { static Property Methods }

    { static Methods }
    { class } function init: JPolygonOptions; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/PolygonOptions')]
  JPolygonOptions = interface(JOverlayOptions)
  // or JObject // SuperSignature: com/baidu/mapapi/map/OverlayOptions
    ['{571D55E0-07B1-4EF3-A57E-779A01E2E1C1}']
    { Property Methods }

    { methods }
    function getFillColor: Integer; cdecl; // ()I
    function getPoints: JList; cdecl; // ()Ljava/util/List;
    function getStroke: JStroke; cdecl; // ()Lcom/baidu/mapapi/map/Stroke;
    function fillColor(P1: Integer): JPolygonOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/PolygonOptions;
    function points(P1: JList): JPolygonOptions; cdecl;
    // (Ljava/util/List;)Lcom/baidu/mapapi/map/PolygonOptions;
    function stroke(P1: JStroke): JPolygonOptions; cdecl;
    // (Lcom/baidu/mapapi/map/Stroke;)Lcom/baidu/mapapi/map/PolygonOptions;
    function visible(P1: Boolean): JPolygonOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/PolygonOptions;
    function isVisible: Boolean; cdecl; // ()Z
    function zIndex(P1: Integer): JPolygonOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/PolygonOptions;
    function getZIndex: Integer; cdecl; // ()I
    function extraInfo(P1: JBundle): JPolygonOptions; cdecl;
    // (Landroid/os/Bundle;)Lcom/baidu/mapapi/map/PolygonOptions;
    function getExtraInfo: JBundle; cdecl; // ()Landroid/os/Bundle;

    { Property }
  end;

  TJPolygonOptions = class(TJavaGenericImport<JPolygonOptionsClass,
    JPolygonOptions>)
  end;

  JPolylineClass = interface(JOverlayClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/map/Overlay
    ['{FF8BA68F-AAE3-432C-B96A-5F7A2602BB5E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/Polyline')]
  JPolyline = interface(JOverlay)
  // or JObject // SuperSignature: com/baidu/mapapi/map/Overlay
    ['{DC796D29-D212-4693-9380-CEBA3D52F059}']
    { Property Methods }

    { methods }
    function getColor: Integer; cdecl; // ()I
    function getPoints: JList; cdecl; // ()Ljava/util/List;
    function getWidth: Integer; cdecl; // ()I
    procedure setColor(P1: Integer); cdecl; // (I)V
    procedure setDottedLine(P1: Boolean); cdecl; // (Z)V
    procedure setFocus(P1: Boolean); cdecl; // (Z)V
    function isFocus: Boolean; cdecl; // ()Z
    function isDottedLine: Boolean; cdecl; // ()Z
    procedure setPoints(P1: JList); cdecl; // (Ljava/util/List;)V
    procedure setWidth(P1: Integer); cdecl; // (I)V

    { Property }
  end;

  TJPolyline = class(TJavaGenericImport<JPolylineClass, JPolyline>)
  end;

  JPolylineOptionsClass = interface(JOverlayOptionsClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/map/OverlayOptions
    ['{10EBC057-49D0-4D8E-A2A9-FE378EC211B7}']
    { static Property Methods }

    { static Methods }
    { class } function init: JPolylineOptions; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/PolylineOptions')]
  JPolylineOptions = interface(JOverlayOptions)
  // or JObject // SuperSignature: com/baidu/mapapi/map/OverlayOptions
    ['{902451AF-5E23-4DEE-8A09-B2AA76C49B9F}']
    { Property Methods }

    { methods }
    function getColor: Integer; cdecl; // ()I
    function getPoints: JList; cdecl; // ()Ljava/util/List;
    function getTextureIndexs: JList; cdecl; // ()Ljava/util/List;
    function getWidth: Integer; cdecl; // ()I
    function color(P1: Integer): JPolylineOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/PolylineOptions;
    function keepScale(P1: Boolean): JPolylineOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/PolylineOptions;
    function customTexture(P1: JBitmapDescriptor): JPolylineOptions; cdecl;
    // (Lcom/baidu/mapapi/map/BitmapDescriptor;)Lcom/baidu/mapapi/map/PolylineOptions;
    function customTextureList(P1: JList): JPolylineOptions; cdecl;
    // (Ljava/util/List;)Lcom/baidu/mapapi/map/PolylineOptions;
    function getCustomTextureList: JList; cdecl; // ()Ljava/util/List;
    function getCustomTexture: JBitmapDescriptor; cdecl;
    // ()Lcom/baidu/mapapi/map/BitmapDescriptor;
    function points(P1: JList): JPolylineOptions; cdecl;
    // (Ljava/util/List;)Lcom/baidu/mapapi/map/PolylineOptions;
    function colorsValues(P1: JList): JPolylineOptions; cdecl;
    // (Ljava/util/List;)Lcom/baidu/mapapi/map/PolylineOptions;
    function textureIndex(P1: JList): JPolylineOptions; cdecl;
    // (Ljava/util/List;)Lcom/baidu/mapapi/map/PolylineOptions;
    function width(P1: Integer): JPolylineOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/PolylineOptions;
    function visible(P1: Boolean): JPolylineOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/PolylineOptions;
    function focus(P1: Boolean): JPolylineOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/PolylineOptions;
    function dottedLine(P1: Boolean): JPolylineOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/PolylineOptions;
    function isDottedLine: Boolean; cdecl; // ()Z
    function isVisible: Boolean; cdecl; // ()Z
    function isFocus: Boolean; cdecl; // ()Z
    function zIndex(P1: Integer): JPolylineOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/PolylineOptions;
    function getZIndex: Integer; cdecl; // ()I
    function extraInfo(P1: JBundle): JPolylineOptions; cdecl;
    // (Landroid/os/Bundle;)Lcom/baidu/mapapi/map/PolylineOptions;
    function getExtraInfo: JBundle; cdecl; // ()Landroid/os/Bundle;

    { Property }
  end;

  TJPolylineOptions = class(TJavaGenericImport<JPolylineOptionsClass,
    JPolylineOptions>)
  end;

  JProjectionClass = interface(JObjectClass)
    ['{12C28435-3059-4805-84B0-26A7DDB4650D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/Projection')]
  JProjection = interface(JObject)
    ['{1E247206-9BEE-4815-BB4A-5BAE7173F8C8}']
    { Property Methods }

    { methods }
    function fromScreenLocation(P1: JPoint): JLatLng; cdecl;
    // (Landroid/graphics/Point;)Lcom/baidu/mapapi/model/LatLng;
    function toScreenLocation(P1: JLatLng): JPoint; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Landroid/graphics/Point;
    function toOpenGLLocation(P1: JLatLng; P2: JMapStatus): JPointF; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;Lcom/baidu/mapapi/map/MapStatus;)Landroid/graphics/PointF;
    function toOpenGLNormalization(P1: JLatLng; P2: JMapStatus): JPointF; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;Lcom/baidu/mapapi/map/MapStatus;)Landroid/graphics/PointF;
    function metersToEquatorPixels(P1: Single): Single; cdecl; // (F)F

    { Property }
  end;

  TJProjection = class(TJavaGenericImport<JProjectionClass, JProjection>)
  end;

  JStrokeClass = interface(JObjectClass)
    ['{03CC7768-736F-4C72-8167-D73C5E36DD2A}']
    { static Property Methods }

    { static Methods }
    { class } function init(P1: Integer; P2: Integer): JStroke; cdecl; // (II)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/Stroke')]
  JStroke = interface(JObject)
    ['{C1918FD4-219D-4DAF-A718-54D60DCD6CE0}']
    { Property Methods }
    function _GetstrokeWidth: Integer; // I
    procedure _SetstrokeWidth(astrokeWidth: Integer); // (I)V
    function _Getcolor: Integer; // I
    procedure _Setcolor(acolor: Integer); // (I)V

    { methods }

    { Property }
    property strokeWidth: Integer read _GetstrokeWidth write _SetstrokeWidth;
    property color: Integer read _Getcolor write _Setcolor;
  end;

  TJStroke = class(TJavaGenericImport<JStrokeClass, JStroke>)
  end;

  JSupportMapFragmentClass = interface(JFragmentClass)
  // or JObjectClass // SuperSignature: android/support/v4/app/Fragment
    ['{3EA27E7C-EDD7-43BB-8602-379B49758276}']
    { static Property Methods }

    { static Methods }
    { class } function init: JSupportMapFragment; cdecl; // ()V
    { class } function newInstance: JSupportMapFragment; cdecl; overload;
    // ()Lcom/baidu/mapapi/map/SupportMapFragment;
    { class } function newInstance(P1: JBaiduMapOptions): JSupportMapFragment;
      cdecl; overload;
    // (Lcom/baidu/mapapi/map/BaiduMapOptions;)Lcom/baidu/mapapi/map/SupportMapFragment;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/SupportMapFragment')]
  JSupportMapFragment = interface(JFragment)
  // or JObject // SuperSignature: android/support/v4/app/Fragment
    ['{68D63B86-67E9-4984-A42B-4704DD960839}']
    { Property Methods }

    { methods }
    function getBaiduMap: JBaiduMap; cdecl; // ()Lcom/baidu/mapapi/map/BaiduMap;
    function getMapView: JMapView; cdecl; // ()Lcom/baidu/mapapi/map/MapView;
    procedure onAttach(P1: JActivity); cdecl; // (Landroid/app/Activity;)V
    procedure onCreate(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    function onCreateView(P1: JLayoutInflater; P2: JViewGroup; P3: JBundle)
      : JView; cdecl;
    // (Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    procedure onViewCreated(P1: JView; P2: JBundle); cdecl;
    // (Landroid/view/View;Landroid/os/Bundle;)V
    procedure onActivityCreated(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    procedure onViewStateRestored(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    procedure onStart; cdecl; // ()V
    procedure onResume; cdecl; // ()V
    procedure onSaveInstanceState(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    procedure onPause; cdecl; // ()V
    procedure onStop; cdecl; // ()V
    procedure onDestroyView; cdecl; // ()V
    procedure onDestroy; cdecl; // ()V
    procedure onDetach; cdecl; // ()V
    procedure onConfigurationChanged(P1: JConfiguration); cdecl;
    // (Landroid/content/res/Configuration;)V

    { Property }
  end;

  JSwipeDismissTouchListener_DismissCallbacksClass = interface(JObjectClass)
    ['{2E498CA5-669D-4ABD-B95B-5EDCDC76BA89}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature
    ('com/baidu/mapapi/map/SwipeDismissTouchListener$DismissCallbacks')]
  JSwipeDismissTouchListener_DismissCallbacks = interface(IJavaInstance)
    ['{23ADD340-A401-4A4A-B9B2-6296C4E4A861}']
    { Property Methods }

    { methods }
    function canDismiss(P1: JObject): Boolean; cdecl; // (Ljava/lang/Object;)Z
    procedure onDismiss(P1: JView; P2: JObject); cdecl;
    // (Landroid/view/View;Ljava/lang/Object;)V
    procedure onNotify; cdecl; // ()V

    { Property }
  end;

  TJSwipeDismissTouchListener_DismissCallbacks = class
    (TJavaGenericImport<JSwipeDismissTouchListener_DismissCallbacksClass,
    JSwipeDismissTouchListener_DismissCallbacks>)
  end;

  JSwipeDismissTouchListenerClass = interface(JObjectClass)
    ['{8AAD5638-48C1-446F-BE7D-A7CB305271BD}']
    { static Property Methods }

    { static Methods }
    { class } function init(P1: JView; P2: JObject;
      P3: JSwipeDismissTouchListener_DismissCallbacks)
      : JSwipeDismissTouchListener; cdecl;
    // (Landroid/view/View;Ljava/lang/Object;Lcom/baidu/mapapi/map/SwipeDismissTouchListener$DismissCallbacks;)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/SwipeDismissTouchListener')]
  JSwipeDismissTouchListener = interface(JObject)
    ['{50912A94-AFEE-46D1-982B-51CAA158C00E}']
    { Property Methods }

    { methods }
    function onTouch(P1: JView; P2: JMotionEvent): Boolean; cdecl;
    // (Landroid/view/View;Landroid/view/MotionEvent;)Z

    { Property }
  end;

  TJSwipeDismissTouchListener = class
    (TJavaGenericImport<JSwipeDismissTouchListenerClass,
    JSwipeDismissTouchListener>)
  end;

  JSwipeDismissViewClass = interface(JRelativeLayoutClass)
  // or JObjectClass // SuperSignature: android/widget/RelativeLayout
    ['{36FAAD74-7751-4890-BA36-ADE9EF6025A2}']
    { static Property Methods }

    { static Methods }
    { class } function init(P1: JContext; P2: JView): JSwipeDismissView; cdecl;
      overload; // (Landroid/content/Context;Landroid/view/View;)V
    { class } function init(P1: JContext; P2: JAttributeSet; P3: JView)
      : JSwipeDismissView; cdecl; overload;
    // (Landroid/content/Context;Landroid/util/AttributeSet;Landroid/view/View;)V
    { class } function init(P1: JContext; P2: JAttributeSet; P3: Integer;
      P4: JView): JSwipeDismissView; cdecl; overload;
    // (Landroid/content/Context;Landroid/util/AttributeSet;ILandroid/view/View;)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/SwipeDismissView')]
  JSwipeDismissView = interface(JRelativeLayout)
  // or JObject // SuperSignature: android/widget/RelativeLayout
    ['{33A86B98-CCD3-46BE-8C55-E3D1C1DB676B}']
    { Property Methods }

    { methods }
    procedure setCallback(P1: JWearMapView_OnDismissCallback); cdecl;
    // (Lcom/baidu/mapapi/map/WearMapView$OnDismissCallback;)V

    { Property }
  end;

  TJSwipeDismissView = class(TJavaGenericImport<JSwipeDismissViewClass,
    JSwipeDismissView>)
  end;

  JTextClass = interface(JOverlayClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/map/Overlay
    ['{AE8F3788-860A-46E7-BAF7-2316F5222C70}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/Text')]
  JText = interface(JOverlay)
  // or JObject // SuperSignature: com/baidu/mapapi/map/Overlay
    ['{CF6B8624-677B-47D3-A269-3129B6026CF9}']
    { Property Methods }

    { methods }
    function getText: JString; cdecl; // ()Ljava/lang/String;
    function getPosition: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getBgColor: Integer; cdecl; // ()I
    function getFontColor: Integer; cdecl; // ()I
    function getFontSize: Integer; cdecl; // ()I
    function getTypeface: JTypeface; cdecl; // ()Landroid/graphics/Typeface;
    function getAlignX: Single; cdecl; // ()F
    function getAlignY: Single; cdecl; // ()F
    function getRotate: Single; cdecl; // ()F
    procedure setText(P1: JString); cdecl; // (Ljava/lang/String;)V
    procedure setPosition(P1: JLatLng); cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)V
    procedure setBgColor(P1: Integer); cdecl; // (I)V
    procedure setFontColor(P1: Integer); cdecl; // (I)V
    procedure setFontSize(P1: Integer); cdecl; // (I)V
    procedure setTypeface(P1: JTypeface); cdecl;
    // (Landroid/graphics/Typeface;)V
    procedure setAlign(P1: Integer; P2: Integer); cdecl; // (II)V
    procedure setRotate(P1: Single); cdecl; // (F)V

    { Property }
  end;

  TJText = class(TJavaGenericImport<JTextClass, JText>)
  end;

  JTextOptionsClass = interface(JOverlayOptionsClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/map/OverlayOptions
    ['{CF1F14F5-7B0C-4686-A132-32974D273E60}']
    { static Property Methods }
    { class } function _GetALIGN_LEFT: Integer; // I
    { class } function _GetALIGN_RIGHT: Integer; // I
    { class } function _GetALIGN_CENTER_HORIZONTAL: Integer; // I
    { class } function _GetALIGN_TOP: Integer; // I
    { class } function _GetALIGN_BOTTOM: Integer; // I
    { class } function _GetALIGN_CENTER_VERTICAL: Integer; // I

    { static Methods }
    { class } function init: JTextOptions; cdecl; // ()V

    { static Property }
    { class } property ALIGN_LEFT: Integer read _GetALIGN_LEFT;
    { class } property ALIGN_RIGHT: Integer read _GetALIGN_RIGHT;
    { class } property ALIGN_CENTER_HORIZONTAL: Integer
      read _GetALIGN_CENTER_HORIZONTAL;
    { class } property ALIGN_TOP: Integer read _GetALIGN_TOP;
    { class } property ALIGN_BOTTOM: Integer read _GetALIGN_BOTTOM;
    { class } property ALIGN_CENTER_VERTICAL: Integer
      read _GetALIGN_CENTER_VERTICAL;
  end;

  [JavaSignature('com/baidu/mapapi/map/TextOptions')]
  JTextOptions = interface(JOverlayOptions)
  // or JObject // SuperSignature: com/baidu/mapapi/map/OverlayOptions
    ['{D9C4AA65-71DE-4C7F-8DDB-7D7344C790AF}']
    { Property Methods }

    { methods }
    function getText: JString; cdecl; // ()Ljava/lang/String;
    function getPosition: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getBgColor: Integer; cdecl; // ()I
    function getFontColor: Integer; cdecl; // ()I
    function getFontSize: Integer; cdecl; // ()I
    function getTypeface: JTypeface; cdecl; // ()Landroid/graphics/Typeface;
    function getAlignX: Single; cdecl; // ()F
    function getAlignY: Single; cdecl; // ()F
    function getRotate: Single; cdecl; // ()F
    function text(P1: JString): JTextOptions; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/map/TextOptions;
    function position(P1: JLatLng): JTextOptions; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/map/TextOptions;
    function bgColor(P1: Integer): JTextOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/TextOptions;
    function fontColor(P1: Integer): JTextOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/TextOptions;
    function fontSize(P1: Integer): JTextOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/TextOptions;
    function typeface(P1: JTypeface): JTextOptions; cdecl;
    // (Landroid/graphics/Typeface;)Lcom/baidu/mapapi/map/TextOptions;
    function align(P1: Integer; P2: Integer): JTextOptions; cdecl;
    // (II)Lcom/baidu/mapapi/map/TextOptions;
    function rotate(P1: Single): JTextOptions; cdecl;
    // (F)Lcom/baidu/mapapi/map/TextOptions;
    function visible(P1: Boolean): JTextOptions; cdecl;
    // (Z)Lcom/baidu/mapapi/map/TextOptions;
    function isVisible: Boolean; cdecl; // ()Z
    function zIndex(P1: Integer): JTextOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/TextOptions;
    function getZIndex: Integer; cdecl; // ()I
    function extraInfo(P1: JBundle): JTextOptions; cdecl;
    // (Landroid/os/Bundle;)Lcom/baidu/mapapi/map/TextOptions;
    function getExtraInfo: JBundle; cdecl; // ()Landroid/os/Bundle;

    { Property }
  end;

  TJTextOptions = class(TJavaGenericImport<JTextOptionsClass, JTextOptions>)
  end;

  JTextureMapFragmentClass = interface(JFragmentClass)
  // or JObjectClass // SuperSignature: android/app/Fragment
    ['{0F6F376A-4E7F-467C-8D88-A709A67285E1}']
    { static Property Methods }

    { static Methods }
    { class } function init: JTextureMapFragment; cdecl; // ()V
    { class } function newInstance: JTextureMapFragment; cdecl; overload;
    // ()Lcom/baidu/mapapi/map/TextureMapFragment;
    { class } function newInstance(P1: JBaiduMapOptions): JTextureMapFragment;
      cdecl; overload;
    // (Lcom/baidu/mapapi/map/BaiduMapOptions;)Lcom/baidu/mapapi/map/TextureMapFragment;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/TextureMapFragment')]
  JTextureMapFragment = interface(JFragment)
  // or JObject // SuperSignature: android/app/Fragment
    ['{6B4B4C01-6112-4BE7-9A2F-F85AB7C53ACB}']
    { Property Methods }

    { methods }
    function getBaiduMap: JBaiduMap; cdecl; // ()Lcom/baidu/mapapi/map/BaiduMap;
    function getMapView: JTextureMapView; cdecl;
    // ()Lcom/baidu/mapapi/map/TextureMapView;
    procedure onAttach(P1: JActivity); cdecl; // (Landroid/app/Activity;)V
    procedure onCreate(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    function onCreateView(P1: JLayoutInflater; P2: JViewGroup; P3: JBundle)
      : JView; cdecl;
    // (Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    procedure onViewCreated(P1: JView; P2: JBundle); cdecl;
    // (Landroid/view/View;Landroid/os/Bundle;)V
    procedure onActivityCreated(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    procedure onStart; cdecl; // ()V
    procedure onResume; cdecl; // ()V
    procedure onSaveInstanceState(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    procedure onPause; cdecl; // ()V
    procedure onStop; cdecl; // ()V
    procedure onDestroyView; cdecl; // ()V
    procedure onDestroy; cdecl; // ()V
    procedure onDetach; cdecl; // ()V
    procedure onConfigurationChanged(P1: JConfiguration); cdecl;
    // (Landroid/content/res/Configuration;)V

    { Property }
  end;

  TJTextureMapFragment = class(TJavaGenericImport<JTextureMapFragmentClass,
    JTextureMapFragment>)
  end;

  JTextureMapViewClass = interface(JViewGroupClass)
  // or JObjectClass // SuperSignature: android/view/ViewGroup
    ['{D2E58D28-3D9A-4930-B947-4A36BE0BF0D8}']
    { static Property Methods }

    { static Methods }
    { class } function init(P1: JContext): JTextureMapView; cdecl; overload;
    // (Landroid/content/Context;)V
    { class } function init(P1: JContext; P2: JAttributeSet): JTextureMapView;
      cdecl; overload;
    // (Landroid/content/Context;Landroid/util/AttributeSet;)V
    { class } function init(P1: JContext; P2: JAttributeSet; P3: Integer)
      : JTextureMapView; cdecl; overload;
    // (Landroid/content/Context;Landroid/util/AttributeSet;I)V
    { class } function init(P1: JContext; P2: JBaiduMapOptions)
      : JTextureMapView; cdecl; overload;
    // (Landroid/content/Context;Lcom/baidu/mapapi/map/BaiduMapOptions;)V
    { class } procedure setCustomMapStylePath(P1: JString); cdecl;
    // (Ljava/lang/String;)V
    { class } procedure setMapCustomEnable(P1: Boolean); cdecl; // (Z)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/TextureMapView')]
  JTextureMapView = interface(JViewGroup)
  // or JObject // SuperSignature: android/view/ViewGroup
    ['{949BF82E-FDA3-4A14-AB6A-34A081F16A13}']
    { Property Methods }

    { methods }
    procedure setPadding(P1: Integer; P2: Integer; P3: Integer; P4: Integer);
      cdecl; // (IIII)V
    function getMap: JBaiduMap; cdecl; // ()Lcom/baidu/mapapi/map/BaiduMap;
    procedure onDestroy; cdecl; // ()V
    procedure setLogoPosition(P1: JLogoPosition); cdecl;
    // (Lcom/baidu/mapapi/map/LogoPosition;)V
    function getLogoPosition: JLogoPosition; cdecl;
    // ()Lcom/baidu/mapapi/map/LogoPosition;
    procedure onPause; cdecl; // ()V
    procedure onResume; cdecl; // ()V
    procedure addView(P1: JView; P2: JViewGroup_LayoutParams); cdecl;
    // (Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    procedure removeView(P1: JView); cdecl; // (Landroid/view/View;)V
    procedure showZoomControls(P1: Boolean); cdecl; // (Z)V
    procedure setZoomControlsPosition(P1: JPoint); cdecl;
    // (Landroid/graphics/Point;)V
    procedure showScaleControl(P1: Boolean); cdecl; // (Z)V
    procedure setScaleControlPosition(P1: JPoint); cdecl;
    // (Landroid/graphics/Point;)V
    function getScaleControlViewWidth: Integer; cdecl; // ()I
    function getScaleControlViewHeight: Integer; cdecl; // ()I
    function getMapLevel: Integer; cdecl; // ()I
    procedure onSaveInstanceState(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    procedure onCreate(P1: JContext; P2: JBundle); cdecl;
    // (Landroid/content/Context;Landroid/os/Bundle;)V

    { Property }
  end;

  TJTextureMapView = class(TJavaGenericImport<JTextureMapViewClass,
    JTextureMapView>)
  end;

  JTextureSupportMapFragmentClass = interface(JFragmentClass)
  // or JObjectClass // SuperSignature: android/support/v4/app/Fragment
    ['{2D1C5B9C-BCFD-4D72-8AE9-5C3CB937EAE7}']
    { static Property Methods }

    { static Methods }
    { class } function init: JTextureSupportMapFragment; cdecl; // ()V
    { class } function newInstance: JTextureSupportMapFragment; cdecl; overload;
    // ()Lcom/baidu/mapapi/map/TextureSupportMapFragment;
    { class } function newInstance(P1: JBaiduMapOptions)
      : JTextureSupportMapFragment; cdecl; overload;
    // (Lcom/baidu/mapapi/map/BaiduMapOptions;)Lcom/baidu/mapapi/map/TextureSupportMapFragment;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/TextureSupportMapFragment')]
  JTextureSupportMapFragment = interface(JFragment)
  // or JObject // SuperSignature: android/support/v4/app/Fragment
    ['{C9963E8C-CA35-41D9-BC4D-707887FAD18E}']
    { Property Methods }

    { methods }
    function getBaiduMap: JBaiduMap; cdecl; // ()Lcom/baidu/mapapi/map/BaiduMap;
    function getMapView: JTextureMapView; cdecl;
    // ()Lcom/baidu/mapapi/map/TextureMapView;
    procedure onAttach(P1: JActivity); cdecl; // (Landroid/app/Activity;)V
    procedure onCreate(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    function onCreateView(P1: JLayoutInflater; P2: JViewGroup; P3: JBundle)
      : JView; cdecl;
    // (Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    procedure onViewCreated(P1: JView; P2: JBundle); cdecl;
    // (Landroid/view/View;Landroid/os/Bundle;)V
    procedure onActivityCreated(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    procedure onViewStateRestored(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    procedure onStart; cdecl; // ()V
    procedure onResume; cdecl; // ()V
    procedure onSaveInstanceState(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    procedure onPause; cdecl; // ()V
    procedure onStop; cdecl; // ()V
    procedure onDestroyView; cdecl; // ()V
    procedure onDestroy; cdecl; // ()V
    procedure onDetach; cdecl; // ()V
    procedure onConfigurationChanged(P1: JConfiguration); cdecl;
    // (Landroid/content/res/Configuration;)V

    { Property }
  end;

  TJTextureSupportMapFragment = class
    (TJavaGenericImport<JTextureSupportMapFragmentClass,
    JTextureSupportMapFragment>)
  end;

  JTileClass = interface(JObjectClass)
    ['{D0AAFAA8-4B26-41DC-BAB1-E24B36C7008F}']
    { static Property Methods }

    { static Methods }
    { class } function init(P1: Integer; P2: Integer; P3: TJavaArray<Byte>)
      : JTile; cdecl; // (II[B)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/Tile')]
  JTile = interface(JObject)
    ['{F9A8BD31-D48F-469C-80E7-83CDC96CD8EC}']
    { Property Methods }
    function _Getdata: TJavaArray<Byte>; // [B
    procedure _Setdata(adata: TJavaArray<Byte>); // ([B)V
    function _Getheight: Integer; // I
    procedure _Setheight(aheight: Integer); // (I)V
    function _Getwidth: Integer; // I
    procedure _Setwidth(awidth: Integer); // (I)V

    { methods }
    function toBundle: JBundle; cdecl; // ()Landroid/os/Bundle;

    { Property }
    property data: TJavaArray<Byte> read _Getdata write _Setdata;
    property height: Integer read _Getheight write _Setheight;
    property width: Integer read _Getwidth write _Setwidth;
  end;

  TJTile = class(TJavaGenericImport<JTileClass, JTile>)
  end;

  JTileOverlayClass = interface(JObjectClass)
    ['{D8E5A30F-2C9B-4B0B-BBAA-66EF1501D900}']
    { static Property Methods }

    { static Methods }
    { class } function init(P1: JBaiduMap; P2: JTileProvider): JTileOverlay;
      cdecl; // (Lcom/baidu/mapapi/map/BaiduMap;Lcom/baidu/mapapi/map/TileProvider;)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/TileOverlay')]
  JTileOverlay = interface(JObject)
    ['{1AF64113-A6AC-450C-A2AE-FB742586668B}']
    { Property Methods }

    { methods }
    function clearTileCache: Boolean; cdecl; // ()Z
    procedure removeTileOverlay; cdecl; // ()V

    { Property }
  end;

  TJTileOverlay = class(TJavaGenericImport<JTileOverlayClass, JTileOverlay>)
  end;

  JTileOverlayOptionsClass = interface(JObjectClass)
    ['{C6A128F6-2BD3-494F-B66E-7AB2E5A7A2B4}']
    { static Property Methods }

    { static Methods }
    { class } function init: JTileOverlayOptions; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/TileOverlayOptions')]
  JTileOverlayOptions = interface(JObject)
    ['{8D044C7E-033B-480A-9854-B68C4CEDAFFE}']
    { Property Methods }
    function _Getdatasource: Integer; // I
    procedure _Setdatasource(adatasource: Integer); // (I)V
    function _GeturlString: JString; // Ljava/lang/String;
    procedure _SeturlString(aurlString: JString); // (Ljava/lang/String;)V

    { methods }
    function setMaxTileTmp(P1: Integer): JTileOverlayOptions; cdecl;
    // (I)Lcom/baidu/mapapi/map/TileOverlayOptions;
    function tileProvider(P1: JTileProvider): JTileOverlayOptions; cdecl;
    // (Lcom/baidu/mapapi/map/TileProvider;)Lcom/baidu/mapapi/map/TileOverlayOptions;
    function setPositionFromBounds(P1: JLatLngBounds): JTileOverlayOptions;
      cdecl; // (Lcom/baidu/mapapi/model/LatLngBounds;)Lcom/baidu/mapapi/map/TileOverlayOptions;

    { Property }
    property datasource: Integer read _Getdatasource write _Setdatasource;
    property urlString: JString read _GeturlString write _SeturlString;
  end;

  TJTileOverlayOptions = class(TJavaGenericImport<JTileOverlayOptionsClass,
    JTileOverlayOptions>)
  end;

  JTileProviderClass = interface(JObjectClass)
    ['{2D56AD97-91E1-4CBA-9379-43CCB3063D84}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/TileProvider')]
  JTileProvider = interface(IJavaInstance)
    ['{B84CA0E6-2EEE-40DA-BF75-F49459202D13}']
    { Property Methods }

    { methods }
    function getMaxDisLevel: Integer; cdecl; // ()I
    function getMinDisLevel: Integer; cdecl; // ()I

    { Property }
  end;

  TJTileProvider = class(TJavaGenericImport<JTileProviderClass, JTileProvider>)
  end;

  JUiSettingsClass = interface(JObjectClass)
    ['{60E9E406-9C8E-487F-8E07-FB89225DA84F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/UiSettings')]
  JUiSettings = interface(JObject)
    ['{FA664230-6DB9-4213-BA32-5A8B528E7F11}']
    { Property Methods }

    { methods }
    function isCompassEnabled: Boolean; cdecl; // ()Z
    function isRotateGesturesEnabled: Boolean; cdecl; // ()Z
    function isScrollGesturesEnabled: Boolean; cdecl; // ()Z
    function isOverlookingGesturesEnabled: Boolean; cdecl; // ()Z
    function isZoomGesturesEnabled: Boolean; cdecl; // ()Z
    procedure setAllGesturesEnabled(P1: Boolean); cdecl; // (Z)V
    procedure setCompassEnabled(P1: Boolean); cdecl; // (Z)V
    procedure setRotateGesturesEnabled(P1: Boolean); cdecl; // (Z)V
    procedure setScrollGesturesEnabled(P1: Boolean); cdecl; // (Z)V
    procedure setOverlookingGesturesEnabled(P1: Boolean); cdecl; // (Z)V
    procedure setZoomGesturesEnabled(P1: Boolean); cdecl; // (Z)V

    { Property }
  end;

  TJUiSettings = class(TJavaGenericImport<JUiSettingsClass, JUiSettings>)
  end;

  JUrlTileProviderClass = interface(JObjectClass)
    ['{BA02084C-6832-405F-867E-CABD164416D3}']
    { static Property Methods }

    { static Methods }
    { class } function init: JUrlTileProvider; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/UrlTileProvider')]
  JUrlTileProvider = interface(JObject)
    ['{1F8B7D58-FF06-4197-B1EA-7AE75BFA658B}']
    { Property Methods }

    { methods }
    function getTileUrl: JString; cdecl; // ()Ljava/lang/String;

    { Property }
  end;

  TJUrlTileProvider = class(TJavaGenericImport<JUrlTileProviderClass,
    JUrlTileProvider>)
  end;

  JWearMapView_AnimationTaskClass = interface(JTimerTaskClass)
  // or JObjectClass // SuperSignature: java/util/TimerTask
    ['{82899689-8396-40B5-8EEC-114CA7ACAD60}']
    { static Property Methods }

    { static Methods }
    { class } function init(P1: JWearMapView): JWearMapView_AnimationTask;
      cdecl; // (Lcom/baidu/mapapi/map/WearMapView;)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/WearMapView$AnimationTask')]
  JWearMapView_AnimationTask = interface(JTimerTask)
  // or JObject // SuperSignature: java/util/TimerTask
    ['{0775F16D-A0D6-4A26-BA77-BD940D4D87C6}']
    { Property Methods }

    { methods }
    procedure run; cdecl; // ()V

    { Property }
  end;

  TJWearMapView_AnimationTask = class
    (TJavaGenericImport<JWearMapView_AnimationTaskClass,
    JWearMapView_AnimationTask>)
  end;

  JWearMapView_OnDismissCallbackClass = interface(JObjectClass)
    ['{B1CB5C4B-8049-45B1-8278-6E03972D8CB6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/WearMapView$OnDismissCallback')]
  JWearMapView_OnDismissCallback = interface(IJavaInstance)
    ['{9F431C19-5495-48F5-AAAC-02C929BE7AC6}']
    { Property Methods }

    { methods }
    procedure onDismiss; cdecl; // ()V
    procedure onNotify; cdecl; // ()V

    { Property }
  end;

  TJWearMapView_OnDismissCallback = class
    (TJavaGenericImport<JWearMapView_OnDismissCallbackClass,
    JWearMapView_OnDismissCallback>)
  end;

  JWearMapViewClass = interface(JViewGroupClass)
  // or JObjectClass // SuperSignature: android/view/ViewGroup
    ['{B9C7974F-791D-4A49-A582-F4D39AA26439}']
    { static Property Methods }
    { class } function _GetBT_INVIEW: Integer; // I

    { static Methods }
    { class } function init(P1: JContext): JWearMapView; cdecl; overload;
    // (Landroid/content/Context;)V
    { class } function init(P1: JContext; P2: JAttributeSet): JWearMapView;
      cdecl; overload;
    // (Landroid/content/Context;Landroid/util/AttributeSet;)V
    { class } function init(P1: JContext; P2: JAttributeSet; P3: Integer)
      : JWearMapView; cdecl; overload;
    // (Landroid/content/Context;Landroid/util/AttributeSet;I)V
    { class } function init(P1: JContext; P2: JBaiduMapOptions): JWearMapView;
      cdecl; overload;
    // (Landroid/content/Context;Lcom/baidu/mapapi/map/BaiduMapOptions;)V
    { class } procedure setCustomMapStylePath(P1: JString); cdecl;
    // (Ljava/lang/String;)V
    { class } procedure setMapCustomEnable(P1: Boolean); cdecl; // (Z)V

    { static Property }
    { class } property BT_INVIEW: Integer read _GetBT_INVIEW;
  end;

  [JavaSignature('com/baidu/mapapi/map/WearMapView')]
  JWearMapView = interface(JViewGroup)
  // or JObject // SuperSignature: android/view/ViewGroup
    ['{38B51456-A658-4EE1-95FA-8FE080605D5B}']
    { Property Methods }
    function _GetmTimer: JTimer; // Ljava/util/Timer;
    procedure _SetmTimer(amTimer: JTimer); // (Ljava/util/Timer;)V
    function _GetmTask: JWearMapView_AnimationTask;
    // Lcom/baidu/mapapi/map/WearMapView$AnimationTask;
    procedure _SetmTask(amTask: JWearMapView_AnimationTask);
    // (Lcom/baidu/mapapi/map/WearMapView$AnimationTask;)V
    // function _GetmTimerHandler: JWearMapView_b; //Lcom/baidu/mapapi/map/WearMapView$b;
    // procedure _SetmTimerHandler(amTimerHandler: JWearMapView_b); //(Lcom/baidu/mapapi/map/WearMapView$b;)V

    { methods }
    function onApplyWindowInsets(P1: JView; P2: JWindowInsets): JWindowInsets;
      cdecl; // (Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    procedure setOnDismissCallbackListener(P1: JWearMapView_OnDismissCallback);
      cdecl; // (Lcom/baidu/mapapi/map/WearMapView$OnDismissCallback;)V
    // procedure setShape(P1: JWearMapView_a); cdecl; //(Lcom/baidu/mapapi/map/WearMapView$a;)V
    function onInterceptTouchEvent(P1: JMotionEvent): Boolean; cdecl;
    // (Landroid/view/MotionEvent;)Z
    procedure setViewAnimitionEnable(P1: Boolean); cdecl; // (Z)V
    function getMap: JBaiduMap; cdecl; // ()Lcom/baidu/mapapi/map/BaiduMap;
    procedure onDestroy; cdecl; // ()V
    procedure onDismiss; cdecl; // ()V
    procedure onEnterAmbient(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    procedure onExitAmbient; cdecl; // ()V
    function getMapLevel: Integer; cdecl; // ()I
    procedure addView(P1: JView; P2: JViewGroup_LayoutParams); cdecl;
    // (Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    procedure removeView(P1: JView); cdecl; // (Landroid/view/View;)V
    procedure setPadding(P1: Integer; P2: Integer; P3: Integer; P4: Integer);
      cdecl; // (IIII)V
    procedure showZoomControls(P1: Boolean); cdecl; // (Z)V
    procedure setZoomControlsPosition(P1: JPoint); cdecl;
    // (Landroid/graphics/Point;)V
    procedure showScaleControl(P1: Boolean); cdecl; // (Z)V
    function getScaleControlViewWidth: Integer; cdecl; // ()I
    function getScaleControlViewHeight: Integer; cdecl; // ()I
    procedure setScaleControlPosition(P1: JPoint); cdecl;
    // (Landroid/graphics/Point;)V
    procedure onSaveInstanceState(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    procedure onCreate(P1: JContext; P2: JBundle); cdecl;
    // (Landroid/content/Context;Landroid/os/Bundle;)V

    { Property }
    property mTimer: JTimer read _GetmTimer write _SetmTimer;
    property mTask: JWearMapView_AnimationTask read _GetmTask write _SetmTask;
    // property mTimerHandler: JWearMapView_b read _GetmTimerHandler write _SetmTimerHandler;
  end;

  TJWearMapView = class(TJavaGenericImport<JWearMapViewClass, JWearMapView>)
  end;

  JWeightedLatLngClass = interface(JObjectClass)
  // or JObjectClass // SuperSignature: com/baidu/mapapi/map/b$a
    ['{312A0248-FB96-491E-9243-390C457C8151}']
    { static Property Methods }
    { class } function _GetDEFAULT_INTENSITY: Double; // D

    { static Methods }
    { class } function init(P1: JLatLng; P2: Double): JWeightedLatLng; cdecl;
      overload; // (Lcom/baidu/mapapi/model/LatLng;D)V
    { class } function init(P1: JLatLng): JWeightedLatLng; cdecl; overload;
    // (Lcom/baidu/mapapi/model/LatLng;)V

    { static Property }
    { class } property DEFAULT_INTENSITY: Double read _GetDEFAULT_INTENSITY;
  end;

  [JavaSignature('com/baidu/mapapi/map/WeightedLatLng')]
  JWeightedLatLng = interface(JObject)
  // or JObject // SuperSignature: com/baidu/mapapi/map/b$a
    ['{60C1F16F-1132-43CA-B834-5111710340F7}']
    { Property Methods }
    function _Getintensity: Double; // D
    procedure _Setintensity(aintensity: Double); // (D)V
    function _GetlatLng: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _SetlatLng(alatLng: JLatLng);
    // (Lcom/baidu/mapapi/model/LatLng;)V

    { methods }

    { Property }
    property intensity: Double read _Getintensity write _Setintensity;
    property latLng: JLatLng read _GetlatLng write _SetlatLng;
  end;

  TJWeightedLatLng = class(TJavaGenericImport<JWeightedLatLngClass,
    JWeightedLatLng>)
  end;

  JWinRoundClass = interface(JObjectClass)
    ['{589C7CDF-6A97-4B22-A701-C3F7F58B092A}']
    { static Property Methods }

    { static Methods }
    { class } function init: JWinRound; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/map/WinRound')]
  JWinRound = interface(JObject)
    ['{0AC7B6D1-4A8B-4CE8-ABD5-C58ADB0E005D}']
    { Property Methods }
    function _Getleft: Integer; // I
    procedure _Setleft(aleft: Integer); // (I)V
    function _Getright: Integer; // I
    procedure _Setright(aright: Integer); // (I)V
    function _Gettop: Integer; // I
    procedure _Settop(atop: Integer); // (I)V
    function _Getbottom: Integer; // I
    procedure _Setbottom(abottom: Integer); // (I)V

    { methods }
    function toString: JString; cdecl; // ()Ljava/lang/String;

    { Property }
    property left: Integer read _Getleft write _Setleft;
    property right: Integer read _Getright write _Setright;
    property top: Integer read _Gettop write _Settop;
    property bottom: Integer read _Getbottom write _Setbottom;
  end;

  TJWinRound = class(TJavaGenericImport<JWinRoundClass, JWinRound>)
  end;

implementation

procedure RegisterTypes;
begin

  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.Arc',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JArc));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.ArcOptions',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JArcOptions));

  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.BaiduMap_OnBaseIndoorMapListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.
    JBaiduMap_OnBaseIndoorMapListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.BaiduMap_OnMapClickListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JBaiduMap_OnMapClickListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.BaiduMap_OnMapDoubleClickListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.
    JBaiduMap_OnMapDoubleClickListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.BaiduMap_OnMapDrawFrameCallback',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JBaiduMap_OnMapDrawFrameCallback));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.BaiduMap_OnMapLoadedCallback',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JBaiduMap_OnMapLoadedCallback));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.BaiduMap_OnMapLongClickListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JBaiduMap_OnMapLongClickListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.BaiduMap_OnMapRenderCallback',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JBaiduMap_OnMapRenderCallback));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.BaiduMap_OnMapStatusChangeListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.
    JBaiduMap_OnMapStatusChangeListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.BaiduMap_OnMapTouchListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JBaiduMap_OnMapTouchListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.BaiduMap_OnMarkerClickListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JBaiduMap_OnMarkerClickListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.BaiduMap_OnMarkerDragListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JBaiduMap_OnMarkerDragListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.BaiduMap_OnMyLocationClickListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.
    JBaiduMap_OnMyLocationClickListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.BaiduMap_OnPolylineClickListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.
    JBaiduMap_OnPolylineClickListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.BaiduMap_SnapshotReadyCallback',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JBaiduMap_SnapshotReadyCallback));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.BaiduMap',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JBaiduMap));

  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.BaiduMapOptions',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JBaiduMapOptions));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.BitmapDescriptor',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JBitmapDescriptor));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.BitmapDescriptorFactory',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JBitmapDescriptorFactory));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.Circle',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JCircle));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.CircleOptions',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JCircleOptions));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.Dot',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JDot));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.DotOptions',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JDotOptions));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.FileTileProvider',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JFileTileProvider));

  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.Gradient',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JGradient));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.GroundOverlay',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JGroundOverlay));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.GroundOverlayOptions',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JGroundOverlayOptions));

  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.HeatMap_Builder',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JHeatMap_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.HeatMap',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JHeatMap));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.InfoWindow_OnInfoWindowClickListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.
    JInfoWindow_OnInfoWindowClickListener));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.InfoWindow',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JInfoWindow));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.ItemizedOverlay',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JItemizedOverlay));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.LogoPosition',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JLogoPosition));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.MapBaseIndoorMapInfo_SwitchFloorError',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.
    JMapBaseIndoorMapInfo_SwitchFloorError));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.MapBaseIndoorMapInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMapBaseIndoorMapInfo));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.MapFragment',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMapFragment));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.MapPoi',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMapPoi));

  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.MapStatus_Builder',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMapStatus_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.MapStatus',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMapStatus));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.MapStatusUpdate',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMapStatusUpdate));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.MapStatusUpdateFactory',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMapStatusUpdateFactory));

  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.MapView',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMapView));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.MapViewLayoutParams_Builder',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMapViewLayoutParams_Builder));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.MapViewLayoutParams_ELayoutMode',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMapViewLayoutParams_ELayoutMode));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.MapViewLayoutParams',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMapViewLayoutParams));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.Marker',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMarker));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.MarkerOptions_MarkerAnimateType',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMarkerOptions_MarkerAnimateType));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.MarkerOptions',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMarkerOptions));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.MyLocationConfiguration_LocationMode',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.
    JMyLocationConfiguration_LocationMode));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.MyLocationConfiguration',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMyLocationConfiguration));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.MyLocationData_Builder',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMyLocationData_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.MyLocationData',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMyLocationData));

  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.Overlay',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JOverlay));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.OverlayOptions',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JOverlayOptions));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.Polygon',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JPolygon));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.PolygonOptions',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JPolygonOptions));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.Polyline',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JPolyline));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.PolylineOptions',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JPolylineOptions));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.Projection',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JProjection));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.Stroke',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JStroke));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.SupportMapFragment',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JSupportMapFragment));

  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.SwipeDismissTouchListener_DismissCallbacks',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.
    JSwipeDismissTouchListener_DismissCallbacks));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.SwipeDismissTouchListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JSwipeDismissTouchListener));

  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.SwipeDismissView',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JSwipeDismissView));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.Text',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JText));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.TextOptions',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JTextOptions));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.TextureMapFragment',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JTextureMapFragment));

  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.TextureMapView',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JTextureMapView));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.TextureSupportMapFragment',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JTextureSupportMapFragment));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.Tile',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JTile));

  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.TileOverlay',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JTileOverlay));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.TileOverlayOptions',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JTileOverlayOptions));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.TileProvider',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JTileProvider));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.UiSettings',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JUiSettings));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.UrlTileProvider',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JUrlTileProvider));

  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.WearMapView_AnimationTask',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JWearMapView_AnimationTask));

  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.WearMapView_OnDismissCallback',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JWearMapView_OnDismissCallback));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.WearMapView',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JWearMapView));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.WeightedLatLng',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JWeightedLatLng));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.map.WinRound',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JWinRound));

  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.offline.JMKOfflineMap',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMKOfflineMap));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.offline.JMKOfflineMapListener',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMKOfflineMapListener));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.offline.JMKOLSearchRecord',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMKOLSearchRecord));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.offline.JMKOLUpdateElement',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JMKOLUpdateElement));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.map.offline.JOfflineMapUtil',
    TypeInfo(Androidapi.JNI.baidu.mapapi.map.JOfflineMapUtil));

end;

initialization

RegisterTypes;

end.
