program CalendarDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  CalendarDemoMain in 'CalendarDemoMain.pas' {CalendarDemoMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TCalendarDemoMainForm, CalendarDemoMainForm);
  Application.Run;
end.
