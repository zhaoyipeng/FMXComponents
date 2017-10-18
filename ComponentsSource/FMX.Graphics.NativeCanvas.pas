// ***************************************************************************
//
// Firemonkey Native Canvas Class
//
// Copyright 2017 Aone (amtbonechen@gmail.com), 谢顿 (zhaoyipeng@hotmail.com)
//
// This unit is based on Aone's FMX.Graphics.Native.pas, 谢顿 changed it
// to INativeCanvas, the original version information is below
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
{ ------------------------------------------ }
{                                            }
{ (c) 2017 by Aone                           }
{                                            }
{ QQ: 1467948783                             }
{                                            }
{ http://www.cnblogs.com/onechen             }
{                                            }
{ ------------------------------------------ }
{ Start: 2017.01.16                          }
{ ------------------------------------------ }
// [原创] 改善 Firemonkey Canvas 几何绘图质量问题（移动平台）by Aone


// The basic usage of this unit:
// write these code in you paint method
// var
// Canvas: INativeCanvas;
// begin
// Canvas := Self.Canvas.ToNativeCanvas(TDrawMethod.Native);
//
// Canvas.NativeDraw(LocalRect, procedure begin
// Canvas....
// end);

unit FMX.Graphics.NativeCanvas;

interface

uses
  System.Types,
  System.UITypes,
  System.Math,
  System.Math.Vectors,
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,

{$IFDEF ANDROID}
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNIBridge,
  Androidapi.Helpers,
  Androidapi.Bitmap,
  Androidapi.JNI.App,
  FMX.Surfaces,
  FMX.Helpers.Android,
{$ENDIF}
{$IFDEF IOS}
  iOSapi.CocoaTypes,
  iOSapi.UIKit,
  iOSapi.Foundation,
  iOSapi.CoreGraphics,
  Macapi.CoreFoundation,
  Macapi.ObjectiveC,
  Macapi.Helpers,
  FMX.Helpers.iOS,
{$ENDIF}
  FMX.Types,
  FMX.Graphics,
  FMX.Platform,
  FMX.Graphics.INativeCanvas;

type
{$IFDEF IOS64}
  TDashArray = TArray<CGFloat>; // iOS 64 必需使用 Double 或 CGFloat 否則無法正常顯示虛線
{$ENDIF}

  TFiremonkeyCanvas = class(TAbstractCanvas)
  public
    procedure NativeDraw(const ARect: TRectF; const ADrawProc: TDrawProc); override;
    // 涂色 + 线色一次完成
    procedure DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush; const ACornerType: TCornerType = TCornerType.Round; const Inside: Boolean = False); overload; override;
    procedure DrawPath(const APath: TPathData; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush); overload; override;
    procedure DrawEllipse(const ARect: TRectF; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush; const Inside: Boolean = False); overload; override;
    procedure DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush; const Inside: Boolean = False); overload; override;
    procedure DrawPolygon(const Points: TPolygon; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush); overload; override;

    // 下列为 Canvas 原有函数
    procedure DrawBitmap(const ABitmap: TBitmap; const SrcRect, DstRect: TRectF; const AOpacity: Single; const HighSpeed: Boolean = False); override;
    procedure FillText(const ARect: TRectF; const AText: string; const WordWrap: Boolean; const AOpacity: Single; const Flags: TFillTextFlags; const ATextAlign: TTextAlign; const AVTextAlign: TTextAlign = TTextAlign.Center); override;

    procedure DrawLine(const APt1, APt2: TPointF; const AOpacity: Single); overload; override;
    procedure DrawLine(const APt1, APt2: TPointF; const AOpacity: Single; const ABrush: TStrokeBrush); overload; override;

    procedure FillRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ACornerType: TCornerType = TCornerType.Round); overload; override;
    procedure FillRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ABrush: TBrush; const ACornerType: TCornerType = TCornerType.Round); overload; override;
    procedure DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ACornerType: TCornerType = TCornerType.Round); overload; override;
    procedure DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ABrush: TStrokeBrush; const ACornerType: TCornerType = TCornerType.Round); overload; override;

    procedure FillPath(const APath: TPathData; const AOpacity: Single); overload; override;
    procedure FillPath(const APath: TPathData; const AOpacity: Single; const ABrush: TBrush); overload; override;
    procedure DrawPath(const APath: TPathData; const AOpacity: Single); overload; override;
    procedure DrawPath(const APath: TPathData; const AOpacity: Single; const ABrush: TStrokeBrush); overload; override;

    procedure FillEllipse(const ARect: TRectF; const AOpacity: Single); overload; override;
    procedure FillEllipse(const ARect: TRectF; const AOpacity: Single; const ABrush: TBrush); overload; override;
    procedure DrawEllipse(const ARect: TRectF; const AOpacity: Single); overload; override;
    procedure DrawEllipse(const ARect: TRectF; const AOpacity: Single; const ABrush: TStrokeBrush); overload; override;

    procedure FillArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single); overload; override;
    procedure FillArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single; const ABrush: TBrush); overload; override;
    procedure DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single); overload; override;
    procedure DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single; const ABrush: TStrokeBrush); overload; override;

    procedure FillPolygon(const Points: TPolygon; const AOpacity: Single); override;
    procedure DrawPolygon(const Points: TPolygon; const AOpacity: Single); overload; override;

    procedure IntersectClipRect(const ARect: TRectF); override;
    procedure ExcludeClipRect(const ARect: TRectF); override;
  end;

