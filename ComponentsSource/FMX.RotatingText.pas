// ***************************************************************************
//
// A Firemonkey Rotating Text Component be inspired by RotatingText
//    https://github.com/sdsmdg/RotatingText
//
// Copyright 2017 Ð»¶Ù (zhaoyipeng@hotmail.com)
//
// https://github.com/zhaoyipeng/FMXComponents
//
// ***************************************************************************
// version history
// 2017-10-20, v0.1.0.0 :
//
// the original license of RotatingText (https://github.com/sdsmdg/RotatingText)
// Copyright 2016-17 SDSMDG
//
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
// OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.
unit FMX.RotatingText;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Objects,
  FMX.TextLayout,
  FMX.Animation,
  FMX.Ani,
  FMX.ComponentsCommon;

type
  TRotatingDirection = (TopToBottom, BottomToTop);

  [ComponentPlatformsAttribute(TFMXPlatforms)]
  TFMXRotatingText = class(TShape)
  private
    FLayout: TTextLayout;
    FTextSettings: TTextSettings;
    FLines: TStrings;
    FUpdateDuration: Single;
    FAnimationDuration: Single;
    FCurrentLineNumber: Integer;
    FIsUpdated: Boolean;
    FAnimation: TAnimation;
    FTextHeight: Single;
    FRotatingDirection: TRotatingDirection;
    FMovingType: TInterpolationType;
    procedure SetLines(const Value: TStrings);
    function GetTextSettings: TTextSettings;
    procedure SetTextSettings(const Value: TTextSettings);
    procedure OnFontChanged(Sender: TObject);
    procedure SetAnimationDuration(const Value: Single);
    procedure SetUpdateDuration(const Value: Single);
    procedure SetCurrentLineNumber(const Value: Integer);
    procedure OnAnimation(Sender: TObject);
    procedure OnAnimationFinish(Sender: TObject);
    procedure SetRotatingDirection(const Value: TRotatingDirection);
    function GetColor: TAlphaColor;
    function GetFont: TFont;
    function GetHorzTextAlign: TTextAlign;
    function GetTrimming: TTextTrimming;
    function GetVertTextAlign: TTextAlign;
    function GetWordWrap: Boolean;
    procedure SetColor(const Value: TAlphaColor);
    procedure SetFont(const Value: TFont);
    procedure SetHorzTextAlign(const Value: TTextAlign);
    procedure SetTrimming(const Value: TTextTrimming);
    procedure SetVertTextAlign(const Value: TTextAlign);
    procedure SetWordWrap(const Value: Boolean);
    procedure SetMovingType(const Value: TInterpolationType);
  protected
    function GetTextSettingsClass: TTextSettingsClass; virtual;
    procedure FontChanged; virtual;
    function GetNextLineNumber: Integer;
    function GetPreviousLineNumber: Integer;
    function GetNextLine: string;
    function GetPreviousLine: string;
    function PeekNextLine: string;
    function PeekPreviousLine: string;
    function IsUpdated: Boolean;
    procedure SetUpdated(Value: Boolean);
    property CurrentLineNumber: Integer read FCurrentLineNumber write SetCurrentLineNumber;
    procedure Paint;override;
    procedure Resize; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Start;
    procedure Stop;
    property Font: TFont read GetFont write SetFont;
    property Color: TAlphaColor read GetColor write SetColor;
    property HorzTextAlign: TTextAlign read GetHorzTextAlign write SetHorzTextAlign;
    property Trimming: TTextTrimming read GetTrimming write SetTrimming;
    property VertTextAlign: TTextAlign read GetVertTextAlign write SetVertTextAlign;
    property WordWrap: Boolean read GetWordWrap write SetWordWrap;
  published
    property Align;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled default True;
    property Fill;
    property Locked default False;
    property Height;
    property HitTest default True;
    property Opacity;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Size;
    property Scale;
    property Visible default True;
    property Width;
    { Drag and Drop events }
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    { Mouse events }
    property OnClick;
    property OnDblClick;

    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseEnter;
    property OnMouseLeave;

    property OnPainting;
    property OnPaint;

    property Lines: TStrings read FLines write SetLines;
    property TextSettings: TTextSettings read GetTextSettings write SetTextSettings;
    property UpdateDuration: Single read FUpdateDuration write SetUpdateDuration;
    property AnimationDuration: Single read FAnimationDuration write SetAnimationDuration;
    property RotatingDirection: TRotatingDirection read FRotatingDirection write SetRotatingDirection;
    property MovingType: TInterpolationType read FMovingType write SetMovingType
      default TInterpolationType.Linear;
  end;
implementation

type
  TRotateTextTextSettings = class(TTextSettings)
  public
    constructor Create(const AOwner: TPersistent); override;
  published
    property Font;
    property FontColor;
    property Trimming default TTextTrimming.None;
    property WordWrap default True;
    property HorzAlign default TTextAlign.Center;
    property VertAlign default TTextAlign.Center;
  end;

{ TFMXRotateText }

constructor TFMXRotatingText.Create(AOwner: TComponent);
var
  LClass: TTextSettingsClass;
