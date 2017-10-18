// ***************************************************************************
//
// FMXComponents: Firemonkey Opensource Components Set
//
// TFMXCallout is a Callout component using INativeCanvas
//
// 该控件由Aone开发，本人整理收入FMXComponents
// http://www.cnblogs.com/onechen/p/7130227.html
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
//------------------------------------------------------------------------------
// 2017.10.14 Editor by Aone                                                   -
// 2017.10.14 加入顶点位置调整 CalloutPeakOffset                               -
//                                                                             -
// 本控件修改自 Delphi Berlin 10.1.2 的 TCalloutRectangle (FMX.Objects.pas)    -
//                                                                             -
// 代码说明：                                                                  -
//  1. 代码内 {+++> 代表我增加的代码                                           -
//  2. 代码内 {---> 代表我删除的代码                                           -
//  3. 未来新版 Delphi 可以自己将 {+++> {---> 移植到新版代码内                 -
//------------------------------------------------------------------------------
// http://www.cnblogs.com/onechen/                                             -
//------------------------------------------------------------------------------

unit FMX.Callout;

{$i NativeDraw.inc}

interface

{$SCOPEDENUMS ON}

uses
  System.Types, System.UITypes, System.Classes, System.Rtti, System.Messaging,
  System.SysUtils,
  FMX.Controls,
  FMX.Types,
  FMX.Objects,
  FMX.Graphics,
  FMX.Graphics.INativeCanvas,
  FMX.Graphics.NativeCanvas;

type

{ TFMXCallout }

  TFMXCallout = class(TRectangle)
  private
    FPath: TPathData;
    FFillPath: TPathData;
    FCalloutWidth: Single;
    FCalloutLength: Single;
    FCalloutPosition: TCalloutPosition;
    FCalloutOffset: Single;
{+++>}FCalloutPeakOffset: Single;
{+++>}FNativeDraw: Boolean;
    procedure SetCalloutWidth(const Value: Single);
    procedure SetCalloutLength(const Value: Single);
    procedure SetCalloutPosition(const Value: TCalloutPosition);
    procedure SetCalloutOffset(const Value: Single);
{+++>}procedure SetCalloutPeakOffset(const Value: Single);
{+++>}procedure SetNativeDraw(const Value: Boolean);
  protected
    procedure RebuildPaths;
    { inherited }
    procedure SetXRadius(const Value: Single); override;
    procedure SetYRadius(const Value: Single); override;
    procedure SetCorners(const Value: TCorners); override;
    procedure SetCornerType(const Value: TCornerType); override;
    procedure SetSides(const Value: TSides); override;
    procedure Resize; override;
    procedure Loaded; override;
    { Building Path }
    function GeTOneCalloutRect: TRectF;
    procedure AddCalloutToPath(APath: TPathData; const ARect: TRectF; const ACornerRadiuses: TSizeF);
    procedure AddRoundCornerToPath(APath: TPathData; const ARect: TRectF; const ACornerSize: TSizeF; const ACorner: TCorner);
    procedure AddRectCornerToPath(APath: TPathData; const ARect: TRectF; const ACornerSize: TSizeF; const ACorner: TCorner;
      const ASkipEmptySide: Boolean = True);
    procedure CreatePath;
    procedure CreateFillPath;
    { Painting }
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Fill;
    property CalloutWidth: Single read FCalloutWidth write SetCalloutWidth;
    property CalloutLength: Single read FCalloutLength write SetCalloutLength;
    property CalloutPosition: TCalloutPosition read FCalloutPosition  write SetCalloutPosition
      default TCalloutPosition.Top;
    property CalloutOffset: Single read FCalloutOffset write SetCalloutOffset;
{+++>}property CalloutPeakOffset: Single read FCalloutPeakOffset write SetCalloutPeakOffset;
    property Stroke;
{+++>}property NativeDraw: Boolean read FNativeDraw write SetNativeDraw;
  end;

implementation

{ TOneCallout }

