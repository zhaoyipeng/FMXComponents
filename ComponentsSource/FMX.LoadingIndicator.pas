unit FMX.LoadingIndicator;

interface

uses
  System.Classes,
  System.Types,
  System.UITypes,
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
    LoadingPulse, LoadingArcsRing, LoadingRing, LoadingThreeDots);

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
    RING_CELLS: array [0..7] of TCell = (
      (Col: 2; Row: 0; ColSpan: 1; RowSpan: 1),
      (Col: 3; Row: 0; ColSpan: 2; RowSpan: 2),
      (Col: 4; Row: 2; ColSpan: 1; RowSpan: 1),
      (Col: 3; Row: 3; ColSpan: 2; RowSpan: 2),
      (Col: 2; Row: 4; ColSpan: 1; RowSpan: 1),
      (Col: 0; Row: 3; ColSpan: 2; RowSpan: 2),
      (Col: 0; Row: 2; ColSpan: 1; RowSpan: 1),
      (Col: 0; Row: 0; ColSpan: 2; RowSpan: 2)
    );
    RING_CIRCLE_SIZE = 6;
    procedure ConfirmSize;
  private
    FKind: TLoadingIndicatorKind;
    FColor: TAlphaColor;
    FAnimation: TAnimation;
    FShapes: TArray<TShape>;
    function GetCellRect(CellWidth, CellHeight: Single;
      const Cell: TCell): TRectF;
    procedure SetKind(const Value: TLoadingIndicatorKind);
    procedure SetColor(const Value: TAlphaColor);
    procedure LoadingPulseAnimationProcess(Sender: TObject);
    procedure LoadingDoubleBounceAnimationProcess(Sender: TObject);
    procedure LoadingFlipPlaneAnimationProcess(Sender: TObject);
    procedure LoadingArcsAnimationProcess(Sender: TObject);
    procedure LoadingArcsRingAnimationProcess(Sender: TObject);
    procedure LoadingRingAnimationProcess(Sender: TObject);
    procedure CreateAnimation;
    procedure CreateIndicator;
    procedure CreateLoadingArcs;
    procedure CreateLoadingArcsRing;
    procedure CreateLoadingDoubleBounce;
    procedure CreateLoadingFlipPlane;
    procedure CreateLoadingPulse;
    procedure CreateLoadingRing;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Loaded; override;
    procedure Resize; override;
    procedure Start;
  published
    property Color: TAlphaColor read FColor write SetColor;
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

implementation


type
  TMyAnimation = class(TAnimation)
  protected
    procedure ProcessAnimation; override;
  end;

  { TFMXLoadingIndicator }

procedure TFMXLoadingIndicator.LoadingArcsAnimationProcess(Sender: TObject);
var
  T, A: Single;
  Arc1, Arc2: TPath;
begin
  Arc1 := FShapes[0] as TPath;
  Arc2 := FShapes[1] as TPath;
  T := FAnimation.NormalizedTime;
  A := InterpolateSingle(0, 360, T);
  Arc1.RotationAngle := 360 - A;
  Arc2.RotationAngle := A;
end;

procedure TFMXLoadingIndicator.LoadingArcsRingAnimationProcess(Sender: TObject);
var
  T: Single;
  I: Integer;
  O: Single;
begin
  T := FAnimation.NormalizedTime;
  for I := Low(FShapes) to High(FShapes) do
  begin
    if T < 0.125 then
      O := InterpolateSingle(1, 0.3, T * 8)
    else
      O := 0.3;
    FShapes[I].Opacity := O;
    T := T - 0.125;
    if T < 0 then
      T := T + 1;
  end;
end;

procedure TFMXLoadingIndicator.LoadingDoubleBounceAnimationProcess(
  Sender: TObject);
var
  T, s: Single;
  Circle1: TCircle;
  Circle2: TCircle;
