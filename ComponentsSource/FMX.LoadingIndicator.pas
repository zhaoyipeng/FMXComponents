unit FMX.LoadingIndicator;

interface

uses
  System.Classes,
  System.Types,
  System.UITypes,
  System.Math,
  System.Math.Vectors,
  FMX.Types,
  FMX.Controls,
  FMX.Graphics,
  FMX.Objects,
  FMX.Layouts,
  FMX.Ani,
  FMX.Utils,
  FMX.ComponentsCommon;

type
  TLoadingIndicatorKind = (LoadingArcs, LoadingDoubleBounce, LoadingFlipPlane,
    LoadingPulse, LoadingArcsRing, LoadingRing, LoadingThreeDots, LoadingWave,
    LoadingBallClipRotate, LoadingBallClipRotatePulse);

  [ComponentPlatformsAttribute(TFMXPlatforms)]
  TFMXLoadingIndicator = class(TLayout)
  private type
    TCell = record
      Col: Integer;
      Row: Integer;
      ColSpan: Integer;
      RowSpan: Integer;
    end;
  private const
    INDICATOR_DURING: array [TLoadingIndicatorKind] of Single = (
      3, 1, 1.6, 1.5, 0.8, 0.8, 1.9, 1, 0.75, 1
      );
    INDICATOR_AUTOREVERSE: array [TLoadingIndicatorKind] of Boolean = (
      False, True, False, True, False, False, False, False,
      False, False
      );
    INDICATOR_MINSIZE: array [TLoadingIndicatorKind] of TSizeF = (
      (cx: 45; cy: 45),
      (cx: 45; cy: 45),
      (cx: 45; cy: 45),
      (cx: 45; cy: 45),
      (cx: 45; cy: 45),
      (cx: 45; cy: 45),
      (cx: 70; cy: 20),
      (cx: 50; cy: 40),
      (cx: 34; cy: 34),
      (cx: 34; cy: 34)
      );
    RING_CELLS: array [0 .. 7] of TCell = (
      (Col: 2; Row: 0; ColSpan: 1; RowSpan: 1),
      (Col: 3; Row: 0; ColSpan: 2; RowSpan: 2),
      (Col: 4; Row: 2; ColSpan: 1; RowSpan: 1),
      (Col: 3; Row: 3; ColSpan: 2; RowSpan: 2),
      (Col: 2; Row: 4; ColSpan: 1; RowSpan: 1),
      (Col: 0; Row: 3; ColSpan: 2; RowSpan: 2),
      (Col: 0; Row: 2; ColSpan: 1; RowSpan: 1),
      (Col: 0; Row: 0; ColSpan: 2; RowSpan: 2)
      );
    RING_CIRCLE_SIZE = 7;
    procedure ConfirmSize;
  private
    FKind: TLoadingIndicatorKind;
    FBrush: TBrush;
    FAnimation: TAnimation;
    FDrawProc: procedure of object;
    function GetCellRect(CellWidth, CellHeight: Single; const Cell: TCell): TRectF;
    function GetColor: TAlphaColor;
    procedure OnAnimation(Sender: TObject);
    procedure SetKind(const Value: TLoadingIndicatorKind);
    procedure SetColor(const Value: TAlphaColor);
    procedure CreateAnimation;
    procedure DrawLoadingArcs;
    procedure DrawLoadingArcsRing;
    procedure DrawLoadingDoubleBounce;
    procedure DrawLoadingFlipPlane;
    procedure DrawLoadingPulse;
    procedure DrawLoadingRing;
    procedure DrawLodingThreeDots;
    procedure DrawLoadingWave;
    procedure DrawLoadingBallClipRotate;
    procedure DrawLoadingBallClipRotatePulse;
  protected
    procedure Resize; override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Loaded; override;
    procedure Start;
  published
    property Color: TAlphaColor read GetColor write SetColor;
    property Kind: TLoadingIndicatorKind read FKind write SetKind
      default TLoadingIndicatorKind.LoadingPulse;
    property Align;
    property Anchors;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled default True;
    property Locked default False;
    property Height;
    property HitTest default True;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property Visible default True;
    property Width;
    { Drag and Drop events }
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    { Mouse events }
    property OnClick;
    property OnDblClick;

    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseEnter;
    property OnMouseLeave;

    property OnPainting;
    property OnPaint;
    property OnResize;
{$IF (RTLVersion >= 32)} // Tokyo
    property OnResized;
{$ENDIF}
  end;

  TBezier = class
  private
    AX, BX, CX, AY, BY, CY: Single;
    Bezier: TCubicBezier;
    function PointOnBezier(const StartPoint: TPointF; const AX, BX, CX, AY, BY, CY, T: Single): TPointF;
    procedure CalculateBezierCoefficients(const Bezier: TCubicBezier; out AX, BX, CX, AY, BY, CY: Single);
  public
    constructor Create(X1, Y1, X2, Y2: Single);
    function GetValue(T: Single): Single;
  end;

