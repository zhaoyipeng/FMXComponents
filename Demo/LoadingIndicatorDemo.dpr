program LoadingIndicatorDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.BezierAnimation in '..\ComponentsSource\FMX.BezierAnimation.pas',
  FMX.LoadingIndicator in '..\ComponentsSource\FMX.LoadingIndicator.pas',
  LoadingIndicatiorDemoMain in 'LoadingIndicatiorDemoMain.pas' {LoadingIndicatorDemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLoadingIndicatorDemoForm, LoadingIndicatorDemoForm);
  Application.Run;
end.
