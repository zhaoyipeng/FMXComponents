unit Androidapi.JNI.baidu.mapapi.favorite;
// ====================================================
// Android Baidu Map SDK interface
// Package:com.baidu.mapapi.favorite
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
  Androidapi.JNI.baidu.mapapi.model;

type
  // ===== Forward declarations =====
  JFavoriteManager = interface; // com.baidu.mapapi.favorite.FavoriteManager
  JFavoritePoiInfo = interface; // com.baidu.mapapi.favorite.FavoritePoiInfo

  // ===== Interface declarations =====
  JFavoriteManagerClass = interface(JObjectClass)
    ['{F4E7101B-0F28-416D-B7DC-259CE44487BD}']
    { static Property Methods }

    { static Methods }
    { class } function getInstance: JFavoriteManager; cdecl;
    // ()Lcom/baidu/mapapi/favorite/FavoriteManager;

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/favorite/FavoriteManager')]
  JFavoriteManager = interface(JObject)
    ['{FF031617-2698-4B1A-8199-3CAE6A6A6BFF}']
    { Property Methods }

    { methods }
    procedure init; cdecl; // ()V
    function add(P1: JFavoritePoiInfo): Integer; cdecl;
    // (Lcom/baidu/mapapi/favorite/FavoritePoiInfo;)I
    function getFavPoi(P1: JString): JFavoritePoiInfo; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/favorite/FavoritePoiInfo;
    function getAllFavPois: JList; cdecl; // ()Ljava/util/List;
    function deleteFavPoi(P1: JString): Boolean; cdecl; // (Ljava/lang/String;)Z
    function clearAllFavPois: Boolean; cdecl; // ()Z
    function updateFavPoi(P1: JString; P2: JFavoritePoiInfo): Boolean; cdecl;
    // (Ljava/lang/String;Lcom/baidu/mapapi/favorite/FavoritePoiInfo;)Z
    procedure destroy; cdecl; // ()V

    { Property }
  end;

  TJFavoriteManager = class(TJavaGenericImport<JFavoriteManagerClass,
    JFavoriteManager>)
  end;

  JFavoritePoiInfoClass = interface(JObjectClass)
    ['{07DB3A81-B473-46FB-BE9D-199D5BA45F96}']
    { static Property Methods }

    { static Methods }
    { class } function init: JFavoritePoiInfo; cdecl; // ()V

    { static Property }
  end;

  [JavaSignature('com/baidu/mapapi/favorite/FavoritePoiInfo')]
  JFavoritePoiInfo = interface(JObject)
    ['{08D2C683-9F70-4552-84FE-F3B641D3230C}']
    { Property Methods }

    { methods }
    function poiName(P1: JString): JFavoritePoiInfo; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/favorite/FavoritePoiInfo;
    function pt(P1: JLatLng): JFavoritePoiInfo; cdecl;
    // (Lcom/baidu/mapapi/model/LatLng;)Lcom/baidu/mapapi/favorite/FavoritePoiInfo;
    function addr(P1: JString): JFavoritePoiInfo; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/favorite/FavoritePoiInfo;
    function cityName(P1: JString): JFavoritePoiInfo; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/favorite/FavoritePoiInfo;
    function uid(P1: JString): JFavoritePoiInfo; cdecl;
    // (Ljava/lang/String;)Lcom/baidu/mapapi/favorite/FavoritePoiInfo;
    function getID: JString; cdecl; // ()Ljava/lang/String;
    function getPoiName: JString; cdecl; // ()Ljava/lang/String;
    function getPt: JLatLng; cdecl; // ()Lcom/baidu/mapapi/model/LatLng;
    function getAddr: JString; cdecl; // ()Ljava/lang/String;
    function getUid: JString; cdecl; // ()Ljava/lang/String;
    function getCityName: JString; cdecl; // ()Ljava/lang/String;
    function getTimeStamp: Int64; cdecl; // ()J

    { Property }
  end;

  TJFavoritePoiInfo = class(TJavaGenericImport<JFavoritePoiInfoClass,
    JFavoritePoiInfo>)
  end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.favorite.FavoriteManager',
    TypeInfo(Androidapi.JNI.baidu.mapapi.favorite.JFavoriteManager));
  TRegTypes.RegisterType('Androidapi.JNI.baidu.mapapi.favorite.FavoritePoiInfo',
    TypeInfo(Androidapi.JNI.baidu.mapapi.favorite.JFavoritePoiInfo));
end;

initialization

RegisterTypes;

end.
