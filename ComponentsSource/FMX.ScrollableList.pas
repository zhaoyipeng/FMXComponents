// ***************************************************************************
//
// A Simple Firemonkey Scrolleable List Component
//
// Copyright 2017 谢顿 (zhaoyipeng@hotmail.com)
//
// https://github.com/zhaoyipeng/FMXComponents
//
// ***************************************************************************
unit FMX.ScrollableList;

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
  FMX.Ani,
  FMX.ComponentsCommon;

type

  [ComponentPlatformsAttribute(TFMXPlatforms)]
  TFMXScrollableList = class(TLayout)
  private
    FContainer: TLayout;
    FItemIndex: Integer;
    FTextList: TArray<TText>;
    FDownPos: Single;
    FIsDown: Boolean;
    FDownIndex: Integer;
    FAnimation: TFloatAnimation;
    FItems: TStrings;
    FItemHeight: Single;
    FOnChange: TNotifyEvent;
    FSelectedColor: TAlphaColor;
    FSelectedItemHeight: Single;
    FDownItem: Integer;
    procedure AdjustTexts;
    procedure SetItemIndex(const Value: Integer);
    procedure CreateTexts;
    procedure SetItems(const Value: TStrings);
    procedure SetItemHeight(const Value: Single);
    procedure SetOnChange(const Value: TNotifyEvent);
    procedure SetSelectedColor(const Value: TAlphaColor);
    procedure SetSelectedItemHeight(const Value: Single);
  protected
    procedure Resize; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Single); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Loaded; override;
    destructor Destroy; override;
    procedure SetData(const AList: TArray<string>); reintroduce;
    function GetSelected: string;
  published
    property SelectedColor: TAlphaColor read FSelectedColor
      write SetSelectedColor default $FF1EB9C1 ;
    property ItemHeight: Single read FItemHeight write SetItemHeight;
    property SelectedItemHeight: Single read FSelectedItemHeight write SetSelectedItemHeight;
    property Items: TStrings read FItems write SetItems;
    property ItemIndex: Integer read FItemIndex write SetItemIndex;
    property OnChange: TNotifyEvent read FOnChange write SetOnChange;
  end;

implementation

{ TFMXScrollYears }

procedure TFMXScrollableList.AdjustTexts;
var
  I: Integer;
begin
  for I := 0 to High(FTextList) do
  begin
    if I = FItemIndex then
    begin
      FTextList[I].Height := SelectedItemHeight;
      FTextList[I].TextSettings.Font.Size := 18;
      FTextList[I].TextSettings.FontColor := $FF1EB9C1;
    end
    else
    begin
      FTextList[I].Height := ItemHeight;
      FTextList[I].TextSettings.Font.Size := 18;
      FTextList[I].TextSettings.FontColor := TAlphaColors.Black;
    end;
  end;
end;

constructor TFMXScrollableList.Create(AOwner: TComponent);
begin
  inherited;
  FItemHeight := 52;
  FSelectedItemHeight := 59;
  Width := 64;
  Height := FItemHeight * 3;
  FItems := TStringList.Create;
  FItems.AddStrings(['2000', '2003', '2005', '2008', '2010', '2014', '2016']);
  FIsDown := False;
  FItemIndex := 0;
  HitTest := True;
  ClipChildren := True;
  AutoCapture := True;

  FContainer := TLayout.Create(Self);
  FContainer.Position.X := 0;
  FContainer.Position.Y := ItemHeight;
  FContainer.Width := Width;
  FContainer.Height := FItemHeight * FItems.Count;
  FContainer.Stored := False;
  FContainer.Parent := Self;
  FAnimation := TFloatAnimation.Create(Self);
  FAnimation.PropertyName := 'Position.Y';
  FAnimation.Parent := FContainer;
  FAnimation.Duration := 0.1;
end;

procedure TFMXScrollableList.CreateTexts;
var
  I: Integer;
  t: TText;
  Y: Single;
