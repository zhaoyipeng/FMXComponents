unit FMXComponentsDemoMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms,
  FMX.Objects, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollableList, FMX.RatingBar,
  FMX.Ani, FMX.CircleScoreIndicator, FMX.TabControl, FMX.ImageSlider,
  FMX.ScrollBox, FMX.Memo, FMX.SimpleBBCodeText, ONE.Objects, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, FMX.GesturePassword, FMX.CalendarControl;

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
    tabBasic: TTabItem;
    tabSlider: TTabItem;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    FMXImageSlider1: TFMXImageSlider;
    FloatAnimation3: TFloatAnimation;
    tabBBCode: TTabItem;
    Memo1: TMemo;
    Layout1: TLayout;
    FMXSimpleBBCodeText1: TFMXSimpleBBCodeText;
    BindingsList1: TBindingsList;
    tabGesturePassword: TTabItem;
    Layout6: TLayout;
    FMXGesturePassword1: TFMXGesturePassword;
    lbl1: TLabel;
    lblPassword: TLabel;
    tabCalendarControl: TTabItem;
    FMXCalendarControl1: TFMXCalendarControl;
    Layout7: TLayout;
    chkShowLunarDate: TCheckBox;
    procedure FMXScrollableList2Change(Sender: TObject);
    procedure FMXScrollableList1Change(Sender: TObject);
    procedure btnAnimationClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FMXScrollableList3Change(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FMXSimpleBBCodeText1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure FMXGesturePassword1EnterCompleteEvent(Sender: TObject;
      const APassword: string);
    procedure chkShowLunarDateChange(Sender: TObject);
  private
    { Private declarations }
    FSelection1: TOneSelection;
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

procedure TFMXComponentsDemoForm.chkShowLunarDateChange(Sender: TObject);
begin
  FMXCalendarControl1.IsShowLunarDate := chkShowLunarDate.IsChecked;
end;

procedure TFMXComponentsDemoForm.FMXGesturePassword1EnterCompleteEvent(
  Sender: TObject; const APassword: string);
begin
  lblPassword.Text := self.FMXGesturePassword1.Password;
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

procedure TFMXComponentsDemoForm.FMXSimpleBBCodeText1Click(Sender: TObject);
var
  c: TControl;
begin
  if FSelection1.ChildrenCount > 0 then
  begin
    c := TControl(FSelection1.Children[0]);
    c.HitTest := True;
    c.Align := TAlignLayout.None;
    c.Parent := Layout1;
    c.BoundsRect := FSelection1.BoundsRect;
    c.Position.Point := FSelection1.Position.Point;
  end;

  FSelection1.BoundsRect := TControl(Sender).BoundsRect;
  FSelection1.Position.Point := TControl(Sender).Position.Point;
  FSelection1.Visible := True;
  FSelection1.BringToFront;

  TControl(Sender).Parent := FSelection1;
  TControl(Sender).Align := TAlignLayout.Client;
  TControl(Sender).HitTest := False;
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

  FSelection1 := TOneSelection.Create(Self);
  FSelection1.GripSize := 8;
  FSelection1.Proportional := False;
  Layout1.AddObject(FSelection1);

  FMXSimpleBBCodeText1Click(FMXSimpleBBCodeText1);
end;

procedure TFMXComponentsDemoForm.FormResize(Sender: TObject);
begin
  FMXImageSlider1.Height := ClientWidth * 200 / 320;
end;

procedure TFMXComponentsDemoForm.Memo1Change(Sender: TObject);
begin
  self.FMXSimpleBBCodeText1.Lines.Assign(Memo1.Lines);
end;

end.
