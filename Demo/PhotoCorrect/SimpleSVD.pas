unit SimpleSVD;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Math;

type
  TSVDFloat = Double;
  TSVDFloatArray = TArray<TSVDFloat>;

  TMatrix = class
  private
    FRows: Integer;
    FCols: Integer;
    FName: string;
    FType: Integer;
    FMat: TSVDFloatArray;
    function GetMat(Index: Integer): TSVDFloat;
    procedure SetMat(Index: Integer; const Value: TSVDFloat);
    function GetMatrix(row, col: Integer): TSVDFloat;
    procedure SetMatrix(row, col: Integer; const Value: TSVDFloat);
  public const
    AS_MATRIX = 1;
    AS_VECTOR = 2;
  public
    constructor Create(M, N: Integer; aName: string; aType: Integer);
    procedure Output(Lines: TStrings);
    procedure SetAll(const aMat: TSVDFloatArray);
    property Mat[Index: Integer]: TSVDFloat read GetMat write SetMat;
    property Rows: Integer read FRows;
    property Cols: Integer read FCols;
    property Name: string read FName;
    property MatrixType: Integer read FType;
    property Matrix[row, col: Integer]: TSVDFloat read GetMatrix write SetMatrix; default;
  end;

  TSVD = class
  public
    constructor Create;
    function Multiply (m1, m2, y: TMatrix): Integer;
    function PinvCompute(A: TMatrix; rows, cols: Integer): TMatrix;
    function PseudoInverseSVD(const V,S,U: TSVDFloatArray; rows,cols: Integer): TSVDFloatArray;
    procedure GivensL(var S_: TSVDFloatArray; const dim: TArray<Integer>; m: Integer; a, b: TSVDFloat);
    procedure GivensR(var S_: TSVDFloatArray; const dim: TArray<Integer>; m: Integer; a, b: TSVDFloat);
    procedure SVDDecomp(const dim: TArray<Integer>; var U_, S_, V_: TSVDFloatArray; eps: Double);
    procedure SVDCompute(M, N: Integer; const A: TSVDFloatArray; LDA: Integer;
      var S, U: TSVDFloatArray; LDU: Integer; var VT: TSVDFloatArray;
      LDVT: Integer);
  end;
implementation

{ TMatrix }

constructor TMatrix.Create(M, N: Integer; aName: string; aType: Integer);
begin
  FRows := M;
  FCols := N;
  FName := aName;
  FType := aType;
  SetLength(FMat, M * N);
end;

function TMatrix.GetMat(Index: Integer): TSVDFloat;
begin
  Assert(Index < FRows * FCols);
  Result := FMat[Index];
end;

function TMatrix.GetMatrix(row, col: Integer): TSVDFloat;
begin
  Assert((row < FRows) and (col < FCols));
  Result := FMat[row * FCols + col];
end;

procedure TMatrix.Output(Lines: TStrings);
var
  s: string;
  i, j: Integer;
begin
  if(FType=AS_MATRIX) then
  begin
    Lines.Add('Matrix ' + FName + ':');
    for i:=0 to FRows-1 do
    begin
      s := '';
      for j:=0 to FCols-1 do
      begin
        if(FMat[i*cols+j]<10E-13) and (FMat[i*cols+j]>-10E-13) then
            mat[i*cols+j] := 0;
        s := s + Format('%12.4g', [FMat[i*FCols+j]]);
      end;
      Lines.Add(s);
    end;
    Lines.Add('');
  end
  else if(FType=AS_VECTOR) then
  begin
    Lines.Add('Vector ' + FName + ':');
    s := '';
    for i:=0 to FRows-1 do
    begin
      if(FMat[i]<10E-13) and (FMat[i]>-10E-13) then
        mat[i*cols] := 0;
      s := s + Format('%13.4f', [FMat[i]]);
    end;
    Lines.Add(s);
    Lines.Add('');
  end;
end;

procedure TMatrix.SetAll(const aMat: TSVDFloatArray);
begin
  FMat := aMat;
end;

procedure TMatrix.SetMat(Index: Integer; const Value: TSVDFloat);
begin
  Assert(Index < FRows * FCols);
  FMat[Index] := Value;
end;

procedure TMatrix.SetMatrix(row, col: Integer; const Value: TSVDFloat);
begin
  Assert((row < FRows) and (col < FCols));
  FMat[row * FCols + col] := Value;