implementation


type
  TMyAnimation = class(TAnimation)
  protected
    procedure ProcessAnimation; override;
  end;

function InterpolateCubicBezier(t, B, C, D, X1, Y1, X2, Y2: Single; AType: TAnimationType): Single;
var
  Bezier: TCubicBezier;
begin
  Bezier[0] := PointF(0,0);
  Bezier[1] := PointF(X1,Y1);
  Bezier[2] := PointF(X2,Y2);
  Bezier[3] := PointF(1,1);
//  t := t / D;
//        Result := C * t * t * t + B;
//      end;
//    TAnimationType.Out:
//      begin
//        t := 1 - t / D;
//        Result := C * t * t * t + B;
//      end;
//    TAnimationType.InOut:
//      begin
//        t := t / (D / 2);
//        if t < 1 then
//          Result := C / 2 * t * t * t + B
//        else
//        begin
//          t := 2 - t;
//          Result := C * t * t * t + B;
////          t := t - 2;
////          Result := C / 2 * (t * t * t + 2) + B;
//        end;
//      end;
//  else
//    Result := 0;
//  end;
end;

  { TFMXLoadingIndicator }
procedure TFMXLoadingIndicator.OnAnimation(Sender: TObject);
begin
  Repaint;
end;

procedure TFMXLoadingIndicator.Paint;
begin
  inherited;
  FDrawProc;
end;

procedure TFMXLoadingIndicator.Resize;
begin
  inherited;
  if not (csLoading in ComponentState) then
  begin
    ConfirmSize;
    Repaint;
  end;
end;

constructor TFMXLoadingIndicator.Create(AOwner: TComponent);
begin
  inherited;
  FBrush := TBrush.Create(TBrushKind.Solid, $FF1282B2);
  FKind := TLoadingIndicatorKind.LoadingPulse;
  Width := 45;
  Height := 45;
  CreateAnimation;
  FAnimation.Duration := INDICATOR_DURING[FKind];
  FAnimation.AutoReverse := INDICATOR_AUTOREVERSE[FKind];
  FDrawProc := DrawLoadingPulse;
end;

procedure TFMXLoadingIndicator.Loaded;
begin
  inherited;
  Start;
end;

procedure TFMXLoadingIndicator.SetColor(const Value: TAlphaColor);
begin
  if FBrush.Color <> Value then
  begin
    FBrush.Color := Value;
    Repaint;
  end;
end;

procedure TFMXLoadingIndicator.SetKind(const Value: TLoadingIndicatorKind);
begin
  if FKind <> Value then
  begin
    FKind := Value;
    case Kind of
      LoadingArcs:
        FDrawProc := DrawLoadingArcs;
      LoadingDoubleBounce:
        FDrawProc := DrawLoadingDoubleBounce;
      LoadingFlipPlane:
        FDrawProc := DrawLoadingFlipPlane;
      LoadingPulse:
        FDrawProc := DrawLoadingPulse;
      LoadingArcsRing:
        FDrawProc := DrawLoadingArcsRing;
      LoadingRing:
        FDrawProc := DrawLoadingRing;
      LoadingThreeDots:
        FDrawProc := DrawLodingThreeDots;
      LoadingWave:
        FDrawProc := DrawLoadingWave;
      LoadingBallClipRotate:
        FDrawProc := DrawLoadingBallClipRotate;
      LoadingBallClipRotatePulse:
        FDrawProc := DrawLoadingBallClipRotatePulse;
    end;
    FAnimation.Duration := INDICATOR_DURING[Kind];
    FAnimation.AutoReverse := INDICATOR_AUTOREVERSE[Kind];
    if not (csLoading in ComponentState) then
    begin
      ConfirmSize;
      Repaint;
    end;
  end;
