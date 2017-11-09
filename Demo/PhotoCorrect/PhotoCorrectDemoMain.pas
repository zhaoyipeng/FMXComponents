unit PhotoCorrectDemoMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.Platform, GR32, GR32_Resamplers, GR32_Transforms, Math;

type
  TPhotoCorrectMainForm = class(TForm)
    Layout2: TLayout;
    Image1: TImage;
    Image2: TImage;
    Rectangle3: TRectangle;
    Label13: TLabel;
    Rectangle1: TRectangle;
    Label1: TLabel;
    CmbResamplerClassNames: TComboBox;
    btnReset: TButton;
    btnApply: TButton;
    Path1: TPath;
    procedure Layout2Resize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure CmbResamplerClassNamesChange(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
  private
    { Private declarations }
    FChanging: Boolean;
    Transformation: TProjectiveTransformation;
    FScaleFactor: Single;
    Vertices: array [0 .. 3] of TFloatPoint;
    Shapes: array [0 .. 3] of TSelectionPoint;
    procedure DoPointChanged(Sender: TObject; var X, Y: Single);
    procedure DoTransform;
    function GetSourceRect: TFloatRect;
    procedure ChangePath;
  public
    { Public declarations }
  end;

var
  PhotoCorrectMainForm: TPhotoCorrectMainForm;

implementation

{$R *.fmx}

uses
  PerspectiveCorrect;


procedure TPhotoCorrectMainForm.btnApplyClick(Sender: TObject);
begin
  DoTransform;
end;

procedure TPhotoCorrectMainForm.btnResetClick(Sender: TObject);
var
  s: TSize;
  I: Integer;
begin
  FChanging := True;
  s := Image1.Bitmap.Size;
  Vertices[0] := FloatPoint(0, 0);
  Vertices[1] := FloatPoint(s.Width, 0);
  Vertices[2] := FloatPoint(s.Width, s.Height);
  Vertices[3] := FloatPoint(0, s.Height);
  for I := 0 to 3 do
    Shapes[I].Position.Point := PointF(Vertices[I].X, Vertices[I].Y);
  FChanging := False;
  ChangePath;
end;

procedure TPhotoCorrectMainForm.ChangePath;
var
  I: Integer;
begin
  if FChanging then
    Exit;
  Path1.Position.Point := PointF(0,0);
  Path1.Size.Size := Image1.Bitmap.Size;
  Path1.BeginUpdate;
  Path1.Data.Clear;
  Path1.Data.MoveTo(PointF(Vertices[0].X,Vertices[0].Y));
  for I := 1 to 3 do
  begin
    Path1.Data.LineTo(PointF(Vertices[I].X,Vertices[I].Y));
  end;
  Path1.Data.ClosePath;
  Path1.EndUpdate;
  Path1.Repaint;
end;

procedure TPhotoCorrectMainForm.CmbResamplerClassNamesChange(Sender: TObject);
begin
  DoTransform;
end;

procedure TPhotoCorrectMainForm.DoPointChanged(Sender: TObject; var X, Y: Single);
var
  idx: Integer;
begin
  idx := (Sender as TComponent).Tag;
  Vertices[idx].X := X;
  Vertices[idx].Y := Y;
  ChangePath;
end;

procedure TPhotoCorrectMainForm.DoTransform;
var
  src, dst: TBitmap32;
  I: Integer;
  dstBitmap, tmp: TBitmap;
  X, Y: array [0 .. 3] of TFloat;
  W: Integer;
  FQuadX: array [0 .. 3] of TFloat;
  FQuadY: array [0 .. 3] of TFloat;
  tr: TMyProjectiveTransformation;
  srcPts, dstPts: TArray<TFloatPoint>;
begin
  tr := TMyProjectiveTransformation.Create;
  try
    tr.SrcRect := Self.GetSourceRect;
    tr.X0 := Vertices[0].X;
    tr.X1 := Vertices[1].X;
    tr.X2 := Vertices[2].X;
    tr.X3 := Vertices[3].X;
    tr.Y0 := Vertices[0].Y;
    tr.Y1 := Vertices[1].Y;
    tr.Y2 := Vertices[2].Y;
    tr.Y3 := Vertices[3].Y;
    src := TBitmap32.Create();
    dst := TBitmap32.Create();
    dstBitmap := TBitmap.Create;
    try
      src.Assign(Image1.Bitmap);
      with CmbResamplerClassNames do
        if ItemIndex >= 0 then
          src.ResamplerClassName := Items[ItemIndex];
      dst.SetSize(Round(tr.DestWidth), Round(tr.DestHeight));
      dst.Clear($00000000);
      Transform(dst, src, tr);
      dstBitmap.Assign(dst);
      if FScaleFactor = 1 then
        Image2.Bitmap := dstBitmap
      else
      begin
        tmp := TBitmap.Create;
        try
          tmp.SetSize(Round(dstBitmap.Width * FScaleFactor), Round(dstBitmap.Height * FScaleFactor));
          tmp.Canvas.BeginScene;
          tmp.Clear(0);
          tmp.Canvas.DrawBitmap(dstBitmap, dstBitmap.Bounds, tmp.Bounds, 1);
          tmp.Canvas.EndScene;
          Image2.Bitmap := tmp;
        finally
          tmp.Free;
        end;
      end;
    finally
      dstBitmap.Free;
      dst.Free;
      src.Free;
    end;
  finally
    tr.Free;
  end;

end;
procedure TPhotoCorrectMainForm.FormCreate(Sender: TObject);
var
  I: Integer;
  ScreenSrv: IFMXScreenService;
  s: TSize;
begin
  FChanging := True;
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, ScreenSrv) then
    FScaleFactor := ScreenSrv.GetScreenScale
  else
    FScaleFactor := 1;
  Transformation := TProjectiveTransformation.Create;
  s := Image1.Bitmap.Size;
  Vertices[0] := FloatPoint(0, 0);
  Vertices[1] := FloatPoint(s.Width, 0);
  Vertices[2] := FloatPoint(s.Width, s.Height);
  Vertices[3] := FloatPoint(0, s.Height);
  for I := 0 to 3 do
  begin
    Shapes[I] := TSelectionPoint.Create(Self);
    Shapes[I].Parent := Image1;
    Shapes[I].GripSize := 9;
    Shapes[I].Position.X := Vertices[I].X;
    Shapes[I].Position.Y := Vertices[I].Y;
    Shapes[I].OnTrack := DoPointChanged;
    Shapes[I].Tag := I;
  end;
  ResamplerList.GetClassNames(CmbResamplerClassNames.Items);
  CmbResamplerClassNames.ItemIndex := 0;
  FChanging := False;
  ChangePath;
