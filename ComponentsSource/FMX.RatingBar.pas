// ***************************************************************************
//
// A Simple Firemonkey Rating Bar Component
//
// Copyright 2017 谢顿 (zhaoyipeng@hotmail.com)
//
// https://github.com/zhaoyipeng/FMXComponents
//
// ***************************************************************************
// version history
// 2017-01-20, v0.1.0.0 :
//  first release
// 2017-09-22, v0.2.0.0 :
//  merge Aone's version
//  add Data(TPathData) property, support user define rating shape
//  thanks Aone, QQ: 1467948783
//  http://www.cnblogs.com/onechen
unit FMX.RatingBar;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Math,
  System.Math.Vectors,
  System.Types,
  System.UITypes,
  System.UIConsts,
  FMX.Types,
  FMX.Layouts,
  FMX.Graphics,
  FMX.Controls,
  FMX.Objects,
  FMX.ComponentsCommon;

type

  [ComponentPlatformsAttribute(TFMXPlatforms)]
  TFMXRatingBar = class(TShape, IPathObject)
  private
    FData: TPathData;
    FCount: Integer;
    FMaximum: Single;
    FValue: Single;
    FSpace: Single;
    FActiveColor: TAlphaColor;
    FInActiveColor: TAlphaColor;
    FActiveBrush: TBrush;
    FInActiveBrush: TBrush;
    procedure SetPathData(const Value: TPathData);
    procedure SetCount(const Value: Integer);
    procedure SetMaximum(const Value: Single);
    procedure SetValue(const Value: Single);
    procedure SetSpace(const Value: Single);
    procedure SetActiveColor(const Value: TAlphaColor);
    procedure SetInActiveColor(const Value: TAlphaColor);
    { IPathObject }
    function GetPath: TPathData;
    procedure CreateBrush;
    procedure FreeBrush;
  protected
    procedure Resize; override;
    procedure Paint; override;
    procedure DrawRating(ARect: TRectF; AValue: Single);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property Align;
    property Anchors;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled default True;
    property Fill;
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
    property Data: TPathData read FData write SetPathData;
    property ActiveColor: TAlphaColor read FActiveColor write SetActiveColor;
    property InActiveColor: TAlphaColor read FInActiveColor write SetInActiveColor;
    property Space: Single read FSpace write SetSpace;
    property Count: Integer read FCount write SetCount default 5;
    property Value: Single read FValue write SetValue;
    property Maximum: Single read FMaximum write SetMaximum;
  end;

implementation

{ THHRating }

constructor TFMXRatingBar.Create(AOwner: TComponent);
begin
  inherited;
  Width := 180;
  Height := 30;
  HitTest := False;
  FData := TPathData.Create;
  FData.Data := 'm 4677,2657 -1004,727 385,1179 -1002,-731 -1002,731 386,-1179 -1005,-727 1240,3 381,-1181 381,1181 z';
  // 星 (瘦)
  FCount := 5;
  FMaximum := 5;
  FValue := 0;
  FSpace := 6;
  FActiveColor := claRoyalblue;
  FInActiveColor := $30000000;
  Stroke.Color := claNull; // 不顯示外框
end;

destructor TFMXRatingBar.Destroy;
begin
  FData.Free;
  FreeBrush;
  inherited;
end;

procedure TFMXRatingBar.CreateBrush;
begin
  if not Assigned(FActiveBrush) then
    FActiveBrush := TBrush.Create(TBrushKind.Solid, FActiveColor);
  if not Assigned(FInActiveBrush) then
    FInActiveBrush := TBrush.Create(TBrushKind.Solid, FInActiveColor);
end;

procedure TFMXRatingBar.FreeBrush;
begin
  FreeAndNil(FActiveBrush);
  FreeAndNil(FInActiveBrush);
end;

procedure TFMXRatingBar.Assign(Source: TPersistent);
var
  src: TFMXRatingBar;
begin
  if Source is TFMXRatingBar then
  begin
    src := TFMXRatingBar(Source);
    Stroke := src.Stroke;
    FData.Assign(src.FData);
    FCount := src.FCount;
    FMaximum := src.FMaximum;
    FValue := src.FValue;
    FSpace := src.FSpace;
    FActiveColor := src.FActiveColor;
    FInActiveColor := src.FInActiveColor;

    FreeBrush;
    Repaint;
  end
  else
    inherited;
end;

procedure TFMXRatingBar.DrawRating(ARect: TRectF; AValue: Single);
var
  State: TCanvasSaveState;
  l: Single;
  R: TRectF;
begin
  FData.FitToRect(ARect);
  Canvas.BeginScene;
  if AValue = 0 then
  begin
    Canvas.FillPath(FData, Opacity, FInActiveBrush);
  end
  else if AValue = 1 then
  begin
    Canvas.FillPath(FData, Opacity, FActiveBrush);
  end
  else
  begin
    Canvas.FillPath(FData, Opacity, FInActiveBrush);

    l := Min(ARect.Height, ARect.Width);
    R := RectF(ARect.CenterPoint.X - l, ARect.Top, ARect.CenterPoint.X + l * (AValue - 0.5), ARect.Bottom);

    State := Canvas.SaveState;
    Canvas.IntersectClipRect(R);

    Canvas.FillPath(FData, Opacity, FActiveBrush);
    Canvas.RestoreState(State);
  end;
  // 顯示外框
  Canvas.DrawPath(FData, Opacity);
  Canvas.EndScene;
end;

procedure TFMXRatingBar.Paint;
var
  l, w: Single;
  I: Integer;
  R: TRectF;
  DV, V: Single;
begin
  inherited;
  CreateBrush;
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
    DrawRating(R, V);
  end;
end;

procedure TFMXRatingBar.Resize;
begin
  inherited;
  Repaint;
end;

function TFMXRatingBar.GetPath: TPathData;
begin
  Result := FData;
end;

procedure TFMXRatingBar.SetPathData(const Value: TPathData);
begin
  FData.Assign(Value);
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
  if FSpace <> Value then
  begin
    FSpace := Value;

    Repaint;
  end;
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