procedure TFMXCallout.AddCalloutToPath(APath: TPathData; const ARect: TRectF; const ACornerRadiuses: TSizeF);
begin
  case CalloutPosition of
    TCalloutPosition.Top:
    begin
      if CalloutOffset = 0 then
      begin
        APath.LineTo(PointF(ARect.Width / 2 - CalloutWidth / 2, ARect.Top));
        APath.LineTo(PointF(ARect.Width / 2{+++>} + FCalloutPeakOffset{<+++}, ARect.Top - FCalloutLength));
        APath.LineTo(PointF(ARect.Width / 2 + CalloutWidth / 2, ARect.Top));
        APath.LineTo(PointF(ARect.Right - ACornerRadiuses.cx, ARect.Top));
      end
      else if CalloutOffset > 0 then
      begin
        APath.LineTo(PointF(ARect.Left + FCalloutOffset, ARect.Top));
        APath.LineTo(PointF(ARect.Left + FCalloutOffset + (CalloutWidth / 2){+++>} + FCalloutPeakOffset{<+++}, ARect.Top - FCalloutLength));
        APath.LineTo(PointF(ARect.Left + FCalloutOffset + CalloutWidth, ARect.Top));
        APath.LineTo(PointF(ARect.Right - ACornerRadiuses.cx, ARect.Top));
      end else
      begin
        APath.LineTo(PointF(ARect.Right - Abs(FCalloutOffset) - CalloutWidth, ARect.Top));
        APath.LineTo(PointF(ARect.Right - Abs(FCalloutOffset) - CalloutWidth / 2{+++>} + FCalloutPeakOffset{<+++}, ARect.Top - FCalloutLength));
        APath.LineTo(PointF(ARect.Right - Abs(FCalloutOffset), ARect.Top));
        APath.LineTo(PointF(ARect.Right - ACornerRadiuses.cx, ARect.Top));
      end;
    end;
    TCalloutPosition.Left:
    begin
      if CalloutOffset = 0 then
      begin
        APath.LineTo(PointF(ARect.Left, ARect.Height / 2 + CalloutWidth / 2));
        APath.LineTo(PointF(ARect.Left - FCalloutLength, (ARect.Bottom - ARect.Top) / 2{+++>} + FCalloutPeakOffset{<+++}));
        APath.LineTo(PointF(ARect.Left, ARect.Height / 2 - CalloutWidth / 2));
        APath.LineTo(PointF(ARect.Left, ARect.Top + ACornerRadiuses.cy));
      end
      else if CalloutOffset > 0 then
      begin
        APath.LineTo(PointF(ARect.Left, ARect.Top + CalloutOffset + CalloutWidth));
        APath.LineTo(PointF(ARect.Left - FCalloutLength, ARect.Top + CalloutOffset + CalloutWidth / 2{+++>} + FCalloutPeakOffset{<+++}));
        APath.LineTo(PointF(ARect.Left, ARect.Top + CalloutOffset));
        APath.LineTo(PointF(ARect.Left, ARect.Top + ACornerRadiuses.cy));
      end else
      begin
        APath.LineTo(PointF(ARect.Left, ARect.Bottom + CalloutOffset + CalloutWidth));
        APath.LineTo(PointF(ARect.Left - FCalloutLength, ARect.Bottom + CalloutOffset + CalloutWidth / 2{+++>} + FCalloutPeakOffset{<+++}));
        APath.LineTo(PointF(ARect.Left, ARect.Bottom + CalloutOffset));
        APath.LineTo(PointF(ARect.Left, ARect.Top + ACornerRadiuses.cy));
      end;
    end;
    TCalloutPosition.Bottom:
    begin
      if CalloutOffset = 0 then
      begin
        APath.LineTo(PointF(ARect.Width / 2 + CalloutWidth / 2, ARect.Bottom));
        APath.LineTo(PointF(ARect.Width / 2{+++>} + FCalloutPeakOffset{<+++}, ARect.Bottom + FCalloutLength));
        APath.LineTo(PointF(ARect.Width / 2 - CalloutWidth / 2, ARect.Bottom));
        APath.LineTo(PointF(ARect.Left + ACornerRadiuses.cx, ARect.Bottom));
      end
      else if CalloutOffset > 0 then
      begin
        APath.LineTo(PointF(ARect.Left + FCalloutOffset + CalloutWidth, ARect.Bottom));
        APath.LineTo(PointF(ARect.Left + FCalloutOffset + CalloutWidth / 2{+++>} + FCalloutPeakOffset{<+++}, ARect.Bottom + FCalloutLength));
        APath.LineTo(PointF(ARect.Left + FCalloutOffset, ARect.Bottom));
        APath.LineTo(PointF(ARect.Left + ACornerRadiuses.cx, ARect.Bottom));
      end else
      begin
        APath.LineTo(PointF(ARect.Right - Abs(FCalloutOffset), ARect.Bottom));
        APath.LineTo(PointF(ARect.Right - Abs(FCalloutOffset) - CalloutWidth / 2{+++>} + FCalloutPeakOffset{<+++}, ARect.Bottom + FCalloutLength));
        APath.LineTo(PointF(ARect.Right - Abs(FCalloutOffset) - CalloutWidth, ARect.Bottom));
        APath.LineTo(PointF(ARect.Left + ACornerRadiuses.cx, ARect.Bottom));
      end;
    end;
    TCalloutPosition.Right:
    begin
      if CalloutOffset = 0 then
      begin
        APath.LineTo(PointF(ARect.Right, ARect.Height / 2 - CalloutWidth / 2));
        APath.LineTo(PointF(ARect.Right + FCalloutLength, ARect.Height / 2{+++>} + Tag{<+++}));
        APath.LineTo(PointF(ARect.Right, ARect.Height / 2 + CalloutWidth / 2));
        APath.LineTo(PointF(ARect.Right, ARect.Bottom - ACornerRadiuses.cy));
      end
      else if CalloutOffset > 0 then
      begin
        APath.LineTo(PointF(ARect.Right, ARect.Top + CalloutOffset));
        APath.LineTo(PointF(ARect.Right + FCalloutLength, ARect.Top + CalloutOffset + CalloutWidth / 2{+++>} + Tag{<+++}));
        APath.LineTo(PointF(ARect.Right, ARect.Top + CalloutOffset + CalloutWidth));
        APath.LineTo(PointF(ARect.Right, ARect.Bottom - ACornerRadiuses.cy));
      end
      else
      begin
        APath.LineTo(PointF(ARect.Right, ARect.Bottom + CalloutOffset));
        APath.LineTo(PointF(ARect.Right + FCalloutLength, ARect.Bottom + CalloutOffset + CalloutWidth / 2{+++>} + Tag{<+++}));
        APath.LineTo(PointF(ARect.Right, ARect.Bottom + CalloutOffset + CalloutWidth));
        APath.LineTo(PointF(ARect.Right, ARect.Bottom - ACornerRadiuses.cy));
      end;
    end;
  end;