{$IF Defined(ANDROID) or Defined(IOS)}

  TCustomNativeCanvas = class(TAbstractCanvas)
  private
    class var FModulateColor: TAlphaColor;
  public
    // 涂色 + 线色一次完成
    procedure DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush; const ACornerType: TCornerType = TCornerType.Round; const Inside: Boolean = False); overload; override;
    procedure DrawEllipse(const ARect: TRectF; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush; const Inside: Boolean = False); overload; override;
    procedure DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush; const Inside: Boolean = False); overload; override;
    procedure DrawPolygon(const Points: TPolygon; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush); overload; override;

    // 下列为 Canvas 原有函数
    procedure DrawLine(const APt1, APt2: TPointF; const AOpacity: Single); overload; override;

    procedure FillRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ACornerType: TCornerType = TCornerType.Round); overload; override;
    procedure FillRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ABrush: TBrush; const ACornerType: TCornerType = TCornerType.Round); overload; override;
    procedure DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ACornerType: TCornerType = TCornerType.Round); overload; override;
    procedure DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ABrush: TStrokeBrush; const ACornerType: TCornerType = TCornerType.Round); overload; override;

    procedure FillPath(const APath: TPathData; const AOpacity: Single); overload; override;
    procedure FillPath(const APath: TPathData; const AOpacity: Single; const ABrush: TBrush); overload; override;
    procedure DrawPath(const APath: TPathData; const AOpacity: Single); overload; override;
    procedure DrawPath(const APath: TPathData; const AOpacity: Single; const ABrush: TStrokeBrush); overload; override;

    procedure FillEllipse(const ARect: TRectF; const AOpacity: Single); overload; override;
    procedure FillEllipse(const ARect: TRectF; const AOpacity: Single; const ABrush: TBrush); overload; override;
    procedure DrawEllipse(const ARect: TRectF; const AOpacity: Single); overload; override;
    procedure DrawEllipse(const ARect: TRectF; const AOpacity: Single; const ABrush: TStrokeBrush); overload; override;

    procedure FillArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single); overload; override;
    procedure FillArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single; const ABrush: TBrush); overload; override;
    procedure DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single); overload; override;
    procedure DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single; const ABrush: TStrokeBrush); overload; override;

    procedure FillPolygon(const Points: TPolygon; const AOpacity: Single); override;
    procedure DrawPolygon(const Points: TPolygon; const AOpacity: Single); overload; override;

    class property ModulateColor: TAlphaColor read FModulateColor write FModulateColor;
  end;
{$ENDIF}
{$IFDEF ANDROID}

  TAndroidNativeCanvas = class(TCustomNativeCanvas)
  private
    GlobalCanvas: JCanvas;
    procedure ApplyGradient(const Paint1: JPaint; const ABrush: TBrush; const ARect: TRectF);
    procedure ApplyFill(const Paint1: JPaint; const ABrush: TBrush; const ARect: TRectF; const AOpacity: Single);
    procedure DrawFill(const Paint1: JPaint; const ABrush: TBrush; const SrcRect, DesRect: TRectF; const AOpacity: Single);
    procedure ApplyStroke(const Paint1: JPaint; const AStroke: TStrokeBrush; const ARect: TRectF; const AOpacity: Single);
  public
    procedure NativeDraw(const ARect: TRectF; const ADrawProc: TDrawProc); override;
    procedure DrawBitmap(const ABitmap: TBitmap; const SrcRect, DstRect: TRectF; const AOpacity: Single; const HighSpeed: Boolean = False); override;
    procedure DrawPath(const APath: TPathData; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush); override;

    // 下列为 Canvas 原有函数
    procedure DrawLine(const APt1, APt2: TPointF; const AOpacity: Single; const ABrush: TStrokeBrush); overload; override;

    procedure IntersectClipRect(const ARect: TRectF); override;
    procedure ExcludeClipRect(const ARect: TRectF); override;
  end;
{$ENDIF}
{$IFDEF IOS}

  TIOSNativeCanvas = class(TCustomNativeCanvas)
  private
    GlobalCanvas: CGContextRef;
    procedure ApplyGradient(const ABrush: TBrush; const ARect: TRectF);
    procedure ApplyFill(const ABrush: TBrush; const ARect: TRectF; const AOpacity: Single);
    procedure DrawFill(const ABrush: TBrush; const SrcRect, DesRect: TRectF; const AOpacity: Single);
    procedure ApplyStroke(const AStroke: TStrokeBrush; const ARect: TRectF; const AOpacity: Single);
  public
    procedure NativeDraw(const ARect: TRectF; const ADrawProc: TDrawProc); override;
    procedure DrawBitmap(const ABitmap: TBitmap; const SrcRect, DstRect: TRectF; const AOpacity: Single; const HighSpeed: Boolean = False); override;

    procedure DrawPath(const APath: TPathData; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush); override;

    // 下列为 Canvas 原有函数
    procedure DrawLine(const APt1, APt2: TPointF; const AOpacity: Single; const ABrush: TStrokeBrush); overload; override;

    procedure IntersectClipRect(const ARect: TRectF); override;
    procedure ExcludeClipRect(const ARect: TRectF); override;
  end;
{$ENDIF}

  TCanvasHelper = class helper for TCanvas
  public
    function ToNativeCanvas(AMethod: TDrawMethod): INativeCanvas;
  end;

implementation

{ TFiremonkeyCanvas }

procedure TFiremonkeyCanvas.DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush; const Inside: Boolean);
var
  R: TRectF;
  P: TPointF;
begin
  R := RectF(Center.X - Radius.X, Center.Y - Radius.Y, Center.X + Radius.X, Center.Y + Radius.Y);

  // 线在区内
  if Inside and (AStroke <> nil) and (AStroke.Kind <> TBrushKind.None) then
  begin
    R.Offset(-R.Left, -R.Top);
    InflateRect(R, -(AStroke.Thickness / 2), -(AStroke.Thickness / 2));
  end;

  P := PointF(R.Width / 2, R.Height / 2);

  FCanvas.FillArc(Center, P, StartAngle, SweepAngle, AOpacity, AFill);
  FCanvas.DrawArc(Center, P, StartAngle, SweepAngle, AOpacity, AStroke);
end;

procedure TFiremonkeyCanvas.DrawEllipse(const ARect: TRectF; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush; const Inside: Boolean);
var
  R: TRectF;
begin
  R := ARect;

  // 线在区内
  if Inside and (AStroke <> nil) and (AStroke.Kind <> TBrushKind.None) then
    InflateRect(R, -(AStroke.Thickness / 2), -(AStroke.Thickness / 2));

  FCanvas.FillEllipse(R, AOpacity, AFill);
  FCanvas.DrawEllipse(R, AOpacity, AStroke);
end;

procedure TFiremonkeyCanvas.DrawLine(const APt1, APt2: TPointF; const AOpacity: Single);
begin
  FCanvas.DrawLine(APt1, APt2, AOpacity);
end;

procedure TFiremonkeyCanvas.DrawLine(const APt1, APt2: TPointF; const AOpacity: Single; const ABrush: TStrokeBrush);
begin
  FCanvas.DrawLine(APt1, APt2, AOpacity, ABrush);
end;

procedure TFiremonkeyCanvas.DrawPath(const APath: TPathData; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush);
begin
  FCanvas.FillPath(APath, AOpacity, AFill);
  FCanvas.DrawPath(APath, AOpacity, AStroke);
end;

procedure TFiremonkeyCanvas.DrawPath(const APath: TPathData; const AOpacity: Single; const ABrush: TStrokeBrush);
begin
  FCanvas.DrawPath(APath, AOpacity, ABrush);
end;

procedure TFiremonkeyCanvas.DrawPolygon(const Points: TPolygon; const AOpacity: Single);
begin
  FCanvas.DrawPolygon(Points, AOpacity);
end;

procedure TFiremonkeyCanvas.DrawPath(const APath: TPathData; const AOpacity: Single);
begin
  FCanvas.DrawPath(APath, AOpacity);
