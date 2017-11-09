unit PerspectiveCorrect;

interface

uses
  System.Math,
  SimpleSVD,
  GR32,
  GR32_Transforms,
  GR32_Math,
  GR32_Blend;

type
  TMyProjectiveTransformation = class(T3x3Transformation)
  private
    FDestHeight: TFloat;
    FDestWidth: TFloat;
    FQuadX: array [0..3] of TFloat;
    FQuadY: array [0..3] of TFloat;
    function GetDestHeight: TFloat;
    function GetDestWidth: TFloat;
    procedure SetX0(Value: TFloat); {$IFDEF UseInlining} inline; {$ENDIF}
    procedure SetX1(Value: TFloat); {$IFDEF UseInlining} inline; {$ENDIF}
    procedure SetX2(Value: TFloat); {$IFDEF UseInlining} inline; {$ENDIF}
    procedure SetX3(Value: TFloat); {$IFDEF UseInlining} inline; {$ENDIF}
    procedure SetY0(Value: TFloat); {$IFDEF UseInlining} inline; {$ENDIF}
    procedure SetY1(Value: TFloat); {$IFDEF UseInlining} inline; {$ENDIF}
    procedure SetY2(Value: TFloat); {$IFDEF UseInlining} inline; {$ENDIF}
    procedure SetY3(Value: TFloat); {$IFDEF UseInlining} inline; {$ENDIF}
  protected
    procedure PrepareTransform; override;
    procedure ReverseTransformFixed(DstX, DstY: TFixed; out SrcX, SrcY: TFixed); override;
    procedure ReverseTransformFloat(DstX, DstY: TFloat; out SrcX, SrcY: TFloat); override;
    procedure TransformFixed(SrcX, SrcY: TFixed; out DstX, DstY: TFixed); override;
    procedure TransformFloat(SrcX, SrcY: TFloat; out DstX, DstY: TFloat); override;
  public
    function GetTransformedBounds(const ASrcRect: TFloatRect): TFloatRect; override;
    property DestWidth: TFloat read GetDestWidth;
    property DestHeight: TFloat read GetDestHeight;
  published
    property X0: TFloat read FQuadX[0] write SetX0;
    property X1: TFloat read FQuadX[1] write SetX1;
    property X2: TFloat read FQuadX[2] write SetX2;
    property X3: TFloat read FQuadX[3] write SetX3;
    property Y0: TFloat read FQuadY[0] write SetY0;
    property Y1: TFloat read FQuadY[1] write SetY1;
    property Y2: TFloat read FQuadY[2] write SetY2;
    property Y3: TFloat read FQuadY[3] write SetY3;
  end;

function getPerspectiveTransform(const src,
  dst: TArray<TFloatPoint>): TFloatMatrix;
implementation

function getPerspectiveTransform(const src,
  dst: TArray<TFloatPoint>): TFloatMatrix;
const
  DECOMP_SVD      = 1;

var
  A, b, c: TMatrix;
  M, N, i: Integer;
  svd_deomposition: TSVD;
  A_pinv: TMatrix;
  Mat: TFloatMatrix;
begin
  M := 8;
  N := 8;
  A := TMatrix.Create(M, N, 'A', TMatrix.AS_MATRIX);
  b := TMatrix.Create(M, 1, 'b', TMatrix.AS_VECTOR);
  c := TMatrix.Create(N, 1, 'c', TMatrix.AS_VECTOR);

  for i := 0 to 3 do
  begin
      A[i,0] := src[i].X;
      A[i+4,3] := src[i].X;
      A[i,1] := src[i].Y;
      a[i+4,4] := src[i].Y;
      A[i,2] := 1;
      A[i+4,5] := 1;
      A[i,3] := 0;
      A[i,4] := 0;
      A[i,5] := 0;
      A[i+4,0] := 0;
      A[i+4,1] := 0;
      A[i+4,2] := 0;
      A[i,6] := -src[i].x*dst[i].x;
      A[i,7] := -src[i].y*dst[i].x;
      A[i+4,6] := -src[i].x*dst[i].y;
      A[i+4,7] := -src[i].y*dst[i].y;
      B.Mat[i] := dst[i].x;
      B.Mat[i+4] := dst[i].y;
  end;
  svd_deomposition := TSVD.Create;
  A_pinv := nil;
  try
    A_pinv := svd_deomposition.PinvCompute(A, A.Rows, A.Cols);
    svd_deomposition.multiply(A_pinv, b, c);
    Mat[0][0] := c.Mat[0];
    Mat[1][0] := c.Mat[1];
    Mat[2][0] := c.Mat[2];
    Mat[0][1] := c.Mat[3];
    Mat[1][1] := c.Mat[4];
    Mat[2][1] := c.Mat[5];
    Mat[0][2] := c.Mat[6];
    Mat[1][2] := c.Mat[7];
    Mat[2][2] := 1;
    Result := Mat;
  finally
    A_pinv.Free;
    svd_deomposition.Free;
  end;
