unit TestINativeCanvasMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.EditBox, FMX.SpinBox, FMX.Objects,
  FMX.Graphics.INativeCanvas,
  FMX.Graphics.NativeCanvas, FMX.Layouts, FMX.ListBox
  {$IFDEF IOS}
  , iOSapi.UIKit
  , iOSapi.Foundation
  {$ENDIF}
  ;

type
  TTestDrawBitmapMainForm = class(TForm)
    Image1: TImage;
    PaintBox1: TPaintBox;
    BitmapOpacitySpinBox: TSpinBox;
    Label3: TLabel;
    Layout1: TLayout;
    NativeDrawSwitch: TSwitch;
    Label2: TLabel;
    procedure BitmapOpacitySpinBoxChangeTracking(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
    procedure NativeDrawSwitchSwitch(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestDrawBitmapMainForm: TTestDrawBitmapMainForm;

implementation

{$R *.fmx}

procedure TTestDrawBitmapMainForm.BitmapOpacitySpinBoxChangeTracking(Sender: TObject);
begin
  PaintBox1.Repaint;
end;

procedure TTestDrawBitmapMainForm.NativeDrawSwitchSwitch(Sender: TObject);
begin
  PaintBox1.Repaint;
end;

procedure TTestDrawBitmapMainForm.PaintBox1Paint(Sender: TObject;
  Canvas: TCanvas);
var
  ICanvas: INativeCanvas;
  AStroke: TStrokeBrush;
  AFill: TBrush;
  R: TRectF;
  Method: TDrawMethod;
  W, H: Single;
begin
  if NativeDrawSwitch.IsChecked then
    Method := TDrawMethod.Native
  else
    Method := TDrawMethod.Firemonkey;
  ICanvas := Canvas.ToNativeCanvas(Method);
  ICanvas.NativeDraw(PaintBox1.LocalRect, procedure begin
    AStroke := TStrokeBrush.Create(TBrushKind.Solid, TAlphaColors.Blue);
    W := PaintBox1.Width / 2;
    H := PaintBox1.Height / 2;
    ICanvas.DrawBitmap(Image1.Bitmap,
      RectF(0,0,Image1.Bitmap.Width, Image1.Bitmap.Height),
      TRectF.Create(PointF(0,0),W,H),
      BitmapOpacitySpinBox.Value / 255);
    ICanvas.DrawBitmap(Image1.Bitmap,
      RectF(0,0,Image1.Bitmap.Width, Image1.Bitmap.Height),
      TRectF.Create(PointF(W,0),W,H),
      BitmapOpacitySpinBox.Value / 255);
    ICanvas.DrawBitmap(Image1.Bitmap,
      RectF(0,0,Image1.Bitmap.Width, Image1.Bitmap.Height),
      TRectF.Create(PointF(0,H),W,H),
      BitmapOpacitySpinBox.Value / 255);
    ICanvas.DrawBitmap(Image1.Bitmap,
      RectF(0,0,Image1.Bitmap.Width, Image1.Bitmap.Height),
      TRectF.Create(PointF(W,H),W,H),
      BitmapOpacitySpinBox.Value / 255);
    R := PaintBox1.LocalRect;
    R.Inflate(-30,-30);
    AStroke.Thickness := 2;
    AFill := TBrush.Create(TBrushKind.Solid, TAlphaColors.Lightgray);
    ICanvas.DrawRect(R, 0, 0, AllCorners, 1, AFill, AStroke);
    ICanvas.Fill.Kind := TBrushKind.Solid;
    ICanvas.Fill.Color := TAlphaColors.Black;
    ICanvas.Font.Size := 20;
    ICanvas.Font.Style := [TFontStyle.fsBold, TFontStyle.fsItalic];
    ICanvas.FillText(R, '中文TopLeft', False, 1, [], TTextAlign.Leading, TTextAlign.Leading);
    ICanvas.FillText(R, '中文CenterLeft', False, 1, [], TTextAlign.Leading, TTextAlign.Center);
    ICanvas.FillText(R, '中文BottomLeft', False, 1, [], TTextAlign.Leading, TTextAlign.Trailing);

    ICanvas.Font.Style := [TFontStyle.fsUnderline];
    ICanvas.FillText(R, '中文TopCenter', False, 1, [], TTextAlign.Center, TTextAlign.Leading);
    ICanvas.FillText(R, '中文Center', False, 1, [], TTextAlign.Center, TTextAlign.Center);
    ICanvas.FillText(R, '中文BottomCenter', False, 1, [], TTextAlign.Center, TTextAlign.Trailing);

    ICanvas.Font.Style := [TFontStyle.fsStrikeOut];
    ICanvas.FillText(R, '中文TopRight', False, 1, [], TTextAlign.Trailing, TTextAlign.Leading);
    ICanvas.FillText(R, '中文CenterRight', False, 1, [], TTextAlign.Trailing, TTextAlign.Center);
    ICanvas.FillText(R, '中文BottomRight', False, 1, [], TTextAlign.Trailing, TTextAlign.Trailing);
    AFill.Free;
    AStroke.Free;
  end);
end;

end.
