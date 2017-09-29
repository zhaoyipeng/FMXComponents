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
    LoadingPulse, LoadingArcsRing);

  [ComponentPlatformsAttribute(TFMXPlatforms)]
  TFMXLoadingIndicator = class(TLayout)
  private
    FKind: TLoadingIndicatorKind;
    FColor: TAlphaColor;

    ArcsRing: array [0 .. 7] of TPath;

    Arc1: TArc;
    Arc2: TArc;

    Rectangle1: TRectangle;

    CircleLoadingDoubleBounce1: TCircle;
    CircleLoadingDoubleBounce2: TCircle;

    CircleLoadingPulse: TCircle;
    FAnimation: TAnimation;
    FloatAnimation1: TFloatAnimation;
    KeyAnimation1: TFloatKeyAnimation;
    KeyAnimation2: TFloatKeyAnimation;

    procedure SetKind(const Value: TLoadingIndicatorKind);
    procedure SetColor(const Value: TAlphaColor);
    procedure LoadingPulseAnimationProcess(Sender: TObject);
    procedure LoadingDoubleBounceAnimationProcess(Sender: TObject);
    procedure LoadingFlipPlaneAnimationProcess(Sender: TObject);
    procedure LoadingArcsAnimationProcess(Sender: TObject);
    procedure LoadingArcsRingAnimationProcess(Sender: TObject);
    procedure CreateIndicator;
    procedure CreateLoadingArcs;
    procedure CreateLoadingArcsRing;
    procedure CreateLoadingFlipPlane;
    procedure CreateLoadingPulse;
    procedure CreateAnimation;
    procedure CreateLoadingDoubleBounce;
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
begin
  T := FAnimation.NormalizedTime;
  A := InterpolateSingle(0, 360, T);
  Arc1.RotationAngle := A;
  Arc2.RotationAngle := 360 - A;
end;

procedure TFMXLoadingIndicator.LoadingArcsRingAnimationProcess(Sender: TObject);
var
  T: Single;
  I: Integer;
  O: Single;
begin
  T := FAnimation.NormalizedTime;
  for I := 0 to 7 do
  begin
    if T < 0.125 then
      O := InterpolateSingle(1, 0.3, T * 8)
    else
      O := 0.3;
    ArcsRing[I].Opacity := O;
    T := T - 0.125;
    if T < 0 then
      T := T + 1;
  end;
end;

procedure TFMXLoadingIndicator.LoadingDoubleBounceAnimationProcess(
  Sender: TObject);
var
  T, s: Single;
begin
  T := FAnimation.NormalizedTime;
  s := InterpolateSingle(0, 1, T);
  CircleLoadingDoubleBounce1.Scale.X := s;
  CircleLoadingDoubleBounce1.Scale.Y := s;
  CircleLoadingDoubleBounce2.Scale.X := 1 - s;
  CircleLoadingDoubleBounce2.Scale.Y := 1 - s;
  CircleLoadingDoubleBounce1.Position.Point := TPointF.Create(
    Width * (1 - s) / 2, Height * (1 - s) / 2);
  CircleLoadingDoubleBounce2.Position.Point := TPointF.Create(
    Width * s / 2, Height * s / 2);
end;

procedure TFMXLoadingIndicator.LoadingFlipPlaneAnimationProcess(
  Sender: TObject);
var
  SX, SY: Single;
begin
  SY := Rectangle1.Scale.Y;
  SX := Rectangle1.Scale.X;
  Rectangle1.Position.Point := TPointF.Create(
    Width * (1 - SX) / 2, Height * (1 - SY) / 2
    );
end;

procedure TFMXLoadingIndicator.LoadingPulseAnimationProcess(Sender: TObject);
var
  T, s: Single;
begin
  T := FAnimation.NormalizedTime;
  s := InterpolateSingle(0, 1, T);
  CircleLoadingPulse.Scale.X := s;
  CircleLoadingPulse.Opacity := 1 - s;
  CircleLoadingPulse.Scale.Y := s;
  CircleLoadingPulse.Position.Point := TPointF.Create(
    Width * (1 - s) / 2, Height * (1 - s) / 2);
