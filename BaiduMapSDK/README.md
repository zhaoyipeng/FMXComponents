# 一、文件介绍：

## 1.SDK接口文件

安卓：以Androidapi.JNI.baidu.mapapi 开头的文件为安卓SDK jar的接口文件(谢谢老猫提供的工具)。 

iOS:以iOSapi.BaiduMapAPI_ 开头的文件为iOS SDK Framework 的接口文件。

## 2.SDK功能实现文件

BaiduMapAPI.SDKInitializer 初始化SDK 服务<br>
BaiduMapAPI.Search.CommTypes 搜索服务公共单元<br>
BaiduMapAPI.ViewService 地图服务<br>
&nbsp;&nbsp;&nbsp;|--BaiduMapAPI.ViewService.iOS  iOS平台地图服务<br>
&nbsp;&nbsp;&nbsp;|--BaiduMapAPI.ViewService.Android 安卓平台地图服务<br>
BaiduMapAPI.LocationService 定位服务<br>
&nbsp;&nbsp;&nbsp;|--BaiduMapAPI.LocationService.iOS  iOS平台定位服务<br>
&nbsp;&nbsp;&nbsp;|--BaiduMapAPI.LocationService.Android 安卓平台地定位服务<br>
BaiduMapAPI.PoiSearchService 兴趣点搜索服务<br>
&nbsp;&nbsp;&nbsp;|--BaiduMapAPI.PoiSearchService .iOS  iOS平台兴趣点搜索服务<br>
&nbsp;&nbsp;&nbsp;|--BaiduMapAPI.PoiSearchService .Android 安卓平台兴趣点搜索服务<br>
BaiduMapAPI.NaviService 导航服务<br>
&nbsp;&nbsp;&nbsp;|--BaiduMapAPI.NaviService.CommTypes 导航服务公共单元<br>
&nbsp;&nbsp;&nbsp;|--BaiduMapAPI.ViewService.iOS  iOS平台导航服务<br>
&nbsp;&nbsp;&nbsp;|--BaiduMapAPI.ViewService.Android 安卓平台导航服务<br>

# 二、使用说明
## 1.初始化SDK(无论使用SDK什么功能必须先初始化SDK)
引用单元:BaiduMapAPI.SDKInitializer<br>
示例代码:


```
TSDKInitializer.SDKInit(Your App Key);
```


## 2.地图的展示
引用单元:BaiduMapAPI.ViewService<br>
示例代码：

```pascal
Var
    BaiduMapView:TBaiduMapView.
    BaiduMapView := TBaiduMapView.Create(Self);
    BaiduMapView.Parent := Self;
    BaiduMapView.Align := TAlignLayout.Client;
    BaiduMapView.ShowBaiduMap;

```

## 3.定位
引用单元:BaiduMapAPI.LocationService<br>
示例代码:


```pascal
Var
    BaiduMapLocation :TBaiduMapLocation;
BaiduMapLocation := TBaiduMapLocation.Create;
BaiduMapLocation.LocationService.OnUserLocationWillChanged := 				DoUserLocationChanged;
BaiduMapLocation.LocationService.InitLocation;
BaiduMapLocation.LocationService.StopLocation;
BaiduMapLocation.LocationService.StarLocation;
```


说明:当用户位置发生变化后，会主动触发OnUserLocationWillChanged

## 4.兴趣点搜索
兴趣点搜索有：范围内检索、城市内检索、附近检索三种模式<br>
引用单元:BaiduMapAPI.PoiSearchService<br>
示例代码：


```pascal
Var
  Option:TPoiSearchrOption;
  BaiduMapPoiSearch:TBaiduMapPoiSearch;
begin
  BaiduMapPoiSearch:=TBaiduMapPoiSearch.Create;
  //城市类检索
  Option:=TPoiCitySearchOption.Create;
  TPoiCitySearchOption(Option).Keyword:='机场';
  TPoiCitySearchOption(Option).City:='重庆';
  TPoiCitySearchOption(Option).PageCapacity:=10;
  TPoiCitySearchOption(Option).PageNum:=0;
  TPoiCitySearchOption(Option).IsReturnAddr:=True;
  BaiduMapPoiSearch.PoiSearchService.OnGetPoiResult := DoGetPoiResult;
  BaiduMapPoiSearch.PoiSearchService.PoiSearch(Option);
  Option.Free;

```

说明:检索成功后，会回调OnGetPoiResult


## Bug联系: 
  Email:371889755@qq.com<br>
  Tel:18523843322

