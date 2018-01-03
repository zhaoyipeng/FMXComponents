program TestLoadingIndicator;

uses
  System.StartUpCopy,
  FMX.Forms,
  LoadingIndicatorDemoMain in 'LoadingIndicatorDemoMain.pas' {Form35};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm35, Form35);
  Application.Run;
end.