end;

{ TMyProjectiveTransformation }

function TMyProjectiveTransformation.GetDestHeight: TFloat;
begin
  if not TransformValid then PrepareTransform;
  Result := FDestHeight;
end;

function TMyProjectiveTransformation.GetDestWidth: TFloat;
begin
  if not TransformValid then PrepareTransform;
  Result := FDestWidth;
end;

function TMyProjectiveTransformation.GetTransformedBounds(
  const ASrcRect: TFloatRect): TFloatRect;
var
  p0, p1, p2, p3: TFloatPoint;
begin
  p0 := Transform(FloatPoint(X0, Y0));
  p1 := Transform(FloatPoint(X1, Y1));
  p2 := Transform(FloatPoint(X2, Y2));
  p3 := Transform(FloatPoint(X3, Y3));

//  p0 := (FloatPoint(X0, Y0));
//  p1 := (FloatPoint(X1, Y1));
//  p2 := (FloatPoint(X2, Y2));
//  p3 := (FloatPoint(X3, Y3));

  Result.Left   := Min(Min(p0.X, p1.X), Min(p2.X, p3.X));
  Result.Right  := Max(Max(p0.X, p1.X), Max(p2.X, p3.X));
  Result.Top    := Min(Min(p0.Y, p1.Y), Min(p2.Y, p3.Y));
  Result.Bottom := Max(Max(p0.Y, p1.Y), Max(p2.Y, p3.Y));
end;

function Distance(P1, P2: TFloatPoint): Single;
begin
  Result := Sqrt(Sqr(P1.X - P2.X) + Sqr(P1.Y - P2.Y));
end;

procedure TMyProjectiveTransformation.PrepareTransform;
var
  widthA, widthB, heightA, heightB: TFloat;
  src, dst: TArray<TFloatPoint>;
begin
  src := TArray<TFloatPoint>.Create(
    FloatPoint(X0, Y0),
    FloatPoint(X1, Y1),
    FloatPoint(X2, Y2),
    FloatPoint(X3, Y3)
  );
  widthA := Distance(src[2], src[3]);
  widthB := Distance(src[1], src[0]);
  FDestWidth := Max(widthA, widthB);

  heightA := Distance(src[1], src[2]);
  heightB := Distance(src[0], src[3]);
  FDestHeight := Max(heightA, heightB);

  dst := TArray<TFloatPoint>.Create(
    FloatPoint(0, 0),
    FloatPoint(FDestWidth, 0),
    FloatPoint(FDestWidth, FDestHeight),
    FloatPoint(0, FDestHeight)
  );

  FMatrix := getPerspectiveTransform(src, dst);
//  Invert(FMatrix);
  inherited;
end;

procedure TMyProjectiveTransformation.ReverseTransformFixed(DstX, DstY: TFixed;
  out SrcX, SrcY: TFixed);
var
  Z: TFixed;
  Zf: TFloat;
begin
  Z := FixedMul(FInverseFixedMatrix[0, 2], DstX) +
    FixedMul(FInverseFixedMatrix[1, 2], DstY) + FInverseFixedMatrix[2, 2];

  if Z = 0 then Exit;

  {$IFDEF UseInlining}
  SrcX := FixedMul(DstX, FInverseFixedMatrix[0, 0]) +
    FixedMul(DstY, FInverseFixedMatrix[1, 0]) + FInverseFixedMatrix[2, 0];
  SrcY := FixedMul(DstX, FInverseFixedMatrix[0,1]) +
    FixedMul(DstY, FInverseFixedMatrix[1, 1]) + FInverseFixedMatrix[2, 1];
  {$ELSE}
  inherited;
  {$ENDIF}

  if Z <> FixedOne then
  begin
    EMMS;
    Zf := FixedOne / Z;
    SrcX := Round(SrcX * Zf);
    SrcY := Round(SrcY * Zf);
  end;
