unit ScrollYearsDemoMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,FMX.Types, FMX.Controls, FMX.Forms,
  FMX.Objects, FMX.Layouts,FMX.ScrollYears,
  FMX.StdCtrls, FMX.Controls.Presentation;

type
  TForm5 = class(TForm)
    Layout16: TLayout;
    Layout3: TLayout;
    Line1: TLine;
    Line4: TLine;
    FMXScrollYears2: TFMXScrollYears;
    Label1: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    Line2: TLine;
    Line3: TLine;
    FMXScrollYears1: TFMXScrollYears;
    Label2: TLabel;
    procedure FMXScrollYears2Change(Sender: TObject);
    procedure FMXScrollYears1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation
{$R *.fmx}


procedure TForm5.FMXScrollYears1Change(Sender: TObject);
begin
  Label1.Text := FMXScrollYears1.GetSelected;
end;

procedure TForm5.FMXScrollYears2Change(Sender: TObject);
begin
  Label2.Text := FMXScrollYears2.GetSelected;
end;

end.