end;

procedure TFiremonkeyCanvas.DrawPolygon(const Points: TPolygon; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush);
begin
  if AFill <> nil then
    FCanvas.Fill.Assign(AFill);

  if AStroke <> nil then
    FCanvas.Stroke.Assign(AStroke);

  FCanvas.FillPolygon(Points, AOpacity);
  FCanvas.DrawPolygon(Points, AOpacity);
end;

procedure TFiremonkeyCanvas.DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ABrush: TStrokeBrush; const ACornerType: TCornerType);
begin
  FCanvas.DrawRect(ARect, XRadius, YRadius, ACorners, AOpacity, ABrush, ACornerType);
end;

procedure TFiremonkeyCanvas.ExcludeClipRect(const ARect: TRectF);
begin
  FCanvas.ExcludeClipRect(ARect);
end;

procedure TFiremonkeyCanvas.DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ACornerType: TCornerType);
begin
  FCanvas.DrawRect(ARect, XRadius, YRadius, ACorners, AOpacity, ACornerType);
end;

procedure TFiremonkeyCanvas.DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush; const ACornerType: TCornerType; const Inside: Boolean);
var
  R: TRectF;
begin
  R := ARect;

  // 线在区内
  if Inside and (AStroke <> nil) and (AStroke.Kind <> TBrushKind.None) then
    InflateRect(R, -(AStroke.Thickness / 2), -(AStroke.Thickness / 2));

  FCanvas.FillRect(R, XRadius, YRadius, ACorners, AOpacity, AFill, ACornerType);
  FCanvas.DrawRect(R, XRadius, YRadius, ACorners, AOpacity, AStroke, ACornerType);
end;

procedure TFiremonkeyCanvas.FillPath(const APath: TPathData; const AOpacity: Single);
begin
  FCanvas.FillPath(APath, AOpacity);
end;

procedure TFiremonkeyCanvas.FillArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single; const ABrush: TBrush);
begin
  FCanvas.FillArc(Center, Radius, StartAngle, SweepAngle, AOpacity, ABrush);
end;

procedure TFiremonkeyCanvas.FillArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single);
begin
  FCanvas.FillArc(Center, Radius, StartAngle, SweepAngle, AOpacity);
end;

procedure TFiremonkeyCanvas.FillEllipse(const ARect: TRectF; const AOpacity: Single; const ABrush: TBrush);
begin
  FCanvas.FillEllipse(ARect, AOpacity, ABrush);
end;

procedure TFiremonkeyCanvas.FillEllipse(const ARect: TRectF; const AOpacity: Single);
begin
  FCanvas.FillEllipse(ARect, AOpacity);
end;

procedure TFiremonkeyCanvas.FillPath(const APath: TPathData; const AOpacity: Single; const ABrush: TBrush);
begin
  FCanvas.FillPath(APath, AOpacity, ABrush);
end;

procedure TFiremonkeyCanvas.FillPolygon(const Points: TPolygon; const AOpacity: Single);
begin
  FCanvas.FillPolygon(Points, AOpacity);
end;

procedure TFiremonkeyCanvas.FillRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ABrush: TBrush; const ACornerType: TCornerType);
begin
  FCanvas.FillRect(ARect, XRadius, YRadius, ACorners, AOpacity, ABrush, ACornerType);
end;

procedure TFiremonkeyCanvas.FillText(const ARect: TRectF; const AText: string;
  const WordWrap: Boolean; const AOpacity: Single; const Flags: TFillTextFlags;
  const ATextAlign, AVTextAlign: TTextAlign);
begin
  FCanvas.FillText(ARect, AText, WordWrap, AOpacity, Flags, ATextAlign, AVTextAlign);
end;

procedure TFiremonkeyCanvas.IntersectClipRect(const ARect: TRectF);
begin
  FCanvas.IntersectClipRect(ARect);
end;

procedure TFiremonkeyCanvas.FillRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ACornerType: TCornerType);
begin
  FCanvas.FillRect(ARect, XRadius, YRadius, ACorners, AOpacity, ACornerType);
end;

procedure TFiremonkeyCanvas.NativeDraw(const ARect: TRectF; const ADrawProc: TDrawProc);
begin
  // 绘图函数
  if Assigned(ADrawProc) then
    ADrawProc;
end;

procedure TFiremonkeyCanvas.DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single);
begin
  FCanvas.DrawArc(Center, Radius, StartAngle, SweepAngle, AOpacity);
end;

procedure TFiremonkeyCanvas.DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single; const ABrush: TStrokeBrush);
begin
  FCanvas.DrawArc(Center, Radius, StartAngle, SweepAngle, AOpacity, ABrush);
end;

procedure TFiremonkeyCanvas.DrawBitmap(const ABitmap: TBitmap; const SrcRect, DstRect: TRectF; const AOpacity: Single; const HighSpeed: Boolean);
begin
  FCanvas.DrawBitmap(ABitmap, SrcRect, DstRect, AOpacity, HighSpeed);
end;

procedure TFiremonkeyCanvas.DrawEllipse(const ARect: TRectF; const AOpacity: Single);
begin
  FCanvas.DrawEllipse(ARect, AOpacity);
end;

procedure TFiremonkeyCanvas.DrawEllipse(const ARect: TRectF; const AOpacity: Single; const ABrush: TStrokeBrush);
begin
  FCanvas.FillEllipse(ARect, AOpacity, ABrush);
end;

{ TCanvasHelper }

function TCanvasHelper.ToNativeCanvas(AMethod: TDrawMethod): INativeCanvas;
begin
  case AMethod of
    Native:
{$IF DEFINED(ANDROID) OR DEFINED(IOS)}
{$IFDEF ANDROID}
      Result := TAndroidNativeCanvas.Create(Self);
{$ELSE}
      Result := nil;
{$ENDIF}
{$ELSE}
      Result := TFiremonkeyCanvas.Create(Self);
{$ENDIF}
    Firemonkey:
      Result := TFiremonkeyCanvas.Create(Self);
  end;
end;

{$IF Defined(ANDROID) or Defined(IOS)}
{ TCustomNativeCanvas }

procedure TCustomNativeCanvas.DrawLine(const APt1, APt2: TPointF; const AOpacity: Single);
begin
  DrawLine(APt1, APt2, AOpacity, FCanvas.Stroke);
end;

procedure TCustomNativeCanvas.DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush; const ACornerType: TCornerType; const Inside: Boolean);
var
  Path: TPathData;
  R: TRectF;
begin
  R := ARect;

  // 线在区内
  if Inside and (AStroke <> nil) and (AStroke.Kind <> TBrushKind.None) then
    InflateRect(R, -(AStroke.Thickness / 2), -(AStroke.Thickness / 2));

  Path := TPathData.Create;
  try
    Path.AddRectangle(R, XRadius, YRadius, ACorners, ACornerType);
    DrawPath(Path, AOpacity, AFill, AStroke);
  finally
    Path.Free;
  end;
