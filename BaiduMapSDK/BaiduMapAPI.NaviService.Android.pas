unit BaiduMapAPI.NaviService.Android;
//author:Xubzhlin
//Email:371889755@qq.com

//百度地图API 安卓导航服务 单元
//官方链接:http://lbsyun.baidu.com/
//TAndroidBaiduMapNaviService 百度地图 安卓导航服务

interface

uses
  System.Classes, BaiduMapAPI.NaviService, Androidapi.JNI.baidu.navisdk, Androidapi.JNI.JavaTypes,
  Androidapi.JNIBridge, Androidapi.JNI.Os, BaiduMapAPI.NaviService.CommTypes,
  Androidapi.JNI.Embarcadero, Androidapi.JNI.GraphicsContentViewText;

type
  TAndroidBaiduMapNaviService = class;

  TNaviManager_BaseListerer = class(TJavaLocal)
  private
    [weak]FNaviService:TAndroidBaiduMapNaviService;
  public
    constructor Create(NaviService:TAndroidBaiduMapNaviService);
  end;

  TNaviManager_NaviInitListener = class(TNaviManager_BaseListerer, JBaiduNaviManager_NaviInitListener)
  public
    procedure onAuthResult(P1: Integer; P2: JString); cdecl;
    procedure initStart; cdecl;
    procedure initSuccess; cdecl;
    procedure initFailed; cdecl;
  end;

  TNaviManager_RoutePlanListener = class(TNaviManager_BaseListerer, JBaiduNaviManager_RoutePlanListener)
  public
    procedure onJumpToNavigator; cdecl;
    procedure onRoutePlanFailed; cdecl;
  end;

  TJBNRouteGuideManager_OnNavigationListener = class(TNaviManager_BaseListerer, JBNRouteGuideManager_OnNavigationListener)
  public
    procedure onNaviGuideEnd; cdecl;
    procedure notifyOtherAction(P1: Integer; P2: Integer; P3: Integer; P4: JObject); cdecl;
  end;

  TAndroidBaiduMapNaviService = class(TBaiduMapNaviService)
  private
    FSDCardPath:JString;
    FNaviManager:JBaiduNaviManager;
    FJNativeLayout:JNativeLayout;
    FView:JView;
    FNaviInitListener:TNaviManager_NaviInitListener;
    FRoutePlanListener:TNaviManager_RoutePlanListener;
    FNavigationListener:TJBNRouteGuideManager_OnNavigationListener;
    function DoinitDirs:Boolean;
    procedure DoJumpToNavigator;
    procedure RealignView;
    procedure DoInitTTS;
    procedure DoInitNaviManager;
  protected
    procedure DoinitService; override;
    procedure DostartNaviRoutePlan(RoutePlan:TBNRoutePlanNodes); override;
    procedure DoSetVisible(const Value: Boolean); override;
    procedure DoUpdateBaiduNaviFromControl; override;
  end;

implementation

uses
  Androidapi.Helpers, FMX.Helpers.Android, Androidapi.IOUtils, Androidapi.JNI.Os.Environment,
  FMX.Platform.Android, FMX.Forms, System.Types, FMX.CallUIThread.Helper.Android;

{ TAndroidBaiduMapNaviService }

function TAndroidBaiduMapNaviService.DoinitDirs:Boolean;
var
  F:JFile;
begin
  Result:=False;
  if TJEnvironment.JavaClass.getExternalStorageState.equalsIgnoreCase(TJEnvironment.JavaClass.MEDIA_MOUNTED) then
    FSDCardPath:=TJEnvironment.JavaClass.getExternalStorageDirectory.toString;
  if FSDCardPath<>nil then
  begin
    F:=TJFile.JavaClass.init(FSDCardPath, SharedActivityContext.getPackageName);
    if not F.exists then
    begin
      try
        F.mkdir;
        Result:=True;
      except
      end;
    end
    else
      Result:=True;
  end;
end;

