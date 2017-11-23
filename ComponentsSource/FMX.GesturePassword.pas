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
// version history
// 2017-09-06, v0.1.0.0 :
//    first release
// 2017-09-07, v0.2.0.0 :
//    fixed bugs, do not used TImage, change to internal TFixedMultiResBitmap
//    add default draw method if the bitmap not set, if user do not want set
//    bitmap, just drop the component onto form, it can be used

unit FMX.GesturePassword;

interface

uses
  System.Types,
  System.UITypes,
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,
  System.Math,
  System.UIConsts,
  FMX.Graphics,
  FMX.Layouts,
  FMX.Controls,
  FMX.Dialogs,
  FMX.MultiResBitmap,
  FMX.Types,
  FMX.Objects,
  FMX.ComponentsCommon;

type
  TOnEnterCompleteEvent = procedure(Sender: TObject; const APassword: string)
    of object;

  TFMXGesturePassword = class;

  TPasswordItem = class(TObject)
  private const
    cDefaultMargin = 7;
    cDefaultMargin_2 = cDefaultMargin*2;
  private
    [Weak] FOwner: TFMXGesturePassword;
    FSelected: Boolean;
    FIndex:Integer;
    FLocalRect: TRectF;
    FCliRect:TRectF;
    FPointRect: TRectF;
    procedure Render(const Canvas: TCanvas);
    procedure SetLocalRect(const Value: TRectF);
    procedure SetSelected(const Value: Boolean);
  public
    constructor Create(AOwner: TFMXGesturePassword);
    function IsContains(APoint: TPointF): Boolean;
    property Selected: Boolean read FSelected write SetSelected;
    property LocalRect: TRectF read FLocalRect write SetLocalRect;
    property Index:Integer read FIndex write FIndex;
  end;

  TGesturePasswordMultiResBitmap = class (TFixedMultiResBitmap)
  private
    [Weak] FControl: TFMXGesturePassword;
  protected
    procedure Update(Item: TCollectionItem); override;
    function GetDefaultSize: TSize; override;
  end;

  [ComponentPlatformsAttribute(TFMXPlatforms)]
  TFMXGesturePassword = class(TControl)
  private const
    cDefaultPadding = 10;
  private
    FScreenScale: Single;
    FCurrentScale: Single;
    FLeastCount:Integer;
    FLineWidth:Integer;
    FLineColor:TAlphaColor;
    FOnEnterCompleteEvent:TOnEnterCompleteEvent;
    FPassword:String;
    FIsDown: Boolean;
    FCanDrawNowPoint: Boolean;
    FNowPoint: TPointF;
    FSelectedItem: TList<TPasswordItem>;
    FItems: TObjectList<TPasswordItem>;
    FColumnCount: Integer;
    FRowCount: Integer;
    FBackground: TFixedMultiResBitmap;
    FPoint: TFixedMultiResBitmap;
    FCircle:TFixedMultiResBitmap;
    [weak] FBackgroundBitmap: TBitmap;
    [weak] FCircleBitmap: TBitmap;
    [weak] FPointBitmap: TBitmap;
    FButtonSize: Single;
    FCircleStroke1: TStrokeBrush;
    FCircleStroke2: TStrokeBrush;
    FButtonBrush: TBrush;
    procedure SetColumnCount(const Value: Integer);
    procedure SetRowCount(const Value: Integer);
    procedure DoResetItemCount;
    function GetTileSize: TSizeF; overload;
    function GetButtonRect(ASize: TSizeF; AIndex: Integer): TRectF;
    procedure DoSelectedItem(APoint: TPointF);
    procedure DoGetPassWord;
    procedure FillItems;
    procedure FillLines;
    function FindItemByPoint(Point: TPointF): TPasswordItem;
    function GetPassword: String;
    procedure SetBackground(const Value: TFixedMultiResBitmap);
    procedure SetCircle(const Value: TFixedMultiResBitmap);
    procedure SetPoint(const Value: TFixedMultiResBitmap);
    function CreateMultiResBitmap: TFixedMultiResBitmap;
    function PointStored: Boolean;
    function CircleStored: Boolean;
    function BackgroundStored: Boolean;
    function MultiResBitmapStored(ABitmap: TFixedMultiResBitmap): Boolean;
    procedure UpdateCurrentBitmap;
    procedure SetButtonSize(const Value: Single);
  protected
    procedure DoChanged;
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
    property Password: String read GetPassword;
  published
    property Align;
    property Anchors;
    property Margins;
    property ButtonSize: Single read FButtonSize write SetButtonSize;
    property ColumnCount: Integer read FColumnCount write SetColumnCount;
    property RowCount: Integer read FRowCount write SetRowCount;
    property Background: TFixedMultiResBitmap read FBackground write SetBackground;
    property Point: TFixedMultiResBitmap read FPoint write SetPoint  stored PointStored;
    property Circle: TFixedMultiResBitmap read FCircle write SetCircle;
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

