// ***************************************************************************
//
// FMXComponents: Firemonkey Opensource Components Set
//
// CalendarControl is a calendar component like iOS style, it uses
// listview component internally
//
// This component come from xubzhlin's FMX-UI-Controls, collect and
// arrange by the author's agreement
// The original project at: https://github.com/xubzhlin/FMX-UI-Controls
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
// version history
// 2017-09-11, v0.1.0.0 :
//    first release
//    rename component to TFMXCalendarControl
//    add  properties Align, Anchors, ClipChildren, ClipParent, Cursor
//                    DragMode, EnableDragHighlight, Enabled, Height, HitTest
//                    Locked, Padding, Opacity, Margins, PopupMenu, Position
//                    RotationAngle, RotationCenter, Scale, Size, Visible, Width
//    fixed FWeekLayout and FCalenderView stored problem
// 2017-09-11, v0.2.0.0 :
//    add lunar date option
// 2017-09-11, v0.3.0.0 :
//    fixed the bug when EndDate's month is December
//    add set month names method

unit FMX.CalendarControl;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.DateUtils,
  FMX.Platform,
  FMX.Controls,
  FMX.Layouts,
  FMX.Types,
  FMX.Calendar,
  FMX.ListView,
  FMX.ListView.Types,
  FMX.CalendarItemAppearance,
  FMX.ComponentsCommon;

type
  TMonthNames = array [1..12] of string;