end;

{ TSVD }

constructor TSVD.Create;
begin

end;

//#define U(i,j) U_[(i)*dim[0]+(j)]
//#define S(i,j) S_[(i)*dim[1]+(j)]
//#define V(i,j) V_[(i)*dim[1]+(j)]

procedure TSVD.GivensL(var S_: TSVDFloatArray; const dim: TArray<Integer>;
  m: Integer; a, b: TSVDFloat);
var
  r, c, s: TSVDFloat;
  i, idx0, idx1: Integer;
  S0, S1: TSVDFloat;
begin
  r:=sqrt(a*a+b*b);
  c:=a/r;
  s:=-b/r;

  for i:=0 to dim[1]-1 do
  begin
    idx0 := (m+0)*dim[0]+(i);  //S(m+0,i)
    idx1 := (m+1)*dim[0]+(i);  //S(m+1,i)
    S0:=S_[idx0];
    S1:=S_[idx1];
    S_[idx0] := S_[idx0] + S0*(c-1) + S1*(-s);
    S_[idx1] := S_[idx1] + S0*(s) + S1*(c-1);
  end;
end;

procedure TSVD.GivensR(var S_: TSVDFloatArray; const dim: TArray<Integer>;
  m: Integer; a, b: TSVDFloat);
var
  r, c, s: TSVDFloat;
  i, idx0, idx1: Integer;
  S0, S1: TSVDFloat;
begin
  r:=sqrt(a*a+b*b);
  c:=a/r;
  s:=-b/r;
  for i:=0 to dim[0]-1 do
  begin
    idx0 := (i)*dim[0]+(m+0);  //S(i,m+0)
    idx1 := (i)*dim[0]+(m+1);  //S(i,m+1);

    S0:=S_[idx0];
    S1:=S_[idx1];
    S_[idx0] := S_[idx0] + S0*(c-1) + S1*(-s);
    S_[idx1] := S_[idx1] + S0*(s) + S1*(c-1);
  end;
end;

function TSVD.Multiply(m1, m2, y: TMatrix): Integer;
var
  sum: Double;
  I, J, K: Integer;
begin
  if (m1.Cols <> m2.Rows) then
    Exit(0);

  for I := 0 to m1.Rows-1 do
  begin
    for J := 0 to m2.Cols-1 do
    begin
      sum := 0;
      for K := 0 to m1.Cols-1 do
      begin
        sum := sum + m1[i,k] * m2[k,j];
      end;
      y[i,j] := sum;
    end;
  end;

  Result := 1;
end;

function TSVD.PinvCompute(A: TMatrix; rows, cols: Integer): TMatrix;
var
  U, VT, S: TMatrix;
  Mat: TSVDFloatArray;
  I, J: Integer;
  m, n: Integer;
  tU, tS, tVT, pinv: TSVDFloatArray;
begin
  Result := TMatrix.Create(cols,rows,'A_pinv',TMatrix.AS_MATRIX);
  U:=TMatrix.Create(rows,cols,'U',TMatrix.AS_MATRIX);
  VT:=TMatrix.Create(cols,cols,'VT',TMatrix.AS_MATRIX);
  S:=TMatrix.Create(cols,cols,'S',TMatrix.AS_MATRIX);
  SetLength(Mat, rows*cols);
  try
    for I:=0 to rows*cols-1 do
      Mat[i]:=A.Mat[i];

    m := cols;
    n := rows;
    SetLength(tU, m*m);
    SetLength(tS, m);
    SetLength(tVT, m*n);

    SvdCompute(m, n, Mat, m, tS, tU, m, tVT, m);

    for I:=0 to rows-1 do
      for j:=0 to cols-1 do
        U.Mat[i*cols+j] := tVT[i*cols+j];

    for i:=0 to cols-1 do
      for j:=0 to cols-1 do
        VT.Mat[i*cols+j] := tU[i*cols+j];

    for i:=0 to cols-1 do
      for j:=0 to cols-1 do
      begin
        if(i=j) then
          S.Mat[i*cols+j]:=tS[i]
        else
          S.Mat[i*cols+j]:=0;
      end;
    pinv := PseudoInverseSVD(tVT,tS,tU,m,n);
    Result.SetAll(pinv);
  finally
    S.Free;
    VT.Free;
    U.Free;
  end;