end;

procedure TCustomNativeCanvas.DrawEllipse(const ARect: TRectF; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush; const Inside: Boolean = False);
var
  Path: TPathData;
  R: TRectF;
begin
  R := ARect;

  // 线在区内
  if Inside and (AStroke <> nil) and (AStroke.Kind <> TBrushKind.None) then
  begin
    R.Offset(-R.Left, -R.Top);
    InflateRect(R, -(AStroke.Thickness / 2), -(AStroke.Thickness / 2));
  end;

  Path := TPathData.Create;
  try
    Path.AddEllipse(R);
    DrawPath(Path, AOpacity, AFill, AStroke);
  finally
    Path.Free;
  end;
end;

procedure TCustomNativeCanvas.DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush; const Inside: Boolean = False);
var
  R: TRectF;
  P: TPointF;
  Path: TPathData;
begin
  R := RectF(Center.X - Radius.X, Center.Y - Radius.Y, Center.X + Radius.X, Center.Y + Radius.Y);

  // 线在区内
  if Inside and (AStroke <> nil) and (AStroke.Kind <> TBrushKind.None) then
  begin
    R.Offset(-R.Left, -R.Top);
    InflateRect(R, -(AStroke.Thickness / 2), -(AStroke.Thickness / 2));
  end;

  P := PointF(R.Width / 2, R.Height / 2);

  Path := TPathData.Create;
  try
    Path.AddArc(Center, P, StartAngle, SweepAngle);
    DrawPath(Path, AOpacity, AFill, AStroke);
  finally
    Path.Free;
  end;
end;

procedure TCustomNativeCanvas.DrawPolygon(const Points: TPolygon; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush);
var
  i: Integer;
  Path: TPathData;
  PathBreakFound: Boolean;
begin
  Path := TPathData.Create;

  try
    PathBreakFound := False;

    for i := 0 to High(Points) do
    begin
      if i = 0 then
      begin
        Path.MoveTo(Points[i]);
      end
      else if (Points[i].X = PolygonPointBreak.X) and (Points[i].Y = PolygonPointBreak.Y) then
      begin
        Path.ClosePath;
        PathBreakFound := True;
      end
      else
        Path.LineTo(Points[i]);
    end;

    if not PathBreakFound then
      Path.ClosePath;

    DrawPath(Path, AOpacity, AFill, AStroke);
  finally
    Path.Free;
  end;
end;

procedure TCustomNativeCanvas.DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ACornerType: TCornerType = TCornerType.Round);
begin
  DrawRect(ARect, XRadius, YRadius, ACorners, AOpacity, nil, FCanvas.Stroke, ACornerType);
end;

procedure TCustomNativeCanvas.DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ABrush: TStrokeBrush; const ACornerType: TCornerType = TCornerType.Round);
begin
  DrawRect(ARect, XRadius, YRadius, ACorners, AOpacity, nil, ABrush, ACornerType);
end;

procedure TCustomNativeCanvas.FillRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ACornerType: TCornerType = TCornerType.Round);
begin
  DrawRect(ARect, XRadius, YRadius, ACorners, AOpacity, FCanvas.Fill, nil, ACornerType);
end;

procedure TCustomNativeCanvas.FillRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ABrush: TBrush; const ACornerType: TCornerType = TCornerType.Round);
begin
  DrawRect(ARect, XRadius, YRadius, ACorners, AOpacity, ABrush, nil, ACornerType);
end;

procedure TCustomNativeCanvas.DrawPath(const APath: TPathData; const AOpacity: Single; const ABrush: TStrokeBrush);
begin
  DrawPath(APath, AOpacity, nil, ABrush);
end;

procedure TCustomNativeCanvas.DrawPath(const APath: TPathData; const AOpacity: Single);
begin
  DrawPath(APath, AOpacity, nil, FCanvas.Stroke);
end;

procedure TCustomNativeCanvas.FillPath(const APath: TPathData; const AOpacity: Single);
begin
  DrawPath(APath, AOpacity, FCanvas.Fill, nil);
end;

procedure TCustomNativeCanvas.FillPath(const APath: TPathData; const AOpacity: Single; const ABrush: TBrush);
begin
  DrawPath(APath, AOpacity, ABrush, nil);
end;

procedure TCustomNativeCanvas.FillEllipse(const ARect: TRectF; const AOpacity: Single);
begin
  DrawEllipse(ARect, AOpacity, FCanvas.Fill, nil);
end;

procedure TCustomNativeCanvas.FillEllipse(const ARect: TRectF; const AOpacity: Single; const ABrush: TBrush);
begin
  DrawEllipse(ARect, AOpacity, ABrush, nil);
end;

procedure TCustomNativeCanvas.DrawEllipse(const ARect: TRectF; const AOpacity: Single);
begin
  DrawEllipse(ARect, AOpacity, nil, FCanvas.Stroke);
end;

procedure TCustomNativeCanvas.DrawEllipse(const ARect: TRectF; const AOpacity: Single; const ABrush: TStrokeBrush);
begin
  DrawEllipse(ARect, AOpacity, nil, ABrush);
end;

procedure TCustomNativeCanvas.FillArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single);
begin
  DrawArc(Center, Radius, StartAngle, SweepAngle, AOpacity, FCanvas.Fill, nil);
end;

procedure TCustomNativeCanvas.FillArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single; const ABrush: TBrush);
begin
  DrawArc(Center, Radius, StartAngle, SweepAngle, AOpacity, ABrush, nil);
end;

procedure TCustomNativeCanvas.DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single);
begin
  DrawArc(Center, Radius, StartAngle, SweepAngle, AOpacity, nil, FCanvas.Stroke);
end;

procedure TCustomNativeCanvas.DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single; const ABrush: TStrokeBrush);
begin
  DrawArc(Center, Radius, StartAngle, SweepAngle, AOpacity, nil, ABrush);
end;

procedure TCustomNativeCanvas.FillPolygon(const Points: TPolygon; const AOpacity: Single);
begin
  DrawPolygon(Points, AOpacity, FCanvas.Fill, nil);
end;

procedure TCustomNativeCanvas.DrawPolygon(const Points: TPolygon; const AOpacity: Single);
begin
  DrawPolygon(Points, AOpacity, nil, FCanvas.Stroke);
end;

{$ENDIF}
{$IFDEF ANDROID}

function JBitmapToBitmap(const AImage: JBitmap): TBitmap;
var
  Surface: TBitmapSurface;
