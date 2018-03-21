// ***************************************************************************
//
// A Firemonkey Bezier Animation Component
//
// Copyright 2017 Ð»¶Ù (zhaoyipeng@hotmail.com)
//
// https://github.com/zhaoyipeng/FMXComponents
//
// ***************************************************************************
// version history
// 2017-12-04, v0.1.0.0 :
//  first release version
//
unit FMX.BezierAnimation;

interface

uses
  System.Classes,
  System.Rtti,
  FMX.Types,
  FMX.Utils,
  FMX.Ani,
  FMX.ComponentsCommon;

type
  TBezier = class
  public const
    epsilon = 1.0E-5;
  private
    ax, bx, cx, ay, by, cy: Double;
    x1, y1, x2, y2: Double;
  public
    constructor Create(p1x, p1y, p2x, p2y: Double);
    procedure SetData(p1x, p1y, p2x, p2y: Double);
    function SampleCurveX(t: Double): Double;
    function SampleCurveY(t: Double): Double;
    function SampleCurveDerivativeX(t: Double): Double;
    function SolveCurveX(x, epsilon: Double): Double;
    function Solve(x, epsilon: Double): Double;
    class function GetLinear: TBezier;
    class function GetEase: TBezier;
    class function GetEaseIn: TBezier;
    class function GetEaseOut: TBezier;
    class function GetEaseInOut: TBezier;
  end;

  [ComponentPlatformsAttribute(TFMXPlatforms)]
  TFMXBezierAnimation = class(TFloatAnimation)
  private
    FBezier: TBezier;
    FP2X: Double;
    FP2Y: Double;
    FP1X: Double;
    FP1Y: Double;
    procedure SetP1X(const Value: Double);
    procedure SetP1Y(const Value: Double);
    procedure SetP2X(const Value: Double);
    procedure SetP2Y(const Value: Double);
    procedure UpdateBezier;
  protected
    procedure ProcessAnimation; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetData(p1x, p1y, p2x, p2y: Double);
    procedure SetBezier(bezier: TBezier);
    function BezierTime: Single;
  published
    property P1X: Double read FP1X write SetP1X;
    property P1Y: Double read FP1Y write SetP1Y;
    property P2X: Double read FP2X write SetP2X;
    property P2Y: Double read FP2Y write SetP2Y;
  end;

implementation

var
  Linear: TBezier = nil;
  Ease: TBezier = nil;
  EaseIn: TBezier = nil;
  EaseOut: TBezier = nil;
  EaseInOut: TBezier = nil;

type
  TAnimationHelper = class helper for TAnimation
  public
    function GetDelayTime: Single;
  end;

{ TBezier }

constructor TBezier.Create(p1x, p1y, p2x, p2y: Double);
begin
  SetData(p1x, p1y, p2x, p2y);
end;

class function TBezier.GetEase: TBezier;
begin
  if not Assigned(Ease) then
    Ease := TBezier.Create(0.25,0.1,0.25,1);
  Result := Ease;
end;

class function TBezier.GetEaseIn: TBezier;
begin
  if not Assigned(EaseInOut) then
    EaseInOut := TBezier.Create(0.42,0,1,1);
  Result := EaseIn;
end;


class function TBezier.GetEaseInOut: TBezier;
begin
  if not Assigned(EaseInOut) then
    EaseInOut := TBezier.Create(0.42,0,0.58,1);
  Result := EaseInOut;
end;


class function TBezier.GetEaseOut: TBezier;
begin
  if not Assigned(EaseInOut) then
    EaseInOut := TBezier.Create(0,0,0.58,1);
  Result := EaseOut;
end;


class function TBezier.GetLinear: TBezier;
begin
  if not Assigned(Linear) then
    Linear := TBezier.Create(0, 0, 1, 1);
  Result := Linear;
end;

function TBezier.SampleCurveDerivativeX(t: Double): Double;
begin
  Result := (3.0 * ax * t + 2.0 * bx) * t + cx;
end;

function TBezier.SampleCurveX(t: Double): Double;
begin
  // `ax t^3 + bx t^2 + cx t' expanded using Horner's rule.
  Result := ((ax * t + bx) * t + cx) * t;
end;

function TBezier.SampleCurveY(t: Double): Double;
begin
   Result := ((ay * t + by) * t + cy) * t;
end;

procedure TBezier.SetData(p1x, p1y, p2x, p2y: Double);
begin
  x1 := p1x;
  y1 := p1y;
  x2 := p2x;
  y2 := p2y;
  // Calculate the polynomial coefficients, implicit first and last control points are (0,0) and (1,1).
	cx := 3.0 * p1x;
	bx := 3.0 * (p2x - p1x) - cx;
  ax := 1.0 - cx -bx;

  cy := 3.0 * p1y;
  by := 3.0 * (p2y - p1y) - cy;
  ay := 1.0 - cy - by;
