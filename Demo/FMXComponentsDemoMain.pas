unit FMXComponentsDemoMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,FMX.Types, FMX.Controls, FMX.Forms,
  FMX.Objects, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollableList, FMX.RatingBar,
  FMX.Ani, FMX.CircleScoreIndicator, FMX.TabControl, FMX.ImageSlider;

type
  TFMXComponentsDemoForm = class(TForm)
    Layout16: TLayout;
    Layout3: TLayout;
    Line1: TLine;
    Line4: TLine;
    FMXScrollableList2: TFMXScrollableList;
    Label1: TLabel;
    LayoutYears: TLayout;
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
    Layout4: TLayout;
    Layout5: TLayout;
    Line5: TLine;
    Line6: TLine;
    FMXScrollableList3: TFMXScrollableList;
    Label3: TLabel;
    TabControl1: TTabControl;
    Basic: TTabItem;
    Slider: TTabItem;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    FMXImageSlider1: TFMXImageSlider;
    FloatAnimation3: TFloatAnimation;
    procedure FMXScrollableList2Change(Sender: TObject);
    procedure FMXScrollableList1Change(Sender: TObject);
    procedure btnAnimationClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FMXScrollableList3Change(Sender: TObject);
    procedure FormResize(Sender: TObject);
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

procedure TFMXComponentsDemoForm.FMXScrollableList3Change(Sender: TObject);
begin
  Label3.Text := FMXScrollableList3.GetSelected;
end;

procedure TFMXComponentsDemoForm.FormCreate(Sender: TObject);
begin
  Label1.Text := FMXScrollableList1.GetSelected;
  Label2.Text := FMXScrollableList2.GetSelected;
  Label3.Text := FMXScrollableList3.GetSelected;

  FMXImageSlider1.SetPage(0, Image1);
  FMXImageSlider1.SetPage(1, Image2);
  FMXImageSlider1.SetPage(2, Image3);
  FMXImageSlider1.SetPage(3, Image4);
end;

procedure TFMXComponentsDemoForm.FormResize(Sender: TObject);
begin
  FMXImageSlider1.Height := ClientWidth * 200 / 320;
end;

end.