begin
  Surface := TBitmapSurface.Create;
  Result := nil;
  try
    if JBitmapToSurface(AImage, Surface) then
    begin
      Result := TBitmap.Create;
      Result.Assign(Surface);
    end;
  finally
    Surface.Free;
  end;
end;

function BitmapToJBitmap(const ABitmap: TBitmap): JBitmap;
var
  BitmapSurface: TBitmapSurface;
begin
  Assert(ABitmap <> nil);

  Result := TJBitmap.JavaClass.createBitmap(ABitmap.Width, ABitmap.Height, TJBitmap_Config.JavaClass.ARGB_8888);
  BitmapSurface := TBitmapSurface.Create;
  try
    BitmapSurface.Assign(ABitmap);
    if not SurfaceToJBitmap(BitmapSurface, Result) then
      Result := nil;
  finally
    BitmapSurface.Free;
  end;
end;

procedure TAndroidNativeCanvas.ApplyFill(const Paint1: JPaint; const ABrush: TBrush; const ARect: TRectF; const AOpacity: Single);
begin
  if (ABrush.Kind = TBrushKind.Resource) and (ABrush.Resource <> nil) and (ABrush.Resource.Brush <> nil) then
    ABrush.Assign(ABrush.Resource.Brush);

  Paint1.setStyle(TJPaint_Style.Wrap(TJPaint_Style.JavaClass.Fill));

  case ABrush.Kind of
    TBrushKind.Solid:
      Paint1.setARGB(TColorRec(ABrush.Color).A, TColorRec(ABrush.Color).B, TColorRec(ABrush.Color).G, TColorRec(ABrush.Color).R);
    TBrushKind.Gradient:
      ApplyGradient(Paint1, ABrush, ARect);
  else
    Paint1.setARGB(0, 255, 255, 255);
  end;
end;

procedure TAndroidNativeCanvas.ApplyGradient(const Paint1: JPaint; const ABrush: TBrush; const ARect: TRectF);
var
  i: Integer;
  aColors: TJavaArray<Integer>;
  aStops: TJavaArray<Single>;
  aLinearShader: JLinearGradient;
  aRadialShader: JRadialGradient;
begin
  aColors := TJavaArray<Integer>.Create(ABrush.Gradient.Points.Count);
  aStops := TJavaArray<Single>.Create(ABrush.Gradient.Points.Count);

  for i := 0 to ABrush.Gradient.Points.Count - 1 do
  begin
    aColors[ABrush.Gradient.Points.Count - 1 - i] := Integer(ABrush.Gradient.Points[i].Color);
    aStops[ABrush.Gradient.Points.Count - 1 - i] := 1 - ABrush.Gradient.Points[i].Offset;
  end;

  case ABrush.Gradient.Style of
    // 线渐层
    TGradientStyle.Linear:
      begin
        aLinearShader := TJLinearGradient.JavaClass.init(ARect.Left + ABrush.Gradient.StopPosition.X * ARect.Width, ARect.Top + ABrush.Gradient.StopPosition.Y * ARect.Height, ARect.Left + ABrush.Gradient.StartPosition.X * ARect.Width, ARect.Top + ABrush.Gradient.StartPosition.Y * ARect.Height, aColors, aStops, TJShader_TileMode.JavaClass.CLAMP);
        Paint1.setShader(aLinearShader);
        aLinearShader := nil;
      end;
    // 圆渐层
    TGradientStyle.Radial:
      begin
        aRadialShader := TJRadialGradient.JavaClass.init(ARect.CenterPoint.X, ARect.CenterPoint.Y, ARect.Width / 2, aColors, aStops, TJShader_TileMode.JavaClass.CLAMP);
        Paint1.setShader(aRadialShader);
        aRadialShader := nil;
      end;
  else
    Paint1.setShader(nil);
  end;

  FreeAndNil(aColors);
  FreeAndNil(aStops);
end;

procedure TAndroidNativeCanvas.ApplyStroke(const Paint1: JPaint; const AStroke: TStrokeBrush; const ARect: TRectF; const AOpacity: Single);
var
  i: Integer;
  Dash: TJavaArray<Single>;
begin
  if (AStroke.Kind = TBrushKind.Resource) and (AStroke.Resource <> nil) and (AStroke.Resource.Brush <> nil) then
    AStroke.Assign(AStroke.Resource.Brush);

  Paint1.setStyle(TJPaint_Style.Wrap(TJPaint_Style.JavaClass.Stroke));

  // Thickness = 0 还是有线
  if AStroke.Thickness > 0 then
  begin
    Paint1.setStrokeWidth(AStroke.Thickness);

    case AStroke.Kind of
      TBrushKind.Solid, TBrushKind.Bitmap:
        Paint1.setARGB(TColorRec(AStroke.Color).A, TColorRec(AStroke.Color).B, TColorRec(AStroke.Color).G, TColorRec(AStroke.Color).R);
      TBrushKind.Gradient:
        ApplyGradient(Paint1, AStroke, ARect);
    else
      Paint1.setARGB(0, 0, 0, 0);
    end;

    case AStroke.Cap of
      TStrokeCap.Flat:
        Paint1.setStrokeCap(TJPaint_Cap.JavaClass.BUTT);
      TStrokeCap.Round:
        Paint1.setStrokeCap(TJPaint_Cap.JavaClass.Round);
    end;

    if Length(AStroke.DashArray) > 0 then
    begin
      Dash := TJavaArray<Single>.Create(Length(AStroke.DashArray));

      for i := 0 to High(AStroke.DashArray) do
      begin
        Dash[i] := AStroke.DashArray[i] * AStroke.Thickness;
        if AStroke.Cap = TStrokeCap.Round then
        begin
          if Odd(i) then
            Dash[i] := (AStroke.DashArray[i] + 0.9) * AStroke.Thickness
          else
            Dash[i] := (AStroke.DashArray[i] - 0.9) * AStroke.Thickness;
        end;
      end;

      Paint1.setPathEffect(TJDashPathEffect.JavaClass.init(Dash, 0));
    end;

    case AStroke.Join of
      TStrokeJoin.Miter:
        Paint1.setStrokeJoin(TJPaint_Join.JavaClass.Miter);
      TStrokeJoin.Round:
        Paint1.setStrokeJoin(TJPaint_Join.JavaClass.Round);
      TStrokeJoin.Bevel:
        Paint1.setStrokeJoin(TJPaint_Join.JavaClass.Bevel);
    end;
  end
  else
    Paint1.setARGB(0, 0, 0, 0);
end;

procedure TAndroidNativeCanvas.DrawBitmap(const ABitmap: TBitmap; const SrcRect, DstRect: TRectF; const AOpacity: Single; const HighSpeed: Boolean);
var
  Paint1: JPaint;
  jb: JBitmap;
  src: JRect;
  dst: JRectF;