end;

procedure TFMXCallout.AddRectCornerToPath(APath: TPathData; const ARect: TRectF; const ACornerSize: TSizeF;
  const ACorner: TCorner; const ASkipEmptySide: Boolean = True);
begin
  case ACorner of
    TCorner.TopLeft:
    begin
      if (TSide.Left in Sides) or not ASkipEmptySide then
        APath.LineTo(ARect.TopLeft)
      else
        APath.MoveTo(ARect.TopLeft);
      if (TSide.Top in Sides) or not ASkipEmptySide then
        APath.LineTo(PointF(ARect.Left + ACornerSize.cx, ARect.Top))
      else
        APath.MoveTo(PointF(ARect.Left + ACornerSize.cx, ARect.Top));
    end;
    TCorner.TopRight:
    begin
      if (TSide.Top in Sides) or not ASkipEmptySide then
        APath.LineTo(PointF(ARect.Right, ARect.Top))
      else
        APath.MoveTo(PointF(ARect.Right, ARect.Top));
      if (TSide.Right in Sides) or not ASkipEmptySide then
        APath.LineTo(PointF(ARect.Right, ARect.Top + ACornerSize.cy))
      else
        APath.MoveTo(PointF(ARect.Right, ARect.Top + ACornerSize.cy));
    end;
    TCorner.BottomLeft:
    begin
      if (TSide.Bottom in Sides) or not ASkipEmptySide then
        APath.LineTo(PointF(ARect.Left, ARect.Bottom))
      else
        APath.MoveTo(PointF(ARect.Left, ARect.Bottom));
      if (TSide.Left in Sides) or not ASkipEmptySide then
        APath.LineTo(PointF(ARect.Left, ARect.Bottom - ACornerSize.cy))
      else
        APath.MoveTo(PointF(ARect.Left, ARect.Bottom - ACornerSize.cy));
    end;
    TCorner.BottomRight:
    begin
      if (TSide.Right in Sides) or not ASkipEmptySide then
        APath.LineTo(PointF(ARect.Right, ARect.Bottom))
      else
        APath.MoveTo(PointF(ARect.Right, ARect.Bottom));
      if (TSide.Bottom in Sides) or not ASkipEmptySide then
        APath.LineTo(PointF(ARect.Right - ACornerSize.cx, ARect.Bottom))
      else
        APath.MoveTo(PointF(ARect.Right - ACornerSize.cx, ARect.Bottom));
    end;
  end;
