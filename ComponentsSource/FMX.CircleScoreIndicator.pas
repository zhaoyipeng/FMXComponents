// ***************************************************************************
//
// A Simple Firemonkey Circle Score Indicator Component
//
// Copyright 2017 Ð»¶Ù (zhaoyipeng@hotmail.com)
//
// https://github.com/zhaoyipeng/FMXComponents
//
// ***************************************************************************
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// *************************************************************************** }

// version history
// 2017-01-20, v0.1.0.0 : first release

unit FMX.CircleScoreIndicator;

interface

uses
  System.Classes,
  System.Types,
  System.Math.Vectors,
  System.UITypes,
  FMX.Controls,
  FMX.Graphics,
  FMX.Objects,
  FMX.ComponentsCommon;

type
  [ComponentPlatformsAttribute(TFMXPlatforms)]
  TFMXCircleScoreIndicator = class(TShape)
  private
    { Private declarations }
    FMax: Single;
    FMin: Single;
    FStartAngle: Single;
    FThickness: Single;
    FBackStroke: TStrokeBrush;
    FHeadBrush: TStrokeBrush;
    FTailBrush: TStrokeBrush;
    FScoreBrush: TBrush;
    FValue: Single;
    FIsHealthy: Boolean;
    procedure SetMax(const Value: Single);
    procedure SetMin(const Value: Single);
    procedure SetStartAngle(const Value: Single);
    procedure SetThickness(const Value: Single);
    procedure SetBackStroke(const Value: TStrokeBrush);
    procedure SetScoreBrush(const Value: TBrush);
    procedure SetValue(const Value: Single);
    function CreateMatrix(Angle: Single; cp2: TPointF): TMatrix;
    procedure RotateBrush(aBrush: TBrush; Angle: Single);
    procedure SetIsHealthy(const Value: Boolean);
  protected
    procedure Paint; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetHealthyTheme;
    procedure SetUnhealthyTheme;
  published
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
    property Stroke;
    property Visible default True;
    property Width;
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
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
    property Max: Single read FMax write SetMax;
    property Min: Single read FMin write SetMin;
    property Value: Single read FValue write SetValue;
    property StartAngle: Single read FStartAngle write SetStartAngle;
    property Thickness: Single read FThickness write SetThickness;
    property BackStroke: TStrokeBrush read FBackStroke write SetBackStroke;
    property ScoreBrush: TBrush read FScoreBrush write SetScoreBrush;
    property IsHealthy: Boolean read FIsHealthy write SetIsHealthy;
  end;

procedure Register;

implementation

uses
  System.Math;

procedure Register;
begin
  RegisterComponents('FMXComponents', [TFMXCircleScoreIndicator]);
end;

{ TFMXCircleScore }

constructor TFMXCircleScoreIndicator.Create(AOwner: TComponent);
var
  g: TGradientPoint;
begin
  inherited;
  FBackStroke := TStrokeBrush.Create(TBrushKind.Solid, $FFF5E0E2);
  FBackStroke.Thickness := 11;
  FBackStroke.OnChanged := FillChanged;
  FScoreBrush := TBrush.Create(TBrushKind.Gradient, $FFF14D4D);
  FScoreBrush.Gradient.Points.Clear;
  FScoreBrush.Gradient.Points.Add;
  FScoreBrush.Gradient.Points.Add;
  FScoreBrush.Gradient.Points.Add;
  g := FScoreBrush.Gradient.Points[0];
  g.Offset := 0;
  g.Color := $FFF14D4D;
  g := FScoreBrush.Gradient.Points[1];
  g.Offset := 0.5;
  g.Color := $FFE46161;
  g := FScoreBrush.Gradient.Points[2];
  g.Offset := 1.0;
  g.Color := $FFEB8F73;
  FScoreBrush.OnChanged := FillChanged;
  FMin := 0;
  FMax := 100;
  FValue := 45;
  FThickness := 11;
  FHeadBrush := TStrokeBrush.Create(TBrushKind.Solid, $FFF14D4D);
  FTailBrush := TStrokeBrush.Create(TBrushKind.Solid, $FFEB8F73);
end;

destructor TFMXCircleScoreIndicator.Destroy;
begin
  FTailBrush.Free;
  FHeadBrush.Free;
  FBackStroke.Free;
  inherited;
end;

function TFMXCircleScoreIndicator.CreateMatrix(Angle: Single; cp2: TPointF): TMatrix;
var
  ScaleMatrix: TMatrix;
  M1: TMatrix;
  M2: TMatrix;
  RotMatrix: TMatrix;
  TranslateMatrix: TMatrix;
