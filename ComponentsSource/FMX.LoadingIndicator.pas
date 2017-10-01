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
  FMX.ComponentsCommon,
  FMX.BezierAnimation;

type
  TLoadingIndicatorKind = (Arcs, DoubleBounce, FlipPlane,
    Pulse, ArcsRing, Ring, ThreeDots, Wave,
    BallClipRotate, BallClipRotatePulse,
    BallClipRotateMultiple, BallScaleRipple,
    InnerLineSpinFade, LineScalePulseOut);

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
      3, 1, 1.6, 1.5, 0.8, 0.8, 1.9, 1, 0.75, 1, 1, 1, 1.2, 0.9

      );
    INDICATOR_AUTOREVERSE: array [TLoadingIndicatorKind] of Boolean = (
      False, True, False, True, False, False, False, False,
      False, False, False, False, False, False
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
      (cx: 34; cy: 34),
      (cx: 39; cy: 39),
      (cx: 45; cy: 45),
      (cx: 54; cy: 54),
      (cx: 50; cy: 40)
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
    FBezier: TBezier;
    function GetCellRect(CellWidth, CellHeight: Single; const Cell: TCell): TRectF;
    function GetColor: TAlphaColor;
    procedure OnAnimation(Sender: TObject);
    procedure SetKind(const Value: TLoadingIndicatorKind);
    procedure SetColor(const Value: TAlphaColor);
    procedure CreateAnimation;
    procedure DrawArcs;
    procedure DrawArcsRing;
    procedure DrawDoubleBounce;
    procedure DrawFlipPlane;
    procedure DrawPulse;
    procedure DrawRing;
    procedure DrawLodingThreeDots;
    procedure DrawWave;
    procedure DrawBallClipRotate;
    procedure DrawBallClipRotatePulse;
    procedure DrawBallClipRotateMultiple;
    procedure DrawBallScaleRipple;
    procedure DrawInnerLineSpinFade;
    procedure DrawLineScalePulseOut;
    procedure FillArc(Arc: TPathData; Center: TPointF; const Riduas, Thickness,
      AngleStart, AngleEnd, AOpacity: Single; const ABrush: TBrush);
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
      default TLoadingIndicatorKind.Pulse;
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

implementation

type
  TMyAnimation = class(TAnimation)
  protected
    procedure ProcessAnimation; override;
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
  FBezier := TBezier.Create(0.09,0.57,0.49,0.9);
  FBrush := TBrush.Create(TBrushKind.Solid, $FF1282B2);
  FKind := TLoadingIndicatorKind.Pulse;
  Width := 45;
  Height := 45;
  CreateAnimation;
  FAnimation.Duration := INDICATOR_DURING[FKind];
  FAnimation.AutoReverse := INDICATOR_AUTOREVERSE[FKind];
  FDrawProc := DrawPulse;
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
      Arcs:
        FDrawProc := DrawArcs;
      DoubleBounce:
        FDrawProc := DrawDoubleBounce;
      FlipPlane:
        FDrawProc := DrawFlipPlane;
      Pulse:
        FDrawProc := DrawPulse;
      ArcsRing:
        FDrawProc := DrawArcsRing;
      Ring:
        FDrawProc := DrawRing;
      ThreeDots:
        FDrawProc := DrawLodingThreeDots;
      Wave:
        FDrawProc := DrawWave;
      BallClipRotate:
        FDrawProc := DrawBallClipRotate;
      BallClipRotatePulse:
      begin
        FDrawProc := DrawBallClipRotatePulse;
        FBezier.SetData(0.09,0.57,0.49,0.9);
      end;
      BallClipRotateMultiple:
        FDrawProc := DrawBallClipRotateMultiple;
      BallScaleRipple:
      begin
        FDrawProc := DrawBallScaleRipple;
        FBezier.SetData(0.21, 0.53, 0.56, 0.8);
      end;
      InnerLineSpinFade:
        FDrawProc := DrawInnerLineSpinFade;
      LineScalePulseOut:
      begin
        FDrawProc := DrawLineScalePulseOut;
        FBezier.SetData(0.85, 0.25, 0.37, 0.85);
      end;
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
  FBezier.Free;
  inherited;
end;

procedure TFMXLoadingIndicator.DrawInnerLineSpinFade;
var
  P: TPointF;
  R, T, TI, Angle, O: Single;
  Path: TPathData;
  I: Integer;
  DR: TRectF;
  M, M1, M2: TMatrix;
  Ani: TBezier;
begin
  P := LocalRect.CenterPoint;
  R := Min(P.X, P.Y) - 2;
  Path := TPathData.Create;
  try
    T := FAnimation.NormalizedTime;
    Ani := GetEaseInOut;
    for I := 0 to 7 do
    begin
      TI := T + (7 - I) * 0.1;
      if TI > 1 then
        TI := TI - 1;

      if TI < 0.5 then
      begin
        TI := Ani.Solve(TI * 2, TBezier.epsilon);
        O := InterpolateSingle(1, 0.3, TI);
      end
      else
      begin
        TI := Ani.Solve((TI-0.5) * 2, TBezier.epsilon);
        O := InterpolateSingle(0.3, 1, TI);
      end;
//      O := 1;
      Angle := -I * 45;
      Path.Clear;
      DR := TRectF.Create(PointF(P.X-2, P.Y + 11), 5, 16);
      M1 := TMatrix.Identity;
      M1.m31 := -P.X;
      M1.m32 := -P.Y;
      M2 := TMatrix.Identity;
      M2.m31 := P.X;
      M2.m32 := P.Y;
      M :=  M1 * (TMatrix.CreateRotation(DegToRad(Angle)) * M2);
      Path.AddRectangle(DR, 2, 2, AllCorners);
      Path.ApplyMatrix(M);
      Canvas.FillPath(Path, O, FBrush);
    end;
  finally

  end;
end;

procedure TFMXLoadingIndicator.DrawArcs;
var
  Arc: TPathData;
  P: TPointF;
  R: Single;
  T, A: Single;
begin
  T := FAnimation.NormalizedTime;
  A := InterpolateSingle(0, 360, T);

  P := LocalRect.CenterPoint;
  R := Min(P.X, P.Y);
  Arc := TPathData.Create;
  try
    FillArc(Arc, P, R, 5, A, 270, AbsoluteOpacity, FBrush);
    R := R - 5;
    A := 360 - A;

    FillArc(Arc, P, R, 5, A-165, 210, 0.3, FBrush);
  finally
    Arc.Free;
  end;
end;

procedure TFMXLoadingIndicator.DrawArcsRing;
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
  P := LocalRect.CenterPoint;
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

procedure TFMXLoadingIndicator.DrawBallClipRotate;
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
  P := LocalRect.CenterPoint;
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

procedure TFMXLoadingIndicator.FillArc(Arc: TPathData; Center: TPointF; const Riduas, Thickness,
  AngleStart, AngleEnd, AOpacity: Single; const ABrush: TBrush);
begin
  Arc.Clear;
  Arc.AddArc(Center, PointF(Riduas, Riduas), AngleStart, AngleEnd);
  Arc.AddArc(Center, PointF(Riduas-Thickness, Riduas-Thickness),
    AngleStart + AngleEnd, -AngleEnd);
  Arc.ClosePath;
  Canvas.FillPath(Arc, AOpacity, ABrush);
end;

procedure TFMXLoadingIndicator.DrawBallClipRotateMultiple;
  procedure CalcAS(Ani: TBezier; T: Single; out A, S: Single);
  begin
    if T < 0.5 then
    begin
      T := Ani.Solve(T * 2, TBezier.epsilon);
      A := InterpolateSingle(0, 180, T);
      S := InterpolateSingle(1, 0.6, T)
    end
    else
    begin
      T := Ani.Solve((T-0.5) * 2, TBezier.epsilon);
      A := InterpolateSingle(0, 180, T);
      S := InterpolateSingle(0.6, 1, T);
    end;
  end;
var
  Arc: TPathData;
  P: TPointF;
  R, S1, S2: Single;
  T, A1, A2: Single;
  Ani: TBezier;
begin
  P := LocalRect.CenterPoint;
  Ani := GetEaseInOut;
  T := FAnimation.NormalizedTime;
  CalcAS(Ani, T, A1, S1);
  T := T * 2 - Trunc(T * 2);
  CalcAS(Ani, T, A2, S2);
  Arc := TPathData.Create;
  try
    R := (Min(P.X, P.Y) - 2) * S1;
    FillArc(Arc, P, R+1, 2, A1-45, 90, AbsoluteOpacity, FBrush);
    FillArc(Arc, P, R+1, 2, A1-135, -90, AbsoluteOpacity, FBrush);

    R := (Min(P.X, P.Y) - 12) * S2;
    A2 := 360 - A2;
    FillArc(Arc, P, R+1, 2, A2+45, 90, AbsoluteOpacity, FBrush);
    FillArc(Arc, P, R+1, 2, A2-45, -90, AbsoluteOpacity, FBrush);
  finally
    Arc.Free;
  end;
end;

procedure TFMXLoadingIndicator.DrawBallClipRotatePulse;
var
  Arc: TPathData;
  P: TPointF;
  R, S: Single;
  T, A: Single;
  DR: TRectF;
begin
  T := FAnimation.NormalizedTime;
  A := InterpolateSingle(0, 360, T);
  T := InterpolateCubic(T, 0, 1, 1, TAnimationType.InOut);
  if T < 0.5 then
  begin
    T := FBezier.Solve(T * 2, TBezier.epsilon);
  end
  else
  begin
    T := FBezier.Solve(1 - (T-0.5) * 2, TBezier.epsilon);
  end;
  S := InterpolateSingle(1, 0.6, T);
  P := LocalRect.CenterPoint;
  R := Min(P.X, P.Y) * S;
  Arc := TPathData.Create;
  try
    Arc.AddArc(P, PointF(R, R), A+45, 90);
    Arc.AddArc(P, PointF(R - 2, R - 2), A + 135, -90);
    Arc.ClosePath;
    Canvas.FillPath(Arc, AbsoluteOpacity, FBrush);

    Arc.Clear;
    Arc.AddArc(P, PointF(R, R), A-45, -90);
    Arc.AddArc(P, PointF(R - 2, R - 2), A - 135, +90);
    Arc.ClosePath;
    Canvas.FillPath(Arc, AbsoluteOpacity, FBrush);

    R := (Min(P.X, P.Y) - 9) * S;
    DR := RectF(0,0,R*2,R*2);
    DR := DR.CenterAt(LocalRect);
    Canvas.FillEllipse(DR, AbsoluteOpacity, FBrush);
  finally
    Arc.Free;
  end;
end;

procedure TFMXLoadingIndicator.DrawBallScaleRipple;
var
  Circle: TPathData;
  P: TPointF;
  R: Single;
  T, S, O: Single;
  Ani: TBezier;
  DR: TRectF;
  Stroke: TStrokeBrush;
begin
  P := LocalRect.CenterPoint;
  R := Min(P.X, P.Y) - 2;
  Ani := FBezier;
  T := FAnimation.NormalizedTime;
  if T<0.7 then
  begin
    T := Ani.Solve(T/0.7, TBezier.epsilon);
    S := InterpolateSingle(0.1, 1, T);
    O := InterpolateSingle(1, 0.7, T);
  end
  else
  begin
    T := Ani.Solve((T-0.7)/0.3, TBezier.epsilon);
    S := 1;
    O := InterpolateSingle(0.7, 0, T);
  end;
  Stroke := TStrokeBrush.Create(TBrushKind.Solid, Color);
//  Circle := TPathData.Create;
  try
    Stroke.Thickness := 2;
    R := R * S;
    DR := TRectF.Create(PointF(P.X - R - 1, P.Y - R - 1), R * 2 + 2, R * 2 + 2);
    Canvas.DrawEllipse(DR, O, Stroke);
//    Circle.AddEllipse(DR);
//    DR.Inflate(-2, -2);
//    Circle.AddEllipse(DR);
//    Canvas.FillPath(Circle, O, FBrush);
  finally
//    Circle.Free;
    Stroke.Free;
  end;
end;

procedure TFMXLoadingIndicator.DrawDoubleBounce;
var
  T, S: Single;
  P: TPointF;
  R, R1, R2: Single;
  DR: TRectF;
begin
  T := FAnimation.NormalizedTime;
  S := InterpolateSingle(1, 0, T);
  P := LocalRect.CenterPoint;
  R := Min(P.X, P.Y);
  R1 := R * S;
  R2 := R * (1 - S);
  DR := RectF(P.X - R1, P.Y - R1, P.X + R1, P.Y + R1);
  Canvas.FillEllipse(DR, 0.3, FBrush);
  DR := RectF(P.X - R2, P.Y - R2, P.X + R2, P.Y + R2);
  Canvas.FillEllipse(DR, 0.3, FBrush);
end;

procedure TFMXLoadingIndicator.DrawFlipPlane;
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

procedure TFMXLoadingIndicator.DrawPulse;
var
  T, S: Single;
  P: TPointF;
  R: Single;
  DR: TRectF;
begin
  T := FAnimation.NormalizedTime;
  S := InterpolateSingle(0, 1, T);
  P := LocalRect.CenterPoint;
  R := Min(P.X, P.Y) * S;
  DR := RectF(P.X - R, P.Y - R, P.X + R, P.Y + R);
  Canvas.FillEllipse(DR, 1 - S, FBrush);
end;

procedure TFMXLoadingIndicator.DrawRing;
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

procedure TFMXLoadingIndicator.DrawWave;
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
      S := 1
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

procedure TFMXLoadingIndicator.DrawLineScalePulseOut;
var
  T, TI: Single;
  I: Integer;
  S: Single;
  R: TRectF;
  W, H, Space: Single;
  Ani: TBezier;
begin
  T := FAnimation.NormalizedTime;
  W := (Width - 20) / 5;
  H := Height;
  Space := 0;
  Ani := GetEaseInOut;
  for I := 0 to 4 do
  begin
    case I of
      1,3: TI := T + 0.4/0.9;
      0,4: TI := T + 0.2/0.9;
      else
        TI := T + 0.6/0.9;
    end;
    if TI > 1 then
      TI := TI - 1;
    if TI < 0.5 then
    begin
      TI := Ani.Solve(TI * 2, TBezier.epsilon);
      S := InterpolateSingle(1, 0.4, TI);
    end
    else
    begin
      TI := Ani.Solve((TI-0.5) * 2, TBezier.epsilon);
      S := InterpolateSingle(0.4, 1, TI);
    end;

    R := RectF(0, 0, 4, H * S);
    R.Offset(I * W + Space, (Height - R.Height) / 2);
    Space := Space + 5;
    Canvas.FillRect(R, 2, 2, AllCorners, 1, FBrush);
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


end.
