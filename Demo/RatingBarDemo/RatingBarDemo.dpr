program RatingBarDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  RatingBarDemoMain in 'RatingBarDemoMain.pas' {RatingBarDemoForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TRatingBarDemoForm, RatingBarDemoForm);
  Application.Run;
end.