end;

procedure TFMXCallout.AddRoundCornerToPath(APath: TPathData; const ARect: TRectF; const ACornerSize: TSizeF;
  const ACorner: TCorner);
var
  x2: Single;
  y2: Single;
begin
  x2 := ACornerSize.cx / 2;
  y2 := ACornerSize.cy / 2;
  case ACorner of
    TCorner.TopLeft:
    begin
      case CornerType of
      // TCornerType.Round - default
      TCornerType.Bevel:
        APath.LineTo(PointF(ARect.Left + ACornerSize.cx, ARect.Top));
      TCornerType.InnerRound:
        APath.CurveTo(PointF(ARect.Left + x2, ARect.Top + ACornerSize.cy),
          PointF(ARect.Left + ACornerSize.cx, ARect.Top + y2), PointF(ARect.Left + ACornerSize.cx, ARect.Top));
      TCornerType.InnerLine:
        begin
          APath.LineTo(PointF(ARect.Left + x2, ARect.Top + ACornerSize.cy));
          APath.LineTo(PointF(ARect.Left + ACornerSize.cx, ARect.Top + y2));
          APath.LineTo(PointF(ARect.Left + ACornerSize.cx, ARect.Top));
        end;
      else
        APath.CurveTo(PointF(ARect.Left, ARect.Top + y2), PointF(ARect.Left + x2, ARect.Top),
          PointF(ARect.Left + ACornerSize.cx, ARect.Top))
      end;
    end;
    TCorner.TopRight:
    begin
      case CornerType of
        // TCornerType.Round - default
        TCornerType.Bevel:
          APath.LineTo(PointF(ARect.Right, ARect.Top + ACornerSize.cy));
        TCornerType.InnerRound:
          APath.CurveTo(PointF(ARect.Right - ACornerSize.cx, ARect.Top + y2),
            PointF(ARect.Right - x2, ARect.Top + ACornerSize.cy), PointF(ARect.Right, ARect.Top + ACornerSize.cy));
        TCornerType.InnerLine:
          begin
            APath.LineTo(PointF(ARect.Right - ACornerSize.cx, ARect.Top + y2));
            APath.LineTo(PointF(ARect.Right - x2, ARect.Top + ACornerSize.cy));
            APath.LineTo(PointF(ARect.Right, ARect.Top + ACornerSize.cy));
          end;
      else
        APath.CurveTo(PointF(ARect.Right - x2, ARect.Top), PointF(ARect.Right, ARect.Top + y2),
          PointF(ARect.Right, ARect.Top + ACornerSize.cy))
      end;
    end;
    TCorner.BottomLeft:
    begin
      case CornerType of
        // TCornerType.Round - default
        TCornerType.Bevel:
          APath.LineTo(PointF(ARect.Left, ARect.Bottom - ACornerSize.cy));
        TCornerType.InnerRound:
          APath.CurveTo(PointF(ARect.Left + ACornerSize.cx, ARect.Bottom - y2),
            PointF(ARect.Left + x2, ARect.Bottom -  ACornerSize.cy), PointF(ARect.Left, ARect.Bottom - ACornerSize.cy));
        TCornerType.InnerLine:
          begin
            APath.LineTo(PointF(ARect.Left +  ACornerSize.cx, ARect.Bottom - y2));
            APath.LineTo(PointF(ARect.Left + x2, ARect.Bottom - ACornerSize.cy));
            APath.LineTo(PointF(ARect.Left, ARect.Bottom - ACornerSize.cy));
          end;
      else
        APath.CurveTo(PointF(ARect.Left + x2, ARect.Bottom), PointF(ARect.Left, ARect.Bottom - y2),
          PointF(ARect.Left, ARect.Bottom - ACornerSize.cy))
      end;
    end;
    TCorner.BottomRight:
    begin
      case CornerType of
        // TCornerType.Round - default
        TCornerType.Bevel:
          APath.LineTo(PointF(ARect.Right - ACornerSize.cx, ARect.Bottom));
        TCornerType.InnerRound:
          APath.CurveTo(PointF(ARect.Right - x2, ARect.Bottom - ACornerSize.cy),
            PointF(ARect.Right - ACornerSize.cx, ARect.Bottom - y2), PointF(ARect.Right - ACornerSize.cx, ARect.Bottom));
        TCornerType.InnerLine:
          begin
            APath.LineTo(PointF(ARect.Right - x2, ARect.Bottom - ACornerSize.cy));
            APath.LineTo(PointF(ARect.Right - ACornerSize.cx, ARect.Bottom - y2));
            APath.LineTo(PointF(ARect.Right - ACornerSize.cx, ARect.Bottom));
          end;
      else
        APath.CurveTo(PointF(ARect.Right, ARect.Bottom - y2),
          PointF(ARect.Right - x2, ARect.Bottom), PointF(ARect.Right - ACornerSize.cx, ARect.Bottom))
      end;
    end;
  end;
