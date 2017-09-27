// ***************************************************************************
//
// FMXComponents: Firemonkey Opensource Components Set
//
// TFMXToast is a toast component using pure fmx
//
// 该控件参考了Aone的文章
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
// version history
// 2017-09-27, v0.1.0.0 :
//    first release

unit FMX.Toast;

interface

uses
  System.Classes,
  System.Types,
  System.UITypes,
  FMX.Types,
  FMX.Layouts,
  FMX.Objects,
  FMX.Graphics,
  FMX.Ani,
  FMX.ComponentsCommon;

type

  [ComponentPlatformsAttribute(TFMXPlatforms)]
  TFMXToast = class(TComponent)
  private
    FToastContainer: TLayout;
    FToastText: TText;
    FToastRect: TRectangle;
    FToastAnimation: TFloatAnimation;

    FToastMessage: string;
    FFontColor: TAlphaColor;
    FBackColor: TAlphaColor;
    FFontSize: Single;
    FDelay: Single;
    FIsBlock: Boolean;
    FIsShowIng: Boolean;
    FAlign: TTextAlign;
    procedure SetToastMessage(const Value: string);
    procedure SetFontColor(const Value: TAlphaColor);
    procedure SetBackColor(const Value: TAlphaColor);
    procedure SetFontSize(const Value: Single);
    procedure CreateContainer;
    procedure OnAnimationFinish(Sender: TObject);
    procedure SetDelay(const Value: Single);
    procedure SetIsBlock(const Value: Boolean);
    procedure SetAlign(const Value: TTextAlign);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Show(AOwner: TFmxObject);
  published
    property Align: TTextAlign read FAlign write SetAlign default TTextAlign.Trailing;
    property FontSize: Single read FFontSize write SetFontSize;
    property FontColor: TAlphaColor read FFontColor write SetFontColor default TAlphaColors.White;
    property BackColor: TAlphaColor read FBackColor write SetBackColor default TAlphaColors.Gray;
    property ToastMessage: string read FToastMessage write SetToastMessage;
    property Delay: Single read FDelay write SetDelay;
    property IsBlock: Boolean read FIsBlock write SetIsBlock default False;
  end;

implementation

{ TFMXToast }

constructor TFMXToast.Create(AOwner: TComponent);
begin
  inherited;
  FToastContainer := nil;
  FFontSize := 16;
  FFontColor := TAlphaColors.White;
  FBackColor := TAlphaColors.Gray;
  FDelay := 2.0;
  FToastMessage := 'Toast';
  FIsBlock := False;
  FIsShowing := False;
  FAlign := TTextAlign.Trailing;
end;

destructor TFMXToast.Destroy;
begin
  inherited;
end;

procedure TFMXToast.OnAnimationFinish(Sender: TObject);
begin
  FToastContainer.DisposeOf;
  FIsShowing := False;
end;

procedure TFMXToast.SetAlign(const Value: TTextAlign);
begin
  FAlign := Value;
end;

procedure TFMXToast.SetBackColor(const Value: TAlphaColor);
begin
  FBackColor := Value;
end;

procedure TFMXToast.SetDelay(const Value: Single);
begin
  FDelay := Value;
end;

procedure TFMXToast.SetFontColor(const Value: TAlphaColor);
begin
  FFontColor := Value;
end;

procedure TFMXToast.SetFontSize(const Value: Single);
begin
  FFontSize := Value;
end;

procedure TFMXToast.SetIsBlock(const Value: Boolean);
begin
  FIsBlock := Value;
end;

procedure TFMXToast.SetToastMessage(const Value: string);
begin
  FToastMessage := Value;
end;

procedure TFMXToast.Show(AOwner: TFmxObject);
var
  R: TRectF;
begin
  if FIsShowing then
  begin
    FToastContainer.DisposeOf;
  end;
  FIsShowing := True;
  CreateContainer;
  AOwner.AddObject(FToastContainer);
  R := RectF(0, 0, 10000, 10000);
  FToastText.Canvas.Font.Size := FFontSize;
  FToastText.Canvas.MeasureText(R, FToastMessage, False, [], TTextAlign.Leading, TTextAlign.Leading);
  FToastRect.Height := R.Height * 1.8;
  FToastRect.Width := R.Width + FToastContainer.Width - 48;

  case FAlign of
    TTextAlign.Leading:
    begin
      FToastRect.Align := TAlignLayout.Top;
      FToastRect.Margins.Top := 24;
    end;
    TTextAlign.Trailing:
    begin
      FToastRect.Align := TAlignLayout.Bottom;
      FToastRect.Margins.Bottom := 24;
    end;
    TTextAlign.Center:
      FToastRect.Align := TAlignLayout.VertCenter;
  end;
  FToastRect.Fill.Color := FBackColor;
  FToastRect.XRadius := FToastRect.Height * 0.15;
  FToastRect.YRadius := FToastRect.XRadius;

  FToastText.Color := FontColor;
  FToastText.Text := FToastMessage;
  FToastText.TextSettings.Font.Size := FontSize;

  FToastContainer.Opacity := 0;
  TAnimator.AnimateFloat(FToastContainer, 'Opacity', 1);

  FToastAnimation.Delay := FDelay;
  FToastAnimation.StartValue := 1;
  FToastAnimation.StopValue := 0;
  FToastAnimation.Start;
end;

procedure TFMXToast.CreateContainer;
begin
  FToastContainer := TLayout.Create(nil);
  FToastContainer.Align := TAlignLayout.Contents;
  FToastContainer.HitTest := FIsBlock;

  FToastRect := TRectangle.Create(FToastContainer);
  FToastRect.Stroke.Kind := TBrushKind.None;
  FToastRect.Margins.Left := 24;
  FToastRect.Margins.Right := 24;
  FToastRect.Parent := FToastContainer;
  FToastRect.CornerType := TCornerType.Round;
  FToastRect.Fill.Color := BackColor;
  FToastRect.XRadius := 16;
  FToastRect.YRadius := FToastRect.XRadius;

  FToastText := TText.Create(FToastContainer);
  FToastText.HitTest := False;
  FToastText.Align := TAlignLayout.Client;
  FToastText.TextSettings.WordWrap := False;
  FToastText.Parent := FToastRect;

  FToastAnimation := TFloatAnimation.Create(FToastContainer);
  FToastAnimation.Parent := FToastContainer;
  FToastAnimation.Duration := 0.2;
  FToastAnimation.PropertyName := 'Opacity';
  FToastAnimation.StartValue := 1.0;
  FToastAnimation.StopValue := 0.0;
  FToastAnimation.OnFinish := OnAnimationFinish;
end;

end.
