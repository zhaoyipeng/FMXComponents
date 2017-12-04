// ***************************************************************************
//
// A Firemonkey Bezier Visual Component
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
unit FMX.BezierPanel;

interface

uses
  System.Types,
  System.UITypes,
  System.Classes,
  System.SysUtils,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Objects,
  FMX.BezierAnimation,
  FMX.ComponentsCommon;

type
  [ComponentPlatformsAttribute(TFMXPlatforms)]
  TFMXBezierPanel = class(TControl)
  private
    FNormalBackground: TAlphaColor;
    FSelectedForeground: TAlphaColor;
    FSelectedBackground: TAlphaColor;
    FIsSelected: Boolean;
    FNormalForeground: TAlphaColor;
    FP1X, FP1Y, FP2X, FP2Y: Single;
    FPath: TPathData;
    procedure SetBesizerExpression(const Value: string);
    procedure SetIsSelected(const Value: Boolean);
    procedure SetNormalBackground(const Value: TAlphaColor);
    procedure SetNormalForeground(const Value: TAlphaColor);
    procedure SetSelectedBackground(const Value: TAlphaColor);
    procedure SetSelectedForeground(const Value: TAlphaColor);
    procedure SetP1X(const Value: Single);
    procedure SetP1Y(const Value: Single);
    procedure SetP2X(const Value: Single);
    procedure SetP2Y(const Value: Single);
    function GetBesizerExpression: string;
    function GetPoint(x, y: Single): TPointF;
  protected
    procedure Paint; override;
  public
    constructor Create(AComponent: TComponent); override;
    destructor Destroy; override;
  published
    property P1X: Single read FP1X write SetP1X;
    property P1Y: Single read FP1Y write SetP1Y;
    property P2X: Single read FP2X write SetP2X;
    property P2Y: Single read FP2Y write SetP2Y;
    property BesizerExpression: string read GetBesizerExpression write SetBesizerExpression stored False;
    property NormalBackground: TAlphaColor read FNormalBackground write SetNormalBackground;
    property NormalForeground: TAlphaColor read FNormalForeground write SetNormalForeground;
    property SelectedBackground: TAlphaColor read FSelectedBackground write SetSelectedBackground;
    property SelectedForeground: TAlphaColor read FSelectedForeground write SetSelectedForeground;
    property IsSelected: Boolean read FIsSelected write SetIsSelected;
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
  end;

  TBezierPanelSelector = class(TControl)
  private
    FText: TText;
    FPanel: TFMXBezierPanel;
    function GetText: string;
    procedure SetText(const Value: string);
    function GetIsSelected: Boolean;
    procedure SetIsSelected(const Value: Boolean);
  public
    constructor Create(AComponent: TComponent); override;
    procedure SetBezier(p1x, p1y, p2x, p2y: Single);
  published
    property OnClick;
    property Panel: TFMXBezierPanel read FPanel stored false;
    property IsSelected: Boolean read GetIsSelected write SetIsSelected;
    property Text: string read GetText write SetText;
  end;

implementation

type
  TPathDataHelper = class helper for TPathData
  public
    procedure SetCount(const ACount: Integer);
    procedure SetPoint(const AIndex: Integer; const PathPoint: TPathPoint);
  end;

procedure TPathDataHelper.SetCount(const ACount: Integer);
begin
   with Self do
    FPathData.Count := ACount;
end;

procedure TPathDataHelper.SetPoint(const AIndex: Integer; const PathPoint: TPathPoint);
begin
   with Self do
    FPathData[AIndex] := PathPoint;
end;

{ TBezierPanel }

constructor TFMXBezierPanel.Create(AComponent: TComponent);
begin
  inherited;
  FNormalBackground := $FFE5E5E5;
  FNormalForeground := TAlphaColors.Black;
  FSelectedBackground := $FF00AABB;
  FSelectedForeground := TAlphaColors.White;
  FIsSelected := False;
  FP1X := 0;
  FP1Y := 0;
  FP2X := 1;
  FP2Y := 1;
end;

destructor TFMXBezierPanel.Destroy;
begin
  FPath.Free;
  inherited;
end;

function TFMXBezierPanel.GetBesizerExpression: string;
begin
  Result := Format('%.2f,%.2f,%.2f,%.2f', [P1X, P1Y, P2X, P2Y])
end;

function TFMXBezierPanel.GetPoint(x, y: Single): TPointF;
const
  MARGIN_SIZE = 10;
begin
  Result.x := (Width - 2 * MARGIN_SIZE) * x + MARGIN_SIZE;
  Result.y := (Height - 2 * MARGIN_SIZE) * (1 - y) + MARGIN_SIZE;
end;

procedure TFMXBezierPanel.Paint;
const
  POINT_SIZE = 3;
var
  Fill: TBrush;
  FillColor: TAlphaColor;
  StrokeColor: TAlphaColor;
  bezier: TBezier;
  I: Integer;
  x, y: Single;
  procedure DrawPoint(Canvas: TCanvas; x, y: Single);
  var
    p: TPointF;
  begin
    p := GetPoint(x, y);
    Canvas.Fill.Color := StrokeColor;
    Canvas.FillEllipse(TRectF.Create(PointF(p.x - POINT_SIZE / 2, p.y - POINT_SIZE / 2), POINT_SIZE, POINT_SIZE), 0.7);
    Canvas.DrawEllipse(TRectF.Create(PointF(p.x - POINT_SIZE / 2, p.y - POINT_SIZE / 2), POINT_SIZE, POINT_SIZE), 0.7);
  end;