begin
  inherited;
  Self.ClipChildren := True;
  FUpdateDuration := 2;
  FAnimationDuration := 1;
  LClass := GetTextSettingsClass;
  if LClass = nil then
    LClass := TRotateTextTextSettings;
  FLayout := TTextLayoutManager.DefaultTextLayout.Create;
  FTextSettings := LClass.Create(Self);
  FTextSettings.OnChanged := OnFontChanged;
  FTextSettings.BeginUpdate;
  try
    FTextSettings.IsAdjustChanged := True;
    FTextSettings.Font.Size := 48;
  finally
    FTextSettings.EndUpdate;
  end;
  FLines := TStringList.Create;
  FCurrentLineNumber := 0;
  FAnimation := TFMXAnimation.Create(Self);
  FAnimation.Stored := False;
  FAnimation.Duration := FUpdateDuration;
  FAnimation.Loop := False;
  FAnimation.OnFinish := OnAnimationFinish;
  FAnimation.OnProcess := OnAnimation;
  AddObject(FAnimation);
  Fill.Color := TAlphaColors.Black;
  FRotatingDirection := TRotatingDirection.TopToBottom;
  FMovingType := TInterpolationType.Linear;
  FIsUpdated := False;
end;

destructor TFMXRotatingText.Destroy;
begin
  FTextSettings.Free;
  FLayout.Free;
  inherited;
end;

procedure TFMXRotatingText.FontChanged;
var
  R: TRectF;
  AlignRoot: IAlignRoot;
begin
  FLayout.BeginUpdate;
  try
    FLayout.WordWrap := FTextSettings.WordWrap;
    FLayout.HorizontalAlign := TTextAlign.Leading;
    FLayout.VerticalAlign := TTextAlign.Leading;
    FLayout.Color := FTextSettings.FontColor;
    FLayout.Font := FTextSettings.Font;
    FLayout.Opacity := AbsoluteOpacity;
    FLayout.Trimming := FTextSettings.Trimming;
  finally
    FLayout.EndUpdate;
  end;
  R := FLayout.TextRect;
  FTextHeight := R.Height;
  Height := R.Height + R.Top * 2;
  if Supports(Parent, IAlignRoot, AlignRoot) then
    AlignRoot.Realign;
end;

function TFMXRotatingText.GetColor: TAlphaColor;
begin
  Result := FTextSettings.FontColor;
end;

function TFMXRotatingText.GetFont: TFont;
begin
  Result := FTextSettings.Font;
end;

function TFMXRotatingText.GetHorzTextAlign: TTextAlign;
begin
  Result := FTextSettings.HorzAlign;
end;

function TFMXRotatingText.GetNextLine: string;
begin
  Result := FLines[GetNextLineNumber()];
end;

function TFMXRotatingText.GetNextLineNumber: Integer;
begin
  FCurrentLineNumber := (FCurrentLineNumber + 1) mod FLines.Count;
  Result := FCurrentLineNumber;
end;

function TFMXRotatingText.GetPreviousLine: string;
begin
  Result := FLines[GetPreviousLineNumber()];
end;

function TFMXRotatingText.GetPreviousLineNumber: Integer;
begin
  if (FCurrentLineNumber <= 0) then
    FCurrentLineNumber := FLines.Count - 1
  else
    FCurrentLineNumber := FCurrentLineNumber - 1;
  Result := FCurrentLineNumber;
end;

function TFMXRotatingText.GetTextSettings: TTextSettings;
begin
  Result := FTextSettings;
end;

function TFMXRotatingText.GetTextSettingsClass: TTextSettingsClass;
begin
  Result := nil;
end;

function TFMXRotatingText.GetTrimming: TTextTrimming;
begin
  Result := FTextSettings.Trimming;
end;

function TFMXRotatingText.GetVertTextAlign: TTextAlign;
begin
  Result := FTextSettings.VertAlign;
end;

function TFMXRotatingText.GetWordWrap: Boolean;
begin
  Result := FTextSettings.WordWrap;
end;

function TFMXRotatingText.IsUpdated: Boolean;
begin
  Result := FIsUpdated;
end;

procedure TFMXRotatingText.OnAnimation(Sender: TObject);
begin
  Repaint;
end;

procedure TFMXRotatingText.OnAnimationFinish(Sender: TObject);
begin
  GetNextLineNumber;
  Start;
end;

procedure TFMXRotatingText.OnFontChanged(Sender: TObject);
begin
  FontChanged;
end;

procedure TFMXRotatingText.Paint;
var
  CurrentLine, NextLine: string;
  R, R1, R2: TRectF;
  T: Single;
  Offset: Single;