procedure TAndroidBaiduMapNaviService.DoinitService;
var
  PM:JPackageManager;
  SDK_INT:Integer;
  permissions: TJavaObjectArray<JString>;
begin
  if DoinitDirs then
  begin
    SDK_INT:=TJBuild_VERSION.JavaClass.SDK_INT;
    if TJBuild_VERSION.JavaClass.SDK_INT>=23 then
    begin
      permissions:= TJavaObjectArray<JString>.Create(1);

      permissions.Items[0]:=StringToJString('Manifest.permission.WRITE_EXTERNAL_STORAGE');
      PM:=SharedActivity.getPackageManager;
      if PM.checkPermission(permissions.Items[0], SharedActivity.getPackageName)
        <> TJPackageManager.JavaClass.PERMISSION_GRANTED then
        SharedActivity.requestPermissions(permissions, 1);

      permissions.Items[0]:=StringToJString('Manifest.permission.ACCESS_FINE_LOCATION');
      PM:=SharedActivity.getPackageManager;
      if PM.checkPermission(permissions.Items[0], SharedActivity.getPackageName)
        <> TJPackageManager.JavaClass.PERMISSION_GRANTED then
        SharedActivity.requestPermissions(permissions, 1);
    end;
    //

    CallInUIThreadAndWaitFinishingFix(DoInitNaviManager)
  end;
end;

procedure TAndroidBaiduMapNaviService.DoInitTTS;
var
  bundle:JBundle;
begin
  bundle:=TJBundle.JavaClass.init;
  bundle.putString(TJBNCommonSettingParam.JavaClass.TTS_APP_ID, StringToJString(TTSKey));
  TJBNaviSettingManager.JavaClass.setNaviSdkParam(bundle);
end;

procedure TAndroidBaiduMapNaviService.DoInitNaviManager;
begin
  DoInitTTS;

  if FNaviManager = nil then
    FNaviManager:=TJBaiduNaviManager.JavaClass.getInstance;

  if FNaviInitListener = nil then
    FNaviInitListener := TNaviManager_NaviInitListener.Create(Self);
  //使用默认TTS 不设置 自定义TTS回调
  FNaviManager.init(SharedActivity, FSDCardPath, SharedActivityContext.getPackageName, FNaviInitListener, nil);
end;

procedure TAndroidBaiduMapNaviService.DoJumpToNavigator;
begin
  //设置途径点以及resetEndNode会回调该接口
  CallInUIThread(
  procedure
  begin
    if FNavigationListener = nil then
      FNavigationListener:=TJBNRouteGuideManager_OnNavigationListener.Create(Self);

    if FView = nil  then
      FView:=TJBNRouteGuideManager.JavaClass.getInstance.onCreate(SharedActivity, FNavigationListener);

    FJNativeLayout := TJNativeLayout.JavaClass.init(SharedActivity,
      MainActivity.getWindow.getDecorView.getWindowToken);
    FJNativeLayout.setPosition(0, 0);
    FJNativeLayout.setSize(Round(Screen.Height), Round(Screen.Width));

    FJNativeLayout.setControl(FView);

    RealignView;
      //View.bringToFront;
      //MainActivity.setContentView(View);
  end);
end;

procedure TAndroidBaiduMapNaviService.DoSetVisible(const Value: Boolean);
begin
  if FView = nil then exit;
  
  CallInUIThread(procedure
  begin
    if Value then
      TJBNRouteGuideManager.JavaClass.getInstance.onStart
    else
      TJBNRouteGuideManager.JavaClass.getInstance.onStop;
  end);

end;

procedure TAndroidBaiduMapNaviService.DostartNaviRoutePlan(RoutePlan:TBNRoutePlanNodes);
var
  List:JArrayList;
  Node:JBNRoutePlanNode;
  i: Integer;
  b:Boolean;
