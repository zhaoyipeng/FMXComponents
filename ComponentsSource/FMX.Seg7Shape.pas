// ***************************************************************************
//
// FMXComponents: Firemonkey Opensource Components Set
//
// Segment 7 Shape Firemonkey Componet
//
// This component created by Yamasho
// The original project at: https://github.com/qa65000/Seg7ShapeFmx
// The license file is Seg7ShapeFmxLICENSE
// I port it to Rad Studio Berlin and improved the code
//
//  https://github.com/zhaoyipeng/FMXComponents
//
// ***************************************************************************
// 2017-09-16, v0.2.0.0 :
//    port to Rad Studio Berlin
//    Change the component name to TFMXSeg7Shape
//    remove segments and num properties storage

unit FMX.Seg7Shape;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Types,
  System.Rtti,
  System.UITypes,
  System.UIConsts,
  System.Math.Vectors,
  FMX.Types,
  FMX.Controls,
  FMX.Objects,
  FMX.ComponentsCommon;

type
  [ComponentPlatformsAttribute(TFMXPlatforms)]
  TFMXSeg7Shape = class(TShape)
  const
    NUM_DATA: array [0..15] of Byte = (
      $3F, $06, $5B, $4F, $66, $6D, $7D, $07, $7F, $6F, // 0..9
      $77, $7C, $39, $5E, $79, $71);                    // a..f
  private
    { Private 宣言 }
    FNum: Byte;
    FData: Byte;
    procedure SetSeg_a(const Value: Boolean);
    procedure SetSeg_b(const Value: Boolean);
    procedure SetSeg_c(const Value: Boolean);
    procedure SetSeg_d(const Value: Boolean);
    procedure SetSeg_e(const Value: Boolean);
    procedure SetSeg_f(const Value: Boolean);
    procedure SetSeg_g(const Value: Boolean);
    procedure SetNum(const Value: Byte);
    procedure SetSegmentData(const Value: Byte);
    function GetSEG_A: Boolean;
    function GetSEG_B: Boolean;
    function GetSEG_C: Boolean;
    function GetSEG_D: Boolean;
    function GetSEG_E: Boolean;
    function GetSEG_F: Boolean;
    function GetSEG_G: Boolean;
  protected
    { Protected 宣言 }
    procedure SetBit(idx: Integer; Value: Boolean);
    procedure Paint; override;
  public
    { Public 宣言 }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published 宣言 }
    property Data: Byte read FData write SetSegmentData;
    property Num: Byte read FNum write SetNum stored False;
    property SEG_A: Boolean read GetSEG_A write SetSeg_a stored False;
    property SEG_B: Boolean read GetSEG_B write SetSeg_b stored False;
    property SEG_C: Boolean read GetSEG_C write SetSeg_c stored False;
    property SEG_D: Boolean read GetSEG_D write SetSeg_d stored False;
    property SEG_E: Boolean read GetSEG_E write SetSeg_e stored False;
    property SEG_F: Boolean read GetSEG_F write SetSeg_f stored False;
    property SEG_G: Boolean read GetSEG_G write SetSeg_g stored False;
    property Fill;
    property Stroke;
    property Align;
    property Anchors;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor;
    property DragMode;
    property EnableDragHighlight;
    property Enabled;
    property Locked;
    property Height;
    property HitTest;
    property Margins;
    property Opacity;
    property Padding;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property Visible;
    property Width;
    property OnApplyStyleLookup;
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
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
    property OnResize;
  end;

implementation

constructor TFMXSeg7Shape.Create(AOwner: TComponent);
begin
  inherited;
  FNum := 8;
  FData := $7F;
  Height := 144;
  Width := 100;
end;

destructor TFMXSeg7Shape.Destroy;
begin
  inherited;
end;

function TFMXSeg7Shape.GetSEG_A: Boolean;
begin
  Result := (FData and $01) <> 0;
end;

function TFMXSeg7Shape.GetSEG_B: Boolean;
begin
  Result := (FData and $02) <> 0;
end;

function TFMXSeg7Shape.GetSEG_C: Boolean;
begin
  Result := (FData and $04) <> 0;
end;

function TFMXSeg7Shape.GetSEG_D: Boolean;
begin
  Result := (FData and $08) <> 0;
end;

function TFMXSeg7Shape.GetSEG_E: Boolean;
begin
  Result := (FData and $10) <> 0;
