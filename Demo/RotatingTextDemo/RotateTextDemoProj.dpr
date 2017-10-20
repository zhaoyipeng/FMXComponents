program RotateTextDemoProj;

uses
  System.StartUpCopy,
  FMX.Forms,
  RotateTextDemoMain in 'RotateTextDemoMain.pas' {RotatingTextDemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.InvertedLandscape];
  Application.CreateForm(TRotatingTextDemoForm, RotatingTextDemoForm);
  Application.Run;
end.
