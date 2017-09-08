// ***************************************************************************
//
// FMXComponents: Firemonkey Opensource Components Set from China
//
// A gesture password component
//
// 该控件来自 xubzhlin的FMX-UI-Controls项目，经作者同意进行收集整理
// 原项目地址为：https://github.com/xubzhlin/FMX-UI-Controls
//
//  https://github.com/zhaoyipeng/FMXComponents
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

unit FMX.GesturePassword;

interface

uses
  System.Classes, System.UITypes, System.Types, System.UIConsts,
  FMX.Graphics, FMX.Layouts, System.Math, FMX.Controls,
  System.SysUtils, FMX.Types, FMX.Objects, System.Generics.Collections;

type
  TOnEnterCompleteEvent = procedure(Sender: TObject; const APassword: string)
    of object;

  TFMXGesturePassword = class;

  TPasswordItem = class(TObject)
  private const
    cDefaultMargin = 15;
    cDefaultMargin_2 = cDefaultMargin*2;
  private
    [waek]
    FOwner: TFMXGesturePassword;
    FSelected: Boolean;
    FIndex:Integer;
    FBackground: TBitMap;
    FPoint: TBitMap;
    FCircle:TBitMap;
    FLocalRect: TRectF;
    FCliRect:TRectF;
    FPointRect: TRectF;
    procedure Render(const Canvas: TCanvas);
    procedure SetBackground(const Value: TBitMap);
    procedure SetLocalRect(const Value: TRectF);
    procedure SetPoint(const Value: TBitMap);
    procedure SetSelected(const Value: Boolean);
    procedure SetCircle(const Value: TBitMap);
  public
    constructor Create(AOwner: TFMXGesturePassword);
    destructor Destroy; override;
    property Selected: Boolean read FSelected write SetSelected;
    property Background: TBitMap read FBackground write SetBackground;
    property Point: TBitMap read FPoint write SetPoint;
    property Circle: TBitMap read FCircle write SetCircle;
    property LocalRect: TRectF read FLocalRect write SetLocalRect;
    property Index:Integer read FIndex write FIndex;
  end;

  TFMXGesturePassword = class(TControl)
  private const
    cDefaultPadding = 10;
  private type
    TNotify = class(TComponent)
    private
      FOwner: TFMXGesturePassword;
    protected
      procedure Notification(AComponent: TComponent;
        Operation: TOperation); override;
    end;
  private
    FLeastCount:Integer;
    FLineWidth:Integer;
    FLineColor:TAlphaColor;
    FOnEnterCompleteEvent:TOnEnterCompleteEvent;
    FPassWord:String;
    FIsDown: Boolean;
    FCanDrawNowPoint: Boolean;
    FItemSize: Single;
    FNowPoint: TPointF;
    FSelectedItem: TList<TPasswordItem>;
    FItems: TObjectList<TPasswordItem>;
    FColumnCount: Integer;
    FRowCount: Integer;
    FBackground: TImage;
    FBackgroundNotify: TNotify;
    FPoint: TImage;
    FPointNotify: TNotify;
    FCircle:TImage;
    FCircleNotify: TNotify;
    procedure SetBackground(const Value: TImage);
    procedure SetColumnCount(const Value: Integer);
    procedure SetPoint(const Value: TImage);
    procedure SetRowCount(const Value: Integer);
    procedure DoReSetItemCount;
    function GetItemSize: TPointF; overload;
    function GetItemSize(ASize: Single; APoint: TPointF; AIndex: Integer)
      : TRectF; overload;
    procedure DoSelectedItem(APoint: TPointF);
    procedure DoGetPassWord;
    procedure FillItems;
    procedure FillLines;
    function FindItemByPoint(Point: TPointF): TPasswordItem;
    function GetPassWord: String;
    procedure SetCircle(const Value: TImage);
  protected
    procedure Paint; override;
    procedure Resize; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Single); override;
    procedure DoMouseLeave; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Align;
    property ColumnCount: Integer read FColumnCount write SetColumnCount;
    property RowCount: Integer read FRowCount write SetRowCount;
    property Background: TImage read FBackground write SetBackground;
    property Point: TImage read FPoint write SetPoint;
    property Circle: TImage read FCircle write SetCircle;
    property PassWord: String read GetPassWord;
    property LineColor: TAlphaColor read FLineColor write FLineColor;
    property LineWidth: Integer read FLineWidth write FLineWidth;
    property LeastCount: Integer read FLeastCount write FLeastCount;
    property OnEnterCompleteEvent: TOnEnterCompleteEvent
      read FOnEnterCompleteEvent write FOnEnterCompleteEvent;
    property OnMouseDown;
  end;

