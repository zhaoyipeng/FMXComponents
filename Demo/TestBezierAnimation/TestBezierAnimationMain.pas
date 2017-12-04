unit TestBezierAnimationMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,
  System.UIConsts,
//  FMX.Graphics.INativeCanvas,
//  FMX.Graphics.NativeCanvas,
  FMX.BezierAnimation,
  FMX.Layouts,
  FMX.BezierPanel, FMX.Ani;

type
  TSelectionPoint = class(FMX.Objects.TSelectionPoint)
  private
    FSelectedFillColor: TAlphaColor;
    procedure SetSelectedFillColor(const Value: TAlphaColor);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property SelectedFillColor: TAlphaColor read FSelectedFillColor write SetSelectedFillColor;
  end;

  TCubicBezierAnimationMainForm = class(TForm)
    pbCanvas: TPaintBox;
    SelectionPoint1: TSelectionPoint;
    SelectionPoint2: TSelectionPoint;
    Label1: TLabel;
    edtEqation: TEdit;
    LayoutPanels: TLayout;
    edtEqation2: TEdit;
    LayoutTop: TLayout;
    LayoutRunners: TLayout;
    Layout1: TLayout;
    Layout2: TLayout;
    BezierPanel1: TFMXBezierPanel;
    BezierPanel2: TFMXBezierPanel;
    BezierAnimation1: TFMXBezierAnimation;
    BezierAnimation2: TFMXBezierAnimation;
    Layout3: TLayout;
    btnRun: TButton;
    trckbrDuration: TTrackBar;
    lblDuration: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtEqationEnter(Sender: TObject);
    procedure pbCanvasPaint(Sender: TObject; Canvas: TCanvas);
    procedure SelectionPoint1Track(Sender: TObject; var X, Y: Single);
    procedure SelectionPoint2Track(Sender: TObject; var X, Y: Single);
    procedure Button1Click(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure trckbrDurationChange(Sender: TObject);
  private
    { Private declarations }
    p1x, p1y, p2x, p2y: Single;
    FChanging: Boolean;
    FPanels: TArray<TBezierPanelSelector>;
    function GetPoint(x, y: Single): TPointF;
    procedure SetBezier(p1x, p1y, p2x, p2y: Single);
    procedure UpdateEquation;
    function CreatePanel(AParent: TControl; State: Boolean): TFMXBezierPanel;
    function CreateSelector(AParent: TControl; Offset, p1x, p1y, p2x, p2y: Single;
      text: string): TBezierPanelSelector;
    procedure SetSelectedPanel(APanel: TBezierPanelSelector);
    procedure OnSelectorClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  CubicBezierAnimationMainForm: TCubicBezierAnimationMainForm;

implementation

{$R *.fmx}
{ TForm11 }

procedure TCubicBezierAnimationMainForm.edtEqationEnter(Sender: TObject);
begin
  //
end;

procedure TCubicBezierAnimationMainForm.FormCreate(Sender: TObject);
CONST
  PW = 125;
begin
  SelectionPoint1.SelectedFillColor := $FFFF0088;
  SelectionPoint2.SelectedFillColor := $FF00AABB;

  FPanels := TArray<TBezierPanelSelector>.Create(
    CreateSelector(LayoutPanels, PW * 0, 0.25, 0.10, 0.25, 1.00, 'ease'),
    CreateSelector(LayoutPanels, PW * 1, 0.00, 0.00, 1.00, 1.00, 'linear'),
    CreateSelector(LayoutPanels, PW * 2, 0.42, 0.00, 1.00, 1.00, 'ease-in'),
    CreateSelector(LayoutPanels, PW * 3, 0.00, 0.00, 0.58, 1.00, 'ease-out'),
    CreateSelector(LayoutPanels, PW * 4, 0.42, 0.00, 0.58, 1.00, 'ease-in-out')
  );

  SetSelectedPanel(FPanels[0]);
  FChanging := False;
  SetBezier(0, 0, 1, 1);
end;

function TCubicBezierAnimationMainForm.GetPoint(x, y: Single): TPointF;
begin
  Result.x := pbCanvas.Width * x;
  Result.y := pbCanvas.Height * (1 - y);
end;


procedure TCubicBezierAnimationMainForm.OnSelectorClick(Sender: TObject);
begin
  SetSelectedPanel(Sender as TBezierPanelSelector);
end;

procedure TCubicBezierAnimationMainForm.pbCanvasPaint(Sender: TObject; Canvas: TCanvas);
const
  POINT_SIZE = 18;
  procedure DrawPoint(Canvas: TCanvas; x, y: Single);
  var
    p: TPointF;
  begin
    p := GetPoint(x, y);
    Canvas.FillEllipse(TRectF.Create(PointF(p.x - POINT_SIZE / 2, p.y - POINT_SIZE / 2), POINT_SIZE, POINT_SIZE), 1);
    Canvas.DrawEllipse(TRectF.Create(PointF(p.x - POINT_SIZE / 2, p.y - POINT_SIZE / 2), POINT_SIZE, POINT_SIZE), 1);
  end;

var
  R: TRectF;
//  ICanvas: INativeCanvas;
  path: TPathData;
  I: Integer;
  bezier: TBezier;
  x, y, y1, y2: Single;
begin
  R := pbCanvas.LocalRect;
//  ICanvas := Canvas.ToNativeCanvas(TDrawMethod.Native);
//  Canvas.BeginNativeDraw(R);

  Canvas.Fill.Kind := TBrushKind.Solid;
  Canvas.Fill.Color := TAlphaColors.White;
  Canvas.FillRect(R, 0, 0, AllCorners, 1, Canvas.Fill);

  for I := 1 to 7 do
  begin
    y2 := I * R.Height / 7;
    y1 := y2 - R.Height / 14;
    Canvas.Fill.Color := $FFF0F0F0;
    Canvas.FillRect(RectF(0, y1, R.Right, y2), 0,0,AllCorners, 1);
  end;

  Canvas.Stroke.Kind := TBrushKind.Solid;
//  Canvas.Stroke.Color := TAlphaColors.Lightgray;
  Canvas.Stroke.Color := TAlphaColors.Black;
  Canvas.Stroke.Thickness := 8;
  Canvas.DrawLine(GetPoint(0,0), GetPoint(1,1), 0.1);

  Canvas.Stroke.Color := TAlphaColors.Black;
  Canvas.Stroke.Thickness := 3;
  Canvas.DrawLine(GetPoint(0,0), GetPoint(p1x,p1y), 1);
  Canvas.DrawLine(GetPoint(1,1), GetPoint(p2x,p2y), 1);

  Canvas.Stroke.Thickness := 8;
  path := TPathData.Create;
  bezier := TBezier.Create(p1x, p1y, p2x, p2y);
  try
    path.MoveTo(GetPoint(0, 0));
    for I := 1 to 100 do
    begin
      x := I / 100;
      y := bezier.Solve(x, TBezier.epsilon);
      path.LineTo(GetPoint(x, y));
    end;
    Canvas.Stroke.Color := TAlphaColors.Black;
    Canvas.DrawPath(path, 1);
  finally
    bezier.Free;
    path.Free;
  end;
  Canvas.Stroke.Thickness := 1;
  Canvas.Stroke.Color := TAlphaColors.Lightblue;
  DrawPoint(Canvas, 0, 0);
  DrawPoint(Canvas, 1, 1);
//  Canvas.EndNativeDraw;
end;

procedure TCubicBezierAnimationMainForm.SelectionPoint1Track(Sender: TObject; var X, Y: Single);
begin
  if not FChanging then
  begin
    p1x := SelectionPoint1.Position.Point.x / pbCanvas.Width;
    p1y := (pbCanvas.Height - SelectionPoint1.Position.Point.y) / pbCanvas.Height;
    BezierPanel1.P1X := p1x;
    BezierPanel1.P1Y := p1y;
    UpdateEquation;
    pbCanvas.Repaint;
  end;
end;

procedure TCubicBezierAnimationMainForm.SelectionPoint2Track(Sender: TObject; var X, Y: Single);
begin
  if not FChanging then
  begin
    p2x := SelectionPoint2.Position.Point.x / pbCanvas.Width;
    p2y := (pbCanvas.Height - SelectionPoint2.Position.Point.y) / pbCanvas.Height;
    BezierPanel1.P2X := p2x;
    BezierPanel1.P2Y := p2y;
    UpdateEquation;
    pbCanvas.Repaint;
  end;
end;

procedure TCubicBezierAnimationMainForm.SetBezier(p1x, p1y, p2x, p2y: Single);
begin
  Self.p1x := p1x;
  Self.p1y := p1y;
  Self.p2x := p2x;
  Self.p2y := p2y;
  Self.SelectionPoint1.Position.Point := GetPoint(p1x, p1y);
  Self.SelectionPoint2.Position.Point := GetPoint(p2x, p2y);
  UpdateEquation;
end;

procedure TCubicBezierAnimationMainForm.SetSelectedPanel(
  APanel: TBezierPanelSelector);
var
  I: Integer;
begin
  for I := 0 to High(FPanels) do
  begin
    FPanels[I].IsSelected := FPanels[I] = APanel;
  end;
  BezierPanel2.P1X := APanel.Panel.P1X;
  BezierPanel2.P1Y := APanel.Panel.P1Y;
  BezierPanel2.P2X := APanel.Panel.P2X;
  BezierPanel2.P2Y := APanel.Panel.P2Y;
  edtEqation2.Text := Format('%.2f,%.2f,%.2f,%.2f',
    [BezierPanel2.p1x, BezierPanel2.p1y, BezierPanel2.p2x, BezierPanel2.p2y]);
end;

procedure TCubicBezierAnimationMainForm.trckbrDurationChange(Sender: TObject);
begin
  lblDuration.Text := trckbrDuration.Value.ToString;
end;

procedure TCubicBezierAnimationMainForm.UpdateEquation;
begin
  FChanging := True;
  edtEqation.Text := Format('%.2f,%.2f,%.2f,%.2f', [p1x, p1y, p2x, p2y]);
  FChanging := False;
end;

procedure TCubicBezierAnimationMainForm.btnRunClick(Sender: TObject);
begin
  BezierAnimation1.Duration := trckbrDuration.Value;
  BezierAnimation2.Duration := trckbrDuration.Value;
  with BezierPanel1 do
    BezierAnimation1.SetData(P1X, P1Y, P2X, P2Y);
  with BezierPanel2 do
    BezierAnimation2.SetData(P1X, P1Y, P2X, P2Y);

  BezierAnimation1.Start;
  BezierAnimation2.Start;
end;

procedure TCubicBezierAnimationMainForm.Button1Click(Sender: TObject);
begin
  edtEqation.Text := Format('%.2f,%.2f,%.2f,%.2f', [p1x, p1y, p2x, p2y]);
end;

function TCubicBezierAnimationMainForm.CreatePanel(AParent: TControl;
  State: Boolean): TFMXBezierPanel;
begin
  Result := TFMXBezierPanel.Create(Self);
  Result.Position.Point := PointF(0, 0);
  Result.Height := AParent.Height;
  Result.Width := Result.Height;
  Result.IsSelected := State;
  Result.Parent := AParent;
end;

function TCubicBezierAnimationMainForm.CreateSelector(AParent: TControl; Offset,
  p1x, p1y, p2x, p2y: Single; text: string): TBezierPanelSelector;
begin
  Result := TBezierPanelSelector.Create(Self);
  Result.Position.Point := PointF(Offset, 0);
  Result.Height := AParent.Height;
  Result.Width := AParent.Height - 40;
  Result.SetBezier(p1x, p1y, p2x, p2y);
  Result.Text := text;
  Result.OnClick := OnSelectorClick;
  Result.Parent := AParent;
end;

{ TSelectionPoint }

constructor TSelectionPoint.Create(AOwner: TComponent);
begin
  inherited;
  FSelectedFillColor := TAlphaColors.Red;
end;

procedure TSelectionPoint.Paint;
var
  Fill: TBrush;
  Stroke: TStrokeBrush;
  StrokeColor: TAlphaColor;
begin
  Canvas.Stroke.Thickness := 1;
  Canvas.Stroke.Kind := TBrushKind.Solid;
  if IsMouseOver then
    StrokeColor := TAlphaColors.Yellow
  else
    StrokeColor := TAlphaColors.Darkgray;
  Canvas.Stroke.Color := StrokeColor;
  Canvas.Fill.Kind := TBrushKind.Solid;

  Stroke := TStrokeBrush.Create(TBrushKind.Solid, StrokeColor);
  try
    Fill := TBrush.Create(TBrushKind.Solid, SelectedFillColor);
    try
      Canvas.FillEllipse(TRectF.Create(-GripSize, -GripSize, GripSize, GripSize), AbsoluteOpacity, Fill);
      Canvas.DrawEllipse(TRectF.Create(-GripSize, -GripSize, GripSize, GripSize), AbsoluteOpacity, Stroke);
    finally
      Fill.Free;
    end;
  finally
    Stroke.Free;
  end;
end;

procedure TSelectionPoint.SetSelectedFillColor(const Value: TAlphaColor);
begin
  if FSelectedFillColor <> Value then
  begin
    FSelectedFillColor := Value;
    Repaint;
  end;
end;

end.