begin
  Circle1 := FShapes[0] as TCircle;
  Circle2 := FShapes[0] as TCircle;
  T := FAnimation.NormalizedTime;
  s := InterpolateSingle(1, 0, T);
  Circle1.Scale.X := s;
  Circle1.Scale.Y := s;
  Circle2.Scale.X := 1 - s;
  Circle2.Scale.Y := 1 - s;
  Circle1.Position.Point := TPointF.Create(
    Width * (1 - s) / 2, Height * (1 - s) / 2);
  Circle2.Position.Point := TPointF.Create(
    Width * s / 2, Height * s / 2);
end;

procedure TFMXLoadingIndicator.LoadingFlipPlaneAnimationProcess(
  Sender: TObject);
  function CalcScale(T: Single): Single;
  begin
    if T < 0.4 then
      Result := InterpolateSingle(1, 0, T / 0.4)
    else if T < 0.8 then
      Result := InterpolateSingle(0, 1, (T - 0.4) / 0.4)
    else
      Result := 1;
  end;
var
  SX, SY: Single;
  T: Single;
  R: TRectangle;
begin
  R := FShapes[0] as TRectangle;
  T := FAnimation.NormalizedTime;
  SY := CalcScale(T);
  T := T - 0.5;
  if T < 0 then
    T := T + 1;
  SX := CalcScale(T);
  R.Scale.Y := SY;
  R.Scale.X := SX;
  R.Position.Point := TPointF.Create(
    Width * (1 - SX) / 2, Height * (1 - SY) / 2);
end;

procedure TFMXLoadingIndicator.LoadingPulseAnimationProcess(Sender: TObject);
var
  T, s: Single;
  CircleLoadingPulse: TCircle;
begin
  CircleLoadingPulse := FShapes[0] as TCircle;
  T := FAnimation.NormalizedTime;
  s := InterpolateSingle(0, 1, T);
  CircleLoadingPulse.Scale.X := s;
  CircleLoadingPulse.Opacity := 1 - s;
  CircleLoadingPulse.Scale.Y := s;
  CircleLoadingPulse.Position.Point := TPointF.Create(
    Width * (1 - s) / 2, Height * (1 - s) / 2);
end;

procedure TFMXLoadingIndicator.LoadingRingAnimationProcess(Sender: TObject);
var
  T: Single;
  I: Integer;
  S: Single;
  Circle: TCircle;
  R: TRectF;
  C: TPointF;
begin
  T := FAnimation.NormalizedTime;
  for I := Low(FShapes) to High(FShapes) do
  begin
    if T < 0.4 then
      S := InterpolateSingle(0, 1, T /0.4)
    else if T < 0.8 then
      S := InterpolateSingle(1, 0, (T-0.4) / 0.4)
    else
      S := 0;
    Circle := FShapes[I] as TCircle;
    Circle.Scale.Point := PointF(S, S);
    R := GetCellRect(Width/5,Height/5,RING_CELLS[I]);
    C := R.CenterPoint;
    Circle.Position.Point := PointF(
      C.X - Circle.Width * S / 2,
      C.Y - Circle.Height * S / 2
    );
    T := T - 0.125;
    if T < 0 then
      T := T + 1;
  end;
end;

procedure TFMXLoadingIndicator.Resize;
begin
  inherited;
  ConfirmSize;
  CreateIndicator;
end;

constructor TFMXLoadingIndicator.Create(AOwner: TComponent);
begin
  inherited;
  FColor := $FF1282B2;
  FKind := TLoadingIndicatorKind.LoadingPulse;
  Width := 46;
  Height := 46;
  CreateIndicator;
end;

procedure TFMXLoadingIndicator.CreateLoadingArcsRing;
var
  P: TPointF;
  R: Single;
  StartAngle: Single;
  path: TPath;
  I: Integer;
