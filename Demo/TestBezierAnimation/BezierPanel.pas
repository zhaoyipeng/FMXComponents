unit BezierPanel;

interface

uses
  System.UITypes,
  System.Classes,
  FMX.Objects;

type
  TBezierPanel = class(TShape)
  private
    FNormalBackground: TAlphaColor;
    FSelectedForeground: TAlphaColor;
    FSelectedBackground: TAlphaColor;
    FIsSelected: Boolean;
    FNormalForeground: TAlphaColor;
    FP1x: Single;
    FP1y: Single;
    FP2x: Single;
    FP2y: Single;
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
  protected
    procedure Paint; override;
  public
    constructor Create(AComponent: TComponent); override;
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
  end;
implementation

{ TBezierPanel }

constructor TBezierPanel.Create(AComponent: TComponent);
begin
  inherited;

end;

function TBezierPanel.GetBesizerExpression: string;
begin

end;

procedure TBezierPanel.Paint;
begin
  inherited;

end;

procedure TBezierPanel.SetBesizerExpression(const Value: string);
begin
end;

procedure TBezierPanel.SetIsSelected(const Value: Boolean);
begin
  if FIsSelected <> Value then
  begin
    FIsSelected := Value;
    Repaint;
  end;
end;

procedure TBezierPanel.SetNormalBackground(const Value: TAlphaColor);
begin
  if FNormalBackground <> Value then
  begin
    FNormalBackground := Value;
    Repaint;
  end;
end;

procedure TBezierPanel.SetNormalForeground(const Value: TAlphaColor);
begin
  if FNormalForeground <> Value then
  begin
    FNormalForeground := Value;
    Repaint;
  end;
end;

procedure TBezierPanel.SetP1X(const Value: Single);
begin
  if FP1X <> Value then
  begin
    FP1X := Value;
    Repaint;
  end;
end;

procedure TBezierPanel.SetP1Y(const Value: Single);
begin
  if FP1Y <> Value then
  begin
    FP1Y := Value;
    Repaint;
  end;
end;

procedure TBezierPanel.SetP2X(const Value: Single);
begin
  if FP2X <> Value then
  begin
    FP2X := Value;
    Repaint;
  end;
end;

procedure TBezierPanel.SetP2Y(const Value: Single);
begin
  if FP2Y <> Value then
  begin
    FP2Y := Value;
    Repaint;
  end;
end;

procedure TBezierPanel.SetSelectedBackground(const Value: TAlphaColor);
begin
  if FSelectedBackground <> Value then
  begin
    FSelectedBackground := Value;
    Repaint;
  end;
end;

procedure TBezierPanel.SetSelectedForeground(const Value: TAlphaColor);
begin
  if FSelectedForeground <> Value then
  begin
    FSelectedForeground := Value;
    Repaint;
  end;
end;

end.
