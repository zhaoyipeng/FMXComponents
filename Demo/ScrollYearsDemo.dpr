program ScrollYearsDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  ScrollYearsDemoMain in 'ScrollYearsDemoMain.pas' {Form5},
  FMX.ScrollableList in '..\ComponentsSource\FMX.ScrollableList.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