end;

function TFMXSeg7Shape.GetSEG_F: Boolean;
begin
  Result := (FData and $20) <> 0;
end;

function TFMXSeg7Shape.GetSEG_G: Boolean;
begin
  Result := (FData and $40) <> 0;
end;

procedure TFMXSeg7Shape.SetSeg_a(const Value: Boolean);
begin
  SetBit(0, Value);
end;

procedure TFMXSeg7Shape.SetSeg_b(const Value: Boolean);
begin
  SetBit(1, Value);
end;

procedure TFMXSeg7Shape.SetSeg_c(const Value: Boolean);
begin
  SetBit(2, Value);
end;

procedure TFMXSeg7Shape.SetSeg_d(const Value: Boolean);
begin
  SetBit(3, Value);
end;

procedure TFMXSeg7Shape.SetSeg_e(const Value: Boolean);
begin
  SetBit(4, Value);
end;

procedure TFMXSeg7Shape.SetSeg_f(const Value: Boolean);
begin
  SetBit(5, Value);
end;

procedure TFMXSeg7Shape.SetSeg_g(const Value: Boolean);
begin
  SetBit(6, Value);
end;

procedure TFMXSeg7Shape.SetBit(idx: Integer; Value: Boolean);
var
  mask: Byte;
  newData: Byte;
begin
  mask := 1 shl idx;
  newData := FData and (not mask);
  if Value then
    newData := newData or mask;
  Data := newData;
end;

procedure TFMXSeg7Shape.SetSegmentData(const Value: Byte);
var
  I: Integer;
begin
  if FData <> Value then
  begin
    FData := Value;
    FNum := $FF;
    for I := 0 to High(NUM_DATA) do
    begin
      if NUM_DATA[I] = FData then
      begin
        FNum := I;
        Break;
      end;
    end;
    Repaint;
  end;
end;

procedure TFMXSeg7Shape.SetNum(const Value: Byte);
begin
  if (FNum <> Value) and (Value in [0..15]) then
  begin
    FNum := Value;
    FData := NUM_DATA[FNum];
    Repaint;
  end;
end;

procedure TFMXSeg7Shape.Paint;
var
  Polygon: TPolygon;
  cliw, clih: Single;
  h, w, aw, ah: Single;
  dw, dh: Single;
  gw, gh: Single;
