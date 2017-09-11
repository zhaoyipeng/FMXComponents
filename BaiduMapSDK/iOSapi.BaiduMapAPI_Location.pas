{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework BaiduMapAPI_Location
//

unit iOSapi.BaiduMapAPI_Location;

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
  iOSapi.CoreLocation,
  iOSapi.Foundation;

type

  // ===== Forward declarations =====
{$M+}
  BMKLocationServiceDelegate = interface;
  BMKLocationService = interface;

  // ===== Framework typedefs =====
{$M+}
  // ===== Interface declarations =====

  BMKLocationServiceClass = interface(NSObjectClass)
    ['{68E0D760-79BF-49DC-9E2A-30BB275617C2}']
    { class } procedure setLocationDistanceFilter(distanceFilter
      : CLLocationDistance); cdecl;
    { class } function getCurrentLocationDistanceFilter
      : CLLocationDistance; cdecl;
    { class } procedure setLocationDesiredAccuracy(desiredAccuracy
      : CLLocationAccuracy); cdecl;
    { class } function getCurrentLocationDesiredAccuracy
      : CLLocationAccuracy; cdecl;
  end;

  BMKLocationService = interface(NSObject)
    ['{07B048E3-7F0F-445D-8D88-7C66A9E64C35}']
    function userLocation: BMKUserLocation; cdecl;
    procedure setDelegate(delegate: Pointer); cdecl;
    function delegate: Pointer; cdecl;
    procedure startUserLocationService; cdecl;
    procedure stopUserLocationService; cdecl;
    procedure setDistanceFilter(distanceFilter: CLLocationDistance); cdecl;
    function distanceFilter: CLLocationDistance; cdecl;
    procedure setDesiredAccuracy(desiredAccuracy: CLLocationAccuracy); cdecl;
    function desiredAccuracy: CLLocationAccuracy; cdecl;
    procedure setHeadingFilter(headingFilter: CLLocationDegrees); cdecl;
    function headingFilter: CLLocationDegrees; cdecl;
    procedure setPausesLocationUpdatesAutomatically
      (pausesLocationUpdatesAutomatically: Boolean); cdecl;
    function pausesLocationUpdatesAutomatically: Boolean; cdecl;
    procedure setAllowsBackgroundLocationUpdates(allowsBackgroundLocationUpdates
      : Boolean); cdecl;
    function allowsBackgroundLocationUpdates: Boolean; cdecl;
  end;

  TBMKLocationService = class(TOCGenericImport<BMKLocationServiceClass,
    BMKLocationService>)
  end;

  PBMKLocationService = Pointer;

  // ===== Protocol declarations =====

  BMKLocationServiceDelegate = interface(IObjectiveC)
    ['{0318E275-A978-4FF8-BCD5-825B88D73605}']
    procedure willStartLocatingUser; cdecl;
    procedure didStopLocatingUser; cdecl;
    procedure didUpdateUserHeading(userLocation: BMKUserLocation); cdecl;
    procedure didUpdateBMKUserLocation(userLocation: BMKUserLocation); cdecl;
    procedure didFailToLocateUserWithError(error: NSError); cdecl;
  end;

  // ===== External functions =====

const
  libBaiduMapAPI_Location =
    '/System/Library/Frameworks/BaiduMapAPI_Location.framework/BaiduMapAPI_Location';
function BMKGetMapApiLocationComponentVersion: Pointer { NSString }; cdecl;
  external libBaiduMapAPI_Location name _PU +
  'BMKGetMapApiLocationComponentVersion';
function BMKCheckLocationComponentIsLegal: Boolean; cdecl;
  external libBaiduMapAPI_Location name _PU +
  'BMKCheckLocationComponentIsLegal';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  BaiduMapAPI_LocationModule: THandle;

{$ENDIF IOS}
{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

BaiduMapAPI_LocationModule := dlopen(MarshaledAString(libBaiduMapAPI_Location),
  RTLD_LAZY);

finalization

dlclose(BaiduMapAPI_LocationModule);
{$ENDIF IOS}

end.