end;

// Given an x value, find a parametric value it came from.
function TBezier.Solve(x, epsilon: Double): Double;
begin
   Result := SampleCurveY(SolveCurveX(x, epsilon));
end;

function TBezier.SolveCurveX(x, epsilon: Double): Double;
var
  t0, t1, t2, x2, d2: Double;
  i: Integer;
begin
  // First try a few iterations of Newton's method -- normally very fast.
  t2 := x;
  for i := 0 to 7 do
  begin
    x2 := sampleCurveX(t2) - x;
    if (Abs(x2) < epsilon) then
      Exit(t2);
    d2 := SampleCurveDerivativeX(t2);
    if (Abs(d2) < 1e-6) then
      break;
    t2 := t2 - x2 / d2;
  end;

  // Fall back to the bisection method for reliability.
  t0 := 0.0;
  t1 := 1.0;
  t2 := x;

  if (t2 < t0) then
    Exit(t0);
  if (t2 > t1) then
    Exit(t1);

  while (t0 < t1) do
  begin
    x2 := SampleCurveX(t2);
    if (Abs(x2 - x) < epsilon) then
      Exit(t2);
    if (x > x2) then
      t0 := t2
    else
      t1 := t2;
    t2 := (t1 - t0) * 0.5 + t0;
  end;

  // Failure.
  Exit(t2);
end;

{ TBezierAnimation }

function TFMXBezierAnimation.BezierTime: Single;
begin
  Result := 0;
  if (Duration > 0) and (GetDelayTime <= 0) then
  begin
    Result := FBezier.Solve(InterpolateLinear(CurrentTime, 0, 1, Duration), TBezier.epsilon);
  end;
end;

constructor TFMXBezierAnimation.Create(AOwner: TComponent);
begin
  inherited;
  FP1X := 0;
  FP1Y := 0;
  FP2X := 1;
  FP2Y := 1;
  FBezier := TBezier.Create(0,0,1,1);
end;

destructor TFMXBezierAnimation.Destroy;
begin
  FBezier.Free;
  inherited;
end;

procedure TFMXBezierAnimation.ProcessAnimation;
var
  T: TRttiType;
  P: TRttiProperty;
begin
  if FInstance <> nil then
  begin
    T := SharedContext.GetType(FInstance.ClassInfo);
    if T <> nil then
    begin
      P := T.GetProperty(FPath);
      if (P <> nil) and (P.PropertyType.TypeKind = tkFloat) then
        P.SetValue(FInstance, InterpolateSingle(StartValue, StopValue, BezierTime));
    end;
  end;
end;

procedure TFMXBezierAnimation.SetBezier(bezier: TBezier);
begin
  FP1X := bezier.x1;
  FP1Y := bezier.y1;
  FP2X := bezier.x2;
  FP2Y := bezier.y2;
  FBezier.SetData(bezier.x1, bezier.y1, bezier.x2, bezier.y2);
end;

procedure TFMXBezierAnimation.SetData(p1x, p1y, p2x, p2y: Double);
begin
  FP1X := p1x;
  FP1Y := p1y;
  FP2X := p2x;
  FP2Y := p2y;
  FBezier.SetData(p1x, p1y, p2x, p2y);
end;

procedure TFMXBezierAnimation.SetP1X(const Value: Double);
begin
  if FP1X <> Value then
  begin
    FP1X := Value;
    UpdateBezier;
  end;
end;

procedure TFMXBezierAnimation.SetP1Y(const Value: Double);
begin
  if FP1Y <> Value then
  begin
    FP1Y := Value;
    UpdateBezier;
  end;
end;

procedure TFMXBezierAnimation.SetP2X(const Value: Double);
begin
  if FP2X <> Value then
  begin
    FP2X := Value;
    UpdateBezier;
  end;
end;

procedure TFMXBezierAnimation.SetP2Y(const Value: Double);
begin
  if FP2Y <> Value then
  begin
    FP2Y := Value;
    UpdateBezier;
  end;
end;

procedure TFMXBezierAnimation.UpdateBezier;
begin
  FBezier.SetData(FP1X, FP1Y, FP2X, FP2Y);
end;

{ TAnimationHelper }

function TAnimationHelper.GetDelayTime: Single;
begin
  with Self do
    Result := FDelayTime;
end;

initialization
finalization
  Linear.Free;
  Ease.Free;
  EaseIn.Free;
  EaseOut.Free;
  EaseInOut.Free;
end.