begin
  if Visible = False then
    exit;
  cliw := Width - 1;
  clih := Height - 1;

  /// / Base Point Calc //////////////////////////////////////////
  h := clih * 0.1;
  w := cliw * 0.8;

  ah := 1;
  aw := cliw * 0.1;

  gw := cliw * 0.1;
  gh := (clih - h) / 2.0;

  dw := cliw * 0.1;
  dh := clih - h;

  try
    /// /  色線設定　///////////////////////////////////////////////
    Canvas.Fill.Assign(Fill);
    Canvas.Stroke.Assign(Stroke);
    /// /////点設定 //////////////////////////////////////////////
    SetLength(Polygon, 7);
    /// ///////////// a の位置の書き込み ///////////////////////////
    if SEG_A = True then
    begin
      Polygon[0].X := aw;
      Polygon[0].Y := ah + h * 0.5;
      Polygon[1].X := aw + w * 0.2;
      Polygon[1].Y := ah;
      Polygon[2].X := aw + w * 0.8;
      Polygon[2].Y := ah;
      Polygon[3].X := aw + w;
      Polygon[3].Y := ah + h * 0.5;
      Polygon[4].X := aw + w * 0.8;
      Polygon[4].Y := ah + h;
      Polygon[5].X := aw + w * 0.2;
      Polygon[5].Y := ah + h;
      Polygon[6].X := aw;
      Polygon[6].Y := ah + h * 0.5;
      Canvas.FillPolygon(Polygon, AbsoluteOpacity);
      Canvas.DrawPolygon(Polygon, AbsoluteOpacity);
    end;
    /// ////////////// g 位置の書き込み /////////////////////////////
    if SEG_G = True then
    begin
      Polygon[0].X := gw;
      Polygon[0].Y := gh + h * 0.5;
      Polygon[1].X := gw + w * 0.2;
      Polygon[1].Y := gh;
      Polygon[2].X := gw + w * 0.8;
      Polygon[2].Y := gh;
      Polygon[3].X := gw + w;
      Polygon[3].Y := gh + h * 0.5;
      Polygon[4].X := gw + w * 0.8;
      Polygon[4].Y := gh + h;
      Polygon[5].X := gw + w * 0.2;
      Polygon[5].Y := gh + h;
      Polygon[6].X := gw;
      Polygon[6].Y := gh + h * 0.5;
      Canvas.FillPolygon(Polygon, AbsoluteOpacity);
      Canvas.DrawPolygon(Polygon, AbsoluteOpacity);
    end;
    /// ////////////// d 位置の書き込み /////////////////////////////
    if SEG_D = True then
    begin
      Polygon[0].X := dw;
      Polygon[0].Y := dh + h * 0.5;
      Polygon[1].X := dw + w * 0.2;
      Polygon[1].Y := dh;
      Polygon[2].X := dw + w * 0.8;
      Polygon[2].Y := dh;
      Polygon[3].X := dw + w;
      Polygon[3].Y := dh + h * 0.5;
      Polygon[4].X := dw + w * 0.8;
      Polygon[4].Y := dh + h;
      Polygon[5].X := dw + w * 0.2;
      Polygon[5].Y := dh + h;
      Polygon[6].X := dw;
      Polygon[6].Y := dh + h * 0.5;
      Canvas.FillPolygon(Polygon, AbsoluteOpacity);
      Canvas.DrawPolygon(Polygon, AbsoluteOpacity);
    end;

    SetLength(Polygon, 5);
    /// ////////////// b 位置の書き込み /////////////////////////////
    if SEG_B = True then
    begin
      Polygon[0].X := aw + w;
      Polygon[0].Y := ah + h * 0.5;
      Polygon[1].X := aw + w * 0.8;
      Polygon[1].Y := ah + h;
      Polygon[2].X := gw + w * 0.8;
      Polygon[2].Y := gh;
      Polygon[3].X := aw + w;
      Polygon[3].Y := gh + h * 0.5;
      Polygon[4].X := aw + w;
      Polygon[4].Y := ah + h * 0.5;
      Canvas.FillPolygon(Polygon, AbsoluteOpacity);
      Canvas.DrawPolygon(Polygon, AbsoluteOpacity);
    end;
    /// ////////////// c 位置の書き込み /////////////////////////////
    if SEG_C = True then
    begin
      Polygon[0].X := gw + w;
      Polygon[0].Y := gh + h * 0.5;
      Polygon[1].X := gw + w * 0.8;
      Polygon[1].Y := gh + h;
      Polygon[2].X := dw + w * 0.8;
      Polygon[2].Y := dh;
      Polygon[3].X := gw + w;
      Polygon[3].Y := dh + h * 0.5;
      Polygon[4].X := gw + w;
      Polygon[4].Y := gh + h * 0.5;
      Canvas.FillPolygon(Polygon, AbsoluteOpacity);
      Canvas.DrawPolygon(Polygon, AbsoluteOpacity);
    end;
    /// ////////////// f 位置の書き込み /////////////////////////////
    if SEG_F = True then
    begin
      Polygon[0].X := aw;
      Polygon[0].Y := ah + h * 0.5;
      Polygon[1].X := aw + w * 0.2;
      Polygon[1].Y := ah + h;
      Polygon[2].X := gw + w * 0.2;
      Polygon[2].Y := gh;
      Polygon[3].X := gw;
      Polygon[3].Y := gh + h * 0.5;
      Polygon[4].X := aw;
      Polygon[4].Y := ah + h * 0.5;
      Canvas.FillPolygon(Polygon, AbsoluteOpacity);
      Canvas.DrawPolygon(Polygon, AbsoluteOpacity);
    end;
    /// ////////////// e位置の書き込み /////////////////////////////
    if SEG_E = True then
    begin
      Polygon[0].X := gw;
      Polygon[0].Y := gh + h * 0.5;
      Polygon[1].X := gw + w * 0.2;
      Polygon[1].Y := gh + h;
      Polygon[2].X := dw + w * 0.2;
      Polygon[2].Y := dh;
      Polygon[3].X := dw;
      Polygon[3].Y := dh + h * 0.5;
      Polygon[4].X := gw;
      Polygon[4].Y := gh + h * 0.5;
      Canvas.FillPolygon(Polygon, AbsoluteOpacity);
      Canvas.DrawPolygon(Polygon, AbsoluteOpacity);
    end;
  finally
    inherited;
  end;
end;

end.