begin
//  inherited;
  if FLines.Count > 0 then
  begin
    T := FAnimation.CurrentTime;
    if T < AnimationDuration then
      T := (1 - T / AnimationDuration)
    else
      T := 0;
    if RotatingDirection = TRotatingDirection.BottomToTop then
    begin
      T := 1 - T;
    end;
    case MovingType of
      TInterpolationType.Quadratic:
        T := InterpolateQuad(T, 0, 1, 1, TAnimationType.&In);
      TInterpolationType.Cubic:
        T := InterpolateCubic(T, 0, 1, 1, TAnimationType.&In);
      TInterpolationType.Quartic:
        T := InterpolateQuart(T, 0, 1, 1, TAnimationType.&In);
      TInterpolationType.Quintic:
        T := InterpolateQuint(T, 0, 1, 1, TAnimationType.&In);
      TInterpolationType.Sinusoidal:
        T := InterpolateSine(T, 0, 1, 1, TAnimationType.&In);
      TInterpolationType.Exponential:
        T := InterpolateExpo(T, 0, 1, 1, TAnimationType.&In);
      TInterpolationType.Circular:
        T := InterpolateCirc(T, 0, 1, 1, TAnimationType.&In);
      TInterpolationType.Elastic:
        T := InterpolateElastic(T, 0, 1, 1, 0, 0, TAnimationType.&In);
      TInterpolationType.Back:
        T := InterpolateBack(T, 0, 1, 1, 0, TAnimationType.&In);
      TInterpolationType.Bounce:
        T := InterpolateBounce(T, 0, 1, 1, TAnimationType.&In);
    end;

    Offset := -Height * T;
    CurrentLine := FLines[CurrentLineNumber];
    NextLine := PeekNextLine;
    R1 := LocalRect;
    R1.Offset(0, Offset);
    R2 := LocalRect;
    R2.Offset(0, Offset + FTextHeight);
    Canvas.Font.Assign(FTextSettings.Font);
    Canvas.Fill.Color := Color;

    if RotatingDirection = TRotatingDirection.TopToBottom then
    begin
      R := R1;
      R1 := R2;
      R2 := R;
    end;

    Canvas.FillText(R1, NextLine, False, AbsoluteOpacity, [],
      FTextSettings.HorzAlign, FTextSettings.VertAlign);
    Canvas.FillText(R2, CurrentLine, False, AbsoluteOpacity, [],
      FTextSettings.HorzAlign, FTextSettings.VertAlign);
  end;
end;

function TFMXRotatingText.PeekNextLine: string;
begin
  if (FCurrentLineNumber <= 0) then
    Result := FLines[FLines.Count - 1]
  else
    Result := FLines[FCurrentLineNumber - 1];
end;

function TFMXRotatingText.PeekPreviousLine: string;
begin

  Result := FLines[(CurrentLineNumber + 1) mod FLines.Count];
end;

procedure TFMXRotatingText.Resize;
begin
  inherited;
  FontChanged;
end;

procedure TFMXRotatingText.SetAnimationDuration(const Value: Single);
begin
  FAnimationDuration := Value;
end;

procedure TFMXRotatingText.SetColor(const Value: TAlphaColor);
begin
  FTextSettings.FontColor := Value;
end;

procedure TFMXRotatingText.SetCurrentLineNumber(const Value: Integer);
begin
  FCurrentLineNumber := Value;
end;

procedure TFMXRotatingText.SetFont(const Value: TFont);
begin
  FTextSettings.Font := Value;
end;

procedure TFMXRotatingText.SetHorzTextAlign(const Value: TTextAlign);
begin
  FTextSettings.HorzAlign := Value;
end;

procedure TFMXRotatingText.SetLines(const Value: TStrings);
begin
  FLines.Assign(Value);
end;

procedure TFMXRotatingText.SetMovingType(const Value: TInterpolationType);
begin
  FMovingType := Value;
end;

procedure TFMXRotatingText.SetRotatingDirection(const Value: TRotatingDirection);
begin
  if FRotatingDirection <> Value then
  begin
    FRotatingDirection := Value;
    FCurrentLineNumber := 0;
    FAnimation.Stop;
    FAnimation.Start;
  end;
end;

procedure TFMXRotatingText.SetTextSettings(const Value: TTextSettings);
begin
  FTextSettings.Assign(Value);
end;

procedure TFMXRotatingText.SetTrimming(const Value: TTextTrimming);
begin
  FTextSettings.Trimming := Value;
end;

procedure TFMXRotatingText.SetUpdated(Value: Boolean);
begin
  FIsUpdated := Value;
end;

procedure TFMXRotatingText.SetUpdateDuration(const Value: Single);
begin
  if FUpdateDuration <> Value then
  begin
    FUpdateDuration := Value;
    FAnimation.Duration := Value;
  end;
end;

procedure TFMXRotatingText.SetVertTextAlign(const Value: TTextAlign);
begin
  FTextSettings.VertAlign := Value;
end;

procedure TFMXRotatingText.SetWordWrap(const Value: Boolean);
begin
  FTextSettings.WordWrap := Value;
end;

procedure TFMXRotatingText.Start;
begin
  if FLines.Count > 0 then
    FAnimation.Start;
end;

procedure TFMXRotatingText.Stop;
begin
  FAnimation.Start;
end;

{ TRotateTextTextSettings }

constructor TRotateTextTextSettings.Create(const AOwner: TPersistent);
begin
  inherited;
  Trimming := TTextTrimming.None;
  WordWrap := True;
  HorzAlign := TTextAlign.Center;
  VertAlign := TTextAlign.Center;
end;

end.