implementation

{ TPasswordItem }

constructor TPasswordItem.Create(AOwner: TFMXGesturePassword);
begin
  inherited Create;
  FOwner := AOwner;

end;

destructor TPasswordItem.Destroy;
begin

  inherited;
end;

procedure TPasswordItem.Render(const Canvas: TCanvas);
begin;
  Canvas.Fill.Kind := TBrushKind.Bitmap;
  Canvas.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
  Canvas.Stroke.Kind := TBrushKind.None;

  //画圈
  Canvas.Fill.Bitmap.Bitmap.Assign(FCircle);
  Canvas.FillRect(FCliRect, 0, 0, AllCorners, 1, Canvas.Fill,
    TCornerType.Round);

  if FSelected then
  begin
    //画背景
    if FBackground<>nil then
    begin
      Canvas.Fill.Bitmap.Bitmap.Assign(FBackground);
      Canvas.FillRect(FCliRect, 0, 0, AllCorners, 1, Canvas.Fill,
        TCornerType.Round);
    end;
    //画圆点
    if FPoint<>nil then
    begin
      Canvas.Fill.Bitmap.Bitmap.Assign(FPoint);
      Canvas.FillRect(FPointRect, 0, 0, AllCorners, 1, Canvas.Fill,
        TCornerType.Round);
    end;
  end;
end;

procedure TPasswordItem.SetBackground(const Value: TBitMap);
begin
  FBackground := Value;
end;

procedure TPasswordItem.SetCircle(const Value: TBitMap);
begin
  FCircle := Value;
end;

procedure TPasswordItem.SetLocalRect(const Value: TRectF);
begin
  FLocalRect := Value;

  FCliRect:= FLocalRect;
  FCliRect:= FLocalRect;
  FCliRect.Offset(cDefaultMargin , cDefaultMargin);
  FCliRect.Width:=FCliRect.Width - 2*cDefaultMargin;
  FCliRect.Height:=FCliRect.Height - 2*cDefaultMargin;

  FPointRect:= FCliRect;
  FPointRect.Offset(-cDefaultMargin_2, -cDefaultMargin_2);
  FPointRect.Width:=FPointRect.Width + 2*cDefaultMargin_2;
  FPointRect.Height:=FPointRect.Height + 2*cDefaultMargin_2;
end;

procedure TPasswordItem.SetPoint(const Value: TBitMap);
begin
  FPoint := Value;
end;

procedure TPasswordItem.SetSelected(const Value: Boolean);
begin
  if FSelected <> Value then
  begin
    FSelected := Value;
    FOwner.Repaint;
  end;
end;

{ TPasswordLayout }

constructor TFMXGesturePassword.Create(AOwner: TComponent);
begin
  inherited;
  FCanDrawNowPoint := False;
  FSelectedItem := TList<TPasswordItem>.Create;
  FItems := TObjectList<TPasswordItem>.Create;
  FLeastCount:=3;
  FColumnCount := 3;
  FRowCount := 3;
  FLineColor := TAlphaColors.White;
  FLineWidth := 15;
  DoReSetItemCount;
end;

destructor TFMXGesturePassword.Destroy;
begin
  FItems.Free;
  FBackgroundNotify.Free;
  FPointNotify.Free;
  FCircleNotify.Free;
  inherited;
end;

procedure TFMXGesturePassword.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Single);
begin
  inherited;
  FIsDown := True;
  DoSelectedItem(TPointF.Create(X, Y));
end;

procedure TFMXGesturePassword.DoMouseLeave;
begin
  DoGetPassWord;
end;

procedure TFMXGesturePassword.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: Single);
begin
  DoGetPassWord;
end;

procedure TFMXGesturePassword.DoGetPassWord;
var
  i: Integer;
