// ***************************************************************************
//
// FMXComponents: Firemonkey Opensource Components Set from China
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
unit FMX.CalendarItemAppearance;

interface

uses
  System.Classes, System.SysUtils, FMX.Types, FMX.Controls, System.UITypes,
  FMX.Objects, FMX.ListView, FMX.Graphics, System.Types, System.Rtti,
  FMX.ListView.Types, FMX.ListView.Appearances, System.DateUtils, System.Math;

type
  TClendarListItemAppearanceNames = class
  public const
    ListItem = 'ClendarDayListItem';
    YearItemName = 'YearItemName';
    SunItemName = 'SunItemName';
    MonItmeName = 'MonItmeName';
    TurItmeName = 'TurItmeName';
    WedItemName = 'WedItemName';
    ThuItemName = 'ThuItemName';
    RuiItemName = 'RuiItemName';
    SatItemName = 'SatItemName';
  end;



  TClendarWeekListViewItem = class;
  TClendarDayItem = class;
  TOnGetItemIsMark = procedure(ADayItem:TClendarDayItem; var AIsMark:Boolean) of object;

  TClendarDayItem = class(TListItemDrawable)
  private
    FOwner:TClendarWeekListViewItem;
    FIsPressed: Boolean;
    FIsSelected: Boolean;
    FDayText:String;
    FDay: Int64;
    FBitMap:TBitMap;
    function GetIsMark: Boolean;
    procedure SetDay(const Value: Int64);
    procedure SetIsPressed(const Value: Boolean);
    procedure SetIsSelected(const Value: Boolean);
    procedure DoDrawBitMap(Canvas: TCanvas);
  public
    procedure Render(const Canvas: TCanvas; const DrawItemIndex: Integer;
      const DrawStates: TListItemDrawStates;
      const Resources: TListItemStyleResources; const Params: TListItemDrawable.TParams;
      const SubPassNo: Integer = 0); override;
    constructor Create(const AOwner: TListItem); override;
    destructor Destroy; override;
  published
    property IsPressed: Boolean read FIsPressed write SetIsPressed;
    property IsSelected: Boolean read FIsSelected write SetIsSelected;
    property Day: Int64 read FDay write SetDay;
  end;

  TClendarDayObjectAppearance = class(TCommonObjectAppearance)
  protected
    procedure AssignTo(ADest: TPersistent); override;
  public
    procedure CreateObject(const AListViewItem: TListViewItem); override;
    procedure ResetObject(const AListViewItem: TListViewItem); override;
  end;

  TClendarYearItem = class(TListItemDrawable)
  private
    FYear:Word;
    FYearText:String;
    procedure SetYear(const Value: Word);
  public
    procedure Render(const Canvas: TCanvas; const DrawItemIndex: Integer;
      const DrawStates: TListItemDrawStates;
      const Resources: TListItemStyleResources; const Params: TListItemDrawable.TParams;
      const SubPassNo: Integer = 0); override;
  published
    property Year:Word read FYear write SetYear;
  end;

  TClendarYearObjectAppearance = class(TCommonObjectAppearance)
  protected
    procedure AssignTo(ADest: TPersistent); override;
  public
    procedure CreateObject(const AListViewItem: TListViewItem); override;
    procedure ResetObject(const AListViewItem: TListViewItem); override;
  end;

  TClendarWeekListViewItem = class(TListViewItem)
  private
    function GetClendarDayItem(AName: String): TClendarDayItem;
    function GetSunDayItem:TClendarDayItem;
    function GetMonDayItem:TClendarDayItem;
    function GetTurDayItem:TClendarDayItem;
    function GetWedDayItem:TClendarDayItem;
    function GetThuDayItem:TClendarDayItem;
    function GetRuiDayItem:TClendarDayItem;
    function GetSatDayItem:TClendarDayItem;
    function GetYearItem: TClendarYearItem;
  public
    function FindDayItem(ADate:Int64):TClendarDayItem;
    function GetIsMark(ADayItem:TClendarDayItem):Boolean;
  published
    property YearItem:TClendarYearItem read GetYearItem;
    property SunDayItem:TClendarDayItem read GetSunDayItem;
    property MonDayItem:TClendarDayItem read GetMonDayItem;
    property TurDayItem:TClendarDayItem read GetTurDayItem;
    property WedDayItem:TClendarDayItem read GetWedDayItem;
    property ThuDayItem:TClendarDayItem read GetThuDayItem;
    property RuiDayItem:TClendarDayItem read GetRuiDayItem;
    property SatDayItem:TClendarDayItem read GetSatDayItem;
  end;

  TCalenderView = class(TListView)
  private
    FOnGetItemIsMark:TOnGetItemIsMark;
  protected
    procedure ApplyStyle; override;
    function GetDefaultStyleLookupName: string; override;
  published
    property OnGetItemIsMark:TOnGetItemIsMark read FOnGetItemIsMark write FOnGetItemIsMark;
  end;

