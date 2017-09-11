{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework BaiduMapAPI_Base
//

unit iOSapi.BaiduMapAPI_Base;

interface

uses
  Macapi.CoreFoundation,
  Macapi.CoreServices,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.CoreLocation,
  iOSapi.Foundation;

const
  BMK_COORDTYPE_GPS = 0;
  BMK_COORDTYPE_COMMON = 1;
  BMK_COORDTYPE_BD09LL = 2;
  BMKMapTypeNone = 0;
  BMKMapTypeStandard = 1;
  BMKMapTypeSatellite = 2;
  BMKErrorOk = 0;
  BMKErrorConnect = 2;
  BMKErrorData = 3;
  BMKErrorRouteAddr = 4;
  BMKErrorResultNotFound = 100;
  BMKErrorLocationFailed = 200;
  BMKErrorPermissionCheckFailure = 300;
  BMKErrorParse = 310;
  E_PERMISSIONCHECK_CONNECT_ERROR = -300;
  E_PERMISSIONCHECK_DATA_ERROR = -200;
  E_PERMISSIONCHECK_OK = 0;
  E_PERMISSIONCHECK_KEY_ERROR = 101;
  E_PERMISSIONCHECK_MCODE_ERROR = 102;
  E_PERMISSIONCHECK_UID_KEY_ERROR = 200;
  E_PERMISSIONCHECK_KEY_FORBIDEN = 201;
  BMK_SEARCH_NO_ERROR = 0;
  BMK_SEARCH_AMBIGUOUS_KEYWORD = 1;
  BMK_SEARCH_AMBIGUOUS_ROURE_ADDR = 2;
  BMK_SEARCH_NOT_SUPPORT_BUS = 3;
  BMK_SEARCH_NOT_SUPPORT_BUS_2CITY = 4;
  BMK_SEARCH_RESULT_NOT_FOUND = 5;
  BMK_SEARCH_ST_EN_TOO_NEAR = 6;
  BMK_SEARCH_KEY_ERROR = 7;
  BMK_SEARCH_NETWOKR_ERROR = 8;
  BMK_SEARCH_NETWOKR_TIMEOUT = 9;
  BMK_SEARCH_PERMISSION_UNFINISHED = 10;
  BMK_SEARCH_INDOOR_ID_ERROR = 11;
  BMK_SEARCH_FLOOR_ERROR = 12;
  BMK_SEARCH_INDOOR_ROUTE_NO_IN_BUILDING = 13;
  BMK_SEARCH_INDOOR_ROUTE_NO_IN_SAME_BUILDING = 14;
  BMK_SEARCH_PARAMETER_ERROR = 15;
  BMK_OPEN_NO_ERROR = 0;
  BMK_OPEN_WEB_MAP = 1;
  BMK_OPEN_OPTION_NULL = 2;
  BMK_OPEN_NOT_SUPPORT = 3;
  BMK_OPEN_POI_DETAIL_UID_NULL = 4;
  BMK_OPEN_POI_NEARBY_KEYWORD_NULL = 5;
  BMK_OPEN_ROUTE_START_ERROR = 6;
  BMK_OPEN_ROUTE_END_ERROR = 7;
  BMK_OPEN_PANORAMA_UID_ERROR = 8;
  BMK_OPEN_PANORAMA_ABSENT = 9;
  BMK_OPEN_PERMISSION_UNFINISHED = 10;
  BMK_OPEN_KEY_ERROR = 11;
  BMK_OPEN_NETWOKR_ERROR = 12;
  E_PERMISSION_OK = 0;
  E_PERMISSION_SERVER_ERROR = -200;
  E_PERMISSION_NETWORK_ERROR = -300;
  BMKMapModuleTile = 0;

type

  // ===== Forward declarations =====
{$M+}
  BMKGeneralDelegate = interface;
  BMKPlanNode = interface;
  BMKIndoorPlanNode = interface;
  BMKAddressComponent = interface;
  BMKMapManager = interface;
  BMKUserLocation = interface;

  // ===== Framework typedefs =====
{$M+}
  BMK_COORD_TYPE = Cardinal;
  BMKMapType = NSUInteger;
  BMKErrorCode = Cardinal;
  BMKPermissionCheckResultCode = Integer;
  BMKSearchErrorCode = Cardinal;
  BMKOpenErrorCode = Cardinal;

  BMKCoordinateSpan = record
    latitudeDelta: CLLocationDegrees;
    longitudeDelta: CLLocationDegrees;
  end;

  PBMKCoordinateSpan = ^BMKCoordinateSpan;




  BMKCoordinateBounds = record
    northEast: CLLocationCoordinate2D;
    southWest: CLLocationCoordinate2D;
  end;

  PBMKCoordinateBounds = ^BMKCoordinateBounds;

  BMKCoordinateRegion = record
    center: CLLocationCoordinate2D;
    span: BMKCoordinateSpan;
  end;

  PBMKCoordinateRegion = ^BMKCoordinateRegion;

  BMKGeoPoint = record
    latitudeE6: Integer;
    longitudeE6: Integer;
  end;

  PBMKGeoPoint = ^BMKGeoPoint;

  BMKMapPoint = record
    x: Double;
    y: Double;
  end;

  PBMKMapPoint = ^BMKMapPoint;

  BMKMapSize = record
    width: Double;
    height: Double;
  end;

  PBMKMapSize = ^BMKMapSize;

  BMKMapRect = record
    origin: BMKMapPoint;
    size: BMKMapSize;
  end;

  PBMKMapRect = ^BMKMapRect;


  BMKZoomScale = CGFloat;
  BMKMapModule = Cardinal;
  // ===== Interface declarations =====

  BMKPlanNodeClass = interface(NSObjectClass)
    ['{61BFA8F6-B678-41E3-BBC0-E703889DAD03}']
  end;

  BMKPlanNode = interface(NSObject)
    ['{E5BA3852-B405-45AE-A015-820011E954E0}']
    procedure setCityName(cityName: NSString); cdecl;

    function cityName: NSString; cdecl;
    procedure setCityID(cityID: NSInteger); cdecl;
    function cityID: NSInteger; cdecl;
    procedure setName(name: NSString); cdecl;
    function name: NSString; cdecl;
    procedure setPt(pt: CLLocationCoordinate2D); cdecl;
    function pt: CLLocationCoordinate2D; cdecl;
  end;

  TBMKPlanNode = class(TOCGenericImport<BMKPlanNodeClass, BMKPlanNode>)
  end;

  PBMKPlanNode = Pointer;

  BMKIndoorPlanNodeClass = interface(NSObjectClass)
    ['{CC2C643F-3474-493D-97B2-F53E22B18C07}']
  end;

  BMKIndoorPlanNode = interface(NSObject)
    ['{1BDBE758-1097-405A-8D00-A8C1943320C1}']
    procedure setFloor(floor: NSString); cdecl;
    function floor: NSString; cdecl;
    procedure setPt(pt: CLLocationCoordinate2D); cdecl;
    function pt: CLLocationCoordinate2D; cdecl;
  end;

  TBMKIndoorPlanNode = class(TOCGenericImport<BMKIndoorPlanNodeClass,
    BMKIndoorPlanNode>)
  end;

  PBMKIndoorPlanNode = Pointer;

  BMKAddressComponentClass = interface(NSObjectClass)
    ['{CAF006F5-DBFB-471A-BDCD-044EDA5340C1}']
  end;

  BMKAddressComponent = interface(NSObject)
    ['{892E87DC-4EDC-47C7-9540-24B10F3AE409}']
    procedure setStreetNumber(streetNumber: NSString); cdecl;

    function streetNumber: NSString; cdecl;
    procedure setStreetName(streetName: NSString); cdecl;
    function streetName: NSString; cdecl;
    procedure setDistrict(district: NSString); cdecl;
    function district: NSString; cdecl;
    procedure setCity(city: NSString); cdecl;
    function city: NSString; cdecl;
    procedure setProvince(province: NSString); cdecl;
    function province: NSString; cdecl;
    procedure setCountry(country: NSString); cdecl;
    function country: NSString; cdecl;
    procedure setCountryCode(countryCode: NSString); cdecl;
    function countryCode: NSString; cdecl;
  end;

  TBMKAddressComponent = class(TOCGenericImport<BMKAddressComponentClass,
    BMKAddressComponent>)
  end;

  PBMKAddressComponent = Pointer;

  BMKMapManagerClass = interface(NSObjectClass)
    ['{AE0C3828-E8E6-4924-9AE8-3745331BAAA2}']
    { class } function setCoordinateTypeUsedInBaiduMapSDK
      (coorType: BMK_COORD_TYPE): Boolean; cdecl;
    { class } function getCoordinateTypeUsedInBaiduMapSDK
      : BMK_COORD_TYPE; cdecl;
    { class } procedure logEnable(enable: Boolean; module: BMKMapModule); cdecl;
  end;

  BMKMapManager = interface(NSObject)
    ['{D209DC4A-5185-441D-9221-324C9CED5401}']
    function start(key: NSString; generalDelegate: Pointer): Boolean; cdecl;
    function getTotalSendFlaxLength: Integer; cdecl;
    function getTotalRecvFlaxLength: Integer; cdecl;
    function stop: Boolean; cdecl;
  end;

  TBMKMapManager = class(TOCGenericImport<BMKMapManagerClass, BMKMapManager>)
  end;

  PBMKMapManager = Pointer;

  BMKUserLocationClass = interface(NSObjectClass)
    ['{6EAFBC41-EE76-4D4C-9246-4EB93C990D97}']
  end;

  BMKUserLocation = interface(NSObject)
    ['{A2A0210C-97BC-4489-B05E-CC6F19D8D7F8}']
    function isUpdating: Boolean; cdecl;
    function location: CLLocation; cdecl;
    function heading: CLHeading; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure setSubtitle(subtitle: NSString); cdecl;
    function subtitle: NSString; cdecl;
  end;

  TBMKUserLocation = class(TOCGenericImport<BMKUserLocationClass,
    BMKUserLocation>)
  end;

  PBMKUserLocation = Pointer;

  // ===== Protocol declarations =====

  BMKGeneralDelegate = interface(IObjectiveC)
    ['{0113DC84-7759-49C6-B8C7-4A51D26BBE68}']
    procedure onGetNetworkState(iError: Integer); cdecl;
    procedure onGetPermissionState(iError: Integer); cdecl;
  end;

  // ===== Exported string consts =====

function BMKMapSizeWorld: Pointer;
function BMKMapRectWorld: Pointer;
function BMKMapRectNull: Pointer;


// ===== External functions =====

const
  libBaiduMapAPI_Base =
    '/System/Library/Frameworks/BaiduMapAPI_Base.framework/BaiduMapAPI_Base';
function BMKGetMapApiVersion: Pointer { NSString }; cdecl;
  external libBaiduMapAPI_Base name _PU + 'BMKGetMapApiVersion';
function BMKGetMapApiBaseComponentVersion: Pointer { NSString }; cdecl;
  external libBaiduMapAPI_Base name _PU + 'BMKGetMapApiBaseComponentVersion';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  BaiduMapAPI_BaseModule: THandle;

{$ENDIF IOS}

function BMKMapSizeWorld: Pointer;
begin
  Result := CocoaPointerConst(libBaiduMapAPI_Base, 'BMKMapSizeWorld');
end;

function BMKMapRectWorld: Pointer;
begin
  Result := CocoaPointerConst(libBaiduMapAPI_Base, 'BMKMapRectWorld');
end;

function BMKMapRectNull: Pointer;
begin
  Result := CocoaPointerConst(libBaiduMapAPI_Base, 'BMKMapRectNull');
end;

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

BaiduMapAPI_BaseModule := dlopen(MarshaledAString(libBaiduMapAPI_Base),
  RTLD_LAZY);

finalization

dlclose(BaiduMapAPI_BaseModule);
{$ENDIF IOS}

end.