begin
  if FIsDown then
  begin
    FIsDown := False;
    FPassWord := '';
    if FSelectedItem.Count >= LeastCount then
    begin
      for i := 0 to FSelectedItem.Count - 1 do
      begin
        FPassWord := FPassWord + InttoStr(FSelectedItem[i].Index);
      end;
    end;
    for i := 0 to FSelectedItem.Count - 1 do
      FSelectedItem[i].Selected := False;
    FSelectedItem.Clear;
    if Assigned(FOnEnterCompleteEvent) then
      FOnEnterCompleteEvent(Self, FPassWord);
  end;
end;

procedure TFMXGesturePassword.DoReSetItemCount;
var
  i, ItemCount: Integer;
  APoint: TPointF;
  PassWordItem: TPasswordItem;
begin
  if (FRowCount <> 0) and (FColumnCount <> 0) then
  begin
    ItemCount := FRowCount * FColumnCount;
    // 重置Item个数 和位置
    FItems.Clear;
    for i := 0 to ItemCount - 1 do
    begin
      PassWordItem := TPasswordItem.Create(Self);
      PassWordItem.Index:=i;
      PassWordItem.Selected := False;
      APoint := GetItemSize;
      FItemSize := Round(Min(APoint.X, APoint.Y)) - cDefaultPadding;
      PassWordItem.LocalRect := GetItemSize(FItemSize, APoint, i);
      if FBackground <> nil then
        PassWordItem.Background := FBackground.Bitmap;
      if Point <> nil then
        PassWordItem.Point := FPoint.Bitmap;
      FItems.Add(PassWordItem);
    end;
    Repaint;
  end;
end;

procedure TFMXGesturePassword.DoSelectedItem(APoint: TPointF);
var
  AItem: TPasswordItem;
begin
  AItem := FindItemByPoint(APoint);
  if (AItem <> nil) and (not AItem.Selected) then
  begin
    FCanDrawNowPoint := False;
    AItem.Selected := True;
    FSelectedItem.Add(AItem);
    FNowPoint := APoint;
    Repaint;
  end
  else if (AItem = nil) then
  begin
    FNowPoint := APoint;
    FCanDrawNowPoint := True;
    Repaint;
  end
  else if (AItem.Selected) and FCanDrawNowPoint then
  begin
    FNowPoint := APoint;
    Repaint;
  end;
end;

procedure TFMXGesturePassword.FillItems;
var
  i: Integer;
  AItem: TPasswordItem;
begin
  for i := 0 to FItems.Count - 1 do
  begin
    AItem := FItems[i];
    AItem.Render(Canvas);
  end;
end;

procedure TFMXGesturePassword.FillLines;
var
  i: Integer;
  fromPoint, toPoint: TPointF;
begin
  if FSelectedItem.Count = 0 then
    exit;
  with Canvas do
  begin
    Fill.Kind := TBrushKind.None;
    Stroke.Kind := TBrushKind.Solid;
    Stroke.Cap:= TStrokeCap.Round;
    Stroke.Color := Self.LineColor;
    Stroke.Thickness := Self.LineWidth;

  end;
  if FSelectedItem.Count = 1 then
  begin
    toPoint := FSelectedItem[0].LocalRect.CenterPoint;
  end
  else
  begin
    for i := 0 to FSelectedItem.Count - 2 do
    begin
      fromPoint := FSelectedItem[i].LocalRect.CenterPoint;
      toPoint := FSelectedItem[i + 1].LocalRect.CenterPoint;
      Canvas.DrawLine(fromPoint, toPoint, 0.5);
    end;
  end;
  if FCanDrawNowPoint then
  begin
    Canvas.DrawLine(toPoint, FNowPoint, 0.5);
  end;
end;

function TFMXGesturePassword.FindItemByPoint(Point: TPointF): TPasswordItem;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to FItems.Count - 1 do
  begin
    if FItems[i].LocalRect.Contains(Point) then
    begin
      Result := FItems[i];
      Break;
    end;
  end;
end;

function TFMXGesturePassword.GetItemSize(ASize: Single; APoint: TPointF;
  AIndex: Integer): TRectF;
