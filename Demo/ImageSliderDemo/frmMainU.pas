unit frmMainU;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.ImageSlider,
  FMX.Layouts, FMX.ListBox;

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
    Label1: TLabel;
    cbbInterval: TComboBox;
    IsAuto: TCheckBox;
    procedure btnAddClick(Sender: TObject);
    procedure btnGoPageClick(Sender: TObject);
    procedure IsAutoChange(Sender: TObject);
    procedure btnInitClick(Sender: TObject);
    procedure btnPrevClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbbIntervalChange(Sender: TObject);
  private
    { Private declarations }
    ImgSlider : TFMXImageSlider;
    procedure ItemClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.btnAddClick(Sender: TObject);
var
  Bmp : TBitmap;
begin
  if OpenDialog.Execute then
  begin
    Bmp := TBitmap.Create;
    try
      Bmp.LoadFromFile(OpenDialog.FileName);
      ImgSlider.Add((ImgSlider.PageCount + 1).ToString, Bmp);
    finally
      Bmp.Free;
    end;
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

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  ImgSlider := TFMXImageSlider.Create(Self);
  ImgSlider.Position.X := 0;
  ImgSlider.Position.Y := 0;
  ImgSlider.Parent := Self;
  ImgSlider.Width := ClientWidth;
  ImgSlider.Align := TAlignLayout.Top;
  ImgSlider.Height:= ImgSlider.Width * 400 / 640;;
  ImgSlider.OnItemClick := ItemClick;
end;

procedure TfrmMain.IsAutoChange(Sender: TObject);
begin
  ImgSlider.AutoSlider := IsAuto.IsChecked;
end;

procedure TfrmMain.ItemClick(Sender: TObject);
begin
  ShowMessage(TControl(Sender).Index.ToString);
end;

end.