const
  TWeeks: array [0 .. 6] of string = ('日', '一', '二', '三', '四',
    '五', '六');
  TCnMonths: TMonthNames = ('一月', '二月', '三月', '四月', '五月', '六月',
    '七月', '八月', '九月', '十月', '十一月', '十二月');
  TEnMonths: TMonthNames = (
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  );
type
  TWeekLayout = class(TControl)
  private
    procedure DoDrawDay(LocRect:TRectF; AIndex:Integer);
  protected
    procedure Paint; override;
  end;

  [ComponentPlatformsAttribute(TFMXPlatforms)]
  TFMXCalendarControl = class(TControl)
  private
    FFirstDayOfWeekNum:Integer;
    FWeekLayout:TWeekLayout;
    FCalenderView:TCalenderView;

    FSelectedItem:TClendarDayItem;
    FIsClickDayItem:Boolean;
    FAtPoint:TPointF;
    FOnGetItemIsMark:TOnGetItemIsMark;
    FOnSelectedItem:TNotifyEvent;

    FNeedFillDays:Boolean;
    FStartDate: TDate;
    FEndDate: TDate;
    FIsShowLunarDate: Boolean;
    FMonthNames: array [1..12] of string;

    procedure SetSelectedDate(const Value: TDate);
    function DefineItemIndexOfFirstDayInMonth(ADate:TDate):Integer;
    procedure FillDays;
    procedure DoCalenderViewMouseDown(Sender:TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure DoCalenderViewMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure DoCalenderViewItemClickEx(const Sender: TObject; ItemIndex: Integer; const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure DoGetItemIsMark(ADayItem:TClendarDayItem; var AIsMark:Boolean);
    function GetSelectedDate: TDate;
    procedure SetEndDate(const Value: TDate);
    procedure SetStartDate(const Value: TDate);
    procedure SetIsShowLunarDate(const Value: Boolean);
    procedure SetFirstDayOfWeekNum(const Value: Integer);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure SetMonthNames(const Names: TMonthNames; IsRepaint: Boolean = True);
  published
    property Align;
    property Anchors;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled default True;
    property Height;
    property HitTest default True;
    property Locked default False;
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
    property StartDate:TDate read FStartDate write SetStartDate;
    property EndDate:TDate read FEndDate write SetEndDate;
    property FirstDayOfWeek:Integer read FFirstDayOfWeekNum write SetFirstDayOfWeekNum;
    property SelectedDate:TDate read GetSelectedDate write SetSelectedDate;
    property IsShowLunarDate: Boolean read FIsShowLunarDate write SetIsShowLunarDate default true;
    property OnGetItemIsMark:TOnGetItemIsMark read FOnGetItemIsMark write FOnGetItemIsMark;
    property OnSelectedItem:TNotifyEvent read FOnSelectedItem write FOnSelectedItem;
  end;

implementation

{ TWeekLayout }

procedure TWeekLayout.DoDrawDay(LocRect: TRectF; AIndex: Integer);
begin
  Canvas.Fill.Color:=$FF000000;
  Canvas.FillText(LocRect, TWeeks[AIndex], False , 1, [], TTextAlign.Center, TTextAlign.Center);
end;

procedure TWeekLayout.Paint;
var
  i: Integer;
  ARect:TRectF;
  OffSetX:Single;
begin
  OffSetX:=ClipRect.Width / 7;
  ARect.Top:=ClipRect.Top;
  ARect.Left:=ClipRect.Left;
  ARect.Height:=ClipRect.Height;
  ARect.Width:= OffSetX;
  for i := 0 to 6 do
  begin
    DoDrawDay(ARect, i);
    ARect.Offset(OffSetX, 0);
  end;
end;

{ TCalendarControl }

constructor TFMXCalendarControl.Create(AOwner: TComponent);
var
  LocaleService:IFMXLocaleService;
begin
  inherited;
  SetMonthNames(TCnMonths, False);
  //默认 最近两个月
  FStartDate := Now;
  FEndDate := IncMonth(Now, 1);

  FSelectedItem := nil;

  if TPlatformServices.Current.SupportsPlatformService(IFMXLocaleService, LocaleService) then
    FFirstDayOfWeekNum := LocaleService.GetFirstWeekday
  else
    FFirstDayOfWeekNum := DayMonday;

  FWeekLayout := TWeekLayout.Create(Self);
  FWeekLayout.Height := 28;
  FWeekLayout.Stored := False;
  FWeekLayout.Align := TAlignLayout.Top;
  FWeekLayout.Parent := Self;

  FCalenderView := TCalenderView.Create(Self);
  FCalenderView.Stored := False;
  FCalenderView.Align := TAlignLayout.Client;
  FCalenderView.OnMouseDown := DoCalenderViewMouseDown;
  FCalenderView.OnMouseMove := DoCalenderViewMouseMove;
  FCalenderView.OnItemClickEx := DoCalenderViewItemClickEx;
  FCalenderView.OnGetItemIsMark := DoGetItemIsMark;
  FCalenderView.ItemAppearanceName := 'ClendarDayListItem';
  FCalenderView.CanSwipeDelete := False;
  FCalenderView.ShowSelection := False;
  FCalenderView.Parent := Self;

  FWeekLayout.Margins.Left := FCalenderView.ItemSpaces.Left;
  FWeekLayout.Margins.Right := FCalenderView.ItemSpaces.Right;

  FNeedFillDays:=True;
end;

function TFMXCalendarControl.DefineItemIndexOfFirstDayInMonth(ADate:TDate): Integer;
var
  Interval: Integer;
  BeginDate: TDateTime;
begin
  Interval := DaysPerWeek - FFirstDayOfWeekNum;
  BeginDate := RecodeDay(ADate, 1);
  Result := (Interval + DayOfTheWeek(BeginDate)) mod DaysPerWeek;
end;

procedure TFMXCalendarControl.DoCalenderViewItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  if FIsClickDayItem and (ItemObject is TClendarDayItem) then
  begin
    if TClendarDayItem(ItemObject).Day = 0 then exit;
    if FSelectedItem <> nil then
      FSelectedItem.IsSelected := False;
    FSelectedItem := TClendarDayItem(ItemObject);
    FSelectedItem.IsSelected := True;
    if Assigned(FOnSelectedItem) then
      FOnSelectedItem(FSelectedItem);
  end;
end;

procedure TFMXCalendarControl.DoCalenderViewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  FIsClickDayItem := True;
  FAtPoint := TPointF.Create(X, Y);
end;

procedure TFMXCalendarControl.DoCalenderViewMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Single);
begin
  if FIsClickDayItem then
  begin
    // 偏移了10 认为不是点击
    if (Abs(FAtPoint.X - X) > 10) or (Abs(FAtPoint.Y - Y) > 10) then
      FIsClickDayItem := False;
  end;
end;

procedure TFMXCalendarControl.DoGetItemIsMark(ADayItem: TClendarDayItem; var AIsMark: Boolean);
begin
  if Assigned(FOnGetItemIsMark) then
    FOnGetItemIsMark(ADayItem, AIsMark);
end;

procedure TFMXCalendarControl.FillDays;
var
  FDate, LastDate: TDate;
  First: Word;
  Year: Word;
  ItemIndex, NewIndex:Integer;
  AItem:TClendarWeekListViewItem;
  procedure FillDaysOfMonth(ADate:TDate);
  var
    DaysInMonthTmp: Word;
    Day:Word;
    I: Word;
  begin
    //FillMonth
    ItemIndex := -1;
    DaysInMonthTmp := DaysInMonth(ADate);
    for I := First to First + DaysInMonthTmp - 1 do
    begin
      NewIndex := i div 7;
      if NewIndex > ItemIndex then
      begin
        AItem := TClendarWeekListViewItem(FCalenderView.Items.Add);
        ItemIndex := NewIndex;
      end;
      Day:= I - First + 1;
      case (i+FFirstDayOfWeekNum) mod 7 of
        0: AItem.SunDayItem.Day := Trunc(RecodeDay(ADate, Day));
        1: AItem.MonDayItem.Day := Trunc(RecodeDay(ADate, Day));
        2: AItem.TurDayItem.Day := Trunc(RecodeDay(ADate, Day));
        3: AItem.WedDayItem.Day := Trunc(RecodeDay(ADate, Day));
        4: AItem.ThuDayItem.Day := Trunc(RecodeDay(ADate, Day));
        5: AItem.RuiDayItem.Day := Trunc(RecodeDay(ADate, Day));
        6: AItem.SatDayItem.Day := Trunc(RecodeDay(ADate, Day));
      end;
    end;
  end;
  procedure FillMonth(ADate:TDate);
  var
    AYear:Word;
  begin
    AYear := YearOf(ADate);
    //FillYear
    if (Year = 0) or (AYear <> Year) then
    begin
      Year:=AYear;
      AItem:=TClendarWeekListViewItem(FCalenderView.Items.Add);
      AItem.Height := 28;
      AItem.YearItem.Year := Year;
    end;
    AItem := TClendarWeekListViewItem(FCalenderView.Items.Add);
    AItem.Text := FMonthNames[MonthOf(ADate)];
    First := DefineItemIndexOfFirstDayInMonth(ADate);
//    case (First + FFirstDayOfWeekNum) mod 7 of
//      0: AItem.Objects.TextObject.PlaceOffset.X := AItem.SunDayItem.PlaceOffset.X;
//      1: AItem.Objects.TextObject.PlaceOffset.X := AItem.MonDayItem.PlaceOffset.X;
//      2: AItem.Objects.TextObject.PlaceOffset.X := AItem.TurDayItem.PlaceOffset.X;
//      3: AItem.Objects.TextObject.PlaceOffset.X := AItem.WedDayItem.PlaceOffset.X;
//      4: AItem.Objects.TextObject.PlaceOffset.X := AItem.ThuDayItem.PlaceOffset.X;
//      5: AItem.Objects.TextObject.PlaceOffset.X := AItem.RuiDayItem.PlaceOffset.X;
//      6: AItem.Objects.TextObject.PlaceOffset.X := AItem.SatDayItem.PlaceOffset.X;
//    end;
    FillDaysOfMonth(ADate);
  end;
begin
  FCalenderView.Items.Clear;
  FCalenderView.BeginUpdate;
  try
    Year:=0;
    FDate:=FStartDate;

    while (FDate<EndOfTheMonth(FEndDate)) do
    begin
      FillMonth(FDate);
      FDate := IncMonth(FDate);
    end;
  finally
    FCalenderView.EndUpdate;
  end;
end;

function TFMXCalendarControl.GetSelectedDate: TDate;
begin
  if FSelectedItem = nil then
    Result :=Trunc(Now)
  else
    Result:=FSelectedItem.Day;
end;

procedure TFMXCalendarControl.Paint;
begin
  if FNeedFillDays then
  begin
    FillDays;
    FNeedFillDays := False;
  end;
  inherited;
end;

procedure TFMXCalendarControl.SetEndDate(const Value: TDate);
begin
  if (FEndDate <> Value) and (Value > FStartDate) then
  begin
    FEndDate := Value;
    FNeedFillDays := True;
    Repaint;
  end;
end;

procedure TFMXCalendarControl.SetFirstDayOfWeekNum(const Value: Integer);
begin
  if FFirstDayOfWeekNum <> Value then
  begin
    FFirstDayOfWeekNum := Value;
    FNeedFillDays := True;
    Repaint;
  end;
end;

procedure TFMXCalendarControl.SetSelectedDate(const Value: TDate);
var
  i: Integer;
  AItem: TClendarWeekListViewItem;
  LObject: TClendarDayItem;
  NewDay:Int64;
begin
  LObject:=nil;
  NewDay:=Trunc(Value);
  if (FSelectedItem = nil) or (FSelectedItem.Day <> NewDay) then
  begin
    if FSelectedItem <> nil then
      FSelectedItem.IsSelected := False;
    for i := 0 to FCalenderView.Items.Count - 1 do
    begin
      AItem := TClendarWeekListViewItem(FCalenderView.Items[i]);
      LObject := AItem.FindDayItem(NewDay);
      if LObject <> nil then
      begin
        FSelectedItem := LObject;
        FSelectedItem.IsSelected := True;
        Break;
      end;
    end;
  end;
end;

procedure TFMXCalendarControl.SetIsShowLunarDate(const Value: Boolean);
begin
  if FIsShowLunarDate <> Value then
  begin
    FIsShowLunarDate := Value;
    Repaint;
  end;
end;

procedure TFMXCalendarControl.SetMonthNames(const Names: TMonthNames;
  IsRepaint: Boolean);
var
  I: Integer;
begin
  for I := Low(Names) to High(Names) do
  begin
    FMonthNames[I] := Names[I];
  end;
  if IsRepaint then
  begin
    FNeedFillDays := True;
    Repaint;
  end;
end;

procedure TFMXCalendarControl.SetStartDate(const Value: TDate);
begin
  if (FStartDate <> Value) and (Value < FEndDate) then
  begin
    FStartDate := Value;
    FNeedFillDays := True;
    Repaint;
  end;
end;

end.