end;

procedure TMyProjectiveTransformation.ReverseTransformFloat(DstX, DstY: TFloat;
  out SrcX, SrcY: TFloat);
var
  Z: TFloat;
begin
  EMMS;
  Z := FInverseMatrix[0, 2] * DstX + FInverseMatrix[1, 2] * DstY +
    FInverseMatrix[2, 2];

  if Z = 0 then Exit;

  {$IFDEF UseInlining}
  SrcX := DstX * FInverseMatrix[0, 0] + DstY * FInverseMatrix[1, 0] +
    FInverseMatrix[2, 0];
  SrcY := DstX * FInverseMatrix[0, 1] + DstY * FInverseMatrix[1, 1] +
    FInverseMatrix[2, 1];
  {$ELSE}
  inherited;
  {$ENDIF}

  if Z <> 1 then
  begin
    Z := 1 / Z;
    SrcX := SrcX * Z;
    SrcY := SrcY * Z;
  end;
end;

procedure TMyProjectiveTransformation.SetX0(Value: TFloat);
begin
  FQuadX[0] := Value;
  Changed;
end;

procedure TMyProjectiveTransformation.SetX1(Value: TFloat);
begin
  FQuadX[1] := Value;
  Changed;
end;

procedure TMyProjectiveTransformation.SetX2(Value: TFloat);
begin
  FQuadX[2] := Value;
  Changed;
end;

procedure TMyProjectiveTransformation.SetX3(Value: TFloat);
begin
  FQuadX[3] := Value;
  Changed;
end;

procedure TMyProjectiveTransformation.SetY0(Value: TFloat);
begin
  FQuadY[0] := Value;
  Changed;
end;

procedure TMyProjectiveTransformation.SetY1(Value: TFloat);
begin
  FQuadY[1] := Value;
  Changed;
end;

procedure TMyProjectiveTransformation.SetY2(Value: TFloat);
begin
  FQuadY[2] := Value;
  Changed;
end;

procedure TMyProjectiveTransformation.SetY3(Value: TFloat);
begin
  FQuadY[3] := Value;
  Changed;
end;


procedure TMyProjectiveTransformation.TransformFixed(SrcX, SrcY: TFixed;
  out DstX, DstY: TFixed);
var
  Z: TFixed;
  Zf: TFloat;
begin
  Z := FixedMul(FFixedMatrix[0, 2], SrcX) +
    FixedMul(FFixedMatrix[1, 2], SrcY) + FFixedMatrix[2, 2];

  if Z = 0 then Exit;

  {$IFDEF UseInlining}
  DstX := FixedMul(SrcX, FFixedMatrix[0, 0]) +
    FixedMul(SrcY, FFixedMatrix[1, 0]) + FFixedMatrix[2, 0];
  DstY := FixedMul(SrcX, FFixedMatrix[0, 1]) +
    FixedMul(SrcY, FFixedMatrix[1, 1]) + FFixedMatrix[2, 1];
  {$ELSE}
  inherited;
  {$ENDIF}

  if Z <> FixedOne then
  begin
    EMMS;
    Zf := FixedOne / Z;
    DstX := Round(DstX * Zf);
    DstY := Round(DstY * Zf);
  end;
end;

procedure TMyProjectiveTransformation.TransformFloat(SrcX, SrcY: TFloat;
  out DstX, DstY: TFloat);
var
  Z: TFloat;
begin
  EMMS;
  Z := FMatrix[0, 2] * SrcX + FMatrix[1, 2] * SrcY + FMatrix[2, 2];

  if Z = 0 then Exit;

  {$IFDEF UseInlining}
  DstX := SrcX * Matrix[0, 0] + SrcY * Matrix[1, 0] + Matrix[2, 0];
  DstY := SrcX * Matrix[0, 1] + SrcY * Matrix[1, 1] + Matrix[2, 1];
  {$ELSE}
  inherited;
  {$ENDIF}

  if Z <> 1 then
  begin
    Z := 1 / Z;
    DstX := DstX * Z;
    DstY := DstY * Z;
  end;
end;

end.