implementation

type
  TClendarDayListItemAppearance = class(TPresetItemObjects)
  public const
    cDefaultHeight = 50;
  private
    FYear: TClendarYearObjectAppearance;
    FSunDay: TClendarDayObjectAppearance;
    FMonDay: TClendarDayObjectAppearance;
    FTurDay: TClendarDayObjectAppearance;
    FWedDay: TClendarDayObjectAppearance;
    FThuDay: TClendarDayObjectAppearance;
    FRuiDay: TClendarDayObjectAppearance;
    FSatDay: TClendarDayObjectAppearance;
    procedure SetMonDay(const Value: TClendarDayObjectAppearance);
    procedure SetRuiDay(const Value: TClendarDayObjectAppearance);
    procedure SetSatDay(const Value: TClendarDayObjectAppearance);
    procedure SetSunDay(const Value: TClendarDayObjectAppearance);
    procedure SetThuDay(const Value: TClendarDayObjectAppearance);
    procedure SetTurDay(const Value: TClendarDayObjectAppearance);
    procedure SetWedDay(const Value: TClendarDayObjectAppearance);

    function CreateClendarDayObject(AName: String): TClendarDayObjectAppearance;
    procedure SetYear(const Value: TClendarYearObjectAppearance);
  protected
    function DefaultHeight: Integer; override;
    procedure UpdateSizes(const ItemSize: TSizeF); override;
    function GetGroupClass: TPresetItemObjects.TGroupClass; override;
  public
    constructor Create(const Owner: TControl); override;
    destructor Destroy; override;
  published
    property Year: TClendarYearObjectAppearance read FYear write SetYear;
    property SunDay: TClendarDayObjectAppearance read FSunDay write SetSunDay;
    property MonDay: TClendarDayObjectAppearance read FMonDay write SetMonDay;
    property TurDay: TClendarDayObjectAppearance read FTurDay write SetTurDay;
    property WedDay: TClendarDayObjectAppearance read FWedDay write SetWedDay;
    property ThuDay: TClendarDayObjectAppearance read FThuDay write SetThuDay;
    property RuiDay: TClendarDayObjectAppearance read FRuiDay write SetRuiDay;
    property SatDay: TClendarDayObjectAppearance read FSatDay write SetSatDay;
  end;

  { TClendarDayItem }

constructor TClendarDayItem.Create(const AOwner: TListItem);
begin
  inherited;
  FOwner:=TClendarWeekListViewItem(AOwner);
  FIsPressed := False;
  FIsSelected := False;
  FDay := 0;
end;

destructor TClendarDayItem.Destroy;
begin
  FBitMap.Free;
  FBitMap:=nil;
  inherited;
end;

procedure TClendarDayItem.DoDrawBitMap(Canvas: TCanvas);
var
  AtPoint1,AtPoint2:TPointF;
  Scale:Single;