end;

constructor TFMXCallout.Create(AOwner: TComponent);
begin
  inherited;
{+++>}FNativeDraw := True;
  FCalloutWidth := 23;
  FCalloutLength := 11;
  FPath := TPathData.Create;
  FFillPath := TPathData.Create;
  RebuildPaths;
end;

destructor TFMXCallout.Destroy;
begin
  FreeAndNil(FPath);
  FreeAndNil(FFillPath);
  inherited;
end;

function TFMXCallout.GeTOneCalloutRect: TRectF;
var
  R: TRectF;
begin
  R := GetShapeRect;
  case CalloutPosition of
    TCalloutPosition.Top:
      R.Top := R.Top + FCalloutLength;
    TCalloutPosition.Left:
      R.Left := R.Left + FCalloutLength;
    TCalloutPosition.Bottom:
      R.Bottom := R.Bottom - FCalloutLength;
    TCalloutPosition.Right:
      R.Right := R.Right - FCalloutLength;
  end;
  Result := R;
end;

procedure TFMXCallout.Loaded;
begin
  inherited Loaded;
  RebuildPaths;
end;

procedure TFMXCallout.CreateFillPath;
var
  CornerSize: TSizeF;
  R: TRectF;
begin
  R := GeTOneCalloutRect;
  CornerSize := TSizeF.Create(XRadius, YRadius);
  if (R.Width - CornerSize.cx * 2 < 0) and (CornerSize.cx > 0) then
    CornerSize.cx := XRadius * R.Width / (CornerSize.cx * 2);
  if (R.Height - CornerSize.cy * 2 < 0) and (CornerSize.cy > 0) then
    CornerSize.cy := YRadius * R.Height / (CornerSize.cy * 2);

  FFillPath.Clear;
  FFillPath.MoveTo(PointF(R.Left, R.Top + CornerSize.cy));

  // Top Left Corner
  if TCorner.TopLeft in Corners then
    AddRoundCornerToPath(FFillPath, R, CornerSize, TCorner.TopLeft)
  else
    AddRectCornerToPath(FFillPath, R, CornerSize, TCorner.TopLeft, False);

  // Top Side
  if CalloutPosition = TCalloutPosition.Top then
    AddCalloutToPath(FFillPath, R, CornerSize)
  else
    FFillPath.LineTo(PointF(R.Right - CornerSize.cx, R.Top));

  // Top Right Corner
  if TCorner.TopRight in Corners then
    AddRoundCornerToPath(FFillPath, R, CornerSize, TCorner.TopRight)
  else
    AddRectCornerToPath(FFillPath, R, CornerSize, TCorner.TopRight, False);

  // Right Side
  if (FCalloutPosition = TCalloutPosition.Right) then
    AddCalloutToPath(FFillPath, R, CornerSize)
  else
    FFillPath.LineTo(PointF(R.Right, R.Bottom - CornerSize.cy));

  // Bottom Right Corner
  if TCorner.BottomRight in Corners then
    AddRoundCornerToPath(FFillPath, R, CornerSize, TCorner.BottomRight)
  else
    AddRectCornerToPath(FFillPath, R, CornerSize, TCorner.BottomRight, False);

  // Bottom Side
  if FCalloutPosition = TCalloutPosition.Bottom then
    AddCalloutToPath(FFillPath, R, CornerSize)
  else
    FFillPath.LineTo(PointF(R.Left + CornerSize.cx, R.Bottom));

  // Bottom Left Corner
  if TCorner.BottomLeft in Corners then
    AddRoundCornerToPath(FFillPath, R, CornerSize, TCorner.BottomLeft)
  else
    AddRectCornerToPath(FFillPath, R, CornerSize, TCorner.BottomLeft, False);

  // Left Side
  if FCalloutPosition = TCalloutPosition.Left then
    AddCalloutToPath(FFillPath, R, CornerSize)
  else
    FFillPath.LineTo(PointF(R.Left, R.Top + CornerSize.cy));
