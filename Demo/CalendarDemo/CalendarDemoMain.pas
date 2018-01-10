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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CalendarDemoMainForm: TCalendarDemoMainForm;

implementation

{$R *.fmx}

procedure TCalendarDemoMainForm.chkShowLunarDateChange(Sender: TObject);
begin
  FMXCalendarControl1.IsShowLunarDate := chkShowLunarDate.IsChecked;
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