begin
  if FBitMap=nil then
  begin
    Scale:=Canvas.Scale;
    FBitMap:=TBitMap.Create(Trunc(LocalRect.Width*Scale),Trunc(LocalRect.Height*Scale));
    FBitMap.Clear(0);
    AtPoint1:=TPointF.Create(0, 1);
    AtPoint2:=TPointF.Create(FBitMap.Width, 1);

    FBitMap.Canvas.BeginScene(nil);
    FBitMap.Canvas.Stroke.Kind:=TBrushKind.Solid;
    FBitMap.Canvas.Stroke.Color:= TAlphaColors.Cadetblue;
    FBitMap.Canvas.Stroke.Thickness:=1;
    FBitMap.Canvas.DrawLine(AtPoint1, AtPoint2, 1);
    FBitMap.Canvas.EndScene;
  end;
  Canvas.DrawBitmap(FBitMap, RectF(0, 0, FBitMap.Width, FBitMap.Height), LocalRect, 1, True);
end;

function TClendarDayItem.GetIsMark: Boolean;
begin
  Result:=False;
  if FOwner<>nil then
    Result:=FOwner.GetIsMark(Self);
end;

procedure TClendarDayItem.Render(const Canvas: TCanvas;
  const DrawItemIndex: Integer; const DrawStates: TListItemDrawStates;
  const Resources: TListItemStyleResources; const Params: TListItemDrawable.TParams;
  const SubPassNo: Integer);
var
  ARect:TRectF;
  TextColor, BackColor: TAlphaColor;
  AIsMark: Single;
  CenterX:Single;
  isNow, isMark:Boolean;
begin
  if (SubPassNo <> 0) or (FDay = 0) then
    Exit;
  DoDrawBitMap(Canvas);
  //Draw Background
  isNow:=False;

  if FDay < Trunc(Now) then
    TextColor:=TAlphaColors.Gainsboro
  else
  if FDay = Trunc(Now) then
  begin
    isNow:=True;
    TextColor:=TAlphaColors.White;
    BackColor:=TAlphaColors.Red;
  end
  else
    TextColor:=TAlphaColors.Black;

  if FIsSelected then
  begin
    TextColor:=TAlphaColors.White;
    BackColor := TAlphaColors.Blue;
  end;

  CenterX:=LocalRect.CenterPoint.X;
  ARect:=TRectF.Create(0, 0 , 32, 32);
  ARect.Offset(CenterX - 16, LocalRect.Top + 2);
  if isNow or FIsSelected then
  begin
    Canvas.Fill.Color:=BackColor;
    Canvas.FillRect(ARect, 16, 16, AllCorners, 1, TCornerType.Round);
  end;
  Canvas.Fill.Color:=TextColor;
  Canvas.FillText(ARect, FDayText, False, 1, [], TTextAlign.Center, TTextAlign.Center);


  //±ê¼Ç
  if GetIsMark then
  begin
    Canvas.Fill.Color:=TAlphaColors.Gainsboro;
    ARect:=TRectF.Create(0, 0 , 6, 6);
    ARect.Offset(CenterX - 3, LocalRect.Top + 40);
    Canvas.FillRect(ARect, 3, 3, AllCorners, 1, TCornerType.Round);
  end;

end;

procedure TClendarDayItem.SetIsPressed(const Value: Boolean);
begin
  if FIsPressed<>Value then
  begin
    FIsPressed := Value;
    Invalidate;
  end;
end;

procedure TClendarDayItem.SetIsSelected(const Value: Boolean);
begin
  if FIsSelected<>Value then
  begin
    FIsSelected := Value;
    Invalidate;
  end;

end;

procedure TClendarDayItem.SetDay(const Value: Int64);
begin
  if FDay<>Value then
  begin
    FDay := Value;
    FDayText:=InttoStr(DayOf(FDay));
    Invalidate;
  end;
end;

{ TClendarDayObjectAppearance }

procedure TClendarDayObjectAppearance.AssignTo(ADest: TPersistent);
var
  DstDrawable: TClendarDayItem;
  DstAppearance: TClendarDayObjectAppearance;
begin
  inherited;
end;

procedure TClendarDayObjectAppearance.CreateObject(const AListViewItem
  : TListViewItem);
var
  LItem: TClendarDayItem;
begin
  LItem := TClendarDayItem.Create(AListViewItem);
  LItem.BeginUpdate;
  try
    LItem.Name := Name;
    LItem.Assign(Self);
  finally
    LItem.EndUpdate;
  end;
end;

procedure TClendarDayObjectAppearance.ResetObject(const AListViewItem
  : TListViewItem);
