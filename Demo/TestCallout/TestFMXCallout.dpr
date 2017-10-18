program TestFMXCallout;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Form1},
  FMX.Graphics.NativeCanvas in 'FMX.Graphics.NativeCanvas.pas',
  FMX.TextLayout.Native in 'FMX.TextLayout.Native.pas',
  FMX.Graphics.INativeCanvas in 'FMX.Graphics.INativeCanvas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
