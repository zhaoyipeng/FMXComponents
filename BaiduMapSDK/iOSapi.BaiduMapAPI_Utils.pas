{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework BaiduMapAPI_Utils
//

unit iOSapi.BaiduMapAPI_Utils;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Foundation,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  Macapi.QuartzCore,
  iOSapi.BaiduMapAPI_Base,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.CoreLocation,
  iOSapi.Foundation;

const
  BMK_NAVI_TYPE_NATIVE = 0;
  BMK_NAVI_TYPE_WEB = 1;
  BMK_OPEN_TRANSIT_RECOMMAND = 3;
  BMK_OPEN_TRANSIT_TRANSFER_FIRST = 4;
  BMK_OPEN_TRANSIT_WALK_FIRST = 5;
  BMK_OPEN_TRANSIT_NO_SUBWAY = 6;
  BMK_OPEN_TRANSIT_TIME_FIRST = 7;

type

  // ===== Forward declarations =====
{$M+}
  BMKFavPoiInfo = interface;
  BMKFavPoiManager = interface;
  BMKNaviPara = interface;
  BMKNavigation = interface;
  BMKOpenOption = interface;
  BMKOpenPanoramaDelegate = interface;
  BMKOpenPanoramaOption = interface;
  BMKOpenPanorama = interface;
  BMKOpenPoiDetailOption = interface;
  BMKOpenPoiNearbyOption = interface;
  BMKOpenPoi = interface;
  BMKOpenRouteOption = interface;
  BMKOpenWalkingRouteOption = interface;
  BMKOpenDrivingRouteOption = interface;
  BMKOpenTransitRouteOption = interface;
  BMKOpenRoute = interface;

  // ===== Framework typedefs =====
{$M+}
  CLLocationDegrees = Double;
  CLLocationCoordinate2D = CLLocationCoordinate2D = record latitude
    : CLLocationDegrees;
longitude:
CLLocationDegrees;
end;
PCLLocationCoordinate2D = ^CLLocationCoordinate2D;;
NSUInteger = Cardinal;
NSInteger = Integer;
BMKCoordinateSpan = record latitudeDelta: CLLocationDegrees;
longitudeDelta:
CLLocationDegrees;
end;;
BMKCoordinateRegion = record center: CLLocationCoordinate2D;
span:
BMKCoordinateSpan;
end;;
CLLocationDistance = Double;
BMKMapPoint = record x: Double;
y:
Double;
end;;
BMKMapSize = record width: Double;
height:
Double;
end;;
BMKMapRect = record origin: BMKMapPoint;
size:
BMKMapSize;
end;;
CGRectEdge = LongWord;
BMK_COORD_TYPE = Cardinal;
BMK_NAVI_TYPE = Cardinal;
BMKOpenErrorCode = Cardinal;
BMKOpenTransitPolicy = Cardinal;
// ===== Interface declarations =====

BMKFavPoiInfoClass = interface(NSObjectClass)
  ['{C8527500-4283-4097-B2F3-B442E9A19766}']
end;
BMKFavPoiInfo = interface(NSObject)['{9157D2A8-2982-4F91-BAD4-F8968727C2FE}']
procedure setFavId(favId: NSString);
cdecl;

function favId: NSString; cdecl;
  procedure setPoiName(poiName: NSString); cdecl;
    function poiName: NSString; cdecl;
      procedure setPoiUid(poiUid: NSString); cdecl;
        function poiUid: NSString; cdecl;
          procedure setPt(pt: CLLocationCoordinate2D); cdecl;
            function pt: CLLocationCoordinate2D; cdecl;
              procedure setAddress(address: NSString); cdecl;
                function address: NSString; cdecl;
                  procedure setCityName(cityName: NSString); cdecl;
                    function cityName: NSString; cdecl;
                      procedure setTimeStamp(timeStamp: NSUInteger); cdecl;
                        function timeStamp: NSUInteger; cdecl;
                        end;

                    TBMKFavPoiInfo = class
                      (TOCGenericImport<BMKFavPoiInfoClass, BMKFavPoiInfo>)
                    end;
                PBMKFavPoiInfo = Pointer;

                BMKFavPoiManagerClass = interface(NSObjectClass)
                  ['{0EB917CA-9172-46D5-B5DA-514721F87491}']
                end;
            BMKFavPoiManager = interface(NSObject)
              ['{0B4B32EB-214C-480C-A07A-21A87E9C8B15}']
            function addFavPoi(favPoiInfo: BMKFavPoiInfo): NSInteger;
            cdecl;
              function getFavPoi(favId: NSString): BMKFavPoiInfo; cdecl;
                function getAllFavPois: NSArray; cdecl;
                  function updateFavPoi(favId: NSString;
                    favPoiInfo: BMKFavPoiInfo): Boolean; cdecl;
                    function deleteFavPoi(favId: NSString): Boolean; cdecl;
                      function clearAllFavPois: Boolean; cdecl;
                      end;

                  TBMKFavPoiManager = class
                    (TOCGenericImport<BMKFavPoiManagerClass, BMKFavPoiManager>)
                  end;
              PBMKFavPoiManager = Pointer;

              BMKNaviParaClass = interface(NSObjectClass)
                ['{7096BB92-F659-407D-BC8C-7A0D138F3A4A}']
              end;
          BMKNaviPara = interface(NSObject)
            ['{8ECB5F1B-EC10-43D9-9134-F703DD074EDD}']
          procedure setStartPoint(startPoint: BMKPlanNode);
          cdecl;
            function startPoint: BMKPlanNode; cdecl;
              procedure setEndPoint(endPoint: BMKPlanNode); cdecl;
                function endPoint: BMKPlanNode; cdecl;
                  procedure setNaviType(naviType: BMK_NAVI_TYPE); cdecl;
                    function naviType: BMK_NAVI_TYPE; cdecl;
                      procedure setAppScheme(appScheme: NSString); cdecl;
                        function appScheme: NSString; cdecl;
                          procedure setAppName(appName: NSString); cdecl;
                            function appName: NSString; cdecl;
                              procedure setIsSupportWeb
                                (isSupportWeb: Boolean); cdecl;
                                function isSupportWeb: Boolean; cdecl;
                                end;

                            TBMKNaviPara = class
                              (TOCGenericImport<BMKNaviParaClass, BMKNaviPara>)
                            end;
                        PBMKNaviPara = Pointer;

                        BMKNavigationClass = interface(NSObjectClass)
                          ['{850B5C0A-3C54-458B-A682-6DB4FE40A350}']
                        { class } function openBaiduMapNavigation
                          (para: BMKNaviPara): BMKOpenErrorCode;
                        cdecl;
                        { class } function openBaiduMapWalkNavigation
                            (para: BMKNaviPara): BMKOpenErrorCode; cdecl;
                          { class } function openBaiduMapRideNavigation
                              (para: BMKNaviPara): BMKOpenErrorCode; cdecl;
                            { class } function openBaiduMapwalkARNavigation
                                (para: BMKNaviPara): BMKOpenErrorCode; cdecl;
                              end;
                          BMKNavigation = interface(NSObject)
                            ['{5907AC0C-2615-4990-9381-D07471A338E7}']
                          end;

                      TBMKNavigation = class
                        (TOCGenericImport<BMKNavigationClass, BMKNavigation>)
                      end;
                  PBMKNavigation = Pointer;

                  BMKOpenOptionClass = interface(NSObjectClass)
                    ['{1951E0C7-7C70-406D-AC6E-4DA3B94FB3E3}']
                  end;
              BMKOpenOption = interface(NSObject)
                ['{01CC8344-8CF6-4473-8EC7-8D5E1D6286F6}']
              procedure setAppScheme(appScheme: NSString);
              cdecl;
                function appScheme: NSString; cdecl;
                  procedure setIsSupportWeb(isSupportWeb: Boolean); cdecl;
                    function isSupportWeb: Boolean; cdecl;
                    end;

                TBMKOpenOption = class
                  (TOCGenericImport<BMKOpenOptionClass, BMKOpenOption>)
                end;
            PBMKOpenOption = Pointer;

            BMKOpenPanoramaOptionClass = interface(BMKOpenOptionClass)
              ['{E5B1A11F-A9D4-4C07-9CD3-72D0B922E0CC}']
            end;
        BMKOpenPanoramaOption = interface(BMKOpenOption)
          ['{FA9095FF-0E6D-4170-B0D8-0DC8B9EE7D88}']
        procedure setPoiUid(poiUid: NSString);
        cdecl;
          function poiUid: NSString; cdecl;
          end;

      TBMKOpenPanoramaOption = class
        (TOCGenericImport<BMKOpenPanoramaOptionClass, BMKOpenPanoramaOption>)
      end;
  PBMKOpenPanoramaOption = Pointer;

  BMKOpenPanoramaClass = interface(NSObjectClass)
    ['{3FD8A0B7-83E6-45A3-87F8-2464AA9A8953}']
  end;
BMKOpenPanorama = interface(NSObject)['{00A8394D-D685-4AC1-8B31-BEE517392A53}']
procedure setDelegate(delegate: Pointer);
cdecl;

function delegate: Pointer; cdecl;
  procedure openBaiduMapPanorama(option: BMKOpenPanoramaOption); cdecl;
  end;

TBMKOpenPanorama = class(TOCGenericImport<BMKOpenPanoramaClass,
  BMKOpenPanorama>)
end;
PBMKOpenPanorama = Pointer;

BMKOpenPoiDetailOptionClass = interface(BMKOpenOptionClass)
  ['{62C36085-296D-431B-8277-2E34B2A088BE}']
end;
BMKOpenPoiDetailOption = interface(BMKOpenOption)
  ['{92617912-0802-4075-9B56-0689FBD4F773}']
procedure setPoiUid(poiUid: NSString);
cdecl;

function poiUid: NSString; cdecl;
end;

TBMKOpenPoiDetailOption = class(TOCGenericImport<BMKOpenPoiDetailOptionClass,
  BMKOpenPoiDetailOption>)
end;
PBMKOpenPoiDetailOption = Pointer;

BMKOpenPoiNearbyOptionClass = interface(BMKOpenOptionClass)
  ['{22002D27-0A55-4868-8594-771C99774E0E}']
end;
BMKOpenPoiNearbyOption = interface(BMKOpenOption)
  ['{309C54A3-C030-4B96-A901-2C53BB786E69}']
procedure setLocation(location: CLLocationCoordinate2D);
cdecl;

function location: CLLocationCoordinate2D; cdecl;
  procedure setRadius(radius: NSUInteger); cdecl;
    function radius: NSUInteger; cdecl;
      procedure setKeyword(keyword: NSString); cdecl;
        function keyword: NSString; cdecl;
        end;

    TBMKOpenPoiNearbyOption = class
      (TOCGenericImport<BMKOpenPoiNearbyOptionClass, BMKOpenPoiNearbyOption>)
    end;
PBMKOpenPoiNearbyOption = Pointer;

BMKOpenPoiClass = interface(NSObjectClass)
  ['{46D94957-0A06-41AE-9747-86BF06D44DC8}']
{ class } function openBaiduMapPoiDetailPage(option: BMKOpenPoiDetailOption)
  : BMKOpenErrorCode;
cdecl;
{ class } function openBaiduMapPoiNearbySearch(option: BMKOpenPoiNearbyOption)
    : BMKOpenErrorCode; cdecl;
  end;
BMKOpenPoi = interface(NSObject)['{50F793FC-491C-4DBC-AFFE-82483BEF2D2A}']
end;

TBMKOpenPoi = class(TOCGenericImport<BMKOpenPoiClass, BMKOpenPoi>)
end;
PBMKOpenPoi = Pointer;

BMKOpenRouteOptionClass = interface(BMKOpenOptionClass)
  ['{98E61E36-911E-48BE-BAE6-E6B06B3EB6F9}']
end;
BMKOpenRouteOption = interface(BMKOpenOption)
  ['{8BDFF948-B633-4DB5-A00E-1621BAA3BDB7}']
procedure setStartPoint(startPoint: BMKPlanNode);
cdecl;

function startPoint: BMKPlanNode; cdecl;
  procedure setEndPoint(endPoint: BMKPlanNode); cdecl;
    function endPoint: BMKPlanNode; cdecl;
    end;

TBMKOpenRouteOption = class(TOCGenericImport<BMKOpenRouteOptionClass,
  BMKOpenRouteOption>)
end;
PBMKOpenRouteOption = Pointer;

BMKOpenWalkingRouteOptionClass = interface(BMKOpenRouteOptionClass)
  ['{203148C1-87E3-4F5F-8746-5E2A4E49A5F3}']
end;
BMKOpenWalkingRouteOption = interface(BMKOpenRouteOption)
  ['{0E95E6CA-776B-42ED-A006-A5C57FFDBD53}']
end;

TBMKOpenWalkingRouteOption = class
  (TOCGenericImport<BMKOpenWalkingRouteOptionClass, BMKOpenWalkingRouteOption>)
end;
PBMKOpenWalkingRouteOption = Pointer;

BMKOpenDrivingRouteOptionClass = interface(BMKOpenRouteOptionClass)
  ['{97FDB608-6C24-4D6F-948D-1AF03276E305}']
end;
BMKOpenDrivingRouteOption = interface(BMKOpenRouteOption)
  ['{0CDA065B-4AD1-4967-BFB7-F58ECC519B32}']
end;

TBMKOpenDrivingRouteOption = class
  (TOCGenericImport<BMKOpenDrivingRouteOptionClass, BMKOpenDrivingRouteOption>)
end;
PBMKOpenDrivingRouteOption = Pointer;

BMKOpenTransitRouteOptionClass = interface(BMKOpenRouteOptionClass)
  ['{7FC548D4-2363-4447-8B4D-0C26ED3A35B9}']
end;
BMKOpenTransitRouteOption = interface(BMKOpenRouteOption)
  ['{0795F84A-BB18-4CAC-89C5-50DA37A7F742}']
procedure setOpenTransitPolicy(openTransitPolicy: BMKOpenTransitPolicy);
cdecl;

function openTransitPolicy: BMKOpenTransitPolicy; cdecl;
end;

TBMKOpenTransitRouteOption = class
  (TOCGenericImport<BMKOpenTransitRouteOptionClass, BMKOpenTransitRouteOption>)
end;
PBMKOpenTransitRouteOption = Pointer;

BMKOpenRouteClass = interface(NSObjectClass)
  ['{342EBBB8-B323-45A2-9580-C2381F2D346D}']
{ class } function openBaiduMapWalkingRoute(option: BMKOpenWalkingRouteOption)
  : BMKOpenErrorCode;
cdecl;

{ class } function openBaiduMapTransitRoute(option: BMKOpenTransitRouteOption)
  : BMKOpenErrorCode; cdecl;
{ class } function openBaiduMapDrivingRoute(option: BMKOpenDrivingRouteOption)
    : BMKOpenErrorCode; cdecl;
  end;
BMKOpenRoute = interface(NSObject)['{957923F0-FD97-4342-8D62-F3D9B01A6E17}']
end;

TBMKOpenRoute = class(TOCGenericImport<BMKOpenRouteClass, BMKOpenRoute>)
end;
PBMKOpenRoute = Pointer;

// ===== Protocol declarations =====

BMKOpenPanoramaDelegate = interface(IObjectiveC)
  ['{CAEA47FD-DEF8-4CBE-B5E2-A40BC3E03FF6}']
procedure onGetOpenPanoramaStatus(ecode: BMKOpenErrorCode);
cdecl;
end;

// ===== External functions =====

const
  libBaiduMapAPI_Utils =
    '/System/Library/Frameworks/BaiduMapAPI_Utils.framework/BaiduMapAPI_Utils';
function BMKCoordinateSpanMake(latitudeDelta: CLLocationDegrees;
  longitudeDelta: CLLocationDegrees): BMKCoordinateSpan; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKCoordinateSpanMake';
function BMKCoordinateRegionMake(centerCoordinate: CLLocationCoordinate2D;
  span: BMKCoordinateSpan): BMKCoordinateRegion; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKCoordinateRegionMake';
function BMKCoordinateRegionMakeWithDistance(centerCoordinate
  : CLLocationCoordinate2D; latitudinalMeters: CLLocationDistance;
  longitudinalMeters: CLLocationDistance): BMKCoordinateRegion; cdecl;
  external libBaiduMapAPI_Utils name _PU +
  'BMKCoordinateRegionMakeWithDistance';
function BMKMapPointForCoordinate(coordinate: CLLocationCoordinate2D)
  : BMKMapPoint; cdecl; external libBaiduMapAPI_Utils name _PU +
  'BMKMapPointForCoordinate';
function BMKCoordinateForMapPoint(mapPoint: BMKMapPoint)
  : CLLocationCoordinate2D; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKCoordinateForMapPoint';
function BMKMetersPerMapPointAtLatitude(latitude: CLLocationDegrees)
  : CLLocationDistance; cdecl; external libBaiduMapAPI_Utils name _PU +
  'BMKMetersPerMapPointAtLatitude';
function BMKMapPointsPerMeterAtLatitude(latitude: CLLocationDegrees): Double;
  cdecl; external libBaiduMapAPI_Utils name _PU +
  'BMKMapPointsPerMeterAtLatitude';
function BMKMetersBetweenMapPoints(a: BMKMapPoint; b: BMKMapPoint)
  : CLLocationDistance; cdecl; external libBaiduMapAPI_Utils name _PU +
  'BMKMetersBetweenMapPoints';
function BMKMapPointMake(x: Double; y: Double): BMKMapPoint; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKMapPointMake';
function BMKMapSizeMake(width: Double; height: Double): BMKMapSize; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKMapSizeMake';
function BMKMapRectMake(x: Double; y: Double; width: Double; height: Double)
  : BMKMapRect; cdecl; external libBaiduMapAPI_Utils name _PU +
  'BMKMapRectMake';
function BMKMapRectGetMinX(rect: BMKMapRect): Double; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKMapRectGetMinX';
function BMKMapRectGetMinY(rect: BMKMapRect): Double; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKMapRectGetMinY';
function BMKMapRectGetMidX(rect: BMKMapRect): Double; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKMapRectGetMidX';
function BMKMapRectGetMidY(rect: BMKMapRect): Double; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKMapRectGetMidY';
function BMKMapRectGetMaxX(rect: BMKMapRect): Double; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKMapRectGetMaxX';
function BMKMapRectGetMaxY(rect: BMKMapRect): Double; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKMapRectGetMaxY';
function BMKMapRectGetWidth(rect: BMKMapRect): Double; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKMapRectGetWidth';
function BMKMapRectGetHeight(rect: BMKMapRect): Double; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKMapRectGetHeight';
function BMKMapPointEqualToPoint(point1: BMKMapPoint; point2: BMKMapPoint)
  : Boolean; cdecl; external libBaiduMapAPI_Utils name _PU +
  'BMKMapPointEqualToPoint';
function BMKMapSizeEqualToSize(size1: BMKMapSize; size2: BMKMapSize): Boolean;
  cdecl; external libBaiduMapAPI_Utils name _PU + 'BMKMapSizeEqualToSize';
function BMKMapRectEqualToRect(rect1: BMKMapRect; rect2: BMKMapRect): Boolean;
  cdecl; external libBaiduMapAPI_Utils name _PU + 'BMKMapRectEqualToRect';
function BMKMapRectIsNull(rect: BMKMapRect): Boolean; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKMapRectIsNull';
function BMKMapRectIsEmpty(rect: BMKMapRect): Boolean; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKMapRectIsEmpty';
function BMKStringFromMapPoint(point: BMKMapPoint): Pointer { NSString }; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKStringFromMapPoint';
function BMKStringFromMapSize(size: BMKMapSize): Pointer { NSString }; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKStringFromMapSize';
function BMKStringFromMapRect(rect: BMKMapRect): Pointer { NSString }; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKStringFromMapRect';
function BMKMapRectUnion(rect1: BMKMapRect; rect2: BMKMapRect): BMKMapRect;
  cdecl; external libBaiduMapAPI_Utils name _PU + 'BMKMapRectUnion';
function BMKMapRectIntersection(rect1: BMKMapRect; rect2: BMKMapRect)
  : BMKMapRect; cdecl; external libBaiduMapAPI_Utils name _PU +
  'BMKMapRectIntersection';
function BMKMapRectInset(rect: BMKMapRect; dx: Double; dy: Double): BMKMapRect;
  cdecl; external libBaiduMapAPI_Utils name _PU + 'BMKMapRectInset';
function BMKMapRectOffset(rect: BMKMapRect; dx: Double; dy: Double): BMKMapRect;
  cdecl; external libBaiduMapAPI_Utils name _PU + 'BMKMapRectOffset';
procedure BMKMapRectDivide(rect: BMKMapRect; slice: Pointer; remainder: Pointer;
  amount: Double; edge: CGRectEdge); cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKMapRectDivide';
function BMKMapRectContainsPoint(rect: BMKMapRect; point: BMKMapPoint): Boolean;
  cdecl; external libBaiduMapAPI_Utils name _PU + 'BMKMapRectContainsPoint';
function BMKMapRectContainsRect(rect1: BMKMapRect; rect2: BMKMapRect): Boolean;
  cdecl; external libBaiduMapAPI_Utils name _PU + 'BMKMapRectContainsRect';
function BMKMapRectIntersectsRect(rect1: BMKMapRect; rect2: BMKMapRect)
  : Boolean; cdecl; external libBaiduMapAPI_Utils name _PU +
  'BMKMapRectIntersectsRect';
function BMKCoordinateRegionForMapRect(rect: BMKMapRect): BMKCoordinateRegion;
  cdecl; external libBaiduMapAPI_Utils name _PU +
  'BMKCoordinateRegionForMapRect';
function BMKMapRectSpans180thMeridian(rect: BMKMapRect): Boolean; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKMapRectSpans180thMeridian';
function BMKMapRectRemainder(rect: BMKMapRect): BMKMapRect; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKMapRectRemainder';
function BMKCircleContainsPoint(point: BMKMapPoint; center: BMKMapPoint;
  radius: Double): Boolean; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKCircleContainsPoint';
function BMKCircleContainsCoordinate(point: CLLocationCoordinate2D;
  center: CLLocationCoordinate2D; radius: Double): Boolean; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKCircleContainsCoordinate';
function BMKPolygonContainsPoint(point: BMKMapPoint; polygon: Pointer;
  count: NSUInteger): Boolean; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKPolygonContainsPoint';
function BMKPolygonContainsCoordinate(point: CLLocationCoordinate2D;
  polygon: Pointer; count: NSUInteger): Boolean; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKPolygonContainsCoordinate';
function BMKGetNearestMapPointFromPolyline(point: BMKMapPoint;
  polyline: Pointer; count: NSUInteger): BMKMapPoint; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKGetNearestMapPointFromPolyline';
function BMKAreaBetweenCoordinates(leftTop: CLLocationCoordinate2D;
  rightBottom: CLLocationCoordinate2D): Double; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKAreaBetweenCoordinates';
function BMKConvertBaiduCoorFrom(coordinate: CLLocationCoordinate2D;
  &type: BMK_COORD_TYPE): Pointer { NSDictionary }; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKConvertBaiduCoorFrom';
function BMKCoorDictionaryDecode(dictionary: Pointer { NSDictionary } )
  : CLLocationCoordinate2D; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKCoorDictionaryDecode';
function BMKGetMapApiUtilsComponentVersion: Pointer { NSString }; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKGetMapApiUtilsComponentVersion';
function BMKCheckUtilsComponentIsLegal: Boolean; cdecl;
  external libBaiduMapAPI_Utils name _PU + 'BMKCheckUtilsComponentIsLegal';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  BaiduMapAPI_UtilsModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

BaiduMapAPI_UtilsModule := dlopen(MarshaledAString(libBaiduMapAPI_Utils),
  RTLD_LAZY);

finalization

dlclose(BaiduMapAPI_UtilsModule);
{$ENDIF IOS}

end.
