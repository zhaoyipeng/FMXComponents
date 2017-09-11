unit Androidapi.JNI.baidu.mapapi.model;
// ====================================================
// Android Baidu Map SDK interface
// Package:com.baidu.mapapi.model
// author:Xubzhlin
// email:371889755@qq.com
//
// date:2017.5.10
// version:4.3.0
// ====================================================

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.os,
  Androidapi.JNI.JavaTypes;

type
  // ===== Forward declarations =====
  JCoordUtil = interface; // com.baidu.mapapi.model.CoordUtil
  JGeoPoint = interface; // com.baidu.mapapi.model.inner.GeoPoint
  JMapBound = interface; // com.baidu.mapapi.model.inner.MapBound
  JPoint = interface; // com.baidu.mapapi.model.inner.Point
  JLatLng = interface; // com.baidu.mapapi.model.LatLng
  JLatLngBounds_Builder = interface;
  // com.baidu.mapapi.model.LatLngBounds$Builder
  JLatLngBounds = interface; // com.baidu.mapapi.model.LatLngBounds
  JParcelItem = interface; // com.baidu.mapapi.model.ParcelItem

  // ===== Interface declarations =====
  JCoordUtilClass = interface(JObjectClass)
    ['{C52C7C87-4D40-4135-A810-F1D78BA779D8}']
    { static Property Methods }

    { static Methods }
    { class } function init: JCoordUtil; cdecl; // ()V
    { class } function mc2ll(P1: JGeoPoint): JLatLng; cdecl;
    // (Lcom/baidu/mapapi/model/inner/GeoPoint;)Lcom/baidu/mapapi/model/LatLng;
    { class } function ll2mc(P1: JLatLng): JGeoPoint; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/inner/GeoPoint;
    { class } function ll2point(P1: JLatLng): JPoint; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/inner/Point;
    { class } function getMCDistanceByOneLatLngAndRadius(P1: JLatLng;
      P2: Integer): Integer; cdecl; // (Lcom/baidu/mapapi/model/LatLng;I)I
    { class } function decodeLocation(P1: JString): JLatLng; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/model/LatLng;
    { class } function decodeNodeLocation(P1: JString): JLatLng; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/model/LatLng;
    { class } function decodeLocationList(P1: JString): JList; cdecl;
    // (Ljava/lang/String;)Ljava/util/List;
    { class } function decodeLocationList2D(P1: JString): JList; cdecl;
    // (Ljava/lang/String;)Ljava/util/List;
    { class } function Coordinate_encryptEx(P1: Single; P2: Single; P3: JString)
      : JLatLng; cdecl; // (FFLjava/lang/String;)Lcom/baidu/mapapi/model/LatLng;
    { class } function getDistance(P1: JPoint; P2: JPoint): Double; cdecl;
    // (Lcom/baidu/mapapi/model/inner/Point;Lcom/baidu/mapapi/model/inner/Point;)D

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/model/CoordUtil')]
  JCoordUtil = interface(JObject)
    ['{B01B1EFC-B1FE-4B5C-B5BC-7A154B45F91A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCoordUtil = class(TJavaGenericImport<JCoordUtilClass, JCoordUtil>)
  end;

  JGeoPointClass = interface(JObjectClass)
    ['{F1D4836A-D401-4AF3-8254-C9D2B0FDF1FA}']
    { static Property Methods }

    { static Methods }
    { class } function init(P1: Double; P2: Double): JGeoPoint; cdecl; // (DD)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/model/inner/GeoPoint')]
  JGeoPoint = interface(JObject)
    ['{EC912D53-B7D4-4686-9552-0D992202DB91}']
    { Property Methods }

    { methods }
    function getLatitudeE6: Double; cdecl; // ()D
    function getLongitudeE6: Double; cdecl; // ()D
    procedure setLatitudeE6(P1: Double); cdecl; // (D)V
    procedure setLongitudeE6(P1: Double); cdecl; // (D)V
    function toString: JString; cdecl; // ()Ljava/lang/String;
    function equals(P1: JObject): Boolean; cdecl; // (Ljava/lang/Object;)Z

    { Property }
  end;

  TJGeoPoint = class(TJavaGenericImport<JGeoPointClass, JGeoPoint>)
  end;

  JMapBoundClass = interface(JObjectClass)
    ['{4F1AD054-6D5A-4F97-A92C-4D35C5F7D788}']
    { static Property Methods }

    { static Methods }
    { class } function init: JMapBound; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/model/inner/MapBound')]
  JMapBound = interface(JObject)
    ['{5BD11E48-D354-4D28-BFF4-D2AA295FC009}']
    { Property Methods }
    function _GetptLB: JPoint; // Lcom/baidu/mapapi/model/inner/Point;
    procedure _SetptLB(aptLB: JPoint);
    // (Lcom/baidu/mapapi/model/inner/Point;)V
    function _GetptRT: JPoint; // Lcom/baidu/mapapi/model/inner/Point;
    procedure _SetptRT(aptRT: JPoint);
    // (Lcom/baidu/mapapi/model/inner/Point;)V

    { methods }
    function getPtLB: JPoint; cdecl; // ()Lcom/baidu/mapapi/model/inner/Point;
    procedure setPtLB(P1: JPoint); cdecl;
    // (Lcom/baidu/mapapi/model/inner/Point;)V
    function getPtRT: JPoint; cdecl; // ()Lcom/baidu/mapapi/model/inner/Point;
    procedure setPtRT(P1: JPoint); cdecl;
    // (Lcom/baidu/mapapi/model/inner/Point;)V

    { Property }
    property ptLB: JPoint read _GetptLB write _SetptLB;
    property ptRT: JPoint read _GetptRT write _SetptRT;
  end;

  TJMapBound = class(TJavaGenericImport<JMapBoundClass, JMapBound>)
  end;

  JPointClass = interface(JObjectClass)
    ['{A7C4BDA9-96C2-4E71-B741-1D6A2BB96BD8}']
    { static Property Methods }

    { static Methods }
    { class } function init: JPoint; cdecl; overload; // ()V
    { class } function init(P1: Integer; P2: Integer): JPoint; cdecl; overload;
    // (II)V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/model/inner/Point')]
  JPoint = interface(JObject)
    ['{E620A9E9-3690-4960-B151-0A73E397D09A}']
    { Property Methods }
    function _Getx: Integer; // I
    procedure _Setx(ax: Integer); // (I)V
    function _Gety: Integer; // I
    procedure _Sety(ay: Integer); // (I)V

    { methods }
    function getmPtx: Integer; cdecl; // ()I
    procedure setmPtx(P1: Integer); cdecl; // (I)V
    function getmPty: Integer; cdecl; // ()I
    procedure setmPty(P1: Integer); cdecl; // (I)V
    function toString: JString; cdecl; // ()Ljava/lang/String;
    function hashCode: Integer; cdecl; // ()I
    function equals(P1: JObject): Boolean; cdecl; // (Ljava/lang/Object;)Z

    { Property }
    property x: Integer read _Getx write _Setx;
    property y: Integer read _Gety write _Sety;
  end;

  TJPoint = class(TJavaGenericImport<JPointClass, JPoint>)
  end;

  JLatLngClass = interface(JObjectClass)
    ['{52A24F9F-DD2F-47B9-A278-F4CCFDF05E89}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init(P1: Double; P2: Double): JLatLng; cdecl; // (DD)V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/model/LatLng')]
  JLatLng = interface(JObject)
    ['{370BA2DF-B8CE-4779-8CAD-E9D1AAEBFEC2}']
    { Property Methods }
    function _Getlatitude: Double; // D
    procedure _Setlatitude(alatitude: Double); // (D)V
    function _Getlongitude: Double; // D
    procedure _Setlongitude(alongitude: Double); // (D)V
    function _GetlatitudeE6: Double; // D
    procedure _SetlatitudeE6(alatitudeE6: Double); // (D)V
    function _GetlongitudeE6: Double; // D
    procedure _SetlongitudeE6(alongitudeE6: Double); // (D)V

    { methods }
    function toString: JString; cdecl; // ()Ljava/lang/String;
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V

    { Property }
    property latitude: Double read _Getlatitude write _Setlatitude;
    property longitude: Double read _Getlongitude write _Setlongitude;
    property latitudeE6: Double read _GetlatitudeE6 write _SetlatitudeE6;
    property longitudeE6: Double read _GetlongitudeE6 write _SetlongitudeE6;
  end;

  TJLatLng = class(TJavaGenericImport<JLatLngClass, JLatLng>)
  end;

  JLatLngBounds_BuilderClass = interface(JObjectClass)
    ['{DFAABE73-B35F-418E-BEE8-5A601202A43A}']
    { static Property Methods }

    { static Methods }
    { class } function init: JLatLngBounds_Builder; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/model/LatLngBounds$Builder')]
  JLatLngBounds_Builder = interface(JObject)
    ['{3CC2ECF4-27F1-4EB6-BC52-8855AFB0EDEE}']
    { Property Methods }

    { methods }
    function build: JLatLngBounds; cdecl;
    // ()Lcom/baidu/mapapi/model/LatLngBounds;
    function include(P1: JLatLng): JLatLngBounds_Builder; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/model/LatLngBounds$Builder;

    { Property }
  end;

  TJLatLngBounds_Builder = class(TJavaGenericImport<JLatLngBounds_BuilderClass,
    JLatLngBounds_Builder>)
  end;

  JLatLngBoundsClass = interface(JObjectClass)
    ['{29735C08-4875-4499-A490-4CF0F6FC5C3F}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/model/LatLngBounds')]
  JLatLngBounds = interface(JObject)
    ['{ED16BD17-FEC3-4F2A-89C7-5E5F06CE044A}']
    { Property Methods }
    function _Getnortheast: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _Setnortheast(anortheast: JLatLng);
    // (Lcom/baidu/mapapi/model/LatLng;)V
    function _Getsouthwest: JLatLng; // Lcom/baidu/mapapi/model/LatLng;
    procedure _Setsouthwest(asouthwest: JLatLng);
    // (Lcom/baidu/mapapi/model/LatLng;)V

    { methods }
    function contains(P1: JLatLng): Boolean; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Z
    function getCenter: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function describeContents: Integer; cdecl; // ()I
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V
    function toString: JString; cdecl; // ()Ljava/lang/String;

    { Property }
    property northeast: JLatLng read _Getnortheast write _Setnortheast;
    property southwest: JLatLng read _Getsouthwest write _Setsouthwest;
  end;

  TJLatLngBounds = class(TJavaGenericImport<JLatLngBoundsClass, JLatLngBounds>)
  end;

  JParcelItemClass = interface(JObjectClass)
    ['{8DC649B4-2F76-46DB-982F-405C7FE7E1AB}']
    { static Property Methods }
    { class } function _GetCREATOR: JParcelable_Creator;
    // Landroid/os/Parcelable$Creator;

    { static Methods }
    { class } function init: JParcelItem; cdecl; // ()V

    { static Property }
    { class } property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/baidu/mapapi/model/ParcelItem')]
  JParcelItem = interface(JObject)
    ['{428B34FF-3BC0-4A67-B74C-FE461790023F}']
    { Property Methods }

    { methods }
    procedure setBundle(P1: JBundle); cdecl; // (Landroid/os/Bundle;)V
    function getBundle: JBundle; cdecl; // ()Landroid/os/Bundle;
    procedure writeToParcel(P1: JParcel; P2: Integer); cdecl;
    // (Landroid/os/Parcel;I)V
    function describeContents: Integer; cdecl; // ()I

    { Property }
  end;

  TJParcelItem = class(TJavaGenericImport<JParcelItemClass, JParcelItem>)
  end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.model.CoordUtil',
    TypeInfo(Androidapi.JNI.baidu.mapapi.model.JCoordUtil));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.model.GeoPoint',
    TypeInfo(Androidapi.JNI.baidu.mapapi.model.JGeoPoint));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.model.MapBound',
    TypeInfo(Androidapi.JNI.baidu.mapapi.model.JMapBound));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.model.Point',
    TypeInfo(Androidapi.JNI.baidu.mapapi.model.JPoint));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.model.LatLng',
    TypeInfo(Androidapi.JNI.baidu.mapapi.model.JLatLng));
  TRegTypes.RegisterType
    ('Androidapi.JNI.baidu.mapapi.model.LatLngBounds_Builder',
    TypeInfo(Androidapi.JNI.baidu.mapapi.model.JLatLngBounds_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.model.LatLngBounds',
    TypeInfo(Androidapi.JNI.baidu.mapapi.model.JLatLngBounds));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.model.ParcelItem',
    TypeInfo(Androidapi.JNI.baidu.mapapi.model.JParcelItem));
end;

initialization

RegisterTypes;

end.