begin
  ResetObjectT<TClendarDayItem>(AListViewItem);
end;

{ TClendarDayListItemAppearance }

constructor TClendarDayListItemAppearance.Create(const Owner: TControl);
begin
  inherited;
  Text.Visible := True;
  Text.Width := 0;
  Text.Height := 0;
  Text.TextAlign := TTextAlign.Leading;
  Text.TextVertAlign := TTextAlign.Center;
  Text.Font.Size:=20;
  Text.TextColor:=TAlphaColors.Cadetblue;

  FYear := TClendarYearObjectAppearance.Create;
  FYear.Owner := Self;
  FYear.Visible := True;
  FYear.Name := TClendarListItemAppearanceNames.YearItemName;
  FYear.DataMembers := TObjectAppearance.TDataMembers.Create
    (TObjectAppearance.TDataMember.Create(TClendarListItemAppearanceNames.YearItemName, Format('Data["%s"]',
    [TClendarListItemAppearanceNames.YearItemName])));
  FYear.Width := 0;
  FYear.Height := 0;

  FSunDay := CreateClendarDayObject
    (TClendarListItemAppearanceNames.SunItemName);
  FMonDay := CreateClendarDayObject
    (TClendarListItemAppearanceNames.MonItmeName);
  FTurDay := CreateClendarDayObject
    (TClendarListItemAppearanceNames.TurItmeName);
  FWedDay := CreateClendarDayObject
    (TClendarListItemAppearanceNames.WedItemName);
  FThuDay := CreateClendarDayObject
    (TClendarListItemAppearanceNames.ThuItemName);
  FRuiDay := CreateClendarDayObject
    (TClendarListItemAppearanceNames.RuiItemName);
  FSatDay := CreateClendarDayObject
    (TClendarListItemAppearanceNames.SatItemName);

  AddObject(FSunDay, True);
  AddObject(FMonDay, True);
  AddObject(FTurDay, True);
  AddObject(FWedDay, True);
  AddObject(FThuDay, True);
  AddObject(FRuiDay, True);
  AddObject(FSatDay, True);
  AddObject(Text, True);
  AddObject(FYear, True);
  AddObject(GlyphButton, IsItemEdit);
end;

function TClendarDayListItemAppearance.CreateClendarDayObject(AName: String)
  : TClendarDayObjectAppearance;
begin
  Result := TClendarDayObjectAppearance.Create;
  Result.Owner := Self;
  Result.Visible := True;
  Result.Name := AName;
  Result.DataMembers := TObjectAppearance.TDataMembers.Create
    (TObjectAppearance.TDataMember.Create(AName, Format('Data["%s"]',
    [AName])));
  Result.Align := TListItemAlign.Leading;
end;

function TClendarDayListItemAppearance.DefaultHeight: Integer;
begin
  Result := cDefaultHeight;
end;

destructor TClendarDayListItemAppearance.Destroy;
begin
  FSunDay.Free;
  FMonDay.Free;
  FTurDay.Free;
  FWedDay.Free;
  FThuDay.Free;
  FRuiDay.Free;
  FSatDay.Free;
  inherited;
end;

function TClendarDayListItemAppearance.GetGroupClass
  : TPresetItemObjects.TGroupClass;
begin
  Result := TClendarDayListItemAppearance;
end;

procedure TClendarDayListItemAppearance.SetMonDay
  (const Value: TClendarDayObjectAppearance);
begin
  FMonDay.AssignTo(Value);
end;

procedure TClendarDayListItemAppearance.SetRuiDay
  (const Value: TClendarDayObjectAppearance);
begin
  FRuiDay.AssignTo(Value);
end;

procedure TClendarDayListItemAppearance.SetSatDay
  (const Value: TClendarDayObjectAppearance);
begin
  FSatDay.AssignTo(Value);
end;

procedure TClendarDayListItemAppearance.SetSunDay
  (const Value: TClendarDayObjectAppearance);
begin
  FSunDay.AssignTo(Value);
end;

procedure TClendarDayListItemAppearance.SetThuDay
  (const Value: TClendarDayObjectAppearance);
begin
  FThuDay.AssignTo(Value);
end;