begin

  for I := High(FTextList) downto 0 do
  begin
    FTextList[I].DisposeOf;
  end;

  FContainer.Height := (FItemHeight * FItems.Count-1) + FSelectedItemHeight;

  SetLength(FTextList, FItems.Count);
  Y := 0;
  for I := 0 to FItems.Count - 1 do
  begin
    t := TText.Create(Self);
    t.Stored := False;
    t.Text := FItems[I];
    t.Position.X := 0;
    t.Position.Y := Y;
    if I = ItemIndex then
      t.Height := SelectedItemHeight
    else
      t.Height := ItemHeight;
    t.Width := Width;
    t.HitTest := False;
    t.Parent := FContainer;
    FTextList[I] := t;
    Y := Y + t.Height;
  end;
  AdjustTexts;
end;

destructor TFMXScrollableList.Destroy;
begin
  FItems.Free;
  inherited;
end;

function TFMXScrollableList.GetSelected: string;
begin
  Result := FItems[ItemIndex];
end;

procedure TFMXScrollableList.Loaded;
begin
  inherited;
  CreateTexts;
end;

procedure TFMXScrollableList.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Single);
begin
  inherited;
  FDownPos := Y;
  FDownIndex := FItemIndex;
  FIsDown := True;
  FDownItem := ItemIndex;
end;

procedure TFMXScrollableList.MouseMove(Shift: TShiftState; X, Y: Single);
var
  Delta, NewY: Single;
begin
  inherited;
  if FIsDown then
  begin
    Delta := Y - FDownPos;
    NewY := (1 - FDownIndex) * FItemHeight + Delta;
    NewY := Max(Min(FItemHeight, NewY), (2 - FItems.Count) * FItemHeight);

    ItemIndex := Round(-NewY / FItemHeight) + 1;
    FContainer.Position.Y := NewY;
  end;
end;

procedure TFMXScrollableList.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Single);
var
  AdjustY: Single;
begin
  inherited;
  if FIsDown then
  begin
    FIsDown := False;
    AdjustY := (1 - ItemIndex) * FItemHeight;
    FAnimation.StartValue := FContainer.Position.Y;
    FAnimation.StopValue := AdjustY;
    FAnimation.Start;

    if ItemIndex <> FDownItem then
    begin
      if Assigned(FOnChange) then
      begin
        FOnChange(Self);
      end;
    end;
  end;
end;

procedure TFMXScrollableList.Resize;
var
  I: Integer;
begin
  inherited;
  Height := FItemHeight * 3;
  if Assigned(FContainer) then
    FContainer.Width := Width;
  for I := 0 to High(FTextList) do
  begin
    FTextList[I].Width := Width;
  end;
end;

procedure TFMXScrollableList.SetItemHeight(const Value: Single);
begin
  if FItemHeight <> Value then
  begin
    FItemHeight := Value;
    Height := 3 * FItemHeight;
  end;
end;

procedure TFMXScrollableList.SetItemIndex(const Value: Integer);
begin
  if FItemIndex <> Value then
  begin
    FItemIndex := Value;
    CreateTexts;
    AdjustTexts;
    FContainer.Position.Y := -(FItemIndex-1) * ItemHeight;
  end;
end;

procedure TFMXScrollableList.SetItems(const Value: TStrings);
begin
  FItems.Assign(Value);
  FItemIndex := -1;
  CreateTexts;
end;

procedure TFMXScrollableList.SetOnChange(const Value: TNotifyEvent);
begin
  FOnChange := Value;
end;

procedure TFMXScrollableList.SetSelectedColor(const Value: TAlphaColor);
begin
  if FSelectedColor <> Value then
  begin
    FSelectedColor := Value;
    AdjustTexts;
  end;
end;

procedure TFMXScrollableList.SetSelectedItemHeight(const Value: Single);
begin
  FSelectedItemHeight := Value;
end;

procedure TFMXScrollableList.SetData(const AList: TArray<string>);
begin
  FItems.Clear;
  FItems.AddStrings(AList);
  FItemIndex := -1;
  CreateTexts;
end;

end.