end;

function TSVD.PseudoInverseSVD(const V, S, U: TSVDFloatArray; rows,
  cols: Integer): TSVDFloatArray;
var
  temp: TSVDFloatArray;
  I, J, K: Integer;
  sum: TSVDFloat;
begin
  SetLength(temp, rows*rows);

  for I:=0 to rows-1 do
    for J := 0 to rows-1 do
      temp[i*rows+j] := U[j*rows+i]/S[j];
  SetLength(Result, rows*cols);

  for i:=0 to rows-1 do
    for j:=0 to cols-1 do
    begin
      sum:=0;
      for k:=0 to rows-1 do
        sum:=sum+temp[i*rows+k]*V[j*rows+k];
      Result[i*cols+j]:=sum;
    end;
end;

procedure TSVD.SVDCompute(M, N: Integer; const A: TSVDFloatArray; LDA: Integer;
  var S, U: TSVDFloatArray; LDU: Integer; var VT: TSVDFloatArray;
  LDVT: Integer);
var
  dim: TArray<Integer>;
  U_, V_, S_: TSVDFloatArray;
  i, j: Integer;
  tmp: TSVDFloat;
begin
  dim := TArray<Integer>.Create(Max(N, M), Min(N, M));
  SetLength(U_, dim[0]*dim[0]);
  SetLength(V_, dim[1]*dim[1]);
  SetLength(S_, dim[0]*dim[1]);
  FillChar(U_[0], dim[0]*dim[0]*SizeOf(TSVDFloat), 0);
  FillChar(V_[0], dim[1]*dim[1]*SizeOf(TSVDFloat), 0);

  if(dim[1]=M) then
  begin
    for I := 0 to dim[0]-1 do
      for J := 0 to dim[1]-1 do
      begin
        S_[i*dim[1]+j]:=A[i*lda+j];
      end;
  end
  else
  begin
    for I := 0 to dim[0]-1 do
      for J := 0 to dim[1]-1 do
      begin
        S_[i*dim[1]+j]:=A[j*lda+i];
      end;
  end;
  for i:=0 to dim[0]-1 do
  begin
    U_[i*dim[0]+i]:=1;
  end;
  for i:=0 to dim[1]-1 do
  begin
    V_[i*dim[1]+i]:=1;
  end;

  SvdDecomp(dim, U_, S_, V_, -1.0);

  for i:=0 to dim[1]-1 do
  begin
    S[i]:=S_[i*dim[1]+i];
  end;
  if(dim[1]=M) then
  begin
    for I := 0 to dim[1]-1 do
      for J := 0 to M-1 do
      begin
        if S[i] < 0.0 then
          tmp := -1.0
        else
          tmp := 1.0;
        U[j+ldu*i]:=V_[j+i*dim[1]]*tmp;
      end;
  end
  else
  begin
   for I := 0 to dim[1]-1 do
      for J := 0 to M-1 do
      begin
        if S[i] < 0.0 then
          tmp := -1.0
        else
          tmp := 1.0;
        U[j+ldu*i]:=U_[i+j*dim[0]]*tmp;
      end;
  end;
  if(dim[0]=N) then
  begin
    for i:=0 to N-1 do
      for j:=0 to dim[1]-1 do
      begin
        VT[j+ldvt*i]:=U_[j+i*dim[0]];
      end;
  end
  else
  begin
    for i:=0 to N-1 do
      for j:=0 to dim[1]-1 do
      begin
        VT[j+ldvt*i]:=V_[i+j*dim[1]];
      end;
  end;
  for i:=0 to dim[1]-1 do
  begin
    if S[i] < 0.0 then
      tmp := -1.0
    else
      tmp := 1.0;
    S[i]:=S[i]*tmp;
  end;
end;

procedure TSVD.SVDDecomp(const dim: TArray<Integer>; var U_, S_,
  V_: TSVDFloatArray; eps: Double);
var
  N: Integer;
  x1: TSVDFloat;
  x_inv_norm, dot_prod: Double;
  house_vec: TArray<Double>;
  i, j, K, idx, k0, idx2, i0, i1: Integer;
  tmp: TSVDFloat;
  alpha, beta, S_max: Double;
  c: array [0 .. 1, 0 .. 1] of Double;
  b, c2, d, lambda1, lambda2, d1, d2, mu: Double;
  dimU, dimV: TArray<Integer>;