function TPasswordItem.IsContains(APoint: TPointF): Boolean;
begin
  Result := LocalRect.CenterPoint.Distance(APoint) < (LocalRect.Height / 2)
end;

procedure TPasswordItem.Render(const Canvas: TCanvas);
var
  R: TRectF;
begin;
  if FSelected then
  begin
    //画背景
    if FOwner.FBackgroundBitmap<>nil then
    begin
    Canvas.DrawBitmap(FOwner.FBackgroundBitmap,
      TRectF.Create(0,0,FOwner.FBackgroundBitmap.Width, FOwner.FBackgroundBitmap.Height),
      FLocalRect, 1
    )
    end
    else
    begin
      R := FLocalRect;
      R.Inflate(-2,-2);
      Canvas.DrawEllipse(R, 1, FOwner.FCircleStroke2);
      Canvas.FillEllipse(FLocalRect, 1, FOwner.FButtonBrush);
      R := TRectF.Create(0,0,26,26);
      R := R.CenterAt(FLocalRect);
      Canvas.FillEllipse(R, 1, FOwner.FCircleStroke2);
    end;
    //画圆点
//    if FPoint<>nil then
//    begin
//      Canvas.Fill.Bitmap.Bitmap.Assign(FPoint);
//      Canvas.FillRect(FPointRect, 0, 0, AllCorners, 1, Canvas.Fill,
//        TCornerType.Round);
//    end;
  end
  else
  begin
     //画圈
    if Assigned(FOwner.FCircleBitmap) then
    begin
      Canvas.DrawBitmap(FOwner.FCircleBitmap,
        TRectF.Create(0,0,FOwner.FCircleBitmap.Width, FOwner.FCircleBitmap.Height),
        FLocalRect, 1
      );
    end
    else
    begin
      Canvas.DrawEllipse(FLocalRect, 1, FOwner.FCircleStroke1);
    end;
  end;
end;

procedure TPasswordItem.SetLocalRect(const Value: TRectF);
begin
  FLocalRect := Value;

//  FCliRect:= FLocalRect;
//  FCliRect.Offset(cDefaultMargin , cDefaultMargin);
//  FCliRect.Width:=FCliRect.Width - 2*cDefaultMargin;
//  FCliRect.Height:=FCliRect.Height - 2*cDefaultMargin;
//
//  FPointRect:= FCliRect;
//  FPointRect.Offset(-cDefaultMargin_2, -cDefaultMargin_2);
//  FPointRect.Width:=FPointRect.Width + 2*cDefaultMargin_2;
//  FPointRect.Height:=FPointRect.Height + 2*cDefaultMargin_2;
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

function TFMXGesturePassword.CreateMultiResBitmap: TFixedMultiResBitmap;
begin
  Result := TGesturePasswordMultiResBitmap.Create(Self, TFixedBitmapItem);
end;

function TFMXGesturePassword.BackgroundStored: Boolean;
begin
  Result := MultiResBitmapStored(FBackground);
end;

function TFMXGesturePassword.CircleStored: Boolean;
begin
  Result := MultiResBitmapStored(FCircle);
end;

