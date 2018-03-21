program ImageSliderDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmMainU in 'frmMainU.pas' {frmMain},
  FMX.ImageSlider in '..\..\ComponentsSource\FMX.ImageSlider.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