begin
  Assert(dim[0] >= dim[1]);
  N := Min(dim[0], dim[1]);

  SetLength(house_vec, Max(dim[0], dim[1]));

  // S(i,j) S_[(i)*dim[1]+(j)]
  for i := 0 to N - 1 do
  begin
    x1 := S_[(i) * dim[1] + (i)]; // S(i,i);
    if (x1 < 0) then
      x1 := -x1;

    x_inv_norm := 0;

    for j := i to dim[0] - 1 do
    begin
      x_inv_norm := x_inv_norm + Sqr(S_[(j) * dim[1] + (i)]); // s(j,i)*s(j,i)
    end;
    if (x_inv_norm > 0) then
      x_inv_norm := 1 / sqrt(x_inv_norm);

    alpha := sqrt(1 + x1 * x_inv_norm);
    beta := x_inv_norm / alpha;

    house_vec[i] := -alpha;
    for j := i + 1 to dim[0] - 1 do
    begin
      house_vec[j] := -beta * S_[(j) * dim[1] + (i)];
    end;

    if (S_[(i) * dim[1] + (i)] < 0) then
      for j := i + 1 to dim[0] - 1 do
      begin
        house_vec[j] := -house_vec[j];
      end;

    for K := i to dim[1] - 1 do
    begin
      dot_prod := 0;
      for j := i to dim[0] - 1 do
      begin
        dot_prod := dot_prod + S_[(j) * dim[1] + (K)] * house_vec[j];
      end;
      for j := i to dim[0] - 1 do
      begin
        idx := (j) * dim[1] + (K);
        S_[idx] := S_[idx] - dot_prod * house_vec[j];
      end;
    end;

    // #define U(i,j) U_[(i)*dim[0]+(j)]
    for K := 0 to dim[0] - 1 do
    begin
      dot_prod := 0;
      for j := i to dim[0] - 1 do
      begin
        dot_prod := dot_prod + U_[(K) * dim[0] + (j)] * house_vec[j];
      end;
      for j := i to dim[0] - 1 do
      begin
        idx := (K) * dim[0] + (j);
        U_[idx] := U_[idx] - dot_prod * house_vec[j];
      end;
    end;

    if (i >= N - 1) then
      continue;
    begin
      x1 := S_[(i) * dim[1] + (i + 1)]; // S(i,i+1);
      if (x1 < 0) then
        x1 := -x1;

      x_inv_norm := 0;
      for j := i + 1 to dim[1] - 1 do
      begin
        x_inv_norm := x_inv_norm + Sqr(S_[(i) * dim[1] + (j)]); // S(i,j);
      end;
      if (x_inv_norm > 0) then
        x_inv_norm := 1 / sqrt(x_inv_norm);

      alpha := sqrt(1 + x1 * x_inv_norm);
      beta := x_inv_norm / alpha;

      house_vec[i + 1] := -alpha;
      for j := i + 2 to dim[1] - 1 do
      begin
        house_vec[j] := -beta * S_[(i) * dim[1] + (j)]; // S(i,j);
      end;
      if (S_[(i) * dim[1] + (i + 1)] < 0) then
        for j := i + 2 to dim[1] - 1 do
        begin
          house_vec[j] := -house_vec[j];
        end;
    end;

    for K := i to dim[0] - 1 do
    begin
      dot_prod := 0;
      for j := i + 1 to dim[1] - 1 do
      begin
        dot_prod := dot_prod + S_[(K) * dim[1] + (j)] * house_vec[j];
      end;
      for j := i + 1 to dim[1] - 1 do
      begin
        idx := (K) * dim[1] + (j);
        S_[idx] := S_[idx] - dot_prod * house_vec[j];
      end;
    end;

    // V(i,j) V_[(i)*dim[1]+(j)]
    for K := 0 to dim[1] - 1 do
    begin
      dot_prod := 0;
      for j := i + 1 to dim[1] - 1 do
      begin
        idx := (j) * dim[1] + (K);
        dot_prod := dot_prod + V_[idx] * house_vec[j];
      end;
      for j := i + 1 to dim[1] - 1 do
      begin
        idx := (j) * dim[1] + (K);
        V_[idx] := V_[idx] - dot_prod * house_vec[j];
      end;
    end;
  end;

  k0 := 0;
  if (eps < 0) then
  begin
    eps := 1.0;
    while (eps + 1.0 > 1.0) do
      eps := eps * 0.5;
    eps := eps * 64.0;
  end;

  while (k0 < dim[1] - 1) do
  begin
    S_max := 0.0;
    for i := 0 to dim[1] - 1 do
    begin
      idx := (i) * dim[1] + (i);
      S_max := Max(S_max, S_[idx]);
    end;

    while (k0 < dim[1] - 1) and (Abs(S_[(k0) * dim[1] + (k0 + 1)]) <= eps * S_max) do
      Inc(k0);
    if (k0 = (dim[1] - 1)) then
      continue;

    N := k0 + 2;
    while (N < dim[1]) and (Abs(S_[(N - 1) * dim[1] + (N)]) > eps * S_max) do
      Inc(N);

    begin
      idx := (N - 2) * dim[1] + (N - 2);
      c[0][0] := Sqr(S_[idx]);
      if (N - k0 > 2) then
      begin
        idx := (N - 3) * dim[1] + (N - 2);
        c[0][0] := c[0][0] + Sqr(S_[idx]);
      end;
      idx := (N - 2) * dim[1] + (N - 2);
      idx2 := (N - 2) * dim[1] + (N - 1);
      c[0][1] := S_[idx] * S_[idx2];
      c[1][0] := c[0][1];

      idx := (N - 1) * dim[1] + (N - 1);
      c[1][1] := Sqr(S_[idx]) + Sqr(S_[idx2]);

      b := -(c[0][0] + c[1][1]) / 2;
      c2 := c[0][0] * c[1][1] - c[0][1] * c[1][0];
      d := 0;
      if (b * b - c2 > 0) then
        d := sqrt(b * b - c2)
      else
      begin
        b := (c[0][0] - c[1][1]) / 2;
        c2 := -c[0][1] * c[1][0];
        if (b * b - c2 > 0) then
          d := sqrt(b * b - c2);
      end;

      lambda1 := -b + d;
      lambda2 := -b - d;

      d1 := lambda1 - c[1][1];
      if d1 < 0 then
        d1 := -d1;
      d2 := lambda2 - c[1][1];
      if d2 < 0 then
        d2 := -d2;
      if d1 < d2 then
        mu := lambda1
      else
        mu := lambda2;

      idx := (k0) * dim[1] + (k0);
      idx2 := (k0) * dim[1] + (k0 + 1);
      alpha := Sqr(S_[idx]) - mu;
      beta := S_[idx] * S_[idx2];
    end;

    for K := k0 to N - 2 do
    begin
      dimU := TArray<Integer>.Create(dim[0], dim[0]);
      dimV := TArray<Integer>.Create(dim[1], dim[1]);
      GivensR(S_, dim, K, alpha, beta);
      GivensL(V_, dimV, K, alpha, beta);

      idx := (K) * dim[1] + (K);
      idx2 := (K + 1) * dim[1] + (K);
      alpha := S_[idx];
      beta := S_[idx2];
      GivensL(S_, dim, K, alpha, beta);
      GivensR(U_, dimU, K, alpha, beta);

      idx := (K) * dim[1] + (K + 1);
      alpha := S_[idx];
      idx := (K) * dim[1] + (K + 2);
      beta := S_[idx];
    end;

    begin
      for i0 := k0 to N - 2 do
      begin
        for i1 := 0 to dim[1] - 1 do
        begin
          if (i0 > i1) or (i0 + 1 < i1) then
          begin
            idx := (i0) * dim[1] + (i1);
            S_[idx] := 0;
          end;
        end;
      end;
      for i0 := 0 to dim[0] - 1 do
      begin
        for i1 := k0 to N - 2 do
        begin
          if (i0 > i1) or (i0 + 1 < i1) then
          begin
            idx := (i0) * dim[1] + (i1);
            S_[idx] := 0;
          end;
        end;
      end;
      for i := 0 to dim[1] - 2 do
      begin
        idx := (i) * dim[1] + (i + 1);
        if (Abs(S_[idx]) <= eps * S_max) then
        begin
          S_[idx] := 0;
        end;
      end;
    end;
  end;
end;

end.
