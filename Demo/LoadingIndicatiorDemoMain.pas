unit LoadingIndicatiorDemoMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.LoadingIndicator,
  FMX.Objects, FMX.Ani, FMX.Utils, FMX.BezierAnimation;

type
  TLoadingIndicatorDemoForm = class(TForm)
    GridPanelLayout1: TGridPanelLayout;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Rectangle3: TRectangle;
    Label13: TLabel;
    rect1: TRectangle;
    Rectangle2: TRectangle;
    Label1: TLabel;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    GridPanelLayout2: TGridPanelLayout;
    FMXLoadingIndicator6: TFMXLoadingIndicator;
    FMXLoadingIndicator7: TFMXLoadingIndicator;
    FMXLoadingIndicator8: TFMXLoadingIndicator;
    FMXLoadingIndicator3: TFMXLoadingIndicator;
    FMXLoadingIndicator2: TFMXLoadingIndicator;
    FMXLoadingIndicator1: TFMXLoadingIndicator;
    FMXLoadingIndicator4: TFMXLoadingIndicator;
    FMXLoadingIndicator9: TFMXLoadingIndicator;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Button1: TButton;
    FloatAnimation1: TFloatAnimation;
    FMXLoadingIndicator10: TFMXLoadingIndicator;
    FMXLoadingIndicator11: TFMXLoadingIndicator;
    FMXLoadingIndicator13: TFMXLoadingIndicator;
    FMXLoadingIndicator16: TFMXLoadingIndicator;
    FMXLoadingIndicator17: TFMXLoadingIndicator;
    FMXLoadingIndicator19: TFMXLoadingIndicator;
    FMXLoadingIndicator21: TFMXLoadingIndicator;
    FMXLoadingIndicator23: TFMXLoadingIndicator;
    FMXLoadingIndicator5: TFMXLoadingIndicator;
    FMXLoadingIndicator12: TFMXLoadingIndicator;
    FMXLoadingIndicator14: TFMXLoadingIndicator;
    FMXLoadingIndicator15: TFMXLoadingIndicator;
    FMXLoadingIndicator18: TFMXLoadingIndicator;
    FMXLoadingIndicator20: TFMXLoadingIndicator;
    FMXLoadingIndicator22: TFMXLoadingIndicator;
    FMXLoadingIndicator24: TFMXLoadingIndicator;
    FMXLoadingIndicator25: TFMXLoadingIndicator;
    FMXLoadingIndicator26: TFMXLoadingIndicator;
    FMXLoadingIndicator27: TFMXLoadingIndicator;
    FMXLoadingIndicator28: TFMXLoadingIndicator;
    FMXLoadingIndicator29: TFMXLoadingIndicator;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FloatAnimation1Process(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
  private
    { Private declarations }
    FBezier: TBezier;
  public
    { Public declarations }
  end;

var
  LoadingIndicatorDemoForm: TLoadingIndicatorDemoForm;

implementation

{$R *.fmx}

procedure TLoadingIndicatorDemoForm.Button1Click(Sender: TObject);
begin
  FloatAnimation1.Enabled := not FloatAnimation1.Enabled;
end;

procedure TLoadingIndicatorDemoForm.FloatAnimation1Process(Sender: TObject);
var
  T, T1: Single;
begin
  T := FloatAnimation1.NormalizedTime;
  T1 := GetEaseInOut.Solve(T, 1.0E-5);
  Rectangle6.Position.X := InterpolateSingle(
    FloatAnimation1.StartValue, FloatAnimation1.StopValue, T1);
end;

procedure TLoadingIndicatorDemoForm.FormCreate(Sender: TObject);
begin
//  FBezier := TBezier.Create(0.09,0.57,0.49,0.9);
  FBezier := TBezier.Create(0.42,0,0.58,1);
end;

procedure TLoadingIndicatorDemoForm.FormDestroy(Sender: TObject);
begin
  FBezier.Free;
end;

procedure TLoadingIndicatorDemoForm.PaintBox1Paint(Sender: TObject;
  Canvas: TCanvas);
//var
//  p: TPathData;
//  P0, P1, P2, P3: TPointF;
begin
//  p := TPathData.Create;
//  P0 := PointF(0,0);
//  P1 := PointF(9, 57);
//  P2 := PointF(49,90);
//  P3 := PointF(100,100);
//  p.MoveTo(P0);
//  P.CurveTo(P1, P2, P3);
//  PaintBox1.Scale.Y := -1;
//  Canvas.Stroke.Kind := TBrushKind.Solid;
//  Canvas.Stroke.Color := TAlphaColors.Black;
//  Canvas.DrawRect(PaintBox1.LocalRect, 0,0,allcorners,  1, TCornerType.Round);
//  Canvas.DrawPath(p, 1);
//  Canvas.DrawLine(P0, P3, 1);
//  Canvas.DrawLine(P0, P1, 1);
//  Canvas.DrawLine(P2, P3, 1);
//  p.Free;
end;

end.
