unit frmMainU;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.ImageSlider,
  FMX.Layouts, FMX.ListBox, FMX.ScrollBox, FMX.Memo, FMX.Colors;

type
  TfrmMain = class(TForm)
    ToolBar: TLayout;
    btnAdd: TButton;
    btnGoPage: TButton;
    Page: TEdit;
    OpenDialog: TOpenDialog;
    Layout1: TLayout;
    Layout2: TLayout;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Memo1: TMemo;
    ImgSlider: TFMXImageSlider;
    Layout3: TLayout;
    Label2: TLabel;
    cbbInterval: TComboBox;
    IsAuto: TCheckBox;
    chkShowDots: TCheckBox;
    Layout4: TLayout;
    cpActiveColor: TColorPanel;
    cpInactiveColor: TColorPanel;
    procedure btnAddClick(Sender: TObject);
    procedure btnGoPageClick(Sender: TObject);
    procedure IsAutoChange(Sender: TObject);
    procedure btnInitClick(Sender: TObject);
    procedure btnPrevClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbbIntervalChange(Sender: TObject);
    procedure ImgSliderItemClick(Sender: TObject);
    procedure ImgSliderItemTap(Sender: TObject; const Point: TPointF);
    procedure ImgSliderCanDragBegin(Sender: TObject; var CanBegin: Boolean);
    procedure ImgSliderPageAnimationFinish(Sender: TObject; NewPage: Integer);
    procedure ImgSliderPageChange(Sender: TObject; NewPage, OldPage: Integer);
    procedure chkShowDotsChange(Sender: TObject);
    procedure Layout4Resize(Sender: TObject);
    procedure cpActiveColorChange(Sender: TObject);
    procedure cpInactiveColorChange(Sender: TObject);
  private
    procedure AddBitmap(const FileName: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.btnAddClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    AddBitmap(OpenDialog.FileName);
  end;
end;

procedure TfrmMain.btnGoPageClick(Sender: TObject);
begin
  ImgSlider.ActivePage := StrToInt(Page.Text.Trim);
end;

procedure TfrmMain.btnInitClick(Sender: TObject);
begin
  ImgSlider.Clear;
end;

procedure TfrmMain.btnNextClick(Sender: TObject);
begin
  ImgSlider.Next;
end;

procedure TfrmMain.btnPrevClick(Sender: TObject);
begin
  ImgSlider.Prev;
end;

procedure TfrmMain.cbbIntervalChange(Sender: TObject);
const
  INTERVALS: array [0..4] of Integer = (
    1000, 2000, 3000, 4000, 5000
  );
begin
  ImgSlider.TimerInterval := INTERVALS[cbbInterval.ItemIndex];
end;

procedure TfrmMain.chkShowDotsChange(Sender: TObject);
begin
  ImgSlider.DotsVisible := chkShowDots.IsChecked;
end;

procedure TfrmMain.cpActiveColorChange(Sender: TObject);
begin
  ImgSlider.DotActiveColor := cpActiveColor.Color;
end;

procedure TfrmMain.cpInactiveColorChange(Sender: TObject);
begin
  ImgSlider.DotInActiveColor := cpInactiveColor.Color;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  ImgSlider.Height:= ClientWidth * 400 / 640;
  {$IFDEF  MSWINDOWS}
  AddBitmap('..\..\Images\image1.jpg');
  AddBitmap('..\..\Images\image2.jpg');
  AddBitmap('..\..\Images\image3.jpg');
  AddBitmap('..\..\Images\image4.jpg');
  ImgSlider.ActivePage := 0;
  {$ENDIF}
  cpActiveColor.Color := ImgSlider.DotActiveColor;
  cpInActiveColor.Color := ImgSlider.DotInActiveColor;
end;

procedure TfrmMain.ImgSliderCanDragBegin(Sender: TObject;
  var CanBegin: Boolean);
begin
//  Memo1.Lines.Add('On CanDragBegin');
end;

procedure TfrmMain.ImgSliderItemClick(Sender: TObject);
begin
//  Memo1.Lines.Add('On Item Click: '+ TControl(Sender).Tag.ToString);
end;

procedure TfrmMain.ImgSliderItemTap(Sender: TObject; const Point: TPointF);
begin
//  Memo1.Lines.Add('On Item Tap: '+ TControl(Sender).Tag.ToString);
end;

procedure TfrmMain.ImgSliderPageAnimationFinish(Sender: TObject; NewPage: Integer);
begin
//  Memo1.Lines.Add(
//    Format('On PageAnimationFinish, NewPage: %d, OldPage: %d',
//    [NewPage, OldPage]));
end;

procedure TfrmMain.ImgSliderPageChange(Sender: TObject; NewPage,
  OldPage: Integer);
begin
  Memo1.Lines.Add(
    Format('On PageChange, OldPage: %d, NewPage: %d',
    [OldPage, NewPage]));
end;

procedure TfrmMain.AddBitmap(const FileName: string);
var
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  try
    Bmp.LoadFromFile(FileName);
    ImgSlider.Add((ImgSlider.PageCount + 1).ToString, Bmp);
  finally
    Bmp.Free;
  end;
end;

procedure TfrmMain.IsAutoChange(Sender: TObject);
begin
  ImgSlider.AutoSlider := IsAuto.IsChecked;
end;

procedure TfrmMain.Layout4Resize(Sender: TObject);
begin
  cpActiveColor.Width := Layout4.Width / 2;
  cpInactiveColor.Width := Layout4.Width / 2;
end;

end.