end;

procedure TFMXLoadingIndicator.Start;
begin
  CreateAnimation;
  FAnimation.Start;
end;

procedure TFMXLoadingIndicator.ConfirmSize;
var
  MinSize: TSizeF;
begin
  MinSize := INDICATOR_MINSIZE[Kind];
  if Width < MinSize.Width then
    Width := MinSize.Width;
  if Height < MinSize.Height then
    Height := MinSize.Height;
end;

procedure TFMXLoadingIndicator.CreateAnimation;
begin
  if not Assigned(FAnimation) then
  begin
    FAnimation := TMyAnimation.Create(Self);
    FAnimation.Stored := False;
    FAnimation.Loop := True;
    FAnimation.OnProcess := OnAnimation;
    AddObject(FAnimation);
  end;
end;

destructor TFMXLoadingIndicator.Destroy;
begin
  FBrush.Free;
  inherited;
end;

procedure TFMXLoadingIndicator.DrawLoadingArcs;
var
  Arc: TPathData;
  P: TPointF;
  R: Single;
  T, A: Single;
begin
  T := FAnimation.NormalizedTime;
  A := InterpolateSingle(0, 360, T);

  P := PointF(Width / 2, Height / 2);
  R := Min(P.X, P.Y);
  Arc := TPathData.Create;
  try
    Arc.AddArc(P, PointF(R, R), A, 270);
    Arc.AddArc(P, PointF(R - 5, R - 5), A + 270, -270);
    Arc.ClosePath;
    Canvas.FillPath(Arc, 1, FBrush);

    R := R - 5;
    A := 360 - A;
    Arc.Clear;
    Arc.AddArc(P, PointF(R, R), A + 45, -210);
    Arc.AddArc(P, PointF(R - 5, R - 5), A + 45 - 210, 210);
    Arc.ClosePath;
    Canvas.FillPath(Arc, 0.3, FBrush);
  finally
    Arc.Free;
  end;
end;

procedure TFMXLoadingIndicator.DrawLoadingArcsRing;
var
  P: TPointF;
  R: Single;
  StartAngle: Single;
  path: TPathData;
  I: Integer;
  T: Single;
  O: Single;
begin
  T := FAnimation.NormalizedTime;
  P := PointF(Width / 2, Height / 2);
  R := Min(P.X, P.Y);
  StartAngle := -15;
  path := TPathData.Create;
  try
    for I := 0 to 7 do
    begin
      if T < 0.125 then
        O := InterpolateSingle(1, 0.3, T * 8)
      else
        O := 0.3;
      T := T - 0.125;
      if T < 0 then
        T := T + 1;
      path.Clear;
      path.AddArc(P, PointF(R, R), StartAngle, 30);
      path.AddArc(P, PointF(R - 5, R - 5), StartAngle + 30, -30);
      path.ClosePath;
      Canvas.FillPath(path, O, FBrush);
      StartAngle := StartAngle + 45;
    end;
  finally
    path.Free;
  end;
end;

procedure TFMXLoadingIndicator.DrawLoadingBallClipRotate;
var
  Arc: TPathData;
  P: TPointF;
  R, S: Single;
  T, A: Single;
begin
  T := FAnimation.NormalizedTime;
  A := InterpolateSingle(0, 360, T);
  if T < 0.5 then
    S := InterpolateSingle(1, 0.6, T/0.5)
  else
    S := InterpolateSingle(0.6, 1, (T-0.5)/0.5);
  P := PointF(Width / 2, Height / 2);
  R := Min(P.X, P.Y) * S;
  Arc := TPathData.Create;
  try
    Arc.AddArc(P, PointF(R, R), A+135, 270);
    Arc.AddArc(P, PointF(R - 2, R - 2), A + 45, -270);
    Arc.ClosePath;
    Canvas.FillPath(Arc, 1, FBrush);
  finally
    Arc.Free;
  end;
end;

procedure TFMXLoadingIndicator.DrawLoadingBallClipRotatePulse;
var
  Arc: TPathData;
  P: TPointF;
  R, S: Single;
  T, A: Single;
begin
  T := FAnimation.NormalizedTime;
  A := InterpolateSingle(0, 360, T);
  T := InterpolateCubic(T, 0, 1, 1, TAnimationType.InOut);
