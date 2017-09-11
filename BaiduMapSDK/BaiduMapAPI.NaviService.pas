unit BaiduMapAPI.NaviService;
//author:Xubzhlin
//Email:371889755@qq.com

//百度地图API 导航服务 单元
//官方链接:http://lbsyun.baidu.com/
//TBaiduMapNaviService 百度地图 导航服务

interface

uses
  FMX.Platform, BaiduMapAPI.NaviService.CommTypes;

type
  IBaiduMapNaviService = interface
    ['{505FA6D0-7135-49D8-B964-3921AE206B98}']
    procedure initService(AKey:string; ATTSKey:string);
    procedure startNaviRoutePlan(RoutePlan:TBNRoutePlanNodes);
  end;

  TBaiduMapNaviService = class(TInterfacedObject, IBaiduMapNaviService)
  private
    FScale:Single;
    FNaviKey:string;
    FTTSKey:string;
    procedure SetVisible(const Value: Boolean);
  protected
    procedure DoinitService;  virtual;  abstract;
    procedure DostartNaviRoutePlan(RoutePlan:TBNRoutePlanNodes);  virtual;  abstract;
    procedure DoSetVisible(const Value: Boolean); virtual;  abstract;
    procedure DoUpdateBaiduNaviFromControl; virtual;  abstract;
    property Scale:Single read FScale;
    property NaviKey:String read FNaviKey;
    property TTSKey:String read FTTSKey;
  public
    procedure UpdateBaiduNaviFromControl;
    procedure initService(AKey:string; ATTSKey:string);
    procedure startNaviRoutePlan(RoutePlan:TBNRoutePlanNodes);
    property Visible:Boolean write SetVisible;
    constructor Create;
  end;

  TBaiduMapNavi = class(TObject)
  private
    FNaviService:TBaiduMapNaviService;
  public
    constructor Create;
    destructor Destroy; override;
    property NaviService:TBaiduMapNaviService read FNaviService;
  end;



implementation

{$IFDEF IOS}
uses
  BaiduMapAPI.NaviService.iOS;
{$ENDIF}
{$IFDEF ANDROID}
uses
  BaiduMapAPI.NaviService.Android;
{$ENDIF ANDROID}

{ TBaiduMapNaviService }

constructor TBaiduMapNaviService.Create;
var
  ScreenSrv:IFMXScreenService;
begin
  inherited Create;

  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService,
    ScreenSrv) then
    FScale := ScreenSrv.GetScreenScale
  else
    FScale := 1;
end;

procedure TBaiduMapNaviService.initService(AKey:string; ATTSKey:string);
begin
  FNaviKey:=AKey;
  FTTSKey:=ATTSKey;
  DoinitService;
end;

procedure TBaiduMapNaviService.SetVisible(const Value: Boolean);
begin
  DoSetVisible(Value);
end;

procedure TBaiduMapNaviService.startNaviRoutePlan(RoutePlan:TBNRoutePlanNodes);
begin
  DostartNaviRoutePlan(RoutePlan);
end;

procedure TBaiduMapNaviService.UpdateBaiduNaviFromControl;
begin
  DoUpdateBaiduNaviFromControl;
end;

{ TBaiduMapNavi }

constructor TBaiduMapNavi.Create;
begin
  inherited Create;
{$IFDEF IOS}
  FNaviService:=TiOSBaiduMapNaviService.Create;
{$ENDIF}
{$IFDEF ANDROID}
  FNaviService:=TAndroidBaiduMapNaviService.Create;
{$ENDIF ANDROID}
  FNaviService.Visible:=False;
end;

destructor TBaiduMapNavi.Destroy;
begin
  FNaviService.Free;
  inherited;
end;

end.
