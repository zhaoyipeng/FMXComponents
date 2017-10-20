unit RotateTextDemoMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.TypInfo,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.RotatingText, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani,
  FMX.Layouts, FMX.ListBox;

type
  TRotatingTextDemoForm = class(TForm)
    rbTopToBottom: TRadioButton;
    rbBottomToTop: TRadioButton;
    GroupBox1: TGroupBox;
    FMXRotatingText1: TFMXRotatingText;
    Text1: TText;
    ListBox1: TListBox;
    GroupBox2: TGroupBox;
    rbSelectRight: TRadioButton;
    rbSelectLeft: TRadioButton;
    GridPanelLayout1: TGridPanelLayout;
    FMXRotatingText2: TFMXRotatingText;
    TextLeft: TText;
    TextRight: TText;
    Layout1: TLayout;
    procedure FormCreate(Sender: TObject);
    procedure rbTopToBottomChange(Sender: TObject);
    procedure ListBox1Change(Sender: TObject);
  private
    { Private declarations }
    function GetMoveTypeName(AType: TInterpolationType): string;
    function GetSelectRotatingText: TFMXRotatingText;
    function GetSelectText: TText;
  public
    { Public declarations }
  end;

var
  RotatingTextDemoForm: TRotatingTextDemoForm;

implementation

{$R *.fmx}

procedure TRotatingTextDemoForm.FormCreate(Sender: TObject);
begin
  ListBox1.ItemIndex := 0;
  TextLeft.Text := GetMoveTypeName(FMXRotatingText1.MovingType);
  TextRight.Text := GetMoveTypeName(FMXRotatingText2.MovingType);
  FMXRotatingText1.Start;
  FMXRotatingText2.Start;
end;

function TRotatingTextDemoForm.GetMoveTypeName(AType: TInterpolationType): string;
begin
  Result := GetEnumName(TypeInfo(TInterpolationType),Ord(AType));
end;

function TRotatingTextDemoForm.GetSelectRotatingText: TFMXRotatingText;
begin
  if rbSelectLeft.IsChecked then
    Result := FMXRotatingText1
  else
    Result := FMXRotatingText2;
end;

function TRotatingTextDemoForm.GetSelectText: TText;
begin
    if rbSelectLeft.IsChecked then
    Result := TextLeft
  else
    Result := TextRight;
end;

procedure TRotatingTextDemoForm.ListBox1Change(Sender: TObject);
begin
  GetSelectRotatingText().MovingType := TInterpolationType(ListBox1.ItemIndex);
  GetSelectText().Text := GetMoveTypeName(TInterpolationType(ListBox1.ItemIndex));
end;

procedure TRotatingTextDemoForm.rbTopToBottomChange(Sender: TObject);
begin
  if rbTopToBottom.IsChecked then
  begin
    FMXRotatingText1.RotatingDirection := TRotatingDirection.TopToBottom;
    FMXRotatingText2.RotatingDirection := TRotatingDirection.TopToBottom;
  end
  else
  begin
    FMXRotatingText1.RotatingDirection := TRotatingDirection.BottomToTop;
    FMXRotatingText2.RotatingDirection := TRotatingDirection.BottomToTop;
  end;
end;

end.