procedure TClendarDayListItemAppearance.SetTurDay
  (const Value: TClendarDayObjectAppearance);
begin
  FTurDay.AssignTo(Value);
end;

procedure TClendarDayListItemAppearance.SetWedDay
  (const Value: TClendarDayObjectAppearance);
begin
  FWedDay.AssignTo(Value);
end;

procedure TClendarDayListItemAppearance.SetYear(
  const Value: TClendarYearObjectAppearance);
begin
  FYear.AssignTo(Value);
end;

procedure TClendarDayListItemAppearance.UpdateSizes(const ItemSize: TSizeF);
var
  LObjectWidth: Single;
begin
  try
    BeginUpdate;
    inherited;
    LObjectWidth := Trunc(ItemSize.Width / 7);

    FSunDay.Width := LObjectWidth;
    FMonDay.Width := LObjectWidth;
    FTurDay.Width := LObjectWidth;
    FWedDay.Width := LObjectWidth;
    FThuDay.Width := LObjectWidth;
    FRuiDay.Width := LObjectWidth;
    FSatDay.Width := LObjectWidth;

    FSunDay.PlaceOffset.X := 0;
    FMonDay.PlaceOffset.X := LObjectWidth;
    FTurDay.PlaceOffset.X := LObjectWidth + FMonDay.PlaceOffset.X;
    FWedDay.PlaceOffset.X := LObjectWidth + FTurDay.PlaceOffset.X;
    FThuDay.PlaceOffset.X := LObjectWidth + FWedDay.PlaceOffset.X;
    FRuiDay.PlaceOffset.X := LObjectWidth + FThuDay.PlaceOffset.X;
    FSatDay.PlaceOffset.X := LObjectWidth + FRuiDay.PlaceOffset.X;
  finally
    EndUpdate;
  end;
end;

{ TClendarDayListViewItem }

function TClendarWeekListViewItem.FindDayItem(ADate:Int64): TClendarDayItem;
  function CheckDayItemDate(ADayItem:TClendarDayItem):Boolean;
  begin
    Result:=ADate = ADayItem.Day
  end;
begin
  Result:=nil;
  if (YearItem.Year <> 0) or (not Text.IsEmpty)  then
    Exit;
  if CheckDayItemDate(SunDayItem) then
  begin
    Result:=SunDayItem;
    Exit;
  end;
  if CheckDayItemDate(MonDayItem) then
  begin
    Result:=MonDayItem;
    Exit;
  end;
  if CheckDayItemDate(TurDayItem) then
  begin
    Result:=TurDayItem;
    Exit;
  end;
  if CheckDayItemDate(WedDayItem) then
  begin
    Result:=WedDayItem;
    Exit;
  end;
  if CheckDayItemDate(ThuDayItem) then
  begin
    Result:=ThuDayItem;
    Exit;
  end;
  if CheckDayItemDate(RuiDayItem) then
  begin
    Result:=RuiDayItem;
    Exit;
  end;
  if CheckDayItemDate(SatDayItem) then
  begin
    Result:=SatDayItem;
    Exit;
  end;
end;

function TClendarWeekListViewItem.GetClendarDayItem(AName: String)
  : TClendarDayItem;
begin
  Result := TClendarDayItem(Objects.FindDrawable(AName));
end;

function TClendarWeekListViewItem.GetIsMark(ADayItem: TClendarDayItem): Boolean;
begin
  Result:=False;
  if Controller is TCalenderView then
  begin
    TCalenderView(Controller).OnGetItemIsMark(ADayItem, Result);
  end;
end;

const
  sThisUnit = 'FMX.CalendarItemAppearance';

function TClendarWeekListViewItem.GetMonDayItem: TClendarDayItem;
begin
  Result:=GetClendarDayItem(TClendarListItemAppearanceNames.MonItmeName);
end;

function TClendarWeekListViewItem.GetRuiDayItem: TClendarDayItem;
begin
  Result:=GetClendarDayItem(TClendarListItemAppearanceNames.RuiItemName);
end;

function TClendarWeekListViewItem.GetSatDayItem: TClendarDayItem;
begin
 Result:=GetClendarDayItem(TClendarListItemAppearanceNames.SatItemName);
