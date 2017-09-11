{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework BaiduMapAPI_Map
//

unit iOSapi.BaiduMapAPI_Map;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.BaiduMapAPI_Base,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.CoreLocation,
  iOSapi.Foundation,
  iOSapi.OpenGLES,
  iOSapi.UIKit;

const
  BMKAnnotationViewDragStateNone = 0;
  BMKAnnotationViewDragStateStarting = 1;
  BMKAnnotationViewDragStateDragging = 2;
  BMKAnnotationViewDragStateCanceling = 3;
  BMKAnnotationViewDragStateEnding = 4;
  BMKUserTrackingModeNone = 0;
  BMKUserTrackingModeHeading = 1;
  BMKUserTrackingModeFollow = 2;
  BMKUserTrackingModeFollowWithHeading = 3;
  BMKLogoPositionLeftBottom = 0;
  BMKLogoPositionLeftTop = 1;
  BMKLogoPositionCenterBottom = 2;
  BMKLogoPositionCenterTop = 3;
  BMKLogoPositionRightBottom = 4;
  BMKLogoPositionRightTop = 5;
  BMKSwitchIndoorFloorSuccess = 0;
  BMKSwitchIndoorFloorFailed = 1;
  BMKSwitchIndoorFloorNotFocused = 2;
  BMKSwitchIndoorFloorNotExist = 3;
  TYPE_OFFLINE_UPDATE = 0;
  TYPE_OFFLINE_ZIPCNT = 1;
  TYPE_OFFLINE_UNZIP = 2;
  TYPE_OFFLINE_ERRZIP = 3;
  TYPE_OFFLINE_NEWVER = 4;
  TYPE_OFFLINE_UNZIPFINISH = 5;
  TYPE_OFFLINE_ADD = 6;
  BMKPinAnnotationColorRed = 0;
  BMKPinAnnotationColorGreen = 1;
  BMKPinAnnotationColorPurple = 2;

type

  // ===== Forward declarations =====
{$M+}
  BMKActionPaopaoView = interface;
  BMKAnnotation = interface;
  BMKMapView = interface;
  BMKAnnotationView = interface;
  BMKShape = interface;
  BMKMultiPoint = interface;
  BMKOverlay = interface;
  BMKArcline = interface;
  BMKOverlayView = interface;
  BMKOverlayGLBasicView = interface;
  BMKArclineView = interface;
  BMKBaseIndoorMapInfo = interface;
  BMKCircle = interface;
  BMKCircleView = interface;
  BMKGradient = interface;
  BMKGroundOverlay = interface;
  BMKOverlayPathView = interface;
  BMKGroundOverlayView = interface;
  BMKHeatMapNode = interface;
  BMKHeatMap = interface;
  BMKLocationViewDisplayParam = interface;
  BMKMapStatus = interface;
  BMKMapViewDelegate = interface;
  BMKMapPoi = interface;
  BMKOLSearchRecord = interface;
  BMKOLUpdateElement = interface;
  BMKOfflineMapDelegate = interface;
  BMKOfflineMap = interface;
  BMKPointAnnotation = interface;
  BMKPinAnnotationView = interface;
  BMKPolyline = interface;
  BMKPolygon = interface;
  BMKPolygonView = interface;
  BMKPolylineView = interface;
  BMKTileLayer = interface;
  BMKURLTileLayer = interface;
  BMKSyncTileLayer = interface;
  BMKAsyncTileLayer = interface;
  BMKTileLayerView = interface;

  // ===== Framework typedefs =====
{$M+}

  BMKAnnotationViewDragState = NSUInteger;

  BMKMapPoint = record
    x: Double;
    y: Double;
  end;

  BMKMapSize = record
    width: Double;
    height: Double;
  end;

  BMKMapRect = record
    origin: BMKMapPoint;
    size: BMKMapSize;
  end;

  BMKZoomScale = CGFloat;

  BMKCoordinateBounds = record
    northEast: CLLocationCoordinate2D;
    southWest: CLLocationCoordinate2D;
  end;

  BMKUserTrackingMode = Cardinal;
  BMKLogoPosition = Cardinal;
  BMKSwitchIndoorFloorError = Cardinal;
  BMKMapType = NSUInteger;

  BMKCoordinateSpan = record
    latitudeDelta: CLLocationDegrees;
    longitudeDelta: CLLocationDegrees;
  end;

  BMKCoordinateRegion = record
    center: CLLocationCoordinate2D;
    span: BMKCoordinateSpan;
  end;

  BMKPinAnnotationColor = NSUInteger;

  TBaiduMapAPI_MapResult = procedure(param1: UIImage; param2: NSError)
    of object;
  // ===== Interface declarations =====

  BMKActionPaopaoViewClass = interface(UIViewClass)
    ['{0E207495-2EFF-4937-A20D-E44415719686}']
  end;

  BMKActionPaopaoView = interface(UIView)
    ['{3B9C6672-A2C4-4E30-99B7-69F7F3EAA1AC}']
    function initWithCustomView(customView: UIView): Pointer; cdecl;
  end;

  TBMKActionPaopaoView = class(TOCGenericImport<BMKActionPaopaoViewClass,
    BMKActionPaopaoView>)
  end;

  PBMKActionPaopaoView = Pointer;

  BMKMapViewClass = interface(UIViewClass)
    ['{8DA9F5C5-5FD2-4246-A764-57AE2DDEAF94}']
    { class } procedure customMapStyle(customMapStyleJsonFilePath
      : NSString); cdecl;

    { class } procedure enableCustomMapStyle(enable: Boolean); cdecl;
    { class } procedure willBackGround; cdecl;
    { class } procedure didForeGround; cdecl;
  end;

  BMKMapView = interface(UIView)
    ['{6A3EE881-4FA1-4C24-97FD-40C5A866679F}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure setMapType(mapType: BMKMapType); cdecl;
    function mapType: BMKMapType; cdecl;
    [MethodName('setRegion:')]
    procedure setRegion(region: BMKCoordinateRegion); cdecl;
    function region: BMKCoordinateRegion; cdecl;
    procedure setLimitMapRegion(limitMapRegion: BMKCoordinateRegion); cdecl;
    function limitMapRegion: BMKCoordinateRegion; cdecl;
    procedure setCompassPosition(compassPosition: CGPoint); cdecl;
    function compassPosition: CGPoint; cdecl;
    function compassSize: CGSize; cdecl;
    [MethodName('setCenterCoordinate:')]
    procedure setCenterCoordinate(centerCoordinate
      : CLLocationCoordinate2D); cdecl;
    function centerCoordinate: CLLocationCoordinate2D; cdecl;
    procedure setZoomLevel(zoomLevel: Single); cdecl;
    function zoomLevel: Single; cdecl;
    procedure setMinZoomLevel(minZoomLevel: Single); cdecl;
    function minZoomLevel: Single; cdecl;
    procedure setMaxZoomLevel(maxZoomLevel: Single); cdecl;
    function maxZoomLevel: Single; cdecl;
    procedure setRotation(rotation: Integer); cdecl;
    function rotation: Integer; cdecl;
    procedure setOverlooking(overlooking: Integer); cdecl;
    function overlooking: Integer; cdecl;
    procedure setBuildingsEnabled(buildingsEnabled: Boolean); cdecl;
    function isBuildingsEnabled: Boolean; cdecl;
    procedure setShowMapPoi(showMapPoi: Boolean); cdecl;
    function showMapPoi: Boolean; cdecl;
    procedure setTrafficEnabled(trafficEnabled: Boolean); cdecl;
    function isTrafficEnabled: Boolean; cdecl;
    procedure setBaiduHeatMapEnabled(baiduHeatMapEnabled: Boolean); cdecl;
    function isBaiduHeatMapEnabled: Boolean; cdecl;
    procedure setGesturesEnabled(gesturesEnabled: Boolean); cdecl;
    function gesturesEnabled: Boolean; cdecl;
    procedure setZoomEnabled(zoomEnabled: Boolean); cdecl;
    function isZoomEnabled: Boolean; cdecl;
    procedure setZoomEnabledWithTap(zoomEnabledWithTap: Boolean); cdecl;
    function isZoomEnabledWithTap: Boolean; cdecl;
    procedure setScrollEnabled(scrollEnabled: Boolean); cdecl;
    function isScrollEnabled: Boolean; cdecl;
    procedure setOverlookEnabled(overlookEnabled: Boolean); cdecl;
    function isOverlookEnabled: Boolean; cdecl;
    procedure setRotateEnabled(rotateEnabled: Boolean); cdecl;
    function isRotateEnabled: Boolean; cdecl;
    procedure setForceTouchEnabled(forceTouchEnabled: Boolean); cdecl;
    function forceTouchEnabled: Boolean; cdecl;
    procedure setShowMapScaleBar(showMapScaleBar: Boolean); cdecl;
    function showMapScaleBar: Boolean; cdecl;
    procedure setMapScaleBarPosition(mapScaleBarPosition: CGPoint); cdecl;
    function mapScaleBarPosition: CGPoint; cdecl;
    function mapScaleBarSize: CGSize; cdecl;
    procedure setLogoPosition(logoPosition: BMKLogoPosition); cdecl;
    function logoPosition: BMKLogoPosition; cdecl;
    [MethodName('setVisibleMapRect:')]
    procedure setVisibleMapRect(visibleMapRect: BMKMapRect); cdecl;
    function visibleMapRect: BMKMapRect; cdecl;
    procedure setMapPadding(mapPadding: UIEdgeInsets); cdecl;
    function mapPadding: UIEdgeInsets; cdecl;
    procedure setUpdateTargetScreenPtWhenMapPaddingChanged
      (updateTargetScreenPtWhenMapPaddingChanged: Boolean); cdecl;
    function updateTargetScreenPtWhenMapPaddingChanged: Boolean; cdecl;
    procedure setChangeWithTouchPointCenterEnabled
      (ChangeWithTouchPointCenterEnabled: Boolean); cdecl;
    function isChangeWithTouchPointCenterEnabled: Boolean; cdecl;
    procedure viewWillAppear; cdecl;
    procedure viewWillDisappear; cdecl;
    procedure mapForceRefresh; cdecl;
    function zoomIn: Boolean; cdecl;
    function zoomOut: Boolean; cdecl;
    function regionThatFits(region: BMKCoordinateRegion)
      : BMKCoordinateRegion; cdecl;
    [MethodName('setRegion:animated:')]
    procedure setRegionAnimated(region: BMKCoordinateRegion;
      animated: Boolean); cdecl;
    [MethodName('setCenterCoordinate:animated:')]
    procedure setCenterCoordinateAnimated(coordinate: CLLocationCoordinate2D;
      animated: Boolean); cdecl;
    [MethodName('takeSnapshot')]
    function takeSnapshot: UIImage; cdecl; overload;
    [MethodName('takeSnapshot:')]
    function takeSnapshot(rect: CGRect): UIImage; cdecl; overload;
    procedure setCompassImage(image: UIImage); cdecl;
    [MethodName('setVisibleMapRect:animated:')]
    procedure setVisibleMapRectAnimated(mapRect: BMKMapRect;
      animated: Boolean); cdecl;
    [MethodName('mapRectThatFits:')]
    function mapRectThatFits(mapRect: BMKMapRect): BMKMapRect; cdecl;
    [MethodName('setVisibleMapRect:edgePadding:animated:')
      ]
    procedure setVisibleMapRectEdgePaddingAnimated(mapRect: BMKMapRect;
      edgePadding: UIEdgeInsets; animated: Boolean); cdecl;
    [MethodName('mapRectThatFits:edgePadding:')]
    function mapRectThatFitsEdgePadding(mapRect: BMKMapRect;
      edgePadding: UIEdgeInsets): BMKMapRect; cdecl;
    function convertCoordinate(coordinate: CLLocationCoordinate2D;
      toPointToView: UIView): CGPoint; cdecl;
    function convertPoint(point: CGPoint; toCoordinateFromView: UIView)
      : CLLocationCoordinate2D; cdecl;
    function convertRegion(region: BMKCoordinateRegion; toRectToView: UIView)
      : CGRect; cdecl;
    [MethodName('convertRect:toRegionFromView:')]
    function convertRectToRegionFromView(rect: CGRect; toRegionFromView: UIView)
      : BMKCoordinateRegion; cdecl;
    function convertMapRect(mapRect: BMKMapRect; toRectToView: UIView)
      : CGRect; cdecl;
    [MethodName('convertRect:toMapRectFromView:')]
    function convertRectToMapRectFromView(rect: CGRect;
      toMapRectFromView: UIView): BMKMapRect; cdecl;
    function glPointForMapPoint(mapPoint: BMKMapPoint): CGPoint; cdecl;
    function glPointsForMapPoints(mapPoints: Pointer; count: NSUInteger)
      : Pointer; cdecl;
    procedure setMapCenterToScreenPt(ptInScreen: CGPoint); cdecl;
    function getMapStatus: BMKMapStatus; cdecl;
    [MethodName('setMapStatus:')]
    procedure setMapStatus(mapStatus: BMKMapStatus); cdecl;
    [MethodName('setMapStatus:withAnimation:')]
    procedure setMapStatusWithAnimation(mapStatus: BMKMapStatus;
      withAnimation: Boolean); cdecl;
    [MethodName('setMapStatus:withAnimation:withAnimationTime:')
      ]
    procedure setMapStatusWithAnimationWithAnimationTime
      (mapStatus: BMKMapStatus; withAnimation: Boolean;
      withAnimationTime: Integer); cdecl;
    function isSurpportBaiduHeatMap: Boolean; cdecl;
    procedure setBaseIndoorMapEnabled(baseIndoorMapEnabled: Boolean); cdecl;
    function baseIndoorMapEnabled: Boolean; cdecl;
    procedure setShowIndoorMapPoi(showIndoorMapPoi: Boolean); cdecl;
    function showIndoorMapPoi: Boolean; cdecl;
    function switchBaseIndoorMapFloor(strFloor: NSString; withID: NSString)
      : BMKSwitchIndoorFloorError; cdecl;
    function getFocusedBaseIndoorMapInfo: BMKBaseIndoorMapInfo; cdecl;
    procedure setShowsUserLocation(showsUserLocation: Boolean); cdecl;
    function showsUserLocation: Boolean; cdecl;
    procedure setUserTrackingMode(userTrackingMode: BMKUserTrackingMode); cdecl;
    function userTrackingMode: BMKUserTrackingMode; cdecl;
    function isUserLocationVisible: Boolean; cdecl;
    procedure updateLocationViewWithParam(locationViewDisplayParam
      : BMKLocationViewDisplayParam); cdecl;
    procedure updateLocationData(userLocation: BMKUserLocation); cdecl;
    function annotations: NSArray; cdecl;
    procedure setIsSelectedAnnotationViewFront(isSelectedAnnotationViewFront
      : Boolean); cdecl;
    function isSelectedAnnotationViewFront: Boolean; cdecl;
    procedure addAnnotation(annotation: Pointer); cdecl;
    procedure addAnnotations(annotations: NSArray); cdecl;
    procedure removeAnnotation(annotation: Pointer); cdecl;
    procedure removeAnnotations(annotations: NSArray); cdecl;
    function viewForAnnotation(annotation: Pointer): BMKAnnotationView; cdecl;
    function dequeueReusableAnnotationViewWithIdentifier(identifier: NSString)
      : BMKAnnotationView; cdecl;
    procedure selectAnnotation(annotation: Pointer; animated: Boolean); cdecl;
    procedure deselectAnnotation(annotation: Pointer; animated: Boolean); cdecl;
    procedure showAnnotations(annotations: NSArray; animated: Boolean); cdecl;
    function annotationsInCoordinateBounds(bounds: BMKCoordinateBounds)
      : NSArray; cdecl;
    procedure addOverlay(overlay: Pointer); cdecl;
    procedure addOverlays(overlays: NSArray); cdecl;
    procedure removeOverlay(overlay: Pointer); cdecl;
    procedure removeOverlays(overlays: NSArray); cdecl;
    [MethodName('insertOverlay:atIndex:')]
    procedure insertOverlayAtIndex(overlay: Pointer;
      atIndex: NSUInteger); cdecl;
    procedure exchangeOverlayAtIndex(index1: NSUInteger;
      withOverlayAtIndex: NSUInteger); cdecl;
    [MethodName('insertOverlay:aboveOverlay:')]
    procedure insertOverlayAboveOverlay(overlay: Pointer;
      aboveOverlay: Pointer); cdecl;
    [MethodName('insertOverlay:belowOverlay:')]
    procedure insertOverlayBelowOverlay(overlay: Pointer;
      belowOverlay: Pointer); cdecl;
    function overlays: NSArray; cdecl;
    function viewForOverlay(overlay: Pointer): BMKOverlayView; cdecl;
    procedure addHeatMap(heatMap: BMKHeatMap); cdecl;
    procedure removeHeatMap; cdecl;
  end;

  TBMKMapView = class(TOCGenericImport<BMKMapViewClass, BMKMapView>)
  end;

  PBMKMapView = Pointer;

  BMKAnnotationViewClass = interface(UIViewClass)
    ['{BA0E736B-4D34-4290-A34D-6E24B572884C}']
  end;

  BMKAnnotationView = interface(UIView)
    ['{A8D7AD24-C6DC-4BC7-8551-32C9187D6BDE}']
    function initWithAnnotation(annotation: Pointer; reuseIdentifier: NSString)
      : Pointer; cdecl;
    function reuseIdentifier: NSString; cdecl;
    procedure setPaopaoView(paopaoView: BMKActionPaopaoView); cdecl;
    function paopaoView: BMKActionPaopaoView; cdecl;
    procedure prepareForReuse; cdecl;
    procedure setAnnotation(annotation: Pointer); cdecl;
    function annotation: Pointer; cdecl;
    procedure setImage(image: UIImage); cdecl;
    function image: UIImage; cdecl;
    procedure setCenterOffset(centerOffset: CGPoint); cdecl;
    function centerOffset: CGPoint; cdecl;
    procedure setCalloutOffset(calloutOffset: CGPoint); cdecl;
    function calloutOffset: CGPoint; cdecl;
    procedure setEnabled3D(enabled3D: Boolean); cdecl;
    function enabled3D: Boolean; cdecl;
    procedure setEnabled(enabled: Boolean); cdecl;
    function isEnabled: Boolean; cdecl;
    [MethodName('setSelected:')]
    procedure setSelected(selected: Boolean); cdecl;
    function isSelected: Boolean; cdecl;
    [MethodName('setSelected:animated:')]
    procedure setSelectedAnimated(selected: Boolean; animated: Boolean); cdecl;
    procedure setCanShowCallout(canShowCallout: Boolean); cdecl;
    function canShowCallout: Boolean; cdecl;
    procedure setLeftCalloutAccessoryView(leftCalloutAccessoryView
      : UIView); cdecl;
    function leftCalloutAccessoryView: UIView; cdecl;
    procedure setRightCalloutAccessoryView(rightCalloutAccessoryView
      : UIView); cdecl;
    function rightCalloutAccessoryView: UIView; cdecl;
    procedure setDraggable(draggable: Boolean); cdecl;
    function isDraggable: Boolean; cdecl;
    procedure setDragState(dragState: BMKAnnotationViewDragState); cdecl;
    function dragState: BMKAnnotationViewDragState; cdecl;
  end;

  TBMKAnnotationView = class(TOCGenericImport<BMKAnnotationViewClass,
    BMKAnnotationView>)
  end;

  PBMKAnnotationView = Pointer;

  BMKShapeClass = interface(NSObjectClass)
    ['{27586084-A22C-45EF-B450-EE544AB8D879}']
  end;

  BMKShape = interface(NSObject)
    ['{CCB637FF-BFB5-449D-A17F-7219F13070EF}']
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure setSubtitle(subtitle: NSString); cdecl;
    function subtitle: NSString; cdecl;
  end;

  TBMKShape = class(TOCGenericImport<BMKShapeClass, BMKShape>)
  end;

  PBMKShape = Pointer;

  BMKMultiPointClass = interface(BMKShapeClass)
    ['{680A0682-26A4-4E5A-A157-406438B261A1}']
  end;

  BMKMultiPoint = interface(BMKShape)
    ['{745E8206-8517-470B-BD4D-FB7BE856433E}']
    function points: Pointer; cdecl;
    function pointCount: NSUInteger; cdecl;
    procedure getCoordinates(coords: Pointer; range: NSRange); cdecl;
  end;

  TBMKMultiPoint = class(TOCGenericImport<BMKMultiPointClass, BMKMultiPoint>)
  end;

  PBMKMultiPoint = Pointer;

  BMKArclineClass = interface(BMKMultiPointClass)
    ['{8BEC0093-661D-4742-B9D1-2FA285C4BDCD}']
    { class } function arclineWithPoints(points: Pointer): BMKArcline; cdecl;
    { class } function arclineWithCoordinates(coords: Pointer)
      : BMKArcline; cdecl;
  end;

  BMKArcline = interface(BMKMultiPoint)
    ['{3260E1BC-6C4F-447D-AD0A-9D0AB033C24B}']
    function setArclineWithPoints(points: Pointer): Boolean; cdecl;
    function setArclineWithCoordinates(coords: Pointer): Boolean; cdecl;
  end;

  TBMKArcline = class(TOCGenericImport<BMKArclineClass, BMKArcline>)
  end;

  PBMKArcline = Pointer;

  BMKOverlayViewClass = interface(UIViewClass)
    ['{A1E65476-4932-4EC6-8ADA-7829553DAD5B}']
  end;

  BMKOverlayView = interface(UIView)
    ['{5126423D-9F61-40F6-B146-671076B933CE}']
    procedure setOverlayGeometryDelegate(delegate: Pointer); cdecl;
    function initWithOverlay(overlay: Pointer): Pointer; cdecl;
    function overlay: Pointer; cdecl;
    function pointForMapPoint(mapPoint: BMKMapPoint): CGPoint; cdecl;
    function mapPointForPoint(point: CGPoint): BMKMapPoint; cdecl;
    function rectForMapRect(mapRect: BMKMapRect): CGRect; cdecl;
    function mapRectForRect(rect: CGRect): BMKMapRect; cdecl;
    function canDrawMapRect(mapRect: BMKMapRect; zoomScale: BMKZoomScale)
      : Boolean; cdecl;
    procedure drawMapRect(mapRect: BMKMapRect; zoomScale: BMKZoomScale;
      inContext: CGContextRef); cdecl;
    procedure setNeedsDisplayInMapRect(mapRect: BMKMapRect); cdecl;
    [MethodName
      ('renderLinesWithPoints:pointCount:strokeColor:lineWidth:looped:')
      ]
    procedure renderLinesWithPointsPointCountStrokeColorLineWidthLooped
      (points: Pointer; pointCount: NSUInteger; strokeColor: UIColor;
      lineWidth: CGFloat; looped: Boolean); cdecl;
    [MethodName
      ('renderLinesWithPoints:pointCount:strokeColor:lineWidth:looped:lineDash:')
      ]
    procedure renderLinesWithPointsPointCountStrokeColorLineWidthLoopedLineDash
      (points: Pointer; pointCount: NSUInteger; strokeColor: UIColor;
      lineWidth: CGFloat; looped: Boolean; lineDash: Boolean); cdecl;
    [MethodName
      ('renderTexturedLinesWithPoints:pointCount:lineWidth:textureID:looped:')
      ]
    procedure renderTexturedLinesWithPointsPointCountLineWidthTextureIDLooped
      (points: Pointer; pointCount: NSUInteger; lineWidth: CGFloat;
      textureID: GLuint; looped: Boolean); cdecl;
    [MethodName
      ('renderTexturedLinesWithPoints:pointCount:lineWidth:textureID:strokeColor:looped:tileTexture:keepScale:')
      ]
    procedure renderTexturedLinesWithPointsPointCountLineWidthTextureIDStrokeColorLoopedTileTextureKeepScale
      (points: Pointer; pointCount: NSUInteger; lineWidth: CGFloat;
      textureID: GLuint; strokeColor: UIColor; looped: Boolean;
      tileTexture: Boolean; keepScale: Boolean); cdecl;
    [MethodName
      ('renderTexturedLinesWithPartPoints:lineWidth:textureIndexs:isFocus:')
      ]
    procedure renderTexturedLinesWithPartPointsLineWidthTextureIndexsIsFocus
      (partPt: NSArray; lineWidth: CGFloat; textureIndexs: NSArray;
      isFocus: Boolean); cdecl;
    [MethodName
      ('renderTexturedLinesWithPartPoints:lineWidth:textureIndexs:isFocus:tileTexture:keepScale:')
      ]
    procedure renderTexturedLinesWithPartPointsLineWidthTextureIndexsIsFocusTileTextureKeepScale
      (partPt: NSArray; lineWidth: CGFloat; textureIndexs: NSArray;
      isFocus: Boolean; tileTexture: Boolean; keepScale: Boolean); cdecl;
    procedure renderRegionWithPoints(points: Pointer; pointCount: NSUInteger;
      fillColor: UIColor; usingTriangleFan: Boolean); cdecl;
    procedure renderATRegionWithPoint(points: Pointer; pointCount: NSUInteger;
      fillColor: UIColor; usingTriangleFan: Boolean); cdecl;
    procedure glRender; cdecl;
    function strokeTextureID: GLuint; cdecl;
    function loadStrokeTextureImage(textureImage: UIImage): GLuint; cdecl;
    function loadStrokeTextureImages(textureImages: NSArray): Boolean; cdecl;
    procedure setColors(colors: NSArray); cdecl;
    function colors: NSArray; cdecl;
  end;

  TBMKOverlayView = class(TOCGenericImport<BMKOverlayViewClass, BMKOverlayView>)
  end;

  PBMKOverlayView = Pointer;

  BMKOverlayGLBasicViewClass = interface(BMKOverlayViewClass)
    ['{853A14EA-0A53-4021-ABEA-AE7BCB686A57}']
  end;

  BMKOverlayGLBasicView = interface(BMKOverlayView)
    ['{98548651-3D4F-4E9A-814A-D0E119EEFD34}']
    procedure setFillColor(fillColor: UIColor); cdecl;
    function fillColor: UIColor; cdecl;
    procedure setStrokeColor(strokeColor: UIColor); cdecl;
    function strokeColor: UIColor; cdecl;
    procedure setLineWidth(lineWidth: CGFloat); cdecl;
    function lineWidth: CGFloat; cdecl;
    procedure setPath(path: CGPathRef); cdecl;
    function path: CGPathRef; cdecl;
    procedure setLineDash(lineDash: Boolean); cdecl;
    function lineDash: Boolean; cdecl;
    procedure setTileTexture(tileTexture: Boolean); cdecl;
    function tileTexture: Boolean; cdecl;
    procedure setKeepScale(keepScale: Boolean); cdecl;
    function keepScale: Boolean; cdecl;
  end;

  TBMKOverlayGLBasicView = class(TOCGenericImport<BMKOverlayGLBasicViewClass,
    BMKOverlayGLBasicView>)
  end;

  PBMKOverlayGLBasicView = Pointer;

  BMKArclineViewClass = interface(BMKOverlayGLBasicViewClass)
    ['{F6E48B08-D3A0-4F8D-A224-C294D19F37D7}']
  end;

  BMKArclineView = interface(BMKOverlayGLBasicView)
    ['{03B78B0B-F251-4E08-893A-687B8ECA6F05}']
    function initWithArcline(arcline: BMKArcline): Pointer; cdecl;
    function arcline: BMKArcline; cdecl;
  end;

  TBMKArclineView = class(TOCGenericImport<BMKArclineViewClass, BMKArclineView>)
  end;

  PBMKArclineView = Pointer;

  BMKBaseIndoorMapInfoClass = interface(NSObjectClass)
    ['{3D4F28BD-700D-4DC3-BA38-E3891EA1D60C}']
  end;

  BMKBaseIndoorMapInfo = interface(NSObject)
    ['{EDDBEAC7-E361-4A41-A87A-9F18C94965F6}']
    procedure setStrID(strID: NSString); cdecl;
    function strID: NSString; cdecl;
    procedure setStrFloor(strFloor: NSString); cdecl;
    function strFloor: NSString; cdecl;
    procedure setArrStrFloors(arrStrFloors: NSMutableArray); cdecl;
    function arrStrFloors: NSMutableArray; cdecl;
  end;

  TBMKBaseIndoorMapInfo = class(TOCGenericImport<BMKBaseIndoorMapInfoClass,
    BMKBaseIndoorMapInfo>)
  end;

  PBMKBaseIndoorMapInfo = Pointer;

  BMKCircleClass = interface(BMKMultiPointClass)
    ['{0C01A6A5-E0B4-497C-B053-5E4F889230D5}']
    { class } function circleWithCenterCoordinate(coord: CLLocationCoordinate2D;
      radius: CLLocationDistance): BMKCircle; cdecl;
    { class } function circleWithMapRect(mapRect: BMKMapRect): BMKCircle; cdecl;
  end;

  BMKCircle = interface(BMKMultiPoint)
    ['{20FF6B6C-F4E5-43F0-876A-5932803A145A}']
    procedure setCoordinate(coordinate: CLLocationCoordinate2D); cdecl;
    function coordinate: CLLocationCoordinate2D; cdecl;
    procedure setRadius(radius: CLLocationDistance); cdecl;
    function radius: CLLocationDistance; cdecl;
    function boundingMapRect: BMKMapRect; cdecl;
    function setCircleWithCenterCoordinate(coord: CLLocationCoordinate2D;
      radius: CLLocationDistance): Boolean; cdecl;
    function setCircleWithMapRect(mapRect: BMKMapRect): Boolean; cdecl;
  end;

  TBMKCircle = class(TOCGenericImport<BMKCircleClass, BMKCircle>)
  end;

  PBMKCircle = Pointer;

  BMKCircleViewClass = interface(BMKOverlayGLBasicViewClass)
    ['{28C99DF8-C635-400A-A6CD-2E69D69E4508}']
  end;

  BMKCircleView = interface(BMKOverlayGLBasicView)
    ['{2F12B27C-3FF0-4CE0-90D5-8657AC60B519}']
    function initWithCircle(circle: BMKCircle): Pointer; cdecl;
    function circle: BMKCircle; cdecl;
  end;

  TBMKCircleView = class(TOCGenericImport<BMKCircleViewClass, BMKCircleView>)
  end;

  PBMKCircleView = Pointer;

  BMKGradientClass = interface(NSObjectClass)
    ['{BDA94C29-8C2D-4A78-99D1-84B130D4A999}']
  end;

  BMKGradient = interface(NSObject)
    ['{E1580EAF-3A82-41EF-AA93-ECA41F50636A}']
    procedure setMColors(mColors: NSArray); cdecl;
    function mColors: NSArray; cdecl;
    procedure setMStartPoints(mStartPoints: NSArray); cdecl;
    function mStartPoints: NSArray; cdecl;
    function initWithColors(colors: NSArray; startPoints: NSArray)
      : Pointer; cdecl;
  end;

  TBMKGradient = class(TOCGenericImport<BMKGradientClass, BMKGradient>)
  end;

  PBMKGradient = Pointer;

  BMKGroundOverlayClass = interface(BMKMultiPointClass)
    ['{3D47C0D8-9511-45BC-9987-E25D2B5CAAD2}']
    { class } function groundOverlayWithPosition
      (position: CLLocationCoordinate2D; zoomLevel: CGFloat; anchor: CGPoint;
      icon: UIImage): BMKGroundOverlay; cdecl;
    { class } function groundOverlayWithBounds(bounds: BMKCoordinateBounds;
      icon: UIImage): BMKGroundOverlay; cdecl;
  end;

  BMKGroundOverlay = interface(BMKMultiPoint)
    ['{2411844A-1842-4B35-B7F3-268AEEE04C55}']
    procedure setPt(pt: CLLocationCoordinate2D); cdecl;
    function pt: CLLocationCoordinate2D; cdecl;
    procedure setAnchor(anchor: CGPoint); cdecl;
    function anchor: CGPoint; cdecl;
    procedure setBound(bound: BMKCoordinateBounds); cdecl;
    function bound: BMKCoordinateBounds; cdecl;
    procedure setIcon(icon: UIImage); cdecl;
    function icon: UIImage; cdecl;
    procedure setAlpha(alpha: GLfloat); cdecl;
    function alpha: GLfloat; cdecl;
  end;

  TBMKGroundOverlay = class(TOCGenericImport<BMKGroundOverlayClass,
    BMKGroundOverlay>)
  end;

  PBMKGroundOverlay = Pointer;

  BMKOverlayPathViewClass = interface(BMKOverlayViewClass)
    ['{A85E3629-BC7A-4B30-8DE4-14251B66F01C}']
  end;

  BMKOverlayPathView = interface(BMKOverlayView)
    ['{1BEDBBA3-137E-4EC5-A419-44C1808BE68C}']
    procedure setFillColor(fillColor: UIColor); cdecl;
    function fillColor: UIColor; cdecl;
    procedure setStrokeColor(strokeColor: UIColor); cdecl;
    function strokeColor: UIColor; cdecl;
    procedure setLineWidth(lineWidth: CGFloat); cdecl;
    function lineWidth: CGFloat; cdecl;
    procedure setLineJoin(lineJoin: CGLineJoin); cdecl;
    function lineJoin: CGLineJoin; cdecl;
    procedure setLineCap(lineCap: CGLineCap); cdecl;
    function lineCap: CGLineCap; cdecl;
    procedure setMiterLimit(miterLimit: CGFloat); cdecl;
    function miterLimit: CGFloat; cdecl;
    procedure setLineDashPhase(lineDashPhase: CGFloat); cdecl;
    function lineDashPhase: CGFloat; cdecl;
    procedure setLineDashPattern(lineDashPattern: NSArray); cdecl;
    function lineDashPattern: NSArray; cdecl;
    procedure createPath; cdecl;
    procedure setPath(path: CGPathRef); cdecl;
    function path: CGPathRef; cdecl;
    procedure invalidatePath; cdecl;
    procedure applyStrokePropertiesToContext(context: CGContextRef;
      atZoomScale: BMKZoomScale); cdecl;
    procedure applyFillPropertiesToContext(context: CGContextRef;
      atZoomScale: BMKZoomScale); cdecl;
    procedure strokePath(path: CGPathRef; inContext: CGContextRef); cdecl;
    procedure fillPath(path: CGPathRef; inContext: CGContextRef); cdecl;
  end;

  TBMKOverlayPathView = class(TOCGenericImport<BMKOverlayPathViewClass,
    BMKOverlayPathView>)
  end;

  PBMKOverlayPathView = Pointer;

  BMKGroundOverlayViewClass = interface(BMKOverlayViewClass)
    ['{1929A559-8D0A-4CFE-9500-7F4A00DDCE9F}']
  end;

  BMKGroundOverlayView = interface(BMKOverlayView)
    ['{E55947AB-615B-49B2-A1AE-84ABA2CD988D}']
    function initWithGroundOverlay(groundOverlay: BMKGroundOverlay)
      : Pointer; cdecl;
    function groundOverlay: BMKGroundOverlay; cdecl;
  end;

  TBMKGroundOverlayView = class(TOCGenericImport<BMKGroundOverlayViewClass,
    BMKGroundOverlayView>)
  end;

  PBMKGroundOverlayView = Pointer;

  BMKHeatMapNodeClass = interface(NSObjectClass)
    ['{3FC46AB6-0297-4D64-82B6-D213A8924311}']
  end;

  BMKHeatMapNode = interface(NSObject)
    ['{C0FED045-7D05-4DC4-94CD-54A28F2B0A9D}']
    procedure setIntensity(intensity: Double); cdecl;
    function intensity: Double; cdecl;
    procedure setPt(pt: CLLocationCoordinate2D); cdecl;
    function pt: CLLocationCoordinate2D; cdecl;
  end;

  TBMKHeatMapNode = class(TOCGenericImport<BMKHeatMapNodeClass, BMKHeatMapNode>)
  end;

  PBMKHeatMapNode = Pointer;

  BMKHeatMapClass = interface(NSObjectClass)
    ['{080DC617-8F3D-4918-B63A-A7C3063A9F32}']
  end;

  BMKHeatMap = interface(NSObject)
    ['{5BE15EDC-5821-4906-9603-CB65629B630A}']
    procedure setMRadius(mRadius: Integer); cdecl;
    function mRadius: Integer; cdecl;
    procedure setMGradient(mGradient: BMKGradient); cdecl;
    function mGradient: BMKGradient; cdecl;
    procedure setMOpacity(mOpacity: Double); cdecl;
    function mOpacity: Double; cdecl;
    procedure setMData(mData: NSMutableArray); cdecl;
    function mData: NSMutableArray; cdecl;
  end;

  TBMKHeatMap = class(TOCGenericImport<BMKHeatMapClass, BMKHeatMap>)
  end;

  PBMKHeatMap = Pointer;

  BMKLocationViewDisplayParamClass = interface(NSObjectClass)
    ['{AF747671-0F90-458E-B831-2CF418872D56}']
  end;

  BMKLocationViewDisplayParam = interface(NSObject)
    ['{285307B2-3E70-4485-B79C-2D27D707E65C}']
    procedure setLocationViewOffsetX(locationViewOffsetX: CGFloat); cdecl;
    function locationViewOffsetX: CGFloat; cdecl;
    procedure setLocationViewOffsetY(locationViewOffsetY: CGFloat); cdecl;
    function locationViewOffsetY: CGFloat; cdecl;
    procedure setIsAccuracyCircleShow(isAccuracyCircleShow: Boolean); cdecl;
    function isAccuracyCircleShow: Boolean; cdecl;
    procedure setAccuracyCircleFillColor(accuracyCircleFillColor
      : UIColor); cdecl;
    function accuracyCircleFillColor: UIColor; cdecl;
    procedure setAccuracyCircleStrokeColor(accuracyCircleStrokeColor
      : UIColor); cdecl;
    function accuracyCircleStrokeColor: UIColor; cdecl;
    procedure setIsRotateAngleValid(isRotateAngleValid: Boolean); cdecl;
    function isRotateAngleValid: Boolean; cdecl;
    procedure setLocationViewImgName(locationViewImgName: NSString); cdecl;
    function locationViewImgName: NSString; cdecl;
  end;

  TBMKLocationViewDisplayParam = class
    (TOCGenericImport<BMKLocationViewDisplayParamClass,
    BMKLocationViewDisplayParam>)
  end;

  PBMKLocationViewDisplayParam = Pointer;

  BMKMapStatusClass = interface(NSObjectClass)
    ['{92DFC989-B4EE-435D-BCCD-C407224661E8}']
  end;

  BMKMapStatus = interface(NSObject)
    ['{091A301B-58A4-48C9-BC96-EB1793105F42}']
    procedure setFLevel(fLevel: Single); cdecl;
    function fLevel: Single; cdecl;
    procedure setFRotation(fRotation: Single); cdecl;
    function fRotation: Single; cdecl;
    procedure setFOverlooking(fOverlooking: Single); cdecl;
    function fOverlooking: Single; cdecl;
    procedure setTargetScreenPt(targetScreenPt: CGPoint); cdecl;
    function targetScreenPt: CGPoint; cdecl;
    procedure setTargetGeoPt(targetGeoPt: CLLocationCoordinate2D); cdecl;
    function targetGeoPt: CLLocationCoordinate2D; cdecl;
    function visibleMapRect: BMKMapRect; cdecl;
  end;

  TBMKMapStatus = class(TOCGenericImport<BMKMapStatusClass, BMKMapStatus>)
  end;

  PBMKMapStatus = Pointer;

  BMKMapPoiClass = interface(NSObjectClass)
    ['{EC177477-390B-43AA-A975-9F172B50D0AF}']
  end;

  BMKMapPoi = interface(NSObject)
    ['{8D837A60-C496-4648-BE3E-86F35A89FB86}']
    procedure setText(text: NSString); cdecl;
    function text: NSString; cdecl;
    procedure setPt(pt: CLLocationCoordinate2D); cdecl;
    function pt: CLLocationCoordinate2D; cdecl;
    procedure setUid(uid: NSString); cdecl;
    function uid: NSString; cdecl;
  end;

  TBMKMapPoi = class(TOCGenericImport<BMKMapPoiClass, BMKMapPoi>)
  end;

  PBMKMapPoi = Pointer;

  BMKOLSearchRecordClass = interface(NSObjectClass)
    ['{8560DB50-8639-495F-BCA9-72AF6A233993}']
  end;

  BMKOLSearchRecord = interface(NSObject)
    ['{EFE096EC-2AC5-4833-946D-32FA0C1F1E38}']
    procedure setCityName(cityName: NSString); cdecl;
    function cityName: NSString; cdecl;
    procedure setSize(size: Integer); cdecl;
    function size: Integer; cdecl;
    procedure setCityID(cityID: Integer); cdecl;
    function cityID: Integer; cdecl;
    procedure setCityType(cityType: Integer); cdecl;
    function cityType: Integer; cdecl;
    procedure setChildCities(childCities: NSArray); cdecl;
    function childCities: NSArray; cdecl;
  end;

  TBMKOLSearchRecord = class(TOCGenericImport<BMKOLSearchRecordClass,
    BMKOLSearchRecord>)
  end;

  PBMKOLSearchRecord = Pointer;

  BMKOLUpdateElementClass = interface(NSObjectClass)
    ['{01C8FFA8-BA10-4AA3-BA4C-7807E463AC48}']
  end;

  BMKOLUpdateElement = interface(NSObject)
    ['{7119AACB-2FC2-4A87-AAE9-95EE622E9273}']
    procedure setCityName(cityName: NSString); cdecl;
    function cityName: NSString; cdecl;
    procedure setCityID(cityID: Integer); cdecl;
    function cityID: Integer; cdecl;
    procedure setSize(size: Integer); cdecl;
    function size: Integer; cdecl;
    procedure setServersize(serversize: Integer); cdecl;
    function serversize: Integer; cdecl;
    procedure setRatio(ratio: Integer); cdecl;
    function ratio: Integer; cdecl;
    procedure setStatus(status: Integer); cdecl;
    function status: Integer; cdecl;
    procedure setUpdate(update: Boolean); cdecl;
    function update: Boolean; cdecl;
    procedure setPt(pt: CLLocationCoordinate2D); cdecl;
    function pt: CLLocationCoordinate2D; cdecl;
  end;

  TBMKOLUpdateElement = class(TOCGenericImport<BMKOLUpdateElementClass,
    BMKOLUpdateElement>)
  end;

  PBMKOLUpdateElement = Pointer;

  BMKOfflineMapClass = interface(NSObjectClass)
    ['{8713906E-A54D-4600-BB7D-179CF4AF9018}']
  end;

  BMKOfflineMap = interface(NSObject)
    ['{91FE929D-5342-4762-8D0A-9D5175151752}']
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    function scan(deleteFailedr: Boolean): Boolean; cdecl;
    function start(cityID: Integer): Boolean; cdecl;
    function update(cityID: Integer): Boolean; cdecl;
    function pause(cityID: Integer): Boolean; cdecl;
    function remove(cityID: Integer): Boolean; cdecl;
    function getHotCityList: NSArray; cdecl;
    function getOfflineCityList: NSArray; cdecl;
    function searchCity(cityName: NSString): NSArray; cdecl;
    function getAllUpdateInfo: NSArray; cdecl;
    function getUpdateInfo(cityID: Integer): BMKOLUpdateElement; cdecl;
  end;

  TBMKOfflineMap = class(TOCGenericImport<BMKOfflineMapClass, BMKOfflineMap>)
  end;

  PBMKOfflineMap = Pointer;

  BMKPointAnnotationClass = interface(BMKShapeClass)
    ['{E7D82F8D-D08F-4507-B623-4652D170D5D4}']
  end;

  BMKPointAnnotation = interface(BMKShape)
    ['{E83283CB-BE83-4A26-85B4-0BB53FF015D3}']
    procedure setCoordinate(coordinate: CLLocationCoordinate2D); cdecl;
    function coordinate: CLLocationCoordinate2D; cdecl;
  end;

  TBMKPointAnnotation = class(TOCGenericImport<BMKPointAnnotationClass,
    BMKPointAnnotation>)
  end;

  PBMKPointAnnotation = Pointer;

  BMKPinAnnotationViewClass = interface(BMKAnnotationViewClass)
    ['{BF418126-2A04-4228-9A12-70A98DB3C01C}']
  end;

  BMKPinAnnotationView = interface(BMKAnnotationView)
    ['{FA292F0C-CEC8-4107-8672-09800CC5FA0B}']
    procedure setPinColor(pinColor: BMKPinAnnotationColor); cdecl;
    function pinColor: BMKPinAnnotationColor; cdecl;
    procedure setAnimatesDrop(animatesDrop: Boolean); cdecl;
    function animatesDrop: Boolean; cdecl;
  end;

  TBMKPinAnnotationView = class(TOCGenericImport<BMKPinAnnotationViewClass,
    BMKPinAnnotationView>)
  end;

  PBMKPinAnnotationView = Pointer;

  BMKPolylineClass = interface(BMKMultiPointClass)
    ['{F7E679CB-35F7-41CA-AF64-F0D4A6949D8A}']
    [MethodName('polylineWithPoints:count:')]
    { class } function polylineWithPointsCount(points: Pointer;
      count: NSUInteger): BMKPolyline; cdecl;
    [MethodName('polylineWithCoordinates:count:')]
    { class } function polylineWithCoordinatesCount(coords: Pointer;
      count: NSUInteger): BMKPolyline; cdecl;
    [MethodName('polylineWithPoints:count:textureIndex:')
      ]
    { class } function polylineWithPointsCountTextureIndex(points: Pointer;
      count: NSUInteger; textureIndex: NSArray): BMKPolyline; cdecl;
    [MethodName('polylineWithCoordinates:count:textureIndex:')
      ]
    { class } function polylineWithCoordinatesCountTextureIndex(coords: Pointer;
      count: NSUInteger; textureIndex: NSArray): BMKPolyline; cdecl;
  end;

  BMKPolyline = interface(BMKMultiPoint)
    ['{EF065F42-7E14-42A0-8CD7-F35897DEAA1C}']
    [MethodName('setPolylineWithPoints:count:')]
    function setPolylineWithPointsCount(points: Pointer; count: NSInteger)
      : Boolean; cdecl;
    [MethodName('setPolylineWithCoordinates:count:')]
    function setPolylineWithCoordinatesCount(coords: Pointer; count: NSInteger)
      : Boolean; cdecl;
    procedure setTextureIndex(textureIndex: NSArray); cdecl;
    function textureIndex: NSArray; cdecl;
    [MethodName('setPolylineWithPoints:count:textureIndex:')
      ]
    function setPolylineWithPointsCountTextureIndex(points: Pointer;
      count: NSInteger; textureIndex: NSArray): Boolean; cdecl;
    [MethodName('setPolylineWithCoordinates:count:textureIndex:')
      ]
    function setPolylineWithCoordinatesCountTextureIndex(coords: Pointer;
      count: NSInteger; textureIndex: NSArray): Boolean; cdecl;
  end;

  TBMKPolyline = class(TOCGenericImport<BMKPolylineClass, BMKPolyline>)
  end;

  PBMKPolyline = Pointer;

  BMKPolygonClass = interface(BMKMultiPointClass)
    ['{E4F481A0-C15B-4761-A9C9-A9456CFC2EFF}']
    { class } function polygonWithPoints(points: Pointer; count: NSUInteger)
      : BMKPolygon; cdecl;
    { class } function polygonWithCoordinates(coords: Pointer;
      count: NSUInteger): BMKPolygon; cdecl;
  end;

  BMKPolygon = interface(BMKMultiPoint)
    ['{E072A25C-3D22-403A-A34D-F52AD34DA872}']
    function setPolygonWithPoints(points: Pointer; count: NSInteger)
      : Boolean; cdecl;
    function setPolygonWithCoordinates(coords: Pointer; count: NSInteger)
      : Boolean; cdecl;
  end;

  TBMKPolygon = class(TOCGenericImport<BMKPolygonClass, BMKPolygon>)
  end;

  PBMKPolygon = Pointer;

  BMKPolygonViewClass = interface(BMKOverlayGLBasicViewClass)
    ['{CCD5629C-5406-4668-A2D7-413D87875710}']
  end;

  BMKPolygonView = interface(BMKOverlayGLBasicView)
    ['{52D21328-A94E-43D4-B58C-B8D0F4FE26C5}']
    function initWithPolygon(polygon: BMKPolygon): Pointer; cdecl;
    function polygon: BMKPolygon; cdecl;
  end;

  TBMKPolygonView = class(TOCGenericImport<BMKPolygonViewClass, BMKPolygonView>)
  end;

  PBMKPolygonView = Pointer;

  BMKPolylineViewClass = interface(BMKOverlayGLBasicViewClass)
    ['{158C4B77-E944-4BA8-8F39-4EE33536C351}']
  end;

  BMKPolylineView = interface(BMKOverlayGLBasicView)
    ['{EEDB052E-B912-41E6-BA06-3E4CB3D0BE09}']
    function initWithPolyline(polyline: BMKPolyline): Pointer; cdecl;
    function polyline: BMKPolyline; cdecl;
    procedure setIsFocus(isFocus: Boolean); cdecl;
    function isFocus: Boolean; cdecl;
  end;

  TBMKPolylineView = class(TOCGenericImport<BMKPolylineViewClass,
    BMKPolylineView>)
  end;

  PBMKPolylineView = Pointer;

  BMKTileLayerClass = interface(NSObjectClass)
    ['{8F78439E-03F4-40D6-AA6A-70575B17F12C}']
  end;

  BMKTileLayer = interface(NSObject)
    ['{A5134314-277E-427E-BD4C-AE3C180FFDA1}']
    procedure setMinZoom(minZoom: NSInteger); cdecl;
    function minZoom: NSInteger; cdecl;
    procedure setMaxZoom(maxZoom: NSInteger); cdecl;
    function maxZoom: NSInteger; cdecl;
    procedure setVisibleMapRect(visibleMapRect: BMKMapRect); cdecl;
    function visibleMapRect: BMKMapRect; cdecl;
  end;

  TBMKTileLayer = class(TOCGenericImport<BMKTileLayerClass, BMKTileLayer>)
  end;

  PBMKTileLayer = Pointer;

  BMKURLTileLayerClass = interface(BMKTileLayerClass)
    ['{CAAC0036-FD4A-44BC-97E9-B0CB15EC739F}']
  end;

  BMKURLTileLayer = interface(BMKTileLayer)
    ['{DEA9A023-E4E9-4601-8D32-091533F8AE7E}']
    function URLTemplate: NSString; cdecl;
    function initWithURLTemplate(URLTemplate: NSString): Pointer; cdecl;
    function cleanTileDataCache: Boolean; cdecl;
  end;

  TBMKURLTileLayer = class(TOCGenericImport<BMKURLTileLayerClass,
    BMKURLTileLayer>)
  end;

  PBMKURLTileLayer = Pointer;

  BMKSyncTileLayerClass = interface(BMKTileLayerClass)
    ['{97A06845-0A16-47E2-8A20-FD203387E8A8}']
  end;

  BMKSyncTileLayer = interface(BMKTileLayer)
    ['{613CADB9-D817-4EA7-99CE-BE0BC9A5359B}']
    function tileForX(x: NSInteger; y: NSInteger; zoom: NSInteger)
      : UIImage; cdecl;
  end;

  TBMKSyncTileLayer = class(TOCGenericImport<BMKSyncTileLayerClass,
    BMKSyncTileLayer>)
  end;

  PBMKSyncTileLayer = Pointer;

  BMKAsyncTileLayerClass = interface(BMKTileLayerClass)
    ['{1DE58970-FB16-4D10-AC54-CCF8EEC922B0}']
  end;

  BMKAsyncTileLayer = interface(BMKTileLayer)
    ['{16DC5964-07FD-40DF-90DB-EE0800BF7D58}']
    procedure loadTileForX(x: NSInteger; y: NSInteger; zoom: NSInteger;
      result: TBaiduMapAPI_MapResult); cdecl;
  end;

  TBMKAsyncTileLayer = class(TOCGenericImport<BMKAsyncTileLayerClass,
    BMKAsyncTileLayer>)
  end;

  PBMKAsyncTileLayer = Pointer;

  BMKTileLayerViewClass = interface(BMKOverlayViewClass)
    ['{76D505AD-37B0-4FC9-9D76-F9A78B8DD2C6}']
  end;

  BMKTileLayerView = interface(BMKOverlayView)
    ['{6DCB40CC-150D-49A6-9714-016E00065BEE}']
    function initWithTileLayer(tileLayer: BMKTileLayer): Pointer; cdecl;
    function tileLayer: BMKTileLayer; cdecl;
  end;

  TBMKTileLayerView = class(TOCGenericImport<BMKTileLayerViewClass,
    BMKTileLayerView>)
  end;

  PBMKTileLayerView = Pointer;

  // ===== Protocol declarations =====

  BMKAnnotation = interface(IObjectiveC)
    ['{D5829859-F8EB-44C1-8143-2FB7410A0AFA}']
    function coordinate: CLLocationCoordinate2D; cdecl;
    function title: NSString; cdecl;
    function subtitle: NSString; cdecl;
    procedure setCoordinate(newCoordinate: CLLocationCoordinate2D); cdecl;
  end;

  BMKOverlay = interface(IObjectiveC)
    ['{3D38BCA4-B0A6-4239-B845-99276F02EDBC}']
    function coordinate: CLLocationCoordinate2D; cdecl;
    function boundingMapRect: BMKMapRect; cdecl;
    function intersectsMapRect(mapRect: BMKMapRect): Boolean; cdecl;
  end;

  BMKMapViewDelegate = interface(IObjectiveC)
    ['{B309E35D-B7F0-4143-B044-D20D43F59721}']
    procedure mapViewDidFinishLoading(mapView: BMKMapView); cdecl;
    procedure mapViewDidFinishRendering(mapView: BMKMapView); cdecl;
    [MethodName('mapView:onDrawMapFrame:')]
    procedure mapViewOnDrawMapFrame(mapView: BMKMapView;
      onDrawMapFrame: BMKMapStatus); cdecl;
    [MethodName('mapView:regionWillChangeAnimated:')]
    procedure mapViewRegionWillChangeAnimated(mapView: BMKMapView;
      regionWillChangeAnimated: Boolean); cdecl;
    [MethodName('mapView:regionDidChangeAnimated:')]
    procedure mapViewRegionDidChangeAnimated(mapView: BMKMapView;
      regionDidChangeAnimated: Boolean); cdecl;
    [MethodName('mapView:viewForAnnotation:')]
    function mapViewViewForAnnotation(mapView: BMKMapView;
      viewForAnnotation: Pointer): BMKAnnotationView; cdecl;
    [MethodName('mapView:didAddAnnotationViews:')]
    procedure mapViewDidAddAnnotationViews(mapView: BMKMapView;
      didAddAnnotationViews: NSArray); cdecl;
    [MethodName('mapView:didSelectAnnotationView:')]
    procedure mapViewDidSelectAnnotationView(mapView: BMKMapView;
      didSelectAnnotationView: BMKAnnotationView); cdecl;
    [MethodName('mapView:didDeselectAnnotationView:')]
    procedure mapViewDidDeselectAnnotationView(mapView: BMKMapView;
      didDeselectAnnotationView: BMKAnnotationView); cdecl;
    [MethodName('mapView:annotationView:didChangeDragState:fromOldState:')
      ]
    procedure mapViewAnnotationViewDidChangeDragStateFromOldState
      (mapView: BMKMapView; annotationView: BMKAnnotationView;
      didChangeDragState: BMKAnnotationViewDragState;
      fromOldState: BMKAnnotationViewDragState); cdecl;
    [MethodName('mapView:annotationViewForBubble:')]
    procedure mapViewAnnotationViewForBubble(mapView: BMKMapView;
      annotationViewForBubble: BMKAnnotationView); cdecl;
    [MethodName('mapView:viewForOverlay:')]
    function mapViewViewForOverlay(mapView: BMKMapView; viewForOverlay: Pointer)
      : BMKOverlayView; cdecl;
    [MethodName('mapView:didAddOverlayViews:')]
    procedure mapViewDidAddOverlayViews(mapView: BMKMapView;
      didAddOverlayViews: NSArray); cdecl;
    [MethodName('mapView:onClickedBMKOverlayView:')]
    procedure mapViewOnClickedBMKOverlayView(mapView: BMKMapView;
      onClickedBMKOverlayView: BMKOverlayView); cdecl;
    [MethodName('mapView:onClickedMapPoi:')]
    procedure mapViewOnClickedMapPoi(mapView: BMKMapView;
      onClickedMapPoi: BMKMapPoi); cdecl;
    [MethodName('mapView:onClickedMapBlank:')]
    procedure mapViewOnClickedMapBlank(mapView: BMKMapView;
      onClickedMapBlank: CLLocationCoordinate2D); cdecl;
    [MethodName('mapview:onDoubleClick:')]
    procedure mapviewOnDoubleClick(mapView: BMKMapView;
      onDoubleClick: CLLocationCoordinate2D); cdecl;
    [MethodName('mapview:onLongClick:')]
    procedure mapviewOnLongClick(mapView: BMKMapView;
      onLongClick: CLLocationCoordinate2D); cdecl;
    [MethodName('mapview:onForceTouch:force:maximumPossibleForce:')
      ]
    procedure mapviewOnForceTouchForceMaximumPossibleForce(mapView: BMKMapView;
      onForceTouch: CLLocationCoordinate2D; force: CGFloat;
      maximumPossibleForce: CGFloat); cdecl;
    procedure mapStatusDidChanged(mapView: BMKMapView); cdecl;
    [MethodName('mapview:baseIndoorMapWithIn:baseIndoorMapInfo:')
      ]
    procedure mapviewBaseIndoorMapWithInBaseIndoorMapInfo(mapView: BMKMapView;
      baseIndoorMapWithIn: Boolean;
      baseIndoorMapInfo: BMKBaseIndoorMapInfo); cdecl;
  end;

  BMKOfflineMapDelegate = interface(IObjectiveC)
    ['{C52D227D-E05A-4472-965F-BAE9C645DA0E}']
    procedure onGetOfflineMapState(&type: Integer; withState: Integer); cdecl;
  end;

  // ===== External functions =====

const
  libBaiduMapAPI_Map =
    '/System/Library/Frameworks/BaiduMapAPI_Map.framework/BaiduMapAPI_Map';
function BMKGetMapApiMapComponentVersion: Pointer { NSString }; cdecl;
  external libBaiduMapAPI_Map name _PU + 'BMKGetMapApiMapComponentVersion';
function BMKCheckMapComponentIsLegal: Boolean; cdecl;
  external libBaiduMapAPI_Map name _PU + 'BMKCheckMapComponentIsLegal';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  BaiduMapAPI_MapModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

BaiduMapAPI_MapModule := dlopen(MarshaledAString(libBaiduMapAPI_Map),
  RTLD_LAZY);

finalization

dlclose(BaiduMapAPI_MapModule);
{$ENDIF IOS}

end.