begin
  //List:=TJList.Wrap((TJArrayList.JavaClass.Init as ILocalObject).GetObjectID);
  List:=TJArrayList.JavaClass.Init;
  for i := 0 to Length(RoutePlan) - 1 do
  begin
    //默认使用 TJBNRoutePlanNode_CoordinateType.JavaClass.BD09LL 坐标系
    Node:= TJBNRoutePlanNode.JavaClass.init(RoutePlan[i].location.Longitude, RoutePlan[i].location.Latitude,
      StringToJString(RoutePlan[i].name), StringToJString(RoutePlan[i].description), TJBNRoutePlanNode_CoordinateType.JavaClass.BD09LL);
    List.add(Node);
  end;
  if FRoutePlanListener = nil then
    FRoutePlanListener:=TNaviManager_RoutePlanListener.Create(Self);
  b := TJBaiduNaviManager.JavaClass.isNaviInited;
  b := TJBaiduNaviManager.JavaClass.isNaviSoLoadSuccess;
  b:=FNaviManager.launchNavigator(SharedActivity, JList(List), 1, True, FRoutePlanListener);
end;

procedure TAndroidBaiduMapNaviService.DoUpdateBaiduNaviFromControl;
begin
  CallInUiThread(RealignView);
end;

procedure TAndroidBaiduMapNaviService.RealignView;
const
  MapExtraSpace = 100;
  // To be sure that destination rect will fit to fullscreen
var
  MapRect: TRectF;
  RoundedRect: TRect;
  LSizeF: TPointF;
  LRealBounds: TRectF;
  LRealPosition, LRealSize: TPointF;
begin
  if (FJNativeLayout <> nil) then
  begin
    //全屏
    LRealPosition := TPointF.Zero;
    LSizeF := TPointF.Create(screen.Size.cx, screen.Size.cy);
    LRealSize := LSizeF * Scale;
    LRealBounds := TRectF.Create(LRealPosition, LRealSize);
    MapRect := TRectF.Create(0, 0, Screen.Width * MapExtraSpace,
      Screen.Height * MapExtraSpace);
    RoundedRect := MapRect.FitInto(LRealBounds).Round;
    if FView=nil then
      RoundedRect.Left := Round(Screen.Size.cx * Scale);
    FJNativeLayout.setPosition(RoundedRect.TopLeft.X, RoundedRect.TopLeft.Y);
    FJNativeLayout.setSize(RoundedRect.Width, RoundedRect.Height);
  end;
end;

{ TNaviManager_NavEventLister }

procedure TNaviManager_NaviInitListener.initFailed;
begin
  //初始化失败
end;

procedure TNaviManager_NaviInitListener.initStart;
begin
  //初始化开始
end;

procedure TNaviManager_NaviInitListener.initSuccess;
begin
  //初始化成功
end;

procedure TNaviManager_NaviInitListener.onAuthResult(P1: Integer; P2: JString);
begin
  // key 校验  P1 = 0 校验成功  其他校验失败
end;


{ TNaviManager_BaseListerer }

constructor TNaviManager_BaseListerer.Create(
  NaviService: TAndroidBaiduMapNaviService);
begin
  inherited Create;
  FNaviService:=NaviService;
end;

{ TNaviManager_RoutePlanListener }

procedure TNaviManager_RoutePlanListener.onJumpToNavigator;
begin
  if (FNaviService<>nil) then
    FNaviService.DoJumpToNavigator;
end;

procedure TNaviManager_RoutePlanListener.onRoutePlanFailed;
begin
  //算路失败
end;

{ TJBNRouteGuideManager_OnNavigationListener }

procedure TJBNRouteGuideManager_OnNavigationListener.notifyOtherAction(P1, P2,
  P3: Integer; P4: JObject);
begin

end;

procedure TJBNRouteGuideManager_OnNavigationListener.onNaviGuideEnd;
begin
  TJBNRouteGuideManager.JavaClass.getInstance.onStop;
  TJBNRouteGuideManager.JavaClass.getInstance.onDestroy;
  FNaviService.FView:=nil;
  CallInUIThread(FNaviService.RealignView);
end;

end.