end;

procedure TFMXLoadingIndicator.Resize;
var
  path: TPath;
begin
  inherited;
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
  FK: TFloatKey;
begin
  P := PointF(Width / 2, Height / 2);
  R := P.X;
  StartAngle := -15;
  for I := Low(ArcsRing) to High(ArcsRing) do
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
    ArcsRing[I] := path;
    AddObject(path);
  end;
  CreateAnimation;
  FAnimation.Duration := 0.8;
  FAnimation.OnProcess := LoadingArcsRingAnimationProcess;
  Self.AddObject(FAnimation);
end;

procedure TFMXLoadingIndicator.CreateLoadingFlipPlane;
var
  FK: TFloatKey;
begin
  Rectangle1 := TRectangle.Create(Self);
  Rectangle1.Stored := False;
  Rectangle1.Fill.Color := Color;
  Rectangle1.Width := Width;
  Rectangle1.Height := Height;
  Rectangle1.Stroke.Kind := TBrushKind.None;
  Self.AddObject(Rectangle1);

  KeyAnimation1 := TFloatKeyAnimation.Create(Self);
  KeyAnimation1.Stored := False;
  KeyAnimation1.Duration := 1.6;
  KeyAnimation1.Loop := True;
  KeyAnimation1.PropertyName := 'Scale.Y';
  KeyAnimation1.StartFromCurrent := False;

  FK := TFloatKey(KeyAnimation1.Keys.Add);
  FK.Key := 0;
  FK.Value := 1;
  FK := TFloatKey(KeyAnimation1.Keys.Add);
  FK.Key := 0.4;
  FK.Value := 0;
  FK := TFloatKey(KeyAnimation1.Keys.Add);
  FK.Key := 0.8;
  FK.Value := 1;
  Rectangle1.AddObject(KeyAnimation1);

  KeyAnimation2 := TFloatKeyAnimation.Create(Self);
  KeyAnimation2.Stored := False;
  KeyAnimation2.Delay := 0.8;
  KeyAnimation2.Duration := 1.6;
  KeyAnimation2.Loop := True;
  KeyAnimation2.PropertyName := 'Scale.X';
  KeyAnimation2.StartFromCurrent := False;
  FK := TFloatKey(KeyAnimation2.Keys.Add);
  FK.Key := 0;
  FK.Value := 1;
  FK := TFloatKey(KeyAnimation2.Keys.Add);
  FK.Key := 0.4;
  FK.Value := 0;
  FK := TFloatKey(KeyAnimation2.Keys.Add);
  FK.Key := 0.8;
  FK.Value := 1;
  KeyAnimation1.OnProcess := LoadingFlipPlaneAnimationProcess;
  Rectangle1.AddObject(KeyAnimation2);
end;

procedure TFMXLoadingIndicator.CreateIndicator;
var
  I: Integer;
  FK: TFloatKey;
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
  end;
end;

procedure TFMXLoadingIndicator.Loaded;
begin
  inherited;
  Start;
end;

procedure TFMXLoadingIndicator.SetColor(const Value: TAlphaColor);
var
  path: TPath;
begin
  if FColor <> Value then
  begin
    FColor := Value;
    case Kind of
      LoadingArcs:
        begin
          Arc1.Stroke.Color := Color;
          Arc2.Stroke.Color := Color;
        end;
      LoadingDoubleBounce:
        begin
          CircleLoadingDoubleBounce1.Fill.Color := FColor;
          CircleLoadingDoubleBounce2.Fill.Color := FColor;
        end;
      LoadingFlipPlane:
        Rectangle1.Fill.Color := Color;
      LoadingPulse:
        CircleLoadingPulse.Fill.Color := FColor;
      LoadingArcsRing:
      begin
        for path in ArcsRing do
        begin
          path.Fill.Color := Color;
        end;
      end;
    end;
  end;
end;

procedure TFMXLoadingIndicator.SetKind(const Value: TLoadingIndicatorKind);
begin
  if FKind <> Value then
  begin
    FKind := Value;
    CreateIndicator;
  end;
