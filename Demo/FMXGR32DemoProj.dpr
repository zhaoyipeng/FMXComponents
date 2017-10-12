program FMXGR32DemoProj;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMXGR32DemoMain in 'FMXGR32DemoMain.pas' {FMXGR32DemoMainFrom};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMXGR32DemoMainFrom, FMXGR32DemoMainFrom);
  Application.Run;
end.
