unit BaiduMapAPI.SDKInitializer;
//author:Xubzhlin
//Email:371889755@qq.com

//百度地图API 服务 单元
//官方链接:http://lbsyun.baidu.com/

//TSDKInitializer 百度地图 SDK初始化
interface

{$IFDEF iOS}
uses
  Macapi.Helpers, iOSapi.BaiduMapAPI_Base;
{$ENDIF}
{$IFDEF ANDROID}
uses
  System.IOUtils, Androidapi.Helpers, Androidapi.JNI.baidu.mapapi, FMX.CallUIThread.Helper.Android;

{$ENDIF}

type
  TSDKInitializer = class
  private
    class var FAppKey:string;
    class function GetAppKey: string; static;
  {$IFDEF iOS}
    class var FMapManager:BMKMapManager;
  {$ENDIF}
  public
    class procedure SDKInit(AppKey:string);
    class property AppKey:string read GetAppKey;
  end;

implementation

{ TSDKInitializer }

class function TSDKInitializer.GetAppKey: string;
begin
  Result := FAppKey;
end;

class procedure TSDKInitializer.SDKInit(AppKey:string);
begin

{$IFDEF iOS}
  FAppKey:=AppKey;
  FMapManager:=TBMKMapManager.Create;
  FMapManager.start(StrToNSStr(AppKey),nil);
  FMapManager.retain;
{$ENDIF}
{$IFDEF ANDROID}
  CallInUIThreadAndWaitFinishingFix(
    procedure
    var
      s:string;
    begin
      s:=TPath.GetDocumentsPath;
      TJSDKInitializer.JavaClass.initialize
        (StringToJString(s), SharedActivity.getApplicationContext);
    end);
{$ENDIF}

end;

end.
