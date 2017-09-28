unit FMX.QRCode;

interface

uses
  System.Classes,
  System.Types,
  System.UITypes,
  FMX.Types,
  FMX.Controls,
  FMX.Graphics,
  FMX.Objects,
  FMX.MultiResBitmap,
  FMX.ComponentsCommon,
  DelphiZXingQRCode;

type
  [ComponentPlatformsAttribute(TFMXPlatforms)]
  TFMXQRCode = class(TControl)
  private
    FLines: TStrings;
    FNeedUpdate: Boolean;
    FForeGround: TAlphaColor;
    FBackGround: TAlphaColor;
    FQRImage: TBitmap;
    FQuietZone: Integer;
    FIcon: TImage;
    procedure SetLines(const Value: TStrings);
    function GetText: string;
    procedure SetText(const Value: string);
    procedure OnLinesChange(Sender: TObject);
    procedure Update;
    procedure SetForeGround(const Value: TAlphaColor);
    procedure SetBackGround(const Value: TAlphaColor);
    procedure CreateQRImage;
    procedure SetQuiteZone(const Value: Integer);
    function GetIconVisible: Boolean;
    procedure SetIconVisible(const Value: Boolean);
    function GetIconSize: TControlSize;
    procedure SetIconSize(const Value: TControlSize);
    function GetIconBitmap: TFixedMultiResBitmap;
    procedure SetIconBitmap(const Value: TFixedMultiResBitmap);
  protected
    procedure Paint;override;
    procedure Resize; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy;override;
    property Text: string read GetText write SetText;
  published
    property Align;
    property Anchors;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor default crDefault;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled default True;
    property Locked default False;
    property Height;
    property HitTest default True;
    property Padding;
    property Opacity;
    property Margins;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    property Visible default True;
    property Width;
    property BackGround: TAlphaColor  read FBackGround write SetBackGround default TAlphaColors.White;
    property ForeGround: TAlphaColor read FForeGround write SetForeGround default TAlphaColors.Black;
    property IconBitmap: TFixedMultiResBitmap read GetIconBitmap write SetIconBitmap;
    property IconSize: TControlSize read GetIconSize write SetIconSize;
    property IconVisible: Boolean read GetIconVisible write SetIconVisible default False;
    property Lines: TStrings read FLines write SetLines;
    property QuiteZone: Integer read FQuietZone write SetQuiteZone default 2;
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
{$IF (RTLVersion >= 32)} // Tokyo
    property OnResized;
{$ENDIF}
  end;

implementation

{ TFMXToast }

constructor TFMXQRCode.Create(AOwner: TComponent);
begin
  inherited;
  FQuietZone := 2;
  FBackGround := TAlphaColors.White;
  FForeGround := TAlphaColors.Black;
  FLines := TStringList.Create;
  FLines.Text := 'https://github.com/zhaoyipeng/FMXComponents';
  TStringList(FLines).OnChange := OnLinesChange;
  FIcon := TImage.Create(Self);
  FIcon.Parent := Self;
  FIcon.Align := TAlignLayout.Center;
  FIcon.Visible := False;
  FIcon.Stored := False;
  FIcon.Width := 48;
  FIcon.Height := 48;

  FQRImage := nil;
  FNeedUpdate := True;
  SetSize(148, 148);
end;

procedure TFMXQRCode.CreateQRImage;
var
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
  Data: TBitmapData;
begin
  if FNeedUpdate then
  begin
    if not Assigned(FQRImage) then
      FQRImage := TBitmap.Create;
    QRCode := TDelphiZXingQRCode.Create;
    try
      QRCode.Data := Text;
      QRCode.Encoding := TQRCodeEncoding.qrAuto;
      QRCode.QuietZone := FQuietZone;
      FQRImage.SetSize(QRCode.Rows, QRCode.Columns);
      FQRImage.Map(TMapAccess.Write, Data);
      try
        for Row := 0 to QRCode.Rows - 1 do
        begin
          for Column := 0 to QRCode.Columns - 1 do
          begin
            if (QRCode.IsBlack[Row, Column]) then
            begin
              Data.SetPixel(Column, Row, FForeGround);
            end
            else
            begin
              Data.SetPixel(Column, Row, FBackGround);
            end;
          end;
        end;
      finally
        FQRImage.Unmap(Data);
      end;
  finally
    QRCode.Free;
  end;
    FNeedUpdate := False;
  end;
end;

destructor TFMXQRCode.Destroy;
begin
  FQRImage.Free;
  inherited;
end;

function TFMXQRCode.GetIconBitmap: TFixedMultiResBitmap;
begin
  Result := FIcon.MultiResBitmap;
end;

function TFMXQRCode.GetIconSize: TControlSize;
begin
  Result := FIcon.Size;
end;

function TFMXQRCode.GetIconVisible: Boolean;
begin
  Result := FIcon.Visible;
end;

function TFMXQRCode.GetText: string;
begin
  Result := FLines.Text;
end;

procedure TFMXQRCode.OnLinesChange(Sender: TObject);
begin
  Update;
end;

procedure TFMXQRCode.Paint;
//var
//  Brush: TBrush;
begin
  inherited;
  CreateQRImage;
  Canvas.DrawBitmap(FQRImage,
      FQRImage.Bounds,
      RectF(0,0,Width,Height),
      AbsoluteOpacity,
      True
      );
 end;

procedure TFMXQRCode.Resize;
begin
  inherited;
  Repaint;
end;

procedure TFMXQRCode.SetBackGround(const Value: TAlphaColor);
begin
  if FBackGround <> Value then
  begin
    FBackGround := Value;
    Update;
  end;
end;

procedure TFMXQRCode.SetForeGround(const Value: TAlphaColor);
begin
  if FForeGround <> Value then
  begin
    FForeGround := Value;
    Update;
  end;
end;

procedure TFMXQRCode.SetIconBitmap(const Value: TFixedMultiResBitmap);
begin
  FIcon.MultiResBitmap := Value;
end;

procedure TFMXQRCode.SetIconSize(const Value: TControlSize);
begin
  FIcon.Size := Value;
end;

procedure TFMXQRCode.SetIconVisible(const Value: Boolean);
begin
  FIcon.Visible := Value;
end;

procedure TFMXQRCode.SetLines(const Value: TStrings);
begin
  FLines.Assign(Value);
end;

procedure TFMXQRCode.SetQuiteZone(const Value: Integer);
begin
  if FQuietZone <> Value then
  begin
    FQuietZone := Value;
    Update;
  end;
end;

procedure TFMXQRCode.SetText(const Value: string);
begin
  FLines.Text := Value;
end;

procedure TFMXQRCode.Update;
begin
  FNeedUpdate := True;
  Repaint;
end;

end.