begin
  if GlobalCanvas = nil then
    Exit;

  Paint1 := TJPaint.Wrap(TJPaint.JavaClass.init(TJPaint.JavaClass.ANTI_ALIAS_FLAG));
  Paint1.setAlpha(Round(AOpacity * 255));

  jb := BitmapToJBitmap(ABitmap);
  src := TJRect.JavaClass.init;
  src.&set(Round(SrcRect.Left), Round(SrcRect.Top), Round(SrcRect.Right), Round(SrcRect.Bottom));
  dst := TJRectF.JavaClass.init;
  dst.&set(DstRect.Left, DstRect.Top, DstRect.Right, DstRect.Bottom);
  GlobalCanvas.DrawBitmap(jb, src, dst, Paint1);
end;

procedure TAndroidNativeCanvas.DrawFill(const Paint1: JPaint; const ABrush: TBrush; const SrcRect, DesRect: TRectF; const AOpacity: Single);
begin
  if (ABrush.Kind = TBrushKind.Resource) and (ABrush.Resource <> nil) and (ABrush.Resource.Brush <> nil) then
    ABrush.Assign(ABrush.Resource.Brush);

  if ABrush.Kind = TBrushKind.Bitmap then
  begin
    // 未完成
  end;
end;

procedure TAndroidNativeCanvas.DrawLine(const APt1, APt2: TPointF; const AOpacity: Single; const ABrush: TStrokeBrush);
var
  Paint1: JPaint;
begin
  if GlobalCanvas = nil then
    Exit;

  if ABrush.Kind <> TBrushKind.None then
  begin
    Paint1 := TJPaint.Wrap(TJPaint.JavaClass.init(TJPaint.JavaClass.ANTI_ALIAS_FLAG));
    ApplyStroke(Paint1, ABrush, TRectF.Create(APt1.X, APt1.Y, APt2.X, APt2.Y), AOpacity);
    GlobalCanvas.DrawLine(APt1.X, APt1.Y, APt2.X, APt2.Y, Paint1);
  end;
end;

procedure TAndroidNativeCanvas.DrawPath(const APath: TPathData; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush);
var
  i: Integer;
  Path1: JPath;
  Paint1: JPaint;
  SrcRect: TRectF;
begin
  Log.d('Enter TAndroidNativeCanvas.DrawPath');
  if GlobalCanvas = nil then
    Exit;

  SrcRect := APath.GetBounds;
  Path1 := TJPath.Wrap(TJPath.JavaClass.init);

  i := 0;
  while i < APath.Count do
  begin
    case APath.Points[i].Kind of
      // 移到
      TPathPointKind.MoveTo:
        Path1.MoveTo(APath.Points[i].Point.X, APath.Points[i].Point.Y);
      // 线到
      TPathPointKind.LineTo:
        Path1.LineTo(APath.Points[i].Point.X, APath.Points[i].Point.Y);
      // 曲线
      TPathPointKind.CurveTo:
        begin
          Path1.cubicTo(APath.Points[i].Point.X, APath.Points[i].Point.Y, APath.Points[i + 1].Point.X, APath.Points[i + 1].Point.Y, APath.Points[i + 2].Point.X, APath.Points[i + 2].Point.Y);
          Inc(i, 2);
        end;
      // 关闭
      TPathPointKind.Close:
        Path1.Close;
    end;
    Inc(i);
  end;

  GlobalCanvas.save;
  Paint1 := TJPaint.Wrap(TJPaint.JavaClass.init(TJPaint.JavaClass.ANTI_ALIAS_FLAG));

  if (AFill <> nil) and (AFill.Kind <> TBrushKind.None) then
  begin
    if AFill.Kind = TBrushKind.Bitmap then
    begin
      GlobalCanvas.DrawPath(Path1, Paint1);
      DrawFill(Paint1, AFill, SrcRect, SrcRect, AOpacity);
    end
    else
    begin
      Path1.setFillType(TJPath_FillType.Wrap(TJPath_FillType.JavaClass.EVEN_ODD));
      ApplyFill(Paint1, AFill, SrcRect, AOpacity);
      GlobalCanvas.DrawPath(Path1, Paint1);
    end;
  end;

  if (AStroke <> nil) and (AStroke.Kind <> TBrushKind.None) then
  begin
    ApplyStroke(Paint1, AStroke, SrcRect, AOpacity);
    GlobalCanvas.DrawPath(Path1, Paint1);
  end;

  GlobalCanvas.restore;
end;

procedure TAndroidNativeCanvas.IntersectClipRect(const ARect: TRectF);
var
  JR: JRectF;
begin
  if GlobalCanvas <> nil then
  begin
    JR := TJRectF.JavaClass.init(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom);

    GlobalCanvas.clipRect(JR, TJRegion_Op.JavaClass.INTERSECT);
  end;
end;

procedure TAndroidNativeCanvas.ExcludeClipRect(const ARect: TRectF);
var
  JR: JRectF;
begin
  if GlobalCanvas <> nil then
  begin
    JR := TJRectF.JavaClass.init(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom);

    GlobalCanvas.clipRect(JR, TJRegion_Op.JavaClass.REPLACE);
  end;
end;

procedure TAndroidNativeCanvas.NativeDraw(const ARect: TRectF; const ADrawProc: TDrawProc);
var
  Bitmap1: JBitmap;
  Paint: JPaint;
  Bitmap: TBitmap;
  ScreenService: IFMXScreenService;
  Scale1: Single;
begin
  Log.d('Enter TAndroidNativeCanvas.NativeDraw');
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, ScreenService) then
    Scale1 := ScreenService.GetScreenScale
  else
    Scale1 := 1;

  Bitmap1 := TJBitmap.JavaClass.createBitmap(Ceil(ARect.Width * Scale1), Ceil(ARect.Height * Scale1), TJBitmap_Config.JavaClass.ARGB_8888);
  GlobalCanvas := TJCanvas.JavaClass.init(Bitmap1);
  GlobalCanvas.save;
  GlobalCanvas.scale(Scale1, Scale1);

  // 透明底色
  Paint := TJPaint.Wrap(TJPaint.JavaClass.init(TJPaint.JavaClass.ANTI_ALIAS_FLAG));
  Paint.setStyle(TJPaint_Style.Wrap(TJPaint_Style.JavaClass.Fill));
  Paint.setARGB(0, 255, 255, 255);
  GlobalCanvas.DrawRect(GlobalCanvas.getClipBounds, Paint);

  // 绘图函数
  if Assigned(ADrawProc) then
    ADrawProc;

  GlobalCanvas.restore;

  // 显示
  Bitmap := JBitmapToBitmap(Bitmap1);
  FCanvas.DrawBitmap(Bitmap, RectF(0, 0, Bitmap.Width, Bitmap.Height), ARect, 1);
  FreeAndNil(Bitmap);
