unit FMX.SimpleBBCodeText;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.UIConsts,
  System.Math,
  System.Generics.Collections,
  FMX.Types,
  FMX.TextLayout,
  FMX.Graphics,
  FMX.Controls,
  FMX.Objects;

type
  TTextBlock = class
  private
    FColor: TAlphaColor;
    FFont: TFont;
    FBounds: TRectF;
    FText: string;
    FPosition: TPointF;
    procedure SetBounds(const Value: TRectF);
    procedure SetColor(const Value: TAlphaColor);
    procedure SetFont(const Value: TFont);
    procedure SetPosition(const Value: TPointF);
    procedure SetText(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Offset(xOffset, yOffset: Single);
    procedure Draw(ACanvas: TCanvas);
    property Color: TAlphaColor read FColor write SetColor;
    property Font: TFont read FFont write SetFont;
    property Position: TPointF read FPosition write SetPosition;
    property Bounds: TRectF read FBounds write SetBounds;
    property Text: string read FText write SetText;
  end;

  TFMXSimpleBBCodeText = class(TControl)
  private
    FLineSpacing: Single;
    FAutoSize: Boolean;
    FNeedUpdate: Boolean;
    FTextSettings: TTextSettings;
    FDefaultTextSettings: TTextSettings;
    FIsChanging: Boolean;
    FLines: TStrings;
    FBlockLines: TObjectList<TObjectList<TTextBlock>>;
    FColor: TAlphaColor;
    procedure SetLineSpacing(const Value: Single);
    procedure SetAutoSize(const Value: Boolean);
    function GetLines: TStrings;
    procedure SetFont(const Value: TFont);
    procedure SetLines(const Value: TStrings);
    procedure SetWordWrap(const Value: Boolean);
    function GetFont: TFont;
    function GetHorzTextAlign: TTextAlign;
    function GetTextSettings: TTextSettings;
    function GetVertTextAlign: TTextAlign;
    function GetWordWrap: Boolean;
    procedure SetHorzTextAlign(const Value: TTextAlign);
    procedure SetTextSettings(const Value: TTextSettings);
    procedure SetVertTextAlign(const Value: TTextAlign);
    procedure OnFontChanged(Sender: TObject);
    procedure OnTextChange(Sender: TObject);
    procedure CreateBBCodeTexts(ACanvas: TCanvas; fr: TRectF;
      XPos, YPos: Integer; WordWrap: Boolean; var XSize, YSize: Single;
      TextSettings: TTextSettings; Opacity, LineSpacing: Single);
    procedure SetColor(const Value: TAlphaColor);
  protected
    procedure Paint; override;
    function IsBBCode: Boolean;
    procedure BBCodeDraw;
    procedure RecreateTexts;
    procedure SetNeedUpdate;
    function GetTextSettingsClass: TTextSettingsClass; virtual;
    procedure FontChanged; virtual;
    procedure TextChanged;
    procedure Resize; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetBBText(const AText: string);
    property Font: TFont read GetFont write SetFont;
    property HorzTextAlign: TTextAlign read GetHorzTextAlign
      write SetHorzTextAlign;
    property VertTextAlign: TTextAlign read GetVertTextAlign
      write SetVertTextAlign;
    property WordWrap: Boolean read GetWordWrap write SetWordWrap;
  published
    property Align;
    property Anchors;
    property AutoSize: Boolean read FAutoSize write SetAutoSize default False;
    property ClipChildren default False;
    property ClipParent default False;
    property Color: TAlphaColor read FColor write SetColor;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled default True;
    property Height;
    property HitTest default True;
    property Lines: TStrings read GetLines write SetLines;
    property LineSpacing: Single read FLineSpacing write SetLineSpacing;
    property Locked default False;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property TextSettings: TTextSettings read GetTextSettings
      write SetTextSettings;
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
    property OnResize;
    property OnResized;
  end;

procedure register;

implementation

procedure register;
begin
  RegisterComponents('FMXComponents', [TFMXSimpleBBCodeText]);
end;

const
  TAIL_CHARS: string = '!)>,.:;?]}¡¢¡£¡ª¡¦¡§¡¨¡©¡«¡¬¡­¡¯¡¯¡±¡³¡µ¡·¡¹¡»¡½¡¿¡Ã£¡£¢£§£©£¬£®£º£»£¿£Ý£à£ü£ý¡¤';
  HEAD_CHARS: string = '(<[{¡®¡°¡²¡´¡¶¡¸¡º¡¼¡¾£¨£Û£û£®¡¤';

var
  FColorLookup: TDictionary<string, TAlphaColor>;

function HexVal(s: string): Integer;
var
  i, j: Integer;
  i1, i2: Integer;
begin
  if Length(s) < 2 then
  begin
    Result := 0;
    Exit;
  end;

  i1 := Low(s);
  i2 := i1 + 1;
  if s[i1] >= 'A' then
    i := ord(s[i1]) - ord('A') + 10
  else
    i := ord(s[i1]) - ord('0');

  if s[i2] >= 'A' then
    j := ord(s[i2]) - ord('A') + 10
  else
    j := ord(s[i2]) - ord('0');

  Result := i shl 4 + j;
end;

function Text2Color(s: string): TAlphaColor;
begin
  Result := claBlack;
  if Assigned(FColorLookup) then
    FColorLookup.TryGetValue(LowerCase(s), Result);
end;

function Hex2Color(s: string): TAlphaColor;
const
  Alpha = TAlphaColor($FF000000);
var
  r, g, b: Integer;
begin
  r := HexVal(Copy(s, 2, 2)) shl 16;
  g := HexVal(Copy(s, 4, 2)) shl 8;
  b := HexVal(Copy(s, 6, 2));
  Result := Alpha or TAlphaColor(b + g + r);
end;

function DecodeBBCode(const Value: string): string;
begin
  Result := Value;
  while Pos('&#91;', Result) > 0 do
  begin
    Result.Replace('&#91;', '[');
  end;

  while Pos('&#93;', Result) > 0 do
  begin
    Result.Replace('&#93;', '[');
  end;
end;

function EncodeBBCode(const Value: string): string;
begin
  Result := Value;
  while Pos('[', Result) > 0 do
  begin
    Result.Replace('[', '&#91;');
  end;

  while Pos(']', Result) > 0 do
  begin
    Result.Replace(']', '&#93;');
  end;
end;

function CalculateText(ACanvas: TCanvas; AValue: String; AMaxRect: TRectF;
  AWordWrap: Boolean = False): TRectF; overload;
var
  r: TRectF;
begin
  r := AMaxRect;
  ACanvas.MeasureText(r, AValue, AWordWrap, [], TTextAlign.Leading,
    TTextAlign.Leading);
  Result := r;
end;

function CalculateText(ACanvas: TCanvas; AValue: String;
  AWordWrap: Boolean = False): TRectF; overload;
begin
  Result := CalculateText(ACanvas, AValue, RectF(0, 0, 10000, 10000),
    AWordWrap);
end;

{ TTextTextSettings }

type
  TTextTextSettings = class(TTextSettings)
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

constructor TTextTextSettings.Create(const AOwner: TPersistent);
begin
  inherited;
  Trimming := TTextTrimming.None;
  WordWrap := True;
  HorzAlign := TTextAlign.Center;
  VertAlign := TTextAlign.Center;
end;

procedure TFMXSimpleBBCodeText.CreateBBCodeTexts(ACanvas: TCanvas; fr: TRectF;
  XPos, YPos: Integer; WordWrap: Boolean; var XSize, YSize: Single;
  TextSettings: TTextSettings; Opacity, LineSpacing: Single);
var
  txtHeight, txtWidth: Single;
  r: TRectF;
  OldFont: TFont;
  DrawFont: TFont;
  OldDrawFont: TFont;
  su, s: string;
  FontColor: TAlphaColor;
  OldFontColor: TAlphaColor;
  function DrawBBCodeLine(var s: string; r: TRectF; var w, h: Single;
    XPos, YPos: Integer): string;
  var
    dr: TRectF;
    TagPos: Integer;
    su, su2: string;
    WordLen, Idx: Integer;
    _tag: string;
    LineBreak: Boolean;
    res, colorStr: string;
    NewColor: TAlphaColor;
    C: Char;
    MinLength: Integer;
    txt: TText;
    line: TObjectList<TTextBlock>;
    block: TTextBlock;
    layout: TTextLayout;
  begin
    layout := TTextLayoutManager.TextLayoutByCanvas(ACanvas.ClassType)
      .Create(ACanvas);
    try
      layout.BeginUpdate;
      layout.TopLeft := PointF(0, 0);
      layout.MaxSize := PointF(10000, 10000);
      // Layout.Text := AText;
      layout.WordWrap := WordWrap;
      layout.HorizontalAlign := TTextAlign.Leading;
      layout.VerticalAlign := TTextAlign.Leading;
      layout.Font := ACanvas.Font;
      layout.Color := FontColor;
      layout.RightToLeft := False;
      layout.EndUpdate;
      Result := '';
      res := '';
      w := 0;
      LineBreak := False;
      dr := r;
      layout.Text := 'gh';
      txtHeight := layout.TextRect.Height;
      line := TObjectList<TTextBlock>.Create;
      FBlockLines.Add(line);
      while (s <> '') and (not LineBreak) do
      begin
        TagPos := Pos('[', s);
        if (TagPos > 0) then
          su := Copy(s, 1, TagPos - 1)
        else
        begin
          su := s;
        end;
        WordLen := Length(su);
        su := DecodeBBCode(su);
        if WordLen > 0 then
        begin
          dr.Bottom := dr.Top + txtHeight;
          layout.Text := su;
          txtWidth := layout.TextRect.Width;
          if (dr.Left + txtWidth) > dr.Right then
          begin
            su2 := su;
            if dr.Left <> r.Left then
              MinLength := 0
            else
              MinLength := 1;

            while (Length(su2) > MinLength) and
              ((dr.Left + txtWidth) > dr.Right) do
            begin
              C := su2.Chars[Length(su2) - 1];
              su2 := su2.Remove(Length(su2) - 1);

              if (Pos(C, TAIL_CHARS) > 0) and (Length(su2) > 1) then
                su2 := su2.Remove(Length(su2) - 1)
              else if (Length(su2) > 1) and
                (Pos(su2.Chars[su2.Length - 1], HEAD_CHARS) > 0) then
                su2 := su2.Remove(Length(su2) - 1);
              layout.Text := su2;
              txtWidth := layout.TextRect.Width;
            end;
            su := su2;
            su2 := EncodeBBCode(su2);
            WordLen := Length(su2);
            LineBreak := True;
          end;
          block := TTextBlock.Create;
          block.Color := FontColor;
          block.Font := ACanvas.Font;
          block.Bounds := dr;
          block.Text := su;
          line.Add(block);
          dr.Left := dr.Left + txtWidth;
          w := w + txtWidth;
          res := res + Copy(s, 1, WordLen);
          Delete(s, 1, WordLen);
        end;
        TagPos := Pos('[', s);
        if (TagPos = 1) and (Length(s) <= 2) then
          s := ''
        else if not LineBreak then
        begin
          TagPos := Pos(']', s);
          if TagPos > 0 then
          begin
            _tag := LowerCase(Copy(s, 1, TagPos));
            if _tag = '[b]' then
              Canvas.Font.Style := Canvas.Font.Style + [TFontStyle.fsBold]
            else if _tag = '[u]' then
              ACanvas.Font.Style := ACanvas.Font.Style +
                [TFontStyle.fsUnderline]
            else if _tag = '[i]' then
              ACanvas.Font.Style := ACanvas.Font.Style + [TFontStyle.fsItalic]
            else if _tag = '[s]' then
              ACanvas.Font.Style := ACanvas.Font.Style +
                [TFontStyle.fsStrikeOut]
            else if _tag = '[/s]' then
              ACanvas.Font.Style := ACanvas.Font.Style -
                [TFontStyle.fsStrikeOut]
            else if _tag = '[/i]' then
              ACanvas.Font.Style := ACanvas.Font.Style - [TFontStyle.fsItalic]
            else if _tag = '[/u]' then
              ACanvas.Font.Style := ACanvas.Font.Style -
                [TFontStyle.fsUnderline]
            else if _tag = '[/b]' then
              ACanvas.Font.Style := ACanvas.Font.Style - [TFontStyle.fsBold]
            else if _tag.StartsWith('[color') then
            begin
              Idx := Pos('=', _tag);
              if Idx > 0 then
              begin
                OldFontColor := ACanvas.Fill.Color;
                colorStr := Trim(Copy(s, Idx + 1, Length(_tag) - Idx - 1));
                if colorStr.StartsWith('#') then
                  NewColor := Hex2Color(colorStr)
                else
                  NewColor := Text2Color(AnsiLowerCase(colorStr));
                FontColor := NewColor;
              end;
            end
            else if _tag = '[/color]' then
            begin
              FontColor := OldFontColor;
            end;

            res := res + Copy(s, 1, TagPos);
            Delete(s, 1, TagPos);
          end
          else
            s := '';
        end;
      end;
      Result := res;
    finally
      layout.Free;
    end;
  end;

var
  FColor: TAlphaColor;
  xOffset: Single;
  line: TObjectList<TTextBlock>;
  block: TTextBlock;
  i: Integer;
begin
  OldFont := TFont.Create;
  OldFont.Assign(ACanvas.Font);
  DrawFont := TFont.Create;
  DrawFont.Assign(ACanvas.Font);
  OldDrawFont := TFont.Create;
  OldDrawFont.Assign(ACanvas.Font);

  FColor := ACanvas.Fill.Color;
  FontColor := FColor;
  OldFontColor := FColor;

  XSize := 0;
  YSize := 0;
  r := fr;
  for i := 0 to FLines.Count - 1 do
  begin
    s := FLines[i];
    while Pos('[[', s) > 0 do
    begin
      s.Replace('[[', '&#91;');
    end;

    while Pos(']]', s) > 0 do
    begin
      s.Replace(']]', '&#93;');
    end;

    while Length(s) > 0 do
    begin
      ACanvas.Font.Assign(DrawFont);
      // FontColor := DrawFontColor;

      su := DrawBBCodeLine(s, r, txtWidth, txtHeight, XPos, YPos);

      // DrawFontColor := ACanvas.Fill.Color;
      OldDrawFont.Assign(OldFont);

      if txtWidth > XSize then
        XSize := txtWidth + 2;

      xOffset := 0;
      case TextSettings.HorzAlign of
        TTextAlign.Center:
          if (r.Right - r.Left - txtWidth > 0) then
            xOffset := ((r.Right - r.Left - txtWidth) / 2);
        TTextAlign.Trailing:
          if r.Right - txtWidth > r.Left then
            xOffset := r.Right - txtWidth;
      end;
      line := FBlockLines.Last;
      for block in line do
      begin
        block.Offset(xOffset, 0);
      end;

      txtHeight := txtHeight + LineSpacing;
      r.Top := r.Top + txtHeight;
      YSize := YSize + txtHeight;
      // do not draw below bottom
      if (r.Top + txtHeight - LineSpacing > r.Bottom + 1) then
        s := '';
    end;
  end;

  if (YSize = 0) then
    YSize := CalculateText(ACanvas, 'gh').Height
  else
    YSize := YSize - LineSpacing;
  ACanvas.Font.Assign(OldFont);
  OldDrawFont.Free;
  DrawFont.Free;
  OldFont.Free;
end;

destructor TFMXSimpleBBCodeText.Destroy;
begin
  FDefaultTextSettings.Free;
  FTextSettings.Free;
  FLines.Free;
  FBlockLines.Free;
  inherited;
end;

{ TSimpleBBCodeText }

function BBTagStrip(s: string): string;
var
  i, j: Integer;
begin
  i := Pos('[', s);
  if i > 0 then
  begin
    Result := Copy(s, 1, i - 1);
    Delete(s, 1, i);
    j := Pos(']', s);
    if j > 0 then
      Delete(s, j, 1);
    Result := Result + s;
  end
  else
    Result := s;
end;

function TFMXSimpleBBCodeText.GetFont: TFont;
begin
  Result := FTextSettings.Font;
end;

function TFMXSimpleBBCodeText.GetHorzTextAlign: TTextAlign;
begin
  Result := FTextSettings.HorzAlign;
end;

function TFMXSimpleBBCodeText.GetLines: TStrings;
begin
  Result := FLines;
end;

function TFMXSimpleBBCodeText.GetTextSettings: TTextSettings;
begin
  Result := FTextSettings;
end;

function TFMXSimpleBBCodeText.GetTextSettingsClass: TTextSettingsClass;
begin
  Result := nil;
end;

function TFMXSimpleBBCodeText.GetVertTextAlign: TTextAlign;
begin
  Result := FTextSettings.VertAlign;
end;

function TFMXSimpleBBCodeText.GetWordWrap: Boolean;
begin
  Result := FTextSettings.WordWrap;
end;

procedure TFMXSimpleBBCodeText.RecreateTexts;
var
  XSize, YSize: Single;
  r: TRectF;
  ACanvas: TCanvas;
  bmp: TBitmap;
  xOffset, yOffset: Single;
  line: TObjectList<TTextBlock>;
  block: TTextBlock;
begin
  try
    bmp := TBitmap.Create(1, 1);
    try
      ACanvas := bmp.Canvas;
      ACanvas.Fill.Color := TAlphaColors.Black;
      ACanvas.Font.Assign(Font);
      r := LocalRect;
      FBlockLines.Clear;

      CreateBBCodeTexts(ACanvas, r, 0, 0, WordWrap, XSize, YSize, TextSettings,
        Opacity, LineSpacing);
      xOffset := 0;
      yOffset := 0;
      case VertTextAlign of
        TTextAlign.Center:
          yOffset := (r.Height - YSize) / 2;
        TTextAlign.Trailing:
          yOffset := r.Height - YSize;
      end;

      case HorzTextAlign of
        TTextAlign.Center:
          xOffset := (r.Width - XSize) / 2;
        TTextAlign.Trailing:
          xOffset := r.Width - XSize;
      end;
      for line in FBlockLines do
      begin
        for block in line do
        begin
          block.Offset(xOffset, yOffset);
        end;
      end;
    finally
      bmp.Free;
    end;
  except
    raise Exception.Create('RecreateTexts Error');
  end;
end;

procedure TFMXSimpleBBCodeText.Resize;
begin
  inherited;
  RecreateTexts;
end;

procedure TFMXSimpleBBCodeText.BBCodeDraw;
begin

end;

constructor TFMXSimpleBBCodeText.Create(AOwner: TComponent);
var
  LClass: TTextSettingsClass;
  sl: TStringList;
begin
  inherited;
  FBlockLines := TObjectList < TObjectList < TTextBlock >>.Create;

  sl := TStringList.Create;
  sl.OnChange := OnTextChange;
  FLines := sl;
  LClass := GetTextSettingsClass;
  if LClass = nil then
    LClass := TTextTextSettings;
  FDefaultTextSettings := LClass.Create(Self);
  FDefaultTextSettings.OnChanged := OnFontChanged;
  FTextSettings := LClass.Create(Self);
  FTextSettings.OnChanged := OnFontChanged;
  FTextSettings.BeginUpdate;
  try
    FTextSettings.IsAdjustChanged := True;
  finally
    FTextSettings.EndUpdate;
  end;
  FIsChanging := False;
end;

procedure TFMXSimpleBBCodeText.FontChanged;
begin
  if not FIsChanging then
  begin
    FIsChanging := True;
    try
      if FTextSettings.IsAdjustChanged then
        RecreateTexts;
    finally
      FIsChanging := False;
    end;
  end;
end;

function TFMXSimpleBBCodeText.IsBBCode: Boolean;
var
  s: string;
begin
  if Self.LineSpacing > 0 then
    Exit(True);
  s := Lines.Text;
  while Pos('[[', s) > 0 do
  begin
    s.Replace('[[', '&#91;');
  end;

  while Pos(']]', s) > 0 do
  begin
    s.Replace(']]', '&#93;');
  end;
  Result := (AnsiPos('[/', Lines.Text) > 0);
end;

procedure TFMXSimpleBBCodeText.OnFontChanged(Sender: TObject);
begin
  FontChanged;
end;

procedure TFMXSimpleBBCodeText.OnTextChange(Sender: TObject);
begin
  TextChanged;
end;

procedure TFMXSimpleBBCodeText.Paint;
var
  line: TObjectList<TTextBlock>;
  block: TTextBlock;
begin
  for line in FBlockLines do
    for block in line do
      block.Draw(Canvas);
end;

procedure TFMXSimpleBBCodeText.SetAutoSize(const Value: Boolean);
begin
  if FAutoSize <> Value then
  begin
    FAutoSize := Value;
    RecreateTexts;
  end;
end;

procedure TFMXSimpleBBCodeText.SetBBText(const AText: string);
begin
  if Lines.Text <> AText then
  begin
    Lines.Text := AText;
  end;
end;

procedure TFMXSimpleBBCodeText.SetColor(const Value: TAlphaColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    RecreateTexts
  end;
end;

procedure TFMXSimpleBBCodeText.SetFont(const Value: TFont);
begin
  FTextSettings.Font := Value;
end;

procedure TFMXSimpleBBCodeText.SetHorzTextAlign(const Value: TTextAlign);
begin
  FTextSettings.HorzAlign := Value;
end;

procedure TFMXSimpleBBCodeText.SetLines(const Value: TStrings);
begin
  FLines.Assign(Value);
end;

procedure TFMXSimpleBBCodeText.SetLineSpacing(const Value: Single);
begin
  if FLineSpacing <> Value then
  begin
    FLineSpacing := Value;
    RecreateTexts;
  end;
end;

procedure TFMXSimpleBBCodeText.SetNeedUpdate;
begin
  FNeedUpdate := True;
end;

procedure TFMXSimpleBBCodeText.SetTextSettings(const Value: TTextSettings);
begin
  FTextSettings := Value;
end;

procedure TFMXSimpleBBCodeText.SetVertTextAlign(const Value: TTextAlign);
begin
  FTextSettings.VertAlign := Value;
end;

procedure TFMXSimpleBBCodeText.SetWordWrap(const Value: Boolean);
begin
  FTextSettings.WordWrap := Value;
end;

procedure TFMXSimpleBBCodeText.TextChanged;
begin
  RecreateTexts;
  Repaint;
end;

{ TTextBlock }

constructor TTextBlock.Create;
begin
  FFont := TFont.Create;
end;

destructor TTextBlock.Destroy;
begin
  FFont.Free;
  inherited;
end;

procedure TTextBlock.Draw(ACanvas: TCanvas);
begin
  ACanvas.Fill.Color := FColor;
  ACanvas.Font.Assign(FFont);
  ACanvas.FillText(FBounds, FText, False, 1, [], TTextAlign.Leading,
    TTextAlign.Center);
end;

procedure TTextBlock.Offset(xOffset, yOffset: Single);
begin
  FPosition.Offset(xOffset, yOffset);
end;

procedure TTextBlock.SetBounds(const Value: TRectF);
begin
  FBounds := Value;
end;

procedure TTextBlock.SetColor(const Value: TAlphaColor);
begin
  FColor := Value;
end;

procedure TTextBlock.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TTextBlock.SetPosition(const Value: TPointF);
begin
  FPosition := Value;
end;

procedure TTextBlock.SetText(const Value: string);
begin
  FText := Value;
end;

initialization

FColorLookup := TDictionary<string, TAlphaColor>.Create;
FColorLookup.Add('aliceblue', claaliceblue);
FColorLookup.Add('antiquewhite', claantiquewhite);
FColorLookup.Add('aqua', claaqua);
FColorLookup.Add('aquamarine', claaquamarine);
FColorLookup.Add('azure', claazure);
FColorLookup.Add('beige', clabeige);
FColorLookup.Add('bisque', clabisque);
FColorLookup.Add('black', claBlack);
FColorLookup.Add('blanchedalmond', clablanchedalmond);
FColorLookup.Add('blue', clablue);
FColorLookup.Add('blueviolet', clablueviolet);
FColorLookup.Add('brown', clabrown);
FColorLookup.Add('burlywood', claburlywood);
FColorLookup.Add('cadetblue', clacadetblue);
FColorLookup.Add('chartreuse', clachartreuse);
FColorLookup.Add('chocolate', clachocolate);
FColorLookup.Add('coral', clacoral);
FColorLookup.Add('cornflowerblue', clacornflowerblue);
FColorLookup.Add('cornsilk', clacornsilk);
FColorLookup.Add('crimson', clacrimson);
FColorLookup.Add('cyan', clacyan);
FColorLookup.Add('darkblue', cladarkblue);
FColorLookup.Add('darkcyan', cladarkcyan);
FColorLookup.Add('darkgoldenrod', cladarkgoldenrod);
FColorLookup.Add('darkgray', cladarkgray);
FColorLookup.Add('darkgreen', cladarkgreen);
FColorLookup.Add('darkgrey', cladarkgrey);
FColorLookup.Add('darkkhaki', cladarkkhaki);
FColorLookup.Add('darkmagenta', cladarkmagenta);
FColorLookup.Add('darkolivegreen', cladarkolivegreen);
FColorLookup.Add('darkorange', cladarkorange);
FColorLookup.Add('darkorchid', cladarkorchid);
FColorLookup.Add('darkred', cladarkred);
FColorLookup.Add('darksalmon', cladarksalmon);
FColorLookup.Add('darkseagreen', cladarkseagreen);
FColorLookup.Add('darkslateblue', cladarkslateblue);
FColorLookup.Add('darkslategray', cladarkslategray);
FColorLookup.Add('darkslategrey', cladarkslategrey);
FColorLookup.Add('darkturquoise', cladarkturquoise);
FColorLookup.Add('darkviolet', cladarkviolet);
FColorLookup.Add('deeppink', cladeeppink);
FColorLookup.Add('deepskyblue', cladeepskyblue);
FColorLookup.Add('dimgray', cladimgray);
FColorLookup.Add('dimgrey', cladimgrey);
FColorLookup.Add('dodgerblue', cladodgerblue);
FColorLookup.Add('firebrick', clafirebrick);
FColorLookup.Add('floralwhite', clafloralwhite);
FColorLookup.Add('forestgreen', claforestgreen);
FColorLookup.Add('fuchsia', clafuchsia);
FColorLookup.Add('gainsboro', clagainsboro);
FColorLookup.Add('ghostwhite', claghostwhite);
FColorLookup.Add('gold', clagold);
FColorLookup.Add('goldenrod', clagoldenrod);
FColorLookup.Add('gray', clagray);
FColorLookup.Add('green', clagreen);
FColorLookup.Add('greenyellow', clagreenyellow);
FColorLookup.Add('grey', clagrey);
FColorLookup.Add('honeydew', clahoneydew);
FColorLookup.Add('hotpink', clahotpink);
FColorLookup.Add('indianred', claindianred);
FColorLookup.Add('indigo', claindigo);
FColorLookup.Add('ivory', claivory);
FColorLookup.Add('khaki', clakhaki);
FColorLookup.Add('lavender', clalavender);
FColorLookup.Add('lavenderblush', clalavenderblush);
FColorLookup.Add('lawngreen', clalawngreen);
FColorLookup.Add('lemonchiffon', clalemonchiffon);
FColorLookup.Add('lightblue', clalightblue);
FColorLookup.Add('lightcoral', clalightcoral);
FColorLookup.Add('lightcyan', clalightcyan);
FColorLookup.Add('lightgoldenrodyellow', clalightgoldenrodyellow);
FColorLookup.Add('lightgray', clalightgray);
FColorLookup.Add('lightgreen', clalightgreen);
FColorLookup.Add('lightgrey', clalightgrey);
FColorLookup.Add('lightpink', clalightpink);
FColorLookup.Add('lightsalmon', clalightsalmon);
FColorLookup.Add('lightseagreen', clalightseagreen);
FColorLookup.Add('lightskyblue', clalightskyblue);
FColorLookup.Add('lightslategray', clalightslategray);
FColorLookup.Add('lightslategrey', clalightslategrey);
FColorLookup.Add('lightsteelblue', clalightsteelblue);
FColorLookup.Add('lightyellow', clalightyellow);
FColorLookup.Add('lime', clalime);
FColorLookup.Add('limegreen', clalimegreen);
FColorLookup.Add('linen', clalinen);
FColorLookup.Add('magenta', clamagenta);
FColorLookup.Add('maroon', clamaroon);
FColorLookup.Add('mediumaquamarine', clamediumaquamarine);
FColorLookup.Add('mediumblue', clamediumblue);
FColorLookup.Add('mediumorchid', clamediumorchid);
FColorLookup.Add('mediumpurple', clamediumpurple);
FColorLookup.Add('mediumseagreen', clamediumseagreen);
FColorLookup.Add('mediumslateblue', clamediumslateblue);
FColorLookup.Add('mediumspringgreen', clamediumspringgreen);
FColorLookup.Add('mediumturquoise', clamediumturquoise);
FColorLookup.Add('mediumvioletred', clamediumvioletred);
FColorLookup.Add('midnightblue', clamidnightblue);
FColorLookup.Add('mintcream', clamintcream);
FColorLookup.Add('mistyrose', clamistyrose);
FColorLookup.Add('moccasin', clamoccasin);
FColorLookup.Add('navajowhite', clanavajowhite);
FColorLookup.Add('navy', clanavy);
FColorLookup.Add('oldlace', claoldlace);
FColorLookup.Add('olive', claolive);
FColorLookup.Add('olivedrab', claolivedrab);
FColorLookup.Add('orange', claorange);
FColorLookup.Add('orangered', claorangered);
FColorLookup.Add('orchid', claorchid);
FColorLookup.Add('palegoldenrod', clapalegoldenrod);
FColorLookup.Add('palegreen', clapalegreen);
FColorLookup.Add('paleturquoise', clapaleturquoise);
FColorLookup.Add('palevioletred', clapalevioletred);
FColorLookup.Add('papayawhip', clapapayawhip);
FColorLookup.Add('peachpuff', clapeachpuff);
FColorLookup.Add('peru', claperu);
FColorLookup.Add('pink', clapink);
FColorLookup.Add('plum', claplum);
FColorLookup.Add('powderblue', clapowderblue);
FColorLookup.Add('purple', clapurple);
FColorLookup.Add('red', clared);
FColorLookup.Add('rosybrown', clarosybrown);
FColorLookup.Add('royalblue', claroyalblue);
FColorLookup.Add('saddlebrown', clasaddlebrown);
FColorLookup.Add('salmon', clasalmon);
FColorLookup.Add('sandybrown', clasandybrown);
FColorLookup.Add('seagreen', claseagreen);
FColorLookup.Add('seashell', claseashell);
FColorLookup.Add('sienna', clasienna);
FColorLookup.Add('skyblue', claskyblue);
FColorLookup.Add('slateblue', claslateblue);
FColorLookup.Add('slategray', claslategray);
FColorLookup.Add('slategrey', claslategrey);
FColorLookup.Add('snow', clasnow);
FColorLookup.Add('springgreen', claspringgreen);
FColorLookup.Add('steelblue', clasteelblue);
FColorLookup.Add('violet', claviolet);
FColorLookup.Add('thistle', clathistle);
FColorLookup.Add('tan', clatan);
FColorLookup.Add('tomato', clatomato);
FColorLookup.Add('turquoise', claturquoise);
FColorLookup.Add('wheat', clawheat);
FColorLookup.Add('whitesmoke', clawhitesmoke);
FColorLookup.Add('yellowgreen', clayellowgreen);
FColorLookup.Add('yellow', clayellow);
FColorLookup.Add('white', clawhite);
FColorLookup.Add('silver', clasilver);
FColorLookup.Add('teal', clateal);

finalization

FColorLookup.Free;

end.
