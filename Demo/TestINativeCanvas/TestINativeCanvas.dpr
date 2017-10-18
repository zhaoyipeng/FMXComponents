program TestINativeCanvas;

uses
  System.StartUpCopy,
  FMX.Forms,
  TestINativeCanvasMain in 'TestINativeCanvasMain.pas' {TestDrawBitmapMainForm},
  FMX.Graphics.NativeCanvas in '..\..\ComponentsSource\FMX.Graphics.NativeCanvas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTestDrawBitmapMainForm, TestDrawBitmapMainForm);
  Application.Run;
end.
