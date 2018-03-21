program TestLoadingIndicator;

uses
  System.StartUpCopy,
  FMX.Forms,
  LoadingIndicatorDemoMain in 'LoadingIndicatorDemoMain.pas' {Form35};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLoadingIndicatorDemoMainForm, LoadingIndicatorDemoMainForm);
  Application.Run;
end.