end;

procedure TFMXCallout.CreatePath;
var
  CornerSize: TSizeF;
  R: TRectF;
begin
  R := GeTOneCalloutRect;
  CornerSize := TSizeF.Create(XRadius, YRadius);
  if (R.Width - CornerSize.cx * 2 < 0) and (CornerSize.cx > 0) then
    CornerSize.cx := XRadius * R.Width / (CornerSize.cx * 2);
  if (R.Height - CornerSize.cy * 2 < 0) and (CornerSize.cy > 0) then
    CornerSize.cy := YRadius * R.Height / (CornerSize.cy * 2);

  FPath.Clear;
  FPath.MoveTo(PointF(R.Left, R.Top + CornerSize.cy));

  // Top Left Corner
  if TCorner.TopLeft in Corners then
    AddRoundCornerToPath(FPath, R, CornerSize, TCorner.TopLeft)
  else
    AddRectCornerToPath(FPath, R, CornerSize, TCorner.TopLeft);

  // Top Side
  if not (TSide.Top in Sides) then
    FPath.MoveTo(PointF(R.Right - CornerSize.cx, R.Top))
  else
  begin
    if CalloutPosition = TCalloutPosition.Top then
      AddCalloutToPath(FPath, R, CornerSize)
    else
      FPath.LineTo(PointF(R.Right - CornerSize.cx, R.Top));
  end;

  // Top Right Corner
  if TCorner.TopRight in Corners then
    AddRoundCornerToPath(FPath, R, CornerSize, TCorner.TopRight)
  else
    AddRectCornerToPath(FPath, R, CornerSize, TCorner.TopRight);

  // Right Side
  if not (TSide.Right in Sides) then
    FPath.MoveTo(PointF(R.Right, R.Bottom - CornerSize.cy))
  else
  begin
    if (FCalloutPosition = TCalloutPosition.Right) then
      AddCalloutToPath(FPath, R, CornerSize)
    else
      FPath.LineTo(PointF(R.Right, R.Bottom - CornerSize.cy));
  end;

  // Bottom Right Corner
  if TCorner.BottomRight in Corners then
    AddRoundCornerToPath(FPath, R, CornerSize, TCorner.BottomRight)
  else
    AddRectCornerToPath(FPath, R, CornerSize, TCorner.BottomRight);

  // Bottom Side
  if not (TSide.Bottom in Sides) then
    FPath.MoveTo(PointF(R.Left + CornerSize.cx, R.Bottom))
  else
  begin
    if FCalloutPosition = TCalloutPosition.Bottom then
      AddCalloutToPath(FPath, R, CornerSize)
    else
      FPath.LineTo(PointF(R.Left + CornerSize.cx, R.Bottom));
  end;

  // Bottom Left Corner
  if TCorner.BottomLeft in Corners then
    AddRoundCornerToPath(FPath, R, CornerSize, TCorner.BottomLeft)
  else
    AddRectCornerToPath(FPath, R, CornerSize, TCorner.BottomLeft);

  // Left Side
  if not (TSide.Left in Sides) then
    FPath.MoveTo(PointF(R.Left, R.Top + CornerSize.cy))
  else
  begin
    if FCalloutPosition = TCalloutPosition.Left then
      AddCalloutToPath(FPath, R, CornerSize)
    else
      FPath.LineTo(PointF(R.Left, R.Top + CornerSize.cy));
  end;