constructor TFMXGesturePassword.Create(AOwner: TComponent);
begin
  inherited;
  FCircleStroke1 := TStrokeBrush.Create(TBrushKind.Solid, TAlphaColors.Gray);
  FCircleStroke1.Thickness := 2;
  FCircleStroke2 := TStrokeBrush.Create(TBrushKind.Solid, $FF00A0E5);
  FCircleStroke2.Thickness := 2;
  FButtonBrush := TStrokeBrush.Create(TBrushKind.Solid, $80C0E8F9);

  FCanDrawNowPoint := False;
  FSelectedItem := TList<TPasswordItem>.Create;
  FItems := TObjectList<TPasswordItem>.Create;
  FLeastCount := 3;
  FColumnCount := 3;
  FRowCount := 3;
  FLineColor := TAlphaColors.Slateblue;
  FLineWidth := 15;

  FBackground := CreateMultiResBitmap;
  FCircle := CreateMultiResBitmap;
  FPoint := CreateMultiResBitmap;

  FButtonSize := 74;
  DoResetItemCount;
end;

destructor TFMXGesturePassword.Destroy;
begin
  FPoint.Free;
  FCircle.Free;
  FBackground.Free;

  FItems.Free;
  FButtonBrush.Free;
  FCircleStroke2.Free;
  FCircleStroke1.Free;
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

function TFMXGesturePassword.MultiResBitmapStored(
  ABitmap: TFixedMultiResBitmap): Boolean;
var
  I: Integer;
begin
  Result := (ABitmap.TransparentColor <> TColors.SysNone) or
            (ABitmap.SizeKind <> TSizeKind.Custom) or
            (ABitmap.Width <> ABitmap.DefaultSize.cx) or
            (ABitmap.Height <> ABitmap.DefaultSize.cy);
  if not Result then
    for I := 0 to ABitmap.Count - 1 do
      if (ABitmap[I].FileName <> '') or
         (not ABitmap[I].IsEmpty) then
      begin
        Result := True;
        Exit;
      end;
end;

procedure TFMXGesturePassword.DoChanged;
begin
  Repaint;
  UpdateEffects;
end;

procedure TFMXGesturePassword.DoGetPassword;
var
  i: Integer;
begin
  if FIsDown then
  begin
    FIsDown := False;
    FPassword := '';
    if FSelectedItem.Count >= LeastCount then
    begin
      for i := 0 to FSelectedItem.Count - 1 do
      begin
        FPassword := FPassword + InttoStr(FSelectedItem[i].Index);
      end;
    end;
    for i := 0 to FSelectedItem.Count - 1 do
      FSelectedItem[i].Selected := False;
    FSelectedItem.Clear;
    if Assigned(FOnEnterCompleteEvent) then
      FOnEnterCompleteEvent(Self, FPassword);
  end;
end;

procedure TFMXGesturePassword.DoResetItemCount;
var
  i, ItemCount: Integer;
  sz: TSizeF;
  Item: TPasswordItem;
begin
  if (FRowCount <> 0) and (FColumnCount <> 0) then
  begin
    ItemCount := FRowCount * FColumnCount;
    // 重置Item个数 和位置
    FItems.Clear;
    for i := 0 to ItemCount - 1 do
    begin
      Item := TPasswordItem.Create(Self);
      Item.Index:=i;
      Item.Selected := False;
      sz := GetTileSize;
      Item.LocalRect := GetButtonRect(sz, i);
      FItems.Add(Item);
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
    if FItems[i].IsContains(Point) then
    begin
      Result := FItems[i];
      Break;
    end;
  end;
end;

function TFMXGesturePassword.GetButtonRect(ASize: TSizeF; AIndex: Integer): TRectF;
var
  ARect: TRectF;
begin
  ARect.Left := Margins.Left + ASize.Width * (AIndex mod FColumnCount);
  ARect.Top := Margins.Top + ASize.Height * (AIndex div FColumnCount);
  ARect.Width := ASize.Width;
  ARect.Height := ASize.Height;
  Result := TRectF.Create(0, 0, ButtonSize, ButtonSize);
  Result := Result.CenterAt(ARect);