end;

function TPhotoCorrectMainForm.GetSourceRect: TFloatRect;
var
  minx, maxx, miny, maxy: TFloat;
  I: Integer;
begin
  minx := MaxSingle;
  miny := MaxSingle;
  maxx := -MaxSingle;
  maxy := -MaxSingle;

  for I := 0 to 3 do
  begin
    maxx := Max(maxx, Vertices[I].X);
    maxy := Max(maxy, Vertices[I].Y);
    minx := Min(minx, Vertices[I].X);
    miny := Min(miny, Vertices[I].Y);
  end;

  Result := FloatRect(minx, miny, maxx, maxy);
end;

procedure TPhotoCorrectMainForm.Layout2Resize(Sender: TObject);
begin
  Image1.Position.Point := TPoint.Zero;
  if Layout2.Width > Layout2.Height then
  begin
    Image1.Size.Size := TSizeF.Create(Layout2.Width / 2, Layout2.Height);
    Image2.Position.Point := PointF(Layout2.Width / 2, 0);
    Image2.Size.Size := TSizeF.Create(Layout2.Width / 2, Layout2.Height);
  end
  else
  begin
    Image1.Size.Size := TSizeF.Create(Layout2.Width, Layout2.Height / 2);
    Image2.Position.Point := PointF(0, Layout2.Height / 2);
    Image2.Size.Size := TSizeF.Create(Layout2.Width, Layout2.Height / 2);
  end;
end;

end.