end;

procedure TFMXLoadingIndicator.Start;
begin
  case Kind of
    LoadingFlipPlane:
      begin
        KeyAnimation1.Enabled := True;
        KeyAnimation2.Enabled := True;
      end;
    LoadingArcs, LoadingArcsRing, LoadingDoubleBounce, LoadingPulse:
      FAnimation.Enabled := True;
  end;
end;

procedure TFMXLoadingIndicator.CreateLoadingDoubleBounce;
begin
  CircleLoadingDoubleBounce1 := TCircle.Create(Self);
  CircleLoadingDoubleBounce1.Stored := False;
  CircleLoadingDoubleBounce1.Fill.Color := Color;
  CircleLoadingDoubleBounce1.Opacity := 0.3;
  CircleLoadingDoubleBounce1.Width := Width;
  CircleLoadingDoubleBounce1.Height := Height;
  CircleLoadingDoubleBounce1.Stroke.Kind := TBrushKind.None;
  Self.AddObject(CircleLoadingDoubleBounce1);
  CircleLoadingDoubleBounce2 := TCircle.Create(Self);
  CircleLoadingDoubleBounce2.Stored := False;
  CircleLoadingDoubleBounce2.Fill.Color := Color;
  CircleLoadingDoubleBounce2.Opacity := 0.3;
  CircleLoadingDoubleBounce2.Width := Width;
  CircleLoadingDoubleBounce2.Height := Height;
  CircleLoadingDoubleBounce2.Stroke.Kind := TBrushKind.None;
  Self.AddObject(CircleLoadingDoubleBounce2);
  CreateAnimation;
  FAnimation.AutoReverse := True;
  FAnimation.Duration := 1.5;
  FAnimation.OnProcess := LoadingDoubleBounceAnimationProcess;
  CircleLoadingDoubleBounce1.AddObject(FAnimation);
end;

procedure TFMXLoadingIndicator.CreateAnimation;
begin
  FAnimation := TMyAnimation.Create(Self);
  FAnimation.Stored := False;
  FAnimation.Loop := True;
end;

procedure TFMXLoadingIndicator.CreateLoadingArcs;
begin
  Arc1 := TArc.Create(Self);
  Arc1.Stored := False;
  Arc1.Width := Width;
  Arc1.Height := Height;
  Arc1.Stroke.Color := Color;
  Arc1.Stroke.Thickness := 5;
  Arc1.StartAngle := 0;
  Arc1.EndAngle := 270;
  Arc2 := TArc.Create(Self);
  Arc2.Stored := False;
  Arc2.Opacity := 0.3;
  Arc2.Position.X := 5;
  Arc2.Position.Y := 5;
  Arc2.Width := Width - 10;
  Arc2.Height := Height - 10;
  Arc2.Stroke.Color := Color;
  Arc2.Stroke.Thickness := 5;
  Arc2.StartAngle := 45;
  Arc2.EndAngle := -210;
  CreateAnimation;
  FAnimation.Duration := 3;
  FAnimation.OnProcess := LoadingArcsAnimationProcess;
  Arc1.AddObject(FAnimation);
  AddObject(Arc1);
  AddObject(Arc2);
end;

procedure TFMXLoadingIndicator.CreateLoadingPulse;
begin
  CircleLoadingPulse := TCircle.Create(Self);
  CircleLoadingPulse.Stored := False;
  CircleLoadingPulse.Fill.Color := Color;
  CircleLoadingPulse.Stroke.Kind := TBrushKind.None;
  CircleLoadingPulse.Position.Point := PointF(0, 0);
  CircleLoadingPulse.Width := Width;
  CircleLoadingPulse.Height := Height;
  Self.AddObject(CircleLoadingPulse);
  CreateAnimation;
  FAnimation.AutoReverse := True;
  FAnimation.Duration := 1.5;
  FAnimation.OnProcess := LoadingPulseAnimationProcess;
  CircleLoadingPulse.AddObject(FAnimation);
end;

{ TMyAnimation }

procedure TMyAnimation.ProcessAnimation;
begin

end;

end.