begin
  ScaleMatrix := TMatrix.Identity;
  ScaleMatrix.m11 := Scale.X;
  ScaleMatrix.m22 := Scale.Y;
  Result := ScaleMatrix;
  // rotation
  if Angle <> 0 then
  begin
    M1 := TMatrix.Identity;
    M1.m31 := -cp2.X * Scale.X;
    M1.m32 := -cp2.Y * Scale.Y;
    M2 := TMatrix.Identity;
    M2.m31 := cp2.X * Scale.X;
    M2.m32 := cp2.Y * Scale.Y;
    RotMatrix := M1 * (TMatrix.CreateRotation(DegToRad(Angle)) * M2);
    Result := Result * RotMatrix;
  end;
end;

procedure TFMXCircleScoreIndicator.Paint;
var
  r, r1, r2: Single;
  cr: TRectF;
  path: TPathData;
  Angle, delta, stAngle, enAngle: Single;
  Count: Integer;
  I: Integer;
  cp, cp1, cp2, p1, p2, p3, p4: TPointF;
  s, s2: TStrokeBrush;
  v1, v2: Single;
  oldMatrix, M: TMatrix;
begin
  inherited;
  r := (System.Math.Min(Width, Height) - Thickness) * 0.5;
  r1 := r - Thickness * 0.5;
  r2 := r + Thickness * 0.5;

  cr := TRectF.Create(0, 0, 1, 1).FitInto(LocalRect);
  cp := cr.CenterPoint;
  cr.Inflate(-Thickness * 0.5, -Thickness * 0.5);
  Canvas.DrawEllipse(cr, AbsoluteOpacity, FBackStroke);

  Angle := 360 * (FValue - FMin) / FMax;
  if SameValue(Angle, 0.0, 1E-4) then
    Exit;

  Count := Ceil(Angle / 5.0);
  if Odd(Count) then
    Count := Count + 1;
  delta := Angle / Count;
  path := TPathData.Create;
  s := TStrokeBrush.Create(TBrushKind.Gradient, TAlphaColors.Black);
  s2 := TStrokeBrush.Create(TBrushKind.Solid, TAlphaColors.Black);
  try
    s.Gradient.Points.Clear;
    s.Gradient.Points.Add;
    s.Gradient.Points.Add;

    cp1 := PointF(cp.X, cp.Y - r);
    Canvas.FillArc(cp1, PointF(Thickness * 0.5, Thickness * 0.5), -90, -180,
      AbsoluteOpacity, FHeadBrush);
    Canvas.DrawArc(cp1, PointF(Thickness * 0.5, Thickness * 0.5), -90, -180,
      AbsoluteOpacity, FHeadBrush);
    for I := 0 to Count - 1 do
    begin
      v1 := I / Count;
      v2 := (I + 1) / Count;

      stAngle := -90 + I * delta;
      enAngle := -90 + (I + 1) * delta;

      s.Gradient.Points[0].Color := FScoreBrush.Gradient.InterpolateColor(v1);
      s.Gradient.Points[1].Color := FScoreBrush.Gradient.InterpolateColor(v2);
      RotateBrush(s, stAngle + delta * 0.5);

      p1 := PointF(cp.X + r1 * Sin(stAngle), cp.Y + r1 * Cos(stAngle));
      p2 := PointF(cp.X + r1 * Sin(enAngle), cp.Y + r1 * Cos(enAngle));
      p3 := PointF(cp.X + r2 * Sin(enAngle), cp.Y + r2 * Cos(enAngle));
      p4 := PointF(cp.X + r2 * Sin(stAngle), cp.Y + r2 * Cos(stAngle));

      path.AddArc(cp, PointF(r1, r1), stAngle, delta);
      path.AddArc(cp, PointF(r2, r2), enAngle, -delta);
      path.ClosePath;
      Canvas.FillPath(path, AbsoluteOpacity, s);
      {$IFDEF MSWINDOWS}
      Canvas.DrawArc(cp, PointF(r1, r1), stAngle, delta, AbsoluteOpacity, s);
      Canvas.DrawArc(cp, PointF(r2, r2), stAngle, delta, AbsoluteOpacity, s);
      s2.Color := FScoreBrush.Gradient.InterpolateColor(v1);
      Canvas.DrawLine(path.Points[0].Point, path.Points[7].Point,
        AbsoluteOpacity, s2);
      {$ENDIF}
      path.Clear;
    end;

    cp2 := PointF(cp.X + r * Cos(DegToRad(Angle - 90)),
      cp.Y + r * Sin(DegToRad(Angle - 90)));
    M := CreateMatrix(Angle, cp2);
    oldMatrix := Canvas.Matrix;
    Canvas.MultiplyMatrix(M);
    Canvas.FillArc(cp2, PointF(Thickness * 0.5, Thickness * 0.5), -90, 180,
      AbsoluteOpacity, FTailBrush);
    Canvas.DrawArc(cp2, PointF(Thickness * 0.5, Thickness * 0.5), -90, 180,
      AbsoluteOpacity, FTailBrush);
    Canvas.SetMatrix(oldMatrix);
  finally
    path.Free;
    s.Free;
    s2.Free;
  end;