end;

function TClendarWeekListViewItem.GetSunDayItem: TClendarDayItem;
begin
  Result:=GetClendarDayItem(TClendarListItemAppearanceNames.SunItemName);
end;

function TClendarWeekListViewItem.GetThuDayItem: TClendarDayItem;
begin
  Result:=GetClendarDayItem(TClendarListItemAppearanceNames.ThuItemName);
end;

function TClendarWeekListViewItem.GetTurDayItem: TClendarDayItem;
begin
  Result:=GetClendarDayItem(TClendarListItemAppearanceNames.TurItmeName);
end;

function TClendarWeekListViewItem.GetWedDayItem: TClendarDayItem;
begin
  Result:=GetClendarDayItem(TClendarListItemAppearanceNames.WedItemName);
end;

function TClendarWeekListViewItem.GetYearItem: TClendarYearItem;
begin
  Result:=TClendarYearItem(Objects.FindDrawable(TClendarListItemAppearanceNames.YearItemName));
end;

{ TClendarYearItem }

procedure TClendarYearItem.Render(const Canvas: TCanvas;
  const DrawItemIndex: Integer; const DrawStates: TListItemDrawStates;
  const Resources: TListItemStyleResources;
  const Params: TListItemDrawable.TParams; const SubPassNo: Integer);
var
  ATextWidth:Single;
  ARect:TRectF;
  CenterY:Single;
  AtPoint1, AtPoint2:TPointF;
begin
  if (SubPassNo <> 0) or (FYear = 0) then
    Exit;
  Canvas.Font.Size:=16;
  Canvas.Fill.Color:=$FF1886ED;
  Canvas.FillText(LocalRect, FYearText, False, 1, [], TTextAlign.Leading, TTextAlign.Center);

  ATextWidth:=Canvas.TextWidth(FYearText);
  CenterY:=LocalRect.CenterPoint.Y;
  AtPoint1:=TPointF.Create((LocalRect.Left + ATextWidth + 5), CenterY);
  AtPoint2:=TPointF.Create((LocalRect.Right), CenterY);
  Canvas.Stroke.Kind:=TBrushKind.Solid;
  Canvas.Stroke.Thickness:=1;
  Canvas.Stroke.Color:=TAlphaColors.Cadetblue;
  Canvas.DrawLine(AtPoint1, AtPoint2, 1);
end;

procedure TClendarYearItem.SetYear(const Value: Word);
begin
  if FYear<>Value then
  begin
    FYear := Value;
    FYearText:=InttoStr(FYear);
    Invalidate;
  end;
end;

{ TClendarYearObjectAppearance }

procedure TClendarYearObjectAppearance.AssignTo(ADest: TPersistent);
begin
  inherited;

end;

procedure TClendarYearObjectAppearance.CreateObject(
  const AListViewItem: TListViewItem);
var
  LItem: TClendarYearItem;
begin
  LItem := TClendarYearItem.Create(AListViewItem);
  LItem.BeginUpdate;
  try
    LItem.Name := Name;
    LItem.Assign(Self);
  finally
    LItem.EndUpdate;
  end;
end;

procedure TClendarYearObjectAppearance.ResetObject(
  const AListViewItem: TListViewItem);
begin
  ResetObjectT<TClendarYearItem>(AListViewItem);
end;

{ TCalenderView }

procedure TCalenderView.ApplyStyle;
var
  StyleObject: TFmxObject;
begin
  StyleObject := Self.FindStyleResource('frame');
  if StyleObject is TColorObject then
    TColorObject(StyleObject).Color := $FFFFFFFF;
  inherited;
end;

function TCalenderView.GetDefaultStyleLookupName: string;
begin
  inherited;
end;

initialization

TAppearancesRegistry.RegisterAppearance(TClendarDayListItemAppearance,
  TClendarListItemAppearanceNames.ListItem, [TRegisterAppearanceOption.Item],
  sThisUnit);

finalization

TAppearancesRegistry.UnregisterAppearances
  (TArray<TItemAppearanceObjectsClass>.Create(TClendarDayListItemAppearance));

end.
