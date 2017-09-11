unit BaiduMapAPI.NaviService.iOS;
//author:Xubzhlin
//Email:371889755@qq.com

//百度地图API iOS导航服务 单元
//官方链接:http://lbsyun.baidu.com/
//TiOSBaiduMapNaviService 百度地图 iOS导航服务

interface

uses
  System.Classes, iOSapi.Foundation, Macapi.ObjectiveC, Macapi.Helpers, 
  BaiduMapAPI.NaviService.CommTypes,  BaiduMapAPI.NaviService, iOSapi.BaiduMapAPI_Navi;

type

  TiOSBaiduMapNaviService = class;
  
  TBNNaviRoutePlanDelegate = class(TOCLocal, BNNaviRoutePlanDelegate)
  private
    [Weak] FNaviService: TiOSBaiduMapNaviService;
  public
    procedure routePlanDidFinished(userInfo:NSDictionary); cdecl;
    procedure searchDidFinished(userInfo:NSDictionary); cdecl;
    [MethodName('routePlanDidFailedWithError:andUserInfo:')]
    procedure routePlanDidFailedWithError(error:NSError; userInfo:NSDictionary); cdecl;
    procedure routePlanDidUserCanceled(userInfo:NSDictionary); cdecl;
    procedure updateRoadConditionDidFinished(pbData:NSData); cdecl;
    procedure updateRoadConditionFailed(pbData:NSData); cdecl;

    constructor Create(NaviService: TiOSBaiduMapNaviService);
  end;

  TBNNaviUIManagerDelegate = class(TOCLocal, BNNaviUIManagerDelegate)
  private
    [Weak] FNaviService: TiOSBaiduMapNaviService;
  public
    function naviPresentedViewController:Pointer; cdecl;
    [MethodName('extraInfo:extraInfo:')]
    procedure onExitPage(pageType:BNaviUIType; extraInfo:NSDictionary); cdecl;

    constructor Create(NaviService: TiOSBaiduMapNaviService);
  end;
//
  TiOSBaiduMapNaviService = class(TBaiduMapNaviService)
  private
    FServices:BNCoreServices;
//    FRoutePlan:BNRoutePlanManagerProtocol;
//    FRoutePlanDelegete:TBNNaviRoutePlanDelegate;
//    FUIManager:BNUIManagerProtocol;
//    FUIManagerDelegete:TBNNaviUIManagerDelegate;
    function DoinitDirs:Boolean;
    procedure DoRoutePlanDidFinished;
    procedure RealignView;
    procedure DoInitTTS;
  protected
    procedure DoinitService; override;
    procedure DostartNaviRoutePlan(RoutePlan:TBNRoutePlanNodes); override;
    procedure DoSetVisible(const Value: Boolean); override;
    procedure DoUpdateBaiduNaviFromControl; override;
  end;

implementation

{ TAndroidBaiduMapNaviService }

function TiOSBaiduMapNaviService.DoinitDirs: Boolean;
begin

end;

procedure TiOSBaiduMapNaviService.DoinitService;
begin
  FServices:=TBNCoreServices.OCClass.GetInstance;
  FServices.initServices(StrToNSStr(NaviKey));
end;

procedure TiOSBaiduMapNaviService.DoInitTTS;
begin

end;

procedure TiOSBaiduMapNaviService.DoRoutePlanDidFinished;
begin
//  if FUIManager = nil then
//    FUIManager:=BNUIManagerProtocol(TBNCoreServices.OCClass.UIService);
//  if FUIManagerDelegete = nil then
//    FUIManagerDelegete:=TBNNaviUIManagerDelegate.Create(Self);
//  FUIManager.showPage(BNaviUI_NormalNavi, FUIManagerDelegete, nil);
end;

procedure TiOSBaiduMapNaviService.DoSetVisible(const Value: Boolean);
begin


end;

procedure TiOSBaiduMapNaviService.DostartNaviRoutePlan(
  RoutePlan: TBNRoutePlanNodes);
var
  i:Integer;
  nodesArray:NSMutableArray;
  Positon:BNPosition;
  Node:BNRoutePlanNode;
begin
  nodesArray:=TNSMutableArray.Wrap(TNSMutableArray.OCClass.arrayWithCapacity(Length(RoutePlan)));

  for i := 0 to Length(RoutePlan) - 1 do
  begin  
    Node:= TBNRoutePlanNode.Create;
    Node.getPos.setX(RoutePlan[i].location.Latitude);
    Node.getPos.setY(RoutePlan[i].location.Longitude);
    Node.getPos.setEType(BNCoordinate_BaiduMapSDK);
    nodesArray.addObject(Node);  
  end;

//  if FRoutePlan = nil then
//    FRoutePlan:=BNRoutePlanManagerProtocol(TBNCoreServices.OCClass.RoutePlanService);
//  if FRoutePlanDelegete = nil then
//    FRoutePlanDelegete:=TBNNaviRoutePlanDelegate.Create(Self);
//  FRoutePlan.startNaviRoutePlan(BNRoutePlanMode_Recommend, nodesArray, nil, FRoutePlanDelegete.GetObjectID, nil);
end;

procedure TiOSBaiduMapNaviService.DoUpdateBaiduNaviFromControl;
begin
  RealignView;
end;

procedure TiOSBaiduMapNaviService.RealignView;
begin

end;

{ TBNNaviRoutePlanDelegate }

constructor TBNNaviRoutePlanDelegate.Create(
  NaviService: TiOSBaiduMapNaviService);
begin
  inherited Create;
  FNaviService := NaviService;
end;

procedure TBNNaviRoutePlanDelegate.routePlanDidFailedWithError(error: NSError;
  userInfo: NSDictionary);
begin

end;

procedure TBNNaviRoutePlanDelegate.routePlanDidFinished(userInfo: NSDictionary);
begin
  //算了成功
  if FNaviService<>nil then
    FNaviService.DoRoutePlanDidFinished;
end;

procedure TBNNaviRoutePlanDelegate.routePlanDidUserCanceled(
  userInfo: NSDictionary);
begin

end;

procedure TBNNaviRoutePlanDelegate.searchDidFinished(userInfo: NSDictionary);
begin

end;

procedure TBNNaviRoutePlanDelegate.updateRoadConditionDidFinished(
  pbData: NSData);
begin

end;

procedure TBNNaviRoutePlanDelegate.updateRoadConditionFailed(pbData: NSData);
begin

end;

{ TBNNaviUIManagerDelegate }

constructor TBNNaviUIManagerDelegate.Create(
  NaviService: TiOSBaiduMapNaviService);
begin
  inherited Create;
  FNaviService := NaviService;  
end;

function TBNNaviUIManagerDelegate.naviPresentedViewController: Pointer;
begin
  //不用实现默认最上层
end;

procedure TBNNaviUIManagerDelegate.onExitPage(pageType: BNaviUIType;
  extraInfo: NSDictionary);
begin
  //退出UI
  if FNaviService<>nil then
  begin
    FNaviService.RealignView;
  end;
end;

end.