end;

procedure TFMXCircleScoreIndicator.RotateBrush(aBrush: TBrush; Angle: Single);
var
  M1, M2, RotMatrix: TMatrix;
  p1, p2: TPointF;
begin
  M1 := TMatrix.Identity;
  M1.m31 := -0.5;
  M1.m32 := -0.5;
  M2 := TMatrix.Identity;
  M2.m31 := 0.5;
  M2.m32 := 0.5;
  RotMatrix := M1 * (TMatrix.CreateRotation(DegToRad(Angle)) * M2);
  p1 := PointF(0, 0.5);
  p2 := PointF(1, 0.5);
  p1 := p1 * RotMatrix;
  p2 := p2 * RotMatrix;
  aBrush.Gradient.StartPosition.Point := p1;
  aBrush.Gradient.StopPosition.Point := p2;
end;

procedure TFMXCircleScoreIndicator.SetBackStroke(const Value: TStrokeBrush);
begin
  FBackStroke := Value;
end;

procedure TFMXCircleScoreIndicator.SetHealthyTheme;
var
  g: TGradientPoint;
begin
  BeginUpdate;
  FBackStroke.Color := $FFe0f5ef;
  FScoreBrush.Gradient.Points.Clear;
  FScoreBrush.Gradient.Points.Add;
  FScoreBrush.Gradient.Points.Add;
  FScoreBrush.Gradient.Points.Add;
  g := FScoreBrush.Gradient.Points[0];
  g.Offset := 0;
  g.Color := $FF14b98c;
  g := FScoreBrush.Gradient.Points[1];
  g.Offset := 0.5;
  g.Color := $FF0cd49e;
  g := FScoreBrush.Gradient.Points[2];
  g.Offset := 1.0;
  g.Color := $FF73eba0;
  FHeadBrush := TStrokeBrush.Create(TBrushKind.Solid, FScoreBrush.Gradient.Points[0].Color);
  FTailBrush := TStrokeBrush.Create(TBrushKind.Solid, FScoreBrush.Gradient.Points[2].Color);
  EndUpdate;
end;

procedure TFMXCircleScoreIndicator.SetIsHealthy(const Value: Boolean);
begin
  if FIsHealthy <> Value then
  begin
    FIsHealthy := Value;
    if FIsHealthy then
      SetHealthyTheme
    else
      SetUnhealthyTheme;
  end;
end;

procedure TFMXCircleScoreIndicator.SetMax(const Value: Single);
begin
  if FMax <> Value then
  begin
    FMax := Value;
    Repaint;
  end;
end;

procedure TFMXCircleScoreIndicator.SetMin(const Value: Single);
begin
  if FMin <> Value then
  begin
    FMin := Value;
    Repaint;
  end;
end;

procedure TFMXCircleScoreIndicator.SetScoreBrush(const Value: TBrush);
begin
  FScoreBrush := Value;
end;

procedure TFMXCircleScoreIndicator.SetStartAngle(const Value: Single);
begin
  if FStartAngle <> Value then
  begin
    FStartAngle := Value;
    Repaint;
  end;
end;

procedure TFMXCircleScoreIndicator.SetThickness(const Value: Single);
begin
  if FThickness <> Value then
  begin
    FThickness := Value;
    FBackStroke.Thickness := Value;
    Repaint;
  end;
end;

procedure TFMXCircleScoreIndicator.SetUnhealthyTheme;
var
  g: TGradientPoint;
begin
  BeginUpdate;
  FBackStroke.Color := $FFF5E0E2;
  FScoreBrush.Gradient.Points.Clear;
  FScoreBrush.Gradient.Points.Add;
  FScoreBrush.Gradient.Points.Add;
  FScoreBrush.Gradient.Points.Add;
  g := FScoreBrush.Gradient.Points[0];
  g.Offset := 0;
  g.Color := $FFF14D4D;
  g := FScoreBrush.Gradient.Points[1];
  g.Offset := 0.5;
  g.Color := $FFE46161;
  g := FScoreBrush.Gradient.Points[2];
  g.Offset := 1.0;
  g.Color := $FFEB8F73;
  FHeadBrush := TStrokeBrush.Create(TBrushKind.Solid, FScoreBrush.Gradient.Points[0].Color);
  FTailBrush := TStrokeBrush.Create(TBrushKind.Solid, FScoreBrush.Gradient.Points[2].Color);
  EndUpdate;
end;

procedure TFMXCircleScoreIndicator.SetValue(const Value: Single);
begin
  if FValue <> Value then
  begin
    FValue := Value;
    Repaint;
  end;
end;

end.
