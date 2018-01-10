unit CalendarDemoMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, FMX.CalendarControl;

type
  TCalendarDemoMainForm = class(TForm)
    Rectangle1: TRectangle;
    FMXCalendarControl1: TFMXCalendarControl;
    Layout7: TLayout;
    chkShowLunarDate: TCheckBox;
    Rectangle2: TRectangle;
    txtCnDate1: TText;
    txtCnDate2: TText;
    lng1: TLang;
    Layout1: TLayout;
    rbChinese: TRadioButton;
    rbEnglish: TRadioButton;
    procedure rbChineseChange(Sender: TObject);
    procedure chkShowLunarDateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FMXCalendarControl1SelectedItem(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CalendarDemoMainForm: TCalendarDemoMainForm;

implementation

uses
  qcndate,
  CnCalendar;

{$R *.fmx}

procedure TCalendarDemoMainForm.chkShowLunarDateChange(Sender: TObject);
begin
  FMXCalendarControl1.IsShowLunarDate := chkShowLunarDate.IsChecked;
end;

procedure TCalendarDemoMainForm.FMXCalendarControl1SelectedItem(
  Sender: TObject);
var
  D: TCnDate;
  Year, Month, Day: Word;
begin
  DecodeDate(FMXCalendarControl1.SelectedDate, Year, Month, Day);
  D := ToCnDate(FMXCalendarControl1.SelectedDate);
  txtCnDate1.Text := Format('农历%s%s', [CnMonthName(D), CnDayName(D)]);
  txtCnDate2.Text :=
    GetGanZhiFromNumber(GetGanZhiFromYear(Year)) +
    GetShengXiaoFromNumber(D.Year) + '年 ' +
    GetGanZhiFromNumber(GetGanZhiFromMonth(Year, Month, Day)) + '月 ' +
    GetGanZhiFromNumber(GetGanZhiFromDay(Year, Month, Day)) + '日';
end;

procedure TCalendarDemoMainForm.FormCreate(Sender: TObject);
begin
  rbChineseChange(Self);
end;

procedure TCalendarDemoMainForm.rbChineseChange(Sender: TObject);
begin
  if rbChinese.IsChecked then
  begin
    LoadLangFromStrings(lng1.LangStr['zh']);
    FMXCalendarControl1.SetMonthNames(TCnMonths);
    FMXCalendarControl1.SetWeekNames(TCnWeeks);
  end
  else
  begin
    LoadLangFromStrings(lng1.LangStr['en']);
    FMXCalendarControl1.SetMonthNames(TEnMonths);
    FMXCalendarControl1.SetWeekNames(TEnWeeks);
  end;
end;

end.
