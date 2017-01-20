unit FMXComponentsDemoMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,FMX.Types, FMX.Controls, FMX.Forms,
  FMX.Objects, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollableList, FMX.RatingBar,
  FMX.Ani, FMX.CircleScoreIndicator;

type
  TFMXComponentsDemoForm = class(TForm)
    Layout16: TLayout;
    Layout3: TLayout;
    Line1: TLine;
    Line4: TLine;
    FMXScrollableList2: TFMXScrollableList;
    Label1: TLabel;
    Layout1: TLayout;
    Layout2: TLayout;
    Line2: TLine;
    Line3: TLine;
    FMXScrollableList1: TFMXScrollableList;
    Label2: TLabel;
    FMXRatingBar1: TFMXRatingBar;
    lblHeader: TLabel;
    btnAnimation: TButton;
    FloatAnimation1: TFloatAnimation;
    FMXCircleScoreIndicator1: TFMXCircleScoreIndicator;
    FloatAnimation2: TFloatAnimation;
    procedure FMXScrollableList2Change(Sender: TObject);
    procedure FMXScrollableList1Change(Sender: TObject);
    procedure btnAnimationClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMXComponentsDemoForm: TFMXComponentsDemoForm;

implementation
{$R *.fmx}


procedure TFMXComponentsDemoForm.btnAnimationClick(Sender: TObject);
begin
  FloatAnimation1.Start;
  FloatAnimation2.Start;
end;

procedure TFMXComponentsDemoForm.FMXScrollableList1Change(Sender: TObject);
begin
  Label1.Text := FMXScrollableList1.GetSelected;
end;

procedure TFMXComponentsDemoForm.FMXScrollableList2Change(Sender: TObject);
begin
  Label2.Text := FMXScrollableList2.GetSelected;
end;

procedure TFMXComponentsDemoForm.FormCreate(Sender: TObject);
begin
  Label1.Text := FMXScrollableList1.GetSelected;
  Label2.Text := FMXScrollableList2.GetSelected;
end;

end.