//  if T < 0.5 then
//    S := InterpolateSingle(1, 0.6, T/0.5)
//  else
//    S := InterpolateSingle(0.6, 1, (T-0.5)/0.5);
  S := InterpolateSingle(1, 0.6, T);
  P := PointF(Width / 2, Height / 2);
  R := Min(P.X, P.Y) * S;
  Arc := TPathData.Create;
  try
    Arc.AddArc(P, PointF(R, R), A+45, 90);
    Arc.AddArc(P, PointF(R - 2, R - 2), A + 135, -90);
    Arc.ClosePath;
    Canvas.FillPath(Arc, 1, FBrush);

    Arc.Clear;
    Arc.AddArc(P, PointF(R, R), A-45, -90);
    Arc.AddArc(P, PointF(R - 2, R - 2), A - 135, +90);
    Arc.ClosePath;
    Canvas.FillPath(Arc, 1, FBrush);
  finally
    Arc.Free;
  end;
end;

procedure TFMXLoadingIndicator.DrawLoadingDoubleBounce;
var
  T, S: Single;
  P: TPointF;
  R, R1, R2: Single;
  DR: TRectF;
begin
  T := FAnimation.NormalizedTime;
  S := InterpolateSingle(1, 0, T);
  P := PointF(Width / 2, Height / 2);
  R := Min(P.X, P.Y);
  R1 := R * S;
  R2 := R * (1 - S);
  DR := RectF(P.X - R1, P.Y - R1, P.X + R1, P.Y + R1);
  Canvas.FillEllipse(DR, 0.3, FBrush);
  DR := RectF(P.X - R2, P.Y - R2, P.X + R2, P.Y + R2);
  Canvas.FillEllipse(DR, 0.3, FBrush);
end;

procedure TFMXLoadingIndicator.DrawLoadingFlipPlane;
  function CalcScale(T: Single): Single;
  begin
    if T < 0.25 then
      Result := InterpolateSingle(1, 0, T / 0.25)
    else if T < 0.5 then
      Result := InterpolateSingle(0, 1, (T - 0.25) / 0.25)
    else
      Result := 1;
  end;

var
  R: TRectF;
  SX, SY: Single;
  T: Single;
begin
  T := FAnimation.NormalizedTime;
  SY := CalcScale(T);
  T := T - 0.5;
  if T < 0 then
    T := T + 1;
  SX := CalcScale(T);
  R := RectF(0, 0, Width * SX, Height * SY);
  R := R.CenterAt(RectF(0, 0, Width, Height));
  Canvas.FillRect(R, 0, 0, AllCorners, 1, FBrush);
end;

procedure TFMXLoadingIndicator.DrawLoadingPulse;
var
  T, S: Single;
  P: TPointF;
  R: Single;
  DR: TRectF;
begin
  T := FAnimation.NormalizedTime;
  S := InterpolateSingle(0, 1, T);
  P := PointF(Width / 2, Height / 2);
  R := Min(P.X, P.Y) * S;
  DR := RectF(P.X - R, P.Y - R, P.X + R, P.Y + R);
  Canvas.FillEllipse(DR, 1 - S, FBrush);
end;

procedure TFMXLoadingIndicator.DrawLoadingRing;
var
  T: Single;
  I: Integer;
  S: Single;
  R, DR: TRectF;
begin
  T := FAnimation.NormalizedTime;
  for I := 0 to 7 do
  begin
    if T < 0.4 then
      S := InterpolateSingle(0, 1, T / 0.4)
    else if T < 0.8 then
      S := InterpolateSingle(1, 0, (T - 0.4) / 0.4)
    else
      S := 0;
    R := GetCellRect(Width / 5, Height / 5, RING_CELLS[I]);
    DR := RectF(0, 0, RING_CIRCLE_SIZE * S, RING_CIRCLE_SIZE * S);
    DR := DR.CenterAt(R);
    Canvas.FillEllipse(DR, 1, FBrush);
    T := T - 0.125;
    if T < 0 then
      T := T + 1;
  end;
end;

procedure TFMXLoadingIndicator.DrawLoadingWave;
var
  T: Single;
  I: Integer;
  S: Single;
  R: TRectF;
  W, H, Space: Single;