var
  ARect: TRectF;
begin
  ARect.TopLeft := TPointF.Create(APoint.X * (AIndex mod FColumnCount),
    APoint.Y * (AIndex div FColumnCount));
  ARect.Width := APoint.X;
  ARect.Height := APoint.Y;
  Result := TRectF.Create(0, 0, ASize, ASize);
  Result := Result.CenterAt(ARect);
end;

function TFMXGesturePassword.GetPassWord: String;
begin
  Result := FPassWord;
  // 获取了 清空
  FPassWord := '';
end;

procedure TFMXGesturePassword.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  if FIsDown then
    DoSelectedItem(TPointF.Create(X, Y));
end;

procedure TFMXGesturePassword.Paint;
begin
  // inherited;
  Canvas.BeginScene;
  try
    // 画线
    if FIsDown then
      FillLines;
    FillItems;
  finally
    Canvas.EndScene;
  end;
end;

procedure TFMXGesturePassword.Resize;
var
  i: Integer;
  APoint: TPointF;
begin
  inherited;
  for i := 0 to FItems.Count - 1 do
  begin
    APoint := GetItemSize;
    FItemSize := Min(APoint.X, APoint.Y) - cDefaultPadding;
    FItems[i].LocalRect := GetItemSize(FItemSize, APoint, i);
  end;
end;

function TFMXGesturePassword.GetItemSize: TPointF;
begin
  Result := TPointF.Create(Width / FRowCount, Height / FColumnCount);
end;

procedure TFMXGesturePassword.SetBackground(const Value: TImage);
var
  i: Integer;
begin
  if FBackground <> Value then
  begin
    if FBackgroundNotify = nil then
    begin
      FBackgroundNotify := TNotify.Create(nil);
      FBackgroundNotify.FOwner := Self;
    end;
    if FBackground <> nil then
      FBackground.RemoveFreeNotification(FBackgroundNotify);
    FBackground := Value;
    if FBackground <> nil then
    begin
      FBackground.FreeNotification(FBackgroundNotify);
      for i := 0 to FItems.Count - 1 do
        FItems[i].Background := FBackground.Bitmap;
    end;
  end;
end;

procedure TFMXGesturePassword.SetCircle(const Value: TImage);
var
  i: Integer;
begin
  if FCircle <> Value then
  begin
    if FCircleNotify = nil then
    begin
      FCircleNotify := TNotify.Create(nil);
      FCircleNotify.FOwner := Self;
    end;
    if FCircle <> nil then
      FCircle.RemoveFreeNotification(FCircleNotify);
    FCircle := Value;
    if FCircle <> nil then
    begin
      FCircle.FreeNotification(FCircleNotify);
      for i := 0 to FItems.Count - 1 do
        FItems[i].Circle := FCircle.Bitmap;
    end;
  end;
end;

procedure TFMXGesturePassword.SetColumnCount(const Value: Integer);
begin
  if FColumnCount <> Value then
  begin
    FColumnCount := Value;
    DoReSetItemCount;
  end;
end;

procedure TFMXGesturePassword.SetPoint(const Value: TImage);
var
  i: Integer;
begin
  if FPoint <> Value then
  begin
    if FPointNotify = nil then
    begin
      FPointNotify := TNotify.Create(nil);
      FPointNotify.FOwner := Self;
    end;
    if FPoint <> nil then
      FPoint.RemoveFreeNotification(FPointNotify);
    FPoint := Value;
    if FPoint <> nil then
    begin
      FPoint.FreeNotification(FPointNotify);
      for i := 0 to FItems.Count - 1 do
        FItems[i].Point := FPoint.Bitmap;
    end;
  end;
end;

procedure TFMXGesturePassword.SetRowCount(const Value: Integer);
begin
  if FRowCount <> Value then
  begin
    FRowCount := Value;
    DoReSetItemCount;
  end;
end;

{ TPasswordLayout.TNotify }

procedure TFMXGesturePassword.TNotify.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if Operation = TOperation.opRemove then
  begin
    if AComponent = FOwner.FBackgroundNotify then
      FOwner.Background := nil;
    if AComponent = FOwner.FPointNotify then
      FOwner.Point := nil;
  end;
end;

end.