end;

{$ENDIF}
{$IFDEF IOS}

function PointToCGPoint(const P: TPointF): CGPoint;
begin
  Result := CGPointMake(P.X, P.Y);
end;

{ TIOSNativeCanvas }

procedure TIOSNativeCanvas.ApplyFill(const ABrush: TBrush; const ARect: TRectF; const AOpacity: Single);
var
  LColor: TAlphaColorF;
begin
  if GlobalCanvas = nil then
    Exit;

  if (ABrush.Kind = TBrushKind.Resource) and (ABrush.Resource <> nil) and (ABrush.Resource.Brush <> nil) then
    ABrush.Assign(ABrush.Resource.Brush);

  case ABrush.Kind of
    TBrushKind.Solid:
      begin
        LColor := TAlphaColorF.Create(MakeColor(ABrush.Color, AOpacity));
        CGContextSetRGBFillColor(GlobalCanvas, LColor.R, LColor.G, LColor.B, LColor.A);
      end;
  else
    CGContextSetRGBFillColor(GlobalCanvas, 0, 0, 0, 0);
  end;

  // 渐层
  if (ABrush.Kind = TBrushKind.Gradient) and (CGContextIsPathEmpty(GlobalCanvas) = 0) then
  begin
    CGContextClip(GlobalCanvas);
    ApplyGradient(ABrush, ARect);
  end;
end;

procedure TIOSNativeCanvas.ApplyGradient(const ABrush: TBrush; const ARect: TRectF);
var
  i: Integer;
  Locations: TArray<CGFloat>;
  colorSpace: CGColorSpaceRef;
  Gradient: CGGradientRef;
  colors: NSMutableArray;
  RCenter: CGPoint;
begin
  if GlobalCanvas = nil then
    Exit;

  SetLength(Locations, ABrush.Gradient.Points.Count);
  colors := TNSMutableArray.Wrap(TNSMutableArray.OCClass.arrayWithCapacity(ABrush.Gradient.Points.Count));

  for i := 0 to ABrush.Gradient.Points.Count - 1 do
  begin
    colors.addObject(AlphaColorToUIColor(ABrush.Gradient.Points[i].Color).CGColor);
    Locations[i] := ABrush.Gradient.Points[i].Offset;
  end;

  colorSpace := CGColorSpaceCreateDeviceRGB;
  Gradient := CGGradientCreateWithColors(colorSpace, (colors as ILocalObject).GetObjectID, @Locations[0]);

  case ABrush.Gradient.Style of
    // 线渐层
    TGradientStyle.Linear:
      begin
        CGContextDrawLinearGradient(GlobalCanvas, Gradient, CGPointMake(ARect.Left + ABrush.Gradient.StartPosition.X * ARect.Width, ARect.Top + ABrush.Gradient.StartPosition.Y * ARect.Height), CGPointMake(ARect.Left + ABrush.Gradient.StopPosition.X * ARect.Width, ARect.Top + ABrush.Gradient.StopPosition.Y * ARect.Height), 0);
      end;
    // 圆渐层
    TGradientStyle.Radial:
      begin
        RCenter.Create(PointF(ABrush.Gradient.RadialTransform.RotationCenter.X * ARect.Width, ABrush.Gradient.RadialTransform.RotationCenter.Y * ARect.Height) + ARect.TopLeft);
        CGContextDrawRadialGradient(GlobalCanvas, Gradient, RCenter, ARect.Width / 2, RCenter, 0, kCGGradientDrawsBeforeStartLocation or kCGGradientDrawsAfterEndLocation);
      end;
  end;

  CFRelease(colorSpace);
  CFRelease(Gradient);
end;

procedure TIOSNativeCanvas.ApplyStroke(const AStroke: TStrokeBrush; const ARect: TRectF; const AOpacity: Single);
var
  Dash: TDashArray;
  i: Integer;
  LColor: TAlphaColorF;
  R: TRectF;
begin
  if GlobalCanvas = nil then
    Exit;

  if (AStroke.Kind = TBrushKind.Resource) and (AStroke.Resource <> nil) and (AStroke.Resource.Brush <> nil) then
    AStroke.Assign(AStroke.Resource.Brush);

  case AStroke.Kind of
    TBrushKind.Solid, TBrushKind.Bitmap:
      begin
        LColor := TAlphaColorF.Create(MakeColor(AStroke.Color, AOpacity));
        CGContextSetRGBStrokeColor(GlobalCanvas, LColor.R, LColor.G, LColor.B, LColor.A);
      end;
  else
    CGContextSetRGBStrokeColor(GlobalCanvas, 0, 0, 0, 0);
  end;

  case AStroke.Cap of
    TStrokeCap.Flat:
      CGContextSetLineCap(GlobalCanvas, kCGLineCapButt);
    TStrokeCap.Round:
      CGContextSetLineCap(GlobalCanvas, kCGLineCapRound);
  end;

  if Length(AStroke.DashArray) > 0 then
  begin
    // select the proper dash array for the printer
    if FPrinter <> nil then
      if AStroke.Dash <> TStrokeDash.Custom then
        Dash := TStrokeBrush.StdDash[TStrokeBrush.TDashDevice.Printer, AStroke.Dash].DashArray
      else
        Dash := AStroke.DashArray
    else // adjust the line dashes for the screen
    begin
      SetLength(Dash, Length(AStroke.DashArray));
      for i := 0 to High(AStroke.DashArray) do
      begin
        Dash[i] := AStroke.DashArray[i] * AStroke.Thickness;
        if AStroke.Cap = TStrokeCap.Round then
        begin
          if Odd(i) then
            Dash[i] := (AStroke.DashArray[i] + 1) * AStroke.Thickness
          else
            Dash[i] := (AStroke.DashArray[i] - 1) * AStroke.Thickness;
        end;
      end;
    end;
    CGContextSetLineDash(GlobalCanvas, AStroke.DashOffset, @Dash[0], Length(AStroke.DashArray));
  end
  else
    CGContextSetLineDash(GlobalCanvas, 0, nil, 0);

  case AStroke.Join of
    TStrokeJoin.Miter:
      CGContextSetLineJoin(GlobalCanvas, kCGLineJoinMiter);

    TStrokeJoin.Round:
      CGContextSetLineJoin(GlobalCanvas, kCGLineJoinRound);

    TStrokeJoin.Bevel:
      CGContextSetLineJoin(GlobalCanvas, kCGLineJoinBevel);
  end;

  CGContextSetLineWidth(GlobalCanvas, AStroke.Thickness);

  // 渐层
  if (AStroke.Kind = TBrushKind.Gradient) and (CGContextIsPathEmpty(GlobalCanvas) = 0) then
  begin
    CGContextReplacePathWithStrokedPath(GlobalCanvas);
    CGContextClip(GlobalCanvas);
    R := ARect;
    InflateRect(R, AStroke.Thickness / 2, AStroke.Thickness / 2);
    ApplyGradient(AStroke, R);
  end;