begin
  T := FAnimation.NormalizedTime;
  W := (Width - 20) / 5;
  H := Height;
  Space := 0;
  for I := 0 to 4 do
  begin
    if T < 0.1 then
      S := InterpolateSingle(1/1.6, 1, T / 0.1)
    else if (T < 0.15) then
      S := 1.6
    else if T < 0.35 then
      S := InterpolateSingle(1, 1/1.6, (T - 0.15) / 0.2)
    else
      S := 1/1.6;
    T := T - 0.05;
    if T < 0 then
      T := T + 1;
    R := RectF(0, 0, W, H * S);
    R.Offset(I * W + Space, (Height - R.Height) / 2);
    Space := Space + 5;
    Canvas.FillRect(R, 0, 0, AllCorners, 1, FBrush);
  end;
end;

procedure TFMXLoadingIndicator.DrawLodingThreeDots;
var
  T, S: Single;
  I: Integer;
  R, DR: TRectF;
  W, H, Space, CR: Single;
begin
  T := FAnimation.CurrentTime;
  W := (Width - 10) / 3;
  H := Height;
  Space := 0;
  for I := 0 to 2 do
  begin
    if T < 0.5 then
      S := InterpolateSingle(0, 1, T / 0.5)
    else if T < 0.6 then
      S := 1
    else if T < 1.1 then
      S := InterpolateSingle(1, 0, (T - 0.6) / 0.5)
    else
      S := 0;
    T := T - 0.25;
    if T < 0 then
      T := T + 1.9;
    R := RectF(0, 0, W, H);
    R.Offset(I * W + Space, 0);
    Space := Space + 5;
    CR := Min(W, H) * S;
    DR := RectF(0, 0, CR, CR);
    DR := DR.CenterAt(R);
    Canvas.FillEllipse(DR, 1, FBrush);
  end;
end;

function TFMXLoadingIndicator.GetCellRect(CellWidth, CellHeight: Single;
  const Cell: TCell): TRectF;
var
  R: TRectF;
begin
  R.Left := CellWidth * Cell.Col;
  R.Top := CellHeight * Cell.Row;
  R.Right := CellWidth * (Cell.Col + Cell.ColSpan);
  R.Bottom := CellHeight * (Cell.Row + Cell.RowSpan);
  Result := RectF(0, 0, CellWidth, CellHeight);
  RectCenter(Result, R);
end;

function TFMXLoadingIndicator.GetColor: TAlphaColor;
begin
  Result := FBrush.Color
end;

{ TMyAnimation }

procedure TMyAnimation.ProcessAnimation;
begin

end;

{ TBezier }

procedure TBezier.CalculateBezierCoefficients(const Bezier: TCubicBezier;
  out AX, BX, CX, AY, BY, CY: Single);
begin
  CX := 3 * (Bezier[1].X - Bezier[0].X);
  CY := 3 * (Bezier[1].Y - Bezier[0].Y);
  BX := 3 * (Bezier[2].X - Bezier[1].X) - CX;
  BY := 3 * (Bezier[2].Y - Bezier[1].Y) - CY;
  AX := Bezier[3].X - Bezier[0].X - CX - BX;
  AY := Bezier[3].Y - Bezier[0].Y - CY - BY;
end;

constructor TBezier.Create(X1, Y1, X2, Y2: Single);
begin
  Bezier[0] := PointF(0,0);
  Bezier[1] := PointF(X1,Y1);
  Bezier[2] := PointF(X2,Y2);
  Bezier[3] := PointF(1,1);
  CalculateBezierCoefficients(Bezier, AX, BX, CX, AY, BY, CY);
end;

function TBezier.GetValue(T: Single): Single;
var
  P: TPointF;
begin
  P := PointOnBezier(Bezier[0], AX, BX, CX, AY, BY, CY, T);
  Result := P.Y;
end;

function TBezier.PointOnBezier(const StartPoint: TPointF; const AX, BX, CX, AY,
  BY, CY, T: Single): TPointF;
var
  SquareT, CubeT: Single;
begin
  SquareT := T * T;
  CubeT := SquareT * T;
  Result.X := (AX * CubeT) + (BX * SquareT) + (CX * T) + StartPoint.X;
  Result.Y := (AY * CubeT) + (BY * SquareT) + (CY * T) + StartPoint.Y;
end;

end.
