program PhotoCorrect;

uses
  System.StartUpCopy,
  FMX.Forms,
  PhotoCorrectDemoMain in 'PhotoCorrectDemoMain.pas' {PhotoCorrectMainForm},
  PerspectiveCorrect in 'PerspectiveCorrect.pas',
  SimpleSVD in 'SimpleSVD.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPhotoCorrectMainForm, PhotoCorrectMainForm);
  Application.Run;
end.