end;

procedure TIOSNativeCanvas.DrawFill(const ABrush: TBrush; const SrcRect, DesRect: TRectF; const AOpacity: Single);
begin
  if ABrush.Kind = TBrushKind.Bitmap then
  begin
    // 未完成
  end
  else
  begin
    ApplyFill(ABrush, DesRect, AOpacity);
    CGContextEOFillPath(GlobalCanvas);
  end;
end;

procedure TIOSNativeCanvas.DrawLine(const APt1, APt2: TPointF; const AOpacity: Single; const ABrush: TStrokeBrush);
var
  R: TRectF;
begin
  if GlobalCanvas = nil then
    Exit;

  if ABrush.Kind <> TBrushKind.None then
  begin
    CGContextSaveGState(GlobalCanvas);
    CGContextBeginPath(GlobalCanvas);

    CGContextMoveToPoint(GlobalCanvas, APt1.X, APt1.Y);
    CGContextAddLineToPoint(GlobalCanvas, APt2.X, APt2.Y);

    // 加上线粗
    R := TRectF.Create(APt1.X, APt1.Y, APt2.X, APt2.Y);
    InflateRect(R, ABrush.Thickness / 2, ABrush.Thickness / 2);

    ApplyStroke(ABrush, R, AOpacity);
    CGContextStrokePath(GlobalCanvas);

    CGContextRestoreGState(GlobalCanvas);
  end;
end;

procedure TIOSNativeCanvas.DrawPath(const APath: TPathData; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush);
  procedure ShowPath;
  var
    i: Integer;
    CurvePoint1, CurvePoint2: TPointF;
  begin
    i := 0;
    while i < APath.Count do
    begin
      case APath[i].Kind of
        TPathPointKind.MoveTo:
          CGContextMoveToPoint(GlobalCanvas, APath[i].Point.X, APath[i].Point.Y);
        TPathPointKind.LineTo:
          CGContextAddLineToPoint(GlobalCanvas, APath[i].Point.X, APath[i].Point.Y);
        TPathPointKind.CurveTo:
          begin
            CurvePoint1 := APath[i].Point;
            Inc(i);
            CurvePoint2 := APath[i].Point;
            Inc(i);
            CGContextAddCurveToPoint(GlobalCanvas, CurvePoint1.X, CurvePoint1.Y, CurvePoint2.X, CurvePoint2.Y, APath[i].Point.X, APath[i].Point.Y);
          end;
        TPathPointKind.Close:
          CGContextClosePath(GlobalCanvas);
      end;

      Inc(i);
    end;
  end;

var
  SrcRect: TRectF;
begin
  if GlobalCanvas = nil then
    Exit;

  SrcRect := APath.GetBounds;

  // 涂色
  if (AFill <> nil) and (AFill.Kind <> TBrushKind.None) then
  begin
    CGContextSaveGState(GlobalCanvas);
    CGContextBeginPath(GlobalCanvas);
    ShowPath;
    DrawFill(AFill, SrcRect, SrcRect, AOpacity);
    CGContextRestoreGState(GlobalCanvas);
  end;

  // 画线
  if (AStroke <> nil) and (AStroke.Kind <> TBrushKind.None) then
  begin
    CGContextSaveGState(GlobalCanvas);
    CGContextBeginPath(GlobalCanvas);
    ShowPath;
    ApplyStroke(AStroke, SrcRect, AOpacity);
    CGContextStrokePath(GlobalCanvas);
    CGContextRestoreGState(GlobalCanvas);
  end;
end;

procedure TIOSNativeCanvas.ExcludeClipRect(const ARect: TRectF);
var
  LRect: array [0 .. 3] of CGRect;
begin
  if GlobalCanvas <> nil then
  begin
    LRect[0] := CGRectFromRect(TRectF.Create(-FWidth, -FWidth, ARect.Left, FHeight));
    LRect[1] := CGRectFromRect(TRectF.Create(ARect.Right, -FHeight, FWidth, FHeight));
    LRect[2] := CGRectFromRect(TRectF.Create(ARect.Left, -FHeight, ARect.Right, ARect.Top));
    LRect[3] := CGRectFromRect(TRectF.Create(ARect.Left, ARect.Bottom, ARect.Right, FHeight));
    CGContextClipToRects(GlobalCanvas, @LRect[0], 4);
  end;
end;

procedure TIOSNativeCanvas.IntersectClipRect(const ARect: TRectF);
begin
  if GlobalCanvas <> nil then
    CGContextClipToRect(GlobalCanvas, CGRectFromRect(ARect));
end;

procedure TIOSNativeCanvas.NativeDraw(const ARect: TRectF; const ADrawProc: TDrawProc);
var
  NativeImage: UIImage;
  PNGRepresentation: NSData;
  PNGMemoryStream: TMemoryStream;
  Bitmap: TBitmap;
begin
  NativeImage := nil;

  UIGraphicsBeginImageContextWithOptions(CGSizeMake(ARect.Width, ARect.Height), False, 0 { 目前机子Scale } );

  GlobalCanvas := UIGraphicsGetCurrentContext;

  CGContextSaveGState(GlobalCanvas);

  // 透明底色
  TUIColor.Wrap(TUIColor.OCClass.colorWithHue(0, 0, 1, 0)).setFill;
  CGContextFillRect(GlobalCanvas, CGContextGetClipBoundingBox(GlobalCanvas));

  // 绘图函数
  if Assigned(ADrawProc) then
    ADrawProc;

  CGContextRestoreGState(GlobalCanvas);

  NativeImage := TUIImage.Wrap(UIGraphicsGetImageFromCurrentImageContext);

  if Assigned(NativeImage) then
  begin
    PNGRepresentation := TNSData.Wrap(UIImagePNGRepresentation((NativeImage as ILocalObject).GetObjectID));

    if Assigned(PNGRepresentation) then
    begin
      Bitmap := TBitmap.Create(0, 0);
      PNGMemoryStream := TMemoryStream.Create;
      PNGMemoryStream.Write(PNGRepresentation.bytes^, PNGRepresentation.Length);
      Bitmap.LoadFromStream(PNGMemoryStream);
      PNGMemoryStream.Free;

      // 显示
      DrawBitmap(Bitmap, RectF(0, 0, Bitmap.Width, Bitmap.Height), ARect, 1);
      FreeAndNil(Bitmap);
    end;
  end;

  UIGraphicsEndImageContext;
end;

{$ENDIF}

end.