end;

procedure TFMXCallout.Paint;
var
  Canvas: INativeCanvas;
  Method: TDrawMethod;
begin
  Log.d('Enter TOneCallout.Paint');
  if Self.NativeDraw then
    Method := TDrawMethod.Native
  else
    Method := TDrawMethod.Firemonkey;
  Canvas := Self.Canvas.ToNativeCanvas(Method);

  Canvas.NativeDraw(LocalRect, procedure begin // 原生繪圖 by Aone, 暱名函數裡加入繪圖方法, 內部會先畫到 Bitmap
    Canvas.FillPath(FFillPath, AbsoluteOpacity, Fill);
    Canvas.DrawPath(FPath, AbsoluteOpacity, Stroke);
  end);                                       // 原生繪圖 by Aone, 結束後會顯示這個 Bitmap
end;

procedure TFMXCallout.RebuildPaths;
begin
  if not (csReading in ComponentState) and not (csLoading in ComponentState) then
  begin
    CreatePath;
    CreateFillPath;
  end;
end;

procedure TFMXCallout.Resize;
begin
  inherited Resize;
  RebuildPaths;
end;

procedure TFMXCallout.SetCalloutWidth(const Value: Single);
begin
  if FCalloutWidth <> Value then
  begin
    FCalloutWidth := Value;
    RebuildPaths;
    Repaint;
  end;
end;

procedure TFMXCallout.SetCorners(const Value: TCorners);
begin
  if Value <> Corners then
  begin
    inherited SetCorners(Value);
    RebuildPaths;
  end;
end;

procedure TFMXCallout.SetCornerType(const Value: TCornerType);
begin
  if Value <> CornerType then
  begin
    inherited SetCornerType(Value);
    RebuildPaths;
    Repaint;
  end;
end;

{+++>}
procedure TFMXCallout.SetNativeDraw(const Value: Boolean);
begin
  if FNativeDraw <> Value then
  begin
    FNativeDraw := Value;
    Repaint;
  end;
end;
{<+++}

procedure TFMXCallout.SetSides(const Value: TSides);
begin
  if Value <> Sides then
  begin
    inherited SetSides(Value);
    RebuildPaths;
    Repaint;
  end;
end;

procedure TFMXCallout.SetXRadius(const Value: Single);
begin
  if Value <> XRadius then
  begin
    inherited SetXRadius(Value);
    RebuildPaths;
    Repaint;
  end;
end;

procedure TFMXCallout.SetYRadius(const Value: Single);
begin
  if Value <> YRadius then
  begin
    inherited SetYRadius(Value);
    RebuildPaths;
    Repaint;
  end;
end;

procedure TFMXCallout.SetCalloutLength(const Value: Single);
begin
  if FCalloutLength <> Value then
  begin
    FCalloutLength := Value;
    RebuildPaths;
    Repaint;
  end;
end;

procedure TFMXCallout.SetCalloutPosition(const Value: TCalloutPosition);
begin
  if FCalloutPosition <> Value then
  begin
    FCalloutPosition := Value;
    RebuildPaths;
    Repaint;
  end;
end;

procedure TFMXCallout.SetCalloutOffset(const Value: Single);
begin
  if FCalloutOffset <> Value then
  begin
    FCalloutOffset := Value;
    RebuildPaths;
    Repaint;
  end;
end;

{+++>}
procedure TFMXCallout.SetCalloutPeakOffset(const Value: Single);
begin
  if FCalloutPeakOffset <> Value then
  begin
    FCalloutPeakOffset := Value;
    RebuildPaths;
    Repaint;
  end;
end;
{<+++}

end.