end;

function TFMXGesturePassword.GetPassWord: String;
begin
  Result := FPassword;
  // 获取了 清空
  FPassword := '';
end;

procedure TFMXGesturePassword.MouseMove(Shift: TShiftState; X, Y: Single);
begin
  if FIsDown then
    DoSelectedItem(TPointF.Create(X, Y));
end;

procedure TFMXGesturePassword.Paint;
var
  R: TRectF;
begin
  if (csDesigning in ComponentState) and not Locked and not FInPaintTo then
  begin
    R := LocalRect;
    InflateRect(R, -0.5, -0.5);
    Canvas.DrawDashRect(R, 0, 0, AllCorners, AbsoluteOpacity, $A0909090);
  end;

  UpdateCurrentBitmap;
  // 画线
  if FIsDown then
    FillLines;
  FillItems;
end;

function TFMXGesturePassword.PointStored: Boolean;
begin
  Result := MultiResBitmapStored(FPoint);
end;

procedure TFMXGesturePassword.Resize;
var
  i: Integer;
  sz: TSizeF;
begin
  inherited;
  for i := 0 to FItems.Count - 1 do
  begin
    sz := GetTileSize;
    FItems[i].LocalRect := GetButtonRect(sz, i);
  end;
end;

function TFMXGesturePassword.GetTileSize: TSizeF;
begin
  Result := TSizeF.Create(
    (Width - Margins.Left - Margins.Right) / FRowCount,
    (Height - Margins.Top - Margins.Bottom) / FColumnCount);
end;

procedure TFMXGesturePassword.SetBackground(const Value: TFixedMultiResBitmap);
begin
  FBackground.Assign(Value);
end;

procedure TFMXGesturePassword.SetButtonSize(const Value: Single);
begin
  if FButtonSize <> Value then
  begin
    FButtonSize := Value;
    Repaint;
  end;
end;

procedure TFMXGesturePassword.SetCircle(const Value: TFixedMultiResBitmap);
begin
  FCircle.Assign(Value);
end;

procedure TFMXGesturePassword.SetColumnCount(const Value: Integer);
begin
  if FColumnCount <> Value then
  begin
    FColumnCount := Value;
    DoResetItemCount;
  end;
end;

procedure TFMXGesturePassword.SetPoint(const Value: TFixedMultiResBitmap);
begin
  FPoint.Assign(Value);
end;

procedure TFMXGesturePassword.SetRowCount(const Value: Integer);
begin
  if FRowCount <> Value then
  begin
    FRowCount := Value;
    DoResetItemCount;
  end;
end;

procedure TFMXGesturePassword.UpdateCurrentBitmap;
begin

end;

{ TGesturePasswordMultiResBitmap }

function TGesturePasswordMultiResBitmap.GetDefaultSize: TSize;
begin
  if FControl = nil then
  begin
    if Owner is TFMXGesturePassword then
      FControl := TFMXGesturePassword(Owner);
  end;
  if FControl <> nil then
  begin
    Result.cx := Round(FControl.ButtonSize);
    Result.cy := Round(FControl.ButtonSize);
  end
  else
    Result := inherited GetDefaultSize;
end;

procedure TGesturePasswordMultiResBitmap.Update(Item: TCollectionItem);
begin
  inherited;
  if FControl = nil then
  begin
    if Owner is TFMXGesturePassword then
      FControl := TFMXGesturePassword(Owner);
  end;
  if (FControl <> nil) and ([csLoading, csDestroying] * FControl.ComponentState = []) then
  begin
    if Item = nil then
      FControl.DoChanged
    else
    begin
      if (TCustomBitmapItem(Item).Scale = FControl.FCurrentScale) then
        FControl.DoChanged
      else
      begin
        FControl.UpdateCurrentBitmap;
        if (TCustomBitmapItem(Item).Scale = FControl.FCurrentScale) then
          FControl.DoChanged
      end;
    end;
  end;
end;

end.

