unit FMX.CallUIThread.Helper.Android;
//安卓 CallInUIThreadAndWaitFinishing  修复 等待卡死的问题
//感觉 老猫

interface

uses
  System.Classes, System.SyncObjs, FMX.Forms, FMX.Helpers.Android;

procedure CallInUIThreadAndWaitFinishingFix(AMethod: TMethodCallback); overload;
procedure CallInUIThreadAndWaitFinishingFix(AMethod: TCallBack); overload;

implementation

var
  UIThreadID: TThreadID = 0;

procedure GetUIThread;
begin
  CallInUIThread(
  procedure()begin
    UIThreadID := TThread.CurrentThread.ThreadID;
  end);
end;

procedure WaitForEvent(AEvent: TEvent; WaitForTime: Integer = 0);
var
  CurrThreadID:TThreadID;
begin
  if AEvent = nil then  exit;
  if WaitForTime = 0 then
    WaitForTime := 5;
  CurrThreadID := TThread.CurrentThread.ThreadID;
  if (TThread.CurrentThread.ThreadID = UIThreadID) or
    (TThread.CurrentThread.ThreadID = MainThreadID) then
  begin
    while AEvent.WaitFor(WaitForTime) = wrTimeout do
    begin
      Application.ProcessMessages;
    end;
  end
  else
    AEvent.WaitFor;
end;

function CheckUIThread: Boolean;
begin
  if TThread.CurrentThread.ThreadID = UIThreadID then
    Result := True
  else
    Result:=False;
end;

procedure CallInUIThreadAndWaitFinishingFix(AMethod: TMethodCallback); overload;
var
  Event: TEvent;
begin
  if (UIThreadID <> 0) and CheckUIThread then
  begin
    AMethod;
    exit;
  end;
  Event := TEvent.Create;
  try
    CallInUIThread(procedure
      begin
        if Assigned(AMethod) then
          AMethod;
        Event.SetEvent;
      end);
    WaitForEvent(Event);
  finally
    Event.DisposeOf;
  end;
end;

procedure CallInUIThreadAndWaitFinishingFix(AMethod: TCallBack); overload;
var
  Event: TEvent;
begin
  if (UIThreadID <> 0) and CheckUIThread then
  begin
    AMethod;
    exit;
  end;
  Event := TEvent.Create;
  try
    CallInUIThread(procedure
      begin
        if Assigned(AMethod) then
          AMethod;
        Event.SetEvent;
      end);
    WaitForEvent(Event);
  finally
    Event.DisposeOf;
  end;
end;

initialization
  GetUIThread;

end.
