program ScrollYearsDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  ScrollYearsDemoMain in 'ScrollYearsDemoMain.pas' {Form5},
  FMX.ScrollYears in '..\ComponentsSource\FMX.ScrollYears.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