begin
  P := PointF(Width / 2, Height / 2);
  R := P.X;
  StartAngle := -15;
  SetLength(FShapes, 8);
  for I := Low(FShapes) to High(FShapes) do
  begin
    path := TPath.Create(Self);
    path.Position.Point := PointF(0, 0);
    path.Width := Width;
    path.Height := Height;
    path.Stored := False;
    path.WrapMode := TPathWrapMode.Original;
    path.Stroke.Kind := TBrushKind.None;
    path.Fill.Kind := TBrushKind.Solid;
    path.Fill.Color := Color;
    path.Data.AddArc(P, PointF(R, R), StartAngle, 30);
    path.Data.AddArc(P, PointF(R - 5, R - 5), StartAngle + 30, -30);
    path.Data.ClosePath;
    path.Opacity := 0.3;
    StartAngle := StartAngle + 45;
    FShapes[I] := path;
    AddObject(path);
  end;
  CreateAnimation;
  FAnimation.Duration := 0.8;
  FAnimation.OnProcess := LoadingArcsRingAnimationProcess;
end;

procedure TFMXLoadingIndicator.CreateLoadingFlipPlane;
var
  R: TRectangle;
begin
  R := TRectangle.Create(Self);
  R.Stored := False;
  R.Fill.Color := Color;
  R.Width := Width;
  R.Height := Height;
  R.Stroke.Kind := TBrushKind.None;
  Self.AddObject(R);
  FShapes := TArray<TShape>.Create(R);

  CreateAnimation;
  FAnimation.Duration := 1.6;
  FAnimation.OnProcess := LoadingFlipPlaneAnimationProcess;
end;

procedure TFMXLoadingIndicator.CreateIndicator;
var
  I: Integer;
begin
  for I := ChildrenCount - 1 downto 0 do
  begin
    RemoveObject(Children[I]);
  end;
  case Kind of
    LoadingArcs:
      CreateLoadingArcs;
    LoadingDoubleBounce:
      CreateLoadingDoubleBounce;
    LoadingFlipPlane:
      CreateLoadingFlipPlane;
    LoadingPulse:
      CreateLoadingPulse;
    LoadingArcsRing:
      CreateLoadingArcsRing;
    LoadingRing:
      CreateLoadingRing;
  end;
end;

procedure TFMXLoadingIndicator.Loaded;
begin
  inherited;
  Start;
end;

procedure TFMXLoadingIndicator.SetColor(const Value: TAlphaColor);
var
  Shape: TShape;
begin
  if FColor <> Value then
  begin
    FColor := Value;
    for Shape in FShapes do
    begin
      Shape.Fill.Color := Color;
    end;
  end;
end;

procedure TFMXLoadingIndicator.SetKind(const Value: TLoadingIndicatorKind);
begin
  if FKind <> Value then
  begin
    FKind := Value;
    ConfirmSize;
    CreateIndicator;
  end;
end;

procedure TFMXLoadingIndicator.Start;
begin
  FAnimation.Start;
end;

procedure TFMXLoadingIndicator.ConfirmSize;
begin
  if Kind = LoadingThreeDots then
  begin
    if Height < 20 then
      Height := 20;
    if Width < 70 then
      Width := 70;
  end
  else begin
    if Height < 46 then
      Height := 46;
    if Width < 46 then
      Width := 46;
  end;
end;

procedure TFMXLoadingIndicator.CreateLoadingDoubleBounce;
var
  Circle1, Circle2: TCircle;
begin
  Circle1 := TCircle.Create(Self);
  Circle1.Stored := False;
  Circle1.Fill.Color := Color;
  Circle1.Opacity := 0.3;
  Circle1.Width := Width;
  Circle1.Height := Height;
  Circle1.Stroke.Kind := TBrushKind.None;
  Self.AddObject(Circle1);
  Circle2 := TCircle.Create(Self);
  Circle2.Stored := False;
  Circle2.Fill.Color := Color;
  Circle2.Opacity := 0.3;
  Circle2.Width := Width;
  Circle2.Height := Height;
  Circle2.Stroke.Kind := TBrushKind.None;
  Self.AddObject(Circle2);
  FShapes := TArray<TShape>.Create(Circle1, Circle2);
  CreateAnimation;
  FAnimation.AutoReverse := True;
  FAnimation.Duration := 1;
  FAnimation.OnProcess := LoadingDoubleBounceAnimationProcess;
