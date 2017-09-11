program FMXComponentsDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMXComponentsDemoMain in 'FMXComponentsDemoMain.pas' {FMXComponentsDemoForm},
  ONE.Objects in 'ONE.Objects.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMXComponentsDemoForm, FMXComponentsDemoForm);
  Application.Run;
end.
