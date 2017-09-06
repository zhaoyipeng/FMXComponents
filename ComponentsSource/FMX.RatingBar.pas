// ***************************************************************************
//
// A Simple Firemonkey Rating Bar Component
//
// Copyright 2017 谢顿 (zhaoyipeng@hotmail.com)
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
unit FMX.RatingBar;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Math,
  System.Math.Vectors,
  System.Types,
  System.UITypes,
  FMX.Types,
  FMX.Layouts,
  FMX.Graphics,
  FMX.Controls,
  FMX.Objects,
  FMX.ComponentsCommon;

type

  [ComponentPlatformsAttribute(TFMXPlatforms)]
  TFMXRatingBar = class(TShape)
  private
    FCount: Integer;
    FMaximum: Single;
    FValue: Single;
    FSpace: Single;
    FActiveColor: TAlphaColor;
    FInActiveColor: TAlphaColor;
    FActiveBrush: TBrush;
    FInActiveBrush: TBrush;
    procedure SetCount(const Value: Integer);
    procedure SetMaximum(const Value: Single);
    procedure SetValue(const Value: Single);
    procedure SetSpace(const Value: Single);
    procedure SetActiveColor(const Value: TAlphaColor);
    procedure SetInActiveColor(const Value: TAlphaColor);
    procedure CreateBrush;
    procedure FreeBrush;
  protected
    procedure Resize; override;
    procedure Paint; override;
    procedure DrawStar(ARect: TRectF; AValue: Single);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
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
    property ActiveColor: TAlphaColor read FActiveColor write SetActiveColor;
    property InActiveColor: TAlphaColor read FInActiveColor write SetInActiveColor;
    property Space: Single read FSpace write SetSpace;
    property Count: Integer read FCount write SetCount default 5;
    property Value: Single read FValue write SetValue;
    property Maximum: Single read FMaximum write SetMaximum;
  end;

procedure register;

implementation

procedure register;
begin
  RegisterComponents('FMXComponents', [TFMXRatingBar]);
end;

{ THHRating }

constructor TFMXRatingBar.Create(AOwner: TComponent);
begin
  inherited;
  Width := 174;
  Height := 30;
  FCount := 5;
  FMaximum := 5;
  FValue := 0;
  FSpace := 6;
  FActiveColor := $FF0CD19D;
  FInActiveColor := $230CD19D;
  CreateBrush;
end;

procedure TFMXRatingBar.CreateBrush;
begin
  if not Assigned(FActiveBrush) then
    FActiveBrush := TBrush.Create(TBrushKind.Solid, FActiveColor);
  if not Assigned(FInActiveBrush) then
    FInActiveBrush := TBrush.Create(TBrushKind.Solid, FInActiveColor);
end;

destructor TFMXRatingBar.Destroy;
begin
  FreeBrush;
  inherited;
end;

procedure TFMXRatingBar.DrawStar(ARect: TRectF; AValue: Single);
var
  P: TPolygon;
  fillBrush: TBrush;
  l, cx, cy: Single;
  cr: TRectF;
  State: TCanvasSaveState;
begin
  CreateBrush;
  SetLength(P, 10);
  l := Min(ARect.Height, ARect.Width);
  cx := ARect.CenterPoint.X;
  cy := ARect.CenterPoint.Y;

  P[0].X := cx;
  P[0].Y := cy - l / 2;
  P[1].X := cx + (10 * l / 64);
  P[1].Y := cy - (13 * l / 64);
  P[2].X := cx + l / 2;
  P[2].Y := cy - (10 * l / 64);
  P[3].X := cx + (16 * l / 64);
  P[3].Y := cy + (6 * l / 64);
  P[4].X := cx + (20 * l / 64);
  P[4].Y := cy + l / 2;
  P[5].X := cx;
  P[5].Y := cy + (20 * l / 64);
  P[6].X := cx - (20 * l / 64);
  P[6].Y := cy + l / 2;
  P[7].X := cx - (l / 4);
  P[7].Y := cy + (6 * l / 64);
  P[8].X := cx - l / 2;
  P[8].Y := cy - (10 * l / 64);
  P[9].X := cx - (10 * l / 64);
  P[9].Y := cy - (13 * l / 64);

  Canvas.BeginScene;
  if (AValue = 0) or (AValue = 1) then
  begin
    if AValue = 1 then
      fillBrush := FActiveBrush
    else
      fillBrush := FInActiveBrush;
    Canvas.Fill.Assign(fillBrush);
    Canvas.FillPolygon(P, Opacity);
  end
  else
  begin
    Canvas.Fill.Assign(FInActiveBrush);
    Canvas.FillPolygon(P, Opacity);
    cr := RectF(cx - l / 2, ARect.Top, cx + l * (AValue - 0.5), ARect.Bottom);
    Canvas.Fill.Assign(FActiveBrush);
    State := Canvas.SaveState;
    Canvas.IntersectClipRect(cr);
    Canvas.FillPolygon(P, Opacity);
    Canvas.RestoreState(State);
  end;
  Canvas.EndScene;
end;

procedure TFMXRatingBar.FreeBrush;
begin
  FreeAndNil(FActiveBrush);
  FreeAndNil(FInActiveBrush);
end;

procedure TFMXRatingBar.Paint;
var
  l, w: Single;
  I: Integer;
  R: TRectF;
  DV, V: Single;
begin
  inherited;
  w := (Width - FSpace * 4) / Count;
  DV := (FValue / FMaximum) * Count;
  for I := 0 to Count - 1 do
  begin
    l := (w + FSpace) * I;
    R := RectF(l, 0, l + w, Height);
    if DV - I >= 1 then
      V := 1
    else if DV <= I then
      V := 0
    else
      V := DV - I;
    DrawStar(R, V);
  end;
end;

procedure TFMXRatingBar.Resize;
begin
  inherited;
  Repaint;
end;

procedure TFMXRatingBar.SetActiveColor(const Value: TAlphaColor);
begin
  if FActiveColor <> Value then
  begin
    FActiveColor := Value;
    FreeAndNil(FActiveBrush);
    Repaint;
  end;
end;

procedure TFMXRatingBar.SetCount(const Value: Integer);
begin
  if FCount <> Value then
  begin
    FCount := Value;
    Repaint;
  end;
end;

procedure TFMXRatingBar.SetInActiveColor(const Value: TAlphaColor);
begin
  if FInActiveColor <> Value then
  begin
    FInActiveColor := Value;
    FreeAndNil(FInActiveBrush);
    Repaint;
  end;
end;

procedure TFMXRatingBar.SetMaximum(const Value: Single);
begin
  if FMaximum <> Value then
  begin
    FMaximum := Value;
    Repaint;
  end;
end;

procedure TFMXRatingBar.SetSpace(const Value: Single);
begin
  FSpace := Value;
end;

procedure TFMXRatingBar.SetValue(const Value: Single);
begin
  if FValue <> Value then
  begin
    FValue := Value;
    Repaint;
  end;
end;

end.
