unit FMX.BezierAnimation;

interface
type
  TBezier = class
  public const
    epsilon = 1.0E-5;
  private
    ax, bx, cx, ay, by, cy: Double;
  public
    constructor Create(p1x, p1y, p2x, p2y: Double);
    procedure SetData(p1x, p1y, p2x, p2y: Double);
    function SampleCurveX(t: Double): Double;
    function SampleCurveY(t: Double): Double;
    function SampleCurveDerivativeX(t: Double): Double;
    function SolveCurveX(x, epsilon: Double): Double;
    function Solve(x, epsilon: Double): Double;
  end;

function GetEaseInOut: TBezier;

implementation

var
  EaseInOut: TBezier = nil;

function GetEaseInOut: TBezier;
begin
  if not Assigned(EaseInOut) then
    EaseInOut := TBezier.Create(0.42,0,0.58,1);
  Result := EaseInOut;
end;

{ TBezier }

constructor TBezier.Create(p1x, p1y, p2x, p2y: Double);
begin
  SetData(p1x, p1y, p2x, p2y);
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

initialization
finalization
  EaseInOut.Free;
end.
