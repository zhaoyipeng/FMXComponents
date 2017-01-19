program FMXComponentsDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMXComponentsDemoMain in 'FMXComponentsDemoMain.pas' {FMXComponentsDemoForm},
  FMX.ScrollableList in '..\ComponentsSource\FMX.ScrollableList.pas',
  FMX.RatingBar in '..\ComponentsSource\FMX.RatingBar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMXComponentsDemoForm, FMXComponentsDemoForm);
  Application.Run;
end.
