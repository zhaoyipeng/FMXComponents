unit TestFMXCalloutMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit, FMX.EditBox,
  FMX.SpinBox, FMX.Colors,
  FMX.Callout,
  FMX.Graphics.INativeCanvas,
  FMX.Graphics.NativeCanvas;

type
  TForm1 = class(TForm)
    Selection1: TSelection;
    TopSB: TSpeedButton;
    BottomSB: TSpeedButton;
    LeftSB: TSpeedButton;
    RightSB: TSpeedButton;
    XRadiusSpinBox: TSpinBox;
    XRadiusLabel: TLabel;
    Layout2: TLayout;
    YRadiusSpinBox: TSpinBox;
    YRadiusLabel: TLabel;
    CalloutWidthSpinBox: TSpinBox;
    CalloutWidthLabel: TLabel;
    CalloutLengthSpinBox: TSpinBox;
    CalloutLengthLabel: TLabel;
    CalloutOffsetSpinBox: TSpinBox;
    CalloutOffsetLabel: TLabel;
    CalloutPeakOffsetSpinBox: TSpinBox;
    CalloutPeakOffsetLabel: TLabel;
    FillColorCB: TComboColorBox;
    FillColorLabel: TLabel;
    StrokeColorCB: TComboColorBox;
    StrokeLabel: TLabel;
    ThicknessSpinBox: TSpinBox;
    Thickness0Label: TLabel;
    NativeDrawSwitch: TSwitch;
    Label2: TLabel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TopSBClick(Sender: TObject);
    procedure XRadiusSpinBoxChangeTracking(Sender: TObject);
    procedure YRadiusSpinBoxChangeTracking(Sender: TObject);
    procedure CalloutWidthSpinBoxChangeTracking(Sender: TObject);
    procedure CalloutLengthSpinBoxChangeTracking(Sender: TObject);
    procedure CalloutOffsetSpinBoxChangeTracking(Sender: TObject);
    procedure CalloutPeakOffsetSpinBoxChangeTracking(Sender: TObject);
    procedure FillColorCBChange(Sender: TObject);
    procedure StrokeColorCBChange(Sender: TObject);
    procedure ThicknessSpinBoxChangeTracking(Sender: TObject);
    procedure NativeDrawSwitchClick(Sender: TObject);
  private
    FCallout: TFMXCallout;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FCallout := TFMXCallout.Create(Self);
  Selection1.AddObject(FCallout);
  FCallout.HitTest := False;
  FCallout.Stroke.Cap := TStrokeCap.Round;
  FCallout.Stroke.Join := TStrokeJoin.Round;
  FCallout.Align := TAlignLayout.Client;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  XRadiusSpinBox.Value := FCallout.XRadius;
  YRadiusSpinBox.Value := FCallout.YRadius;
  CalloutWidthSpinBox.Value := FCallout.CalloutWidth;
  CalloutLengthSpinBox.Value := FCallout.CalloutLength;
  CalloutOffsetSpinBox.Value := FCallout.CalloutOffset;
  CalloutPeakOffsetSpinBox.Value := FCallout.CalloutPeakOffset;

  case FCallout.CalloutPosition of
    TCalloutPosition.Top:
      TopSB.IsPressed := True;
    TCalloutPosition.Bottom:
      BottomSB.IsPressed := True;
    TCalloutPosition.Left:
      LeftSB.IsPressed := True;
    TCalloutPosition.Right:
      RightSB.IsPressed := True;
  end;

  FillColorCB.Color := FCallout.Fill.Color;
  StrokeColorCB.Color := FCallout.Stroke.Color;
  ThicknessSpinBox.Value := FCallout.Stroke.Thickness;
end;

procedure TForm1.NativeDrawSwitchClick(Sender: TObject);
begin
  FCallout.NativeDraw := NativeDrawSwitch.IsChecked;
end;

procedure TForm1.XRadiusSpinBoxChangeTracking(Sender: TObject);
begin
  FCallout.XRadius := XRadiusSpinBox.Value;
end;

procedure TForm1.YRadiusSpinBoxChangeTracking(Sender: TObject);
begin
  FCallout.YRadius := YRadiusSpinBox.Value;
end;

procedure TForm1.CalloutWidthSpinBoxChangeTracking(Sender: TObject);
begin
  FCallout.CalloutWidth := CalloutWidthSpinBox.Value;
end;

procedure TForm1.CalloutLengthSpinBoxChangeTracking(Sender: TObject);
begin
  FCallout.CalloutLength := CalloutLengthSpinBox.Value;
end;

procedure TForm1.CalloutOffsetSpinBoxChangeTracking(Sender: TObject);
begin
  FCallout.CalloutOffset := CalloutOffsetSpinBox.Value;
end;

procedure TForm1.CalloutPeakOffsetSpinBoxChangeTracking(Sender: TObject);
begin
  FCallout.CalloutPeakOffset := CalloutPeakOffsetSpinBox.Value;
end;

procedure TForm1.TopSBClick(Sender: TObject);
begin
  if Sender = TopSB then
    FCallout.CalloutPosition := TCalloutPosition.Top;
  if Sender = BottomSB then
    FCallout.CalloutPosition := TCalloutPosition.Bottom;
  if Sender = LeftSB then
    FCallout.CalloutPosition := TCalloutPosition.Left;
  if Sender = RightSB then
    FCallout.CalloutPosition := TCalloutPosition.Right;
end;

procedure TForm1.FillColorCBChange(Sender: TObject);
begin
  FCallout.Fill.Color := FillColorCB.Color;
end;

procedure TForm1.StrokeColorCBChange(Sender: TObject);
begin
  FCallout.Stroke.Color := StrokeColorCB.Color;
end;

procedure TForm1.ThicknessSpinBoxChangeTracking(Sender: TObject);
var
  s: Single;
begin
  FCallout.Stroke.Thickness := ThicknessSpinBox.Value;

  s := ThicknessSpinBox.Value / 2;
  Selection1.Padding.Rect := RectF(s, s * 2, s, s);
end;

end.