begin
  if FIsSelected then
  begin
    FillColor := FSelectedBackground;
    StrokeColor := FSelectedForeground;
  end
  else
  begin
    FillColor := FNormalBackground;
    StrokeColor := FNormalForeground;
  end;


  Canvas.Fill.Kind := TBrushKind.Solid;
  Canvas.Fill.Color := FillColor;
  Canvas.Stroke.Kind := TBrushKind.Solid;
  Canvas.Stroke.Color := StrokeColor;

  Canvas.FillRect(LocalRect, 6, 6, AllCorners, AbsoluteOpacity);
  Canvas.Stroke.Thickness := 2;
  Canvas.DrawLine(GetPoint(0,0), GetPoint(p1x,p1y), 0.5);
  Canvas.DrawLine(GetPoint(1,1), GetPoint(p2x,p2y), 0.5);

  Canvas.Stroke.Thickness := 3;
  if not Assigned(FPath) then
    FPath := TPathData.Create;
  FPath.SetCount(101);
  bezier := TBezier.Create(p1x, p1y, p2x, p2y);
  try
    FPath.SetPoint(0, TPathPoint.Create(TPathPointKind.MoveTo, GetPoint(0, 0)));
    for I := 1 to 100 do
    begin
      x := I / 100;
      y := bezier.Solve(x, TBezier.epsilon);
      FPath.SetPoint(I, TPathPoint.Create(TPathPointKind.LineTo, GetPoint(x, y)));
    end;
    Canvas.Stroke.Color := StrokeColor;
    Canvas.DrawPath(FPath, 1);
  finally
    bezier.Free;
  end;
  Canvas.Stroke.Thickness := 1;
  Canvas.Stroke.Color := StrokeColor;
  DrawPoint(Canvas, p1x, p1y);
  DrawPoint(Canvas, p2x, p2y);
end;

procedure TFMXBezierPanel.SetBesizerExpression(const Value: string);
begin
end;

procedure TFMXBezierPanel.SetIsSelected(const Value: Boolean);
begin
  if FIsSelected <> Value then
  begin
    FIsSelected := Value;
    Repaint;
  end;
end;

procedure TFMXBezierPanel.SetNormalBackground(const Value: TAlphaColor);
begin
  if FNormalBackground <> Value then
  begin
    FNormalBackground := Value;
    Repaint;
  end;
end;

procedure TFMXBezierPanel.SetNormalForeground(const Value: TAlphaColor);
begin
  if FNormalForeground <> Value then
  begin
    FNormalForeground := Value;
    Repaint;
  end;
end;

procedure TFMXBezierPanel.SetP1X(const Value: Single);
begin
  if FP1X <> Value then
  begin
    FP1X := Value;
    Repaint;
  end;
end;

procedure TFMXBezierPanel.SetP1Y(const Value: Single);
begin
  if FP1Y <> Value then
  begin
    FP1Y := Value;
    Repaint;
  end;
end;

procedure TFMXBezierPanel.SetP2X(const Value: Single);
begin
  if FP2X <> Value then
  begin
    FP2X := Value;
    Repaint;
  end;
end;

procedure TFMXBezierPanel.SetP2Y(const Value: Single);
begin
  if FP2Y <> Value then
  begin
    FP2Y := Value;
    Repaint;
  end;
end;

procedure TFMXBezierPanel.SetSelectedBackground(const Value: TAlphaColor);
begin
  if FSelectedBackground <> Value then
  begin
    FSelectedBackground := Value;
    Repaint;
  end;
end;

procedure TFMXBezierPanel.SetSelectedForeground(const Value: TAlphaColor);
begin
  if FSelectedForeground <> Value then
  begin
    FSelectedForeground := Value;
    Repaint;
  end;
end;

{ TBezierPanelSelector }

constructor TBezierPanelSelector.Create(AComponent: TComponent);
begin
  inherited;
  Width := 120;
  Height := 160;
  FText := TText.Create(Self);
  FText.HitTest := False;
  FText.Stored := False;
  FText.Height := 40;
  FText.Font.Size := 20;
  FText.Align := TAlignLayout.Bottom;
  FText.Parent := Self;

  FPanel := TFMXBezierPanel.Create(Self);
  FPanel.HitTest := False;
  FPanel.Stored := False;
  FPanel.Align := TAlignLayout.Client;
  FPanel.Parent := Self;
end;

function TBezierPanelSelector.GetIsSelected: Boolean;
begin
  Result := FPanel.IsSelected;
end;

function TBezierPanelSelector.GetText: string;
begin
  Result := FText.Text;
end;

procedure TBezierPanelSelector.SetBezier(p1x, p1y, p2x, p2y: Single);
begin
  FPanel.P1X := p1x;
  FPanel.P1Y := p1y;
  FPanel.P2X := p2x;
  FPanel.P2Y := p2Y;
end;

procedure TBezierPanelSelector.SetIsSelected(const Value: Boolean);
begin
  FPanel.IsSelected := Value;
  if Value then
    FText.Color := FPanel.SelectedBackground
  else
    FText.Color := $FF999999;
end;

procedure TBezierPanelSelector.SetText(const Value: string);
begin
  FText.Text := Value;
end;

end.