end;

procedure TFMXLoadingIndicator.CreateAnimation;
begin
  FAnimation := TMyAnimation.Create(Self);
  FAnimation.Stored := False;
  FAnimation.Loop := True;
  AddObject(FAnimation);
end;

procedure TFMXLoadingIndicator.CreateLoadingArcs;
var
  Arc1, Arc2: TPath;
  P: TPointF;
  R: Single;
begin
  P := PointF(Width / 2, Height / 2);
  R := P.X;
  Arc1 := TPath.Create(Self);
  Arc1.Position.Point := PointF(0, 0);
  Arc1.Width := Width;
  Arc1.Height := Height;
  Arc1.Stored := False;
  Arc1.WrapMode := TPathWrapMode.Original;
  Arc1.Stroke.Kind := TBrushKind.None;
  Arc1.Fill.Kind := TBrushKind.Solid;
  Arc1.Fill.Color := Color;
  Arc1.Data.AddArc(P, PointF(R, R), 0, 270);
  Arc1.Data.AddArc(P, PointF(R - 5, R - 5), 270, -270);
  Arc1.Data.ClosePath;

  R := R - 5;
  Arc2 := TPath.Create(Self);
  Arc2.Position.Point := PointF(0, 0);
  Arc2.Width := Width;
  Arc2.Height := Height;
  Arc2.Stored := False;
  Arc2.WrapMode := TPathWrapMode.Original;
  Arc2.Stroke.Kind := TBrushKind.None;
  Arc2.Fill.Kind := TBrushKind.Solid;
  Arc2.Fill.Color := Color;
  Arc2.Opacity := 0.3;
  Arc2.Data.AddArc(P, PointF(R, R), 45, -210);
  Arc2.Data.AddArc(P, PointF(R - 5, R - 5), 45 - 210, 210);
  Arc2.Data.ClosePath;
  CreateAnimation;
  FAnimation.Duration := 3;
  FAnimation.OnProcess := LoadingArcsAnimationProcess;
  FShapes := TArray<TShape>.Create(Arc1, Arc2);
  AddObject(Arc1);
  AddObject(Arc2);
end;

procedure TFMXLoadingIndicator.CreateLoadingPulse;
var
  Circle: TCircle;
begin
  Circle := TCircle.Create(Self);
  Circle.Stored := False;
  Circle.Fill.Color := Color;
  Circle.Stroke.Kind := TBrushKind.None;
  Circle.Position.Point := PointF(0, 0);
  Circle.Width := Width;
  Circle.Height := Height;
  Self.AddObject(Circle);
  CreateAnimation;
  FAnimation.AutoReverse := True;
  FAnimation.Duration := 1.5;
  FAnimation.OnProcess := LoadingPulseAnimationProcess;
  FShapes := TArray<TShape>.Create(Circle);
end;

procedure TFMXLoadingIndicator.CreateLoadingRing;
var
  Circle: TCircle;
  W, H: Single;
  I: Integer;
  C: TPointF;
  R, R2: TRectF;
begin
  SetLength(FShapes, 8);
  W := Width / 5;
  H := Height / 5;
  for I := 0 to 7 do
  begin
    R := GetCellRect(W, H, RING_CELLS[I]);
    R2 := RectF(0, 0, RING_CIRCLE_SIZE, RING_CIRCLE_SIZE);
    RectCenter(R2, R);

    Circle := TCircle.Create(Self);
    Circle.Stored := False;
    Circle.Fill.Kind := TBrushKind.Solid;
    Circle.Fill.Color := Color;
    Circle.Stroke.Kind := TBrushKind.None;
    Circle.BoundsRect := R2;
    FShapes[I] := Circle;
    AddObject(Circle);
  end;
  CreateAnimation;
  FAnimation.Duration := 0.8;
  FAnimation.OnProcess := LoadingRingAnimationProcess;
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

{ TMyAnimation }

procedure TMyAnimation.ProcessAnimation;
begin

end;

end.
