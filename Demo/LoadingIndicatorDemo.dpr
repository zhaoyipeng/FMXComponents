program LoadingIndicatorDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  LoadingIndicatiorDemoMain in 'LoadingIndicatiorDemoMain.pas' {LoadingIndicatorDemoForm},
  FMX.LoadingIndicator in '..\ComponentsSource\FMX.LoadingIndicator.pas',
  FMX.BezierAnimation in '..\ComponentsSource\FMX.BezierAnimation.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLoadingIndicatorDemoForm, LoadingIndicatorDemoForm);
  Application.Run;
end.
