program TestBezierAnimation;

uses
  System.StartUpCopy,
  FMX.Forms,
  TestBezierAnimationMain in 'TestBezierAnimationMain.pas' {Form11},
  FMX.BezierAnimation in '..\..\ComponentsSource\FMX.BezierAnimation.pas',
  BezierPanel in 'BezierPanel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm11, Form11);
  Application.Run;
end.
