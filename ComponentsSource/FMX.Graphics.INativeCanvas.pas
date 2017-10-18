unit FMX.Graphics.INativeCanvas;

interface

uses
  System.Types,
  System.UITypes,
  System.Math.Vectors,
  FMX.Types,
  FMX.Graphics;

type
  TDrawProc = reference to procedure;

  TDrawMethod = (Native, Firemonkey);

  INativeCanvas = interface
    function GetCanvas: TCanvas;

    procedure NativeDraw(const ARect: TRectF; const ADrawProc: TDrawProc);

    { aligning }
    function AlignToPixel(const Value: TPointF): TPointF; overload;
    function AlignToPixel(const Rect: TRectF): TRectF; overload;
    function AlignToPixelVertically(const Value: Single): Single;
    function AlignToPixelHorizontally(const Value: Single): Single;

    // 涂色 + 线色一次完成
    procedure DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush; const ACornerType: TCornerType = TCornerType.Round; const Inside: Boolean = False); overload;
    procedure DrawPath(const APath: TPathData; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush); overload;
    procedure DrawEllipse(const ARect: TRectF; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush; const Inside: Boolean = False); overload;
    procedure DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush; const Inside: Boolean = False); overload;
    procedure DrawPolygon(const Points: TPolygon; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush); overload;

    // 下列为 Canvas 原有函数
    procedure DrawBitmap(const ABitmap: TBitmap; const SrcRect, DstRect: TRectF; const AOpacity: Single; const HighSpeed: Boolean = False);
    procedure FillText(const ARect: TRectF; const AText: string; const WordWrap: Boolean; const AOpacity: Single; const Flags: TFillTextFlags; const ATextAlign: TTextAlign; const AVTextAlign: TTextAlign = TTextAlign.Center);

    procedure DrawLine(const APt1, APt2: TPointF; const AOpacity: Single); overload;
    procedure DrawLine(const APt1, APt2: TPointF; const AOpacity: Single; const ABrush: TStrokeBrush); overload;

    procedure FillRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ACornerType: TCornerType = TCornerType.Round); overload;
    procedure FillRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ABrush: TBrush; const ACornerType: TCornerType = TCornerType.Round); overload;
    procedure DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ACornerType: TCornerType = TCornerType.Round); overload;
    procedure DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ABrush: TStrokeBrush; const ACornerType: TCornerType = TCornerType.Round); overload;

    procedure FillPath(const APath: TPathData; const AOpacity: Single); overload;
    procedure FillPath(const APath: TPathData; const AOpacity: Single; const ABrush: TBrush); overload;
    procedure DrawPath(const APath: TPathData; const AOpacity: Single); overload;
    procedure DrawPath(const APath: TPathData; const AOpacity: Single; const ABrush: TStrokeBrush); overload;

    procedure FillEllipse(const ARect: TRectF; const AOpacity: Single); overload;
    procedure FillEllipse(const ARect: TRectF; const AOpacity: Single; const ABrush: TBrush); overload;
    procedure DrawEllipse(const ARect: TRectF; const AOpacity: Single); overload;
    procedure DrawEllipse(const ARect: TRectF; const AOpacity: Single; const ABrush: TStrokeBrush); overload;

    procedure FillArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single); overload;
    procedure FillArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single; const ABrush: TBrush); overload;
    procedure DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single); overload;
    procedure DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single; const ABrush: TStrokeBrush); overload;

    procedure FillPolygon(const Points: TPolygon; const AOpacity: Single); overload;
    procedure DrawPolygon(const Points: TPolygon; const AOpacity: Single); overload;

    procedure IntersectClipRect(const ARect: TRectF); overload;
    procedure ExcludeClipRect(const ARect: TRectF); overload;

    function GetScale: Single;
    function GetMatrix: TMatrix;
    function GetStroke: TStrokeBrush;
    function GetFill: TBrush;
    function GetFont: TFont;
    procedure SetFill(const Value: TBrush);
    property Scale: Single read GetScale;
    property Matrix: TMatrix read GetMatrix;
    property Stroke: TStrokeBrush read GetStroke;
    property Fill: TBrush read GetFill write SetFill;
    property Font: TFont read GetFont;
  end;

  TAbstractCanvas = class(TInterfacedObject, INativeCanvas)
  protected
    FCanvas: TCanvas;
  public
    constructor Create(ACanvas: TCanvas);
    function GetCanvas: TCanvas;
    procedure NativeDraw(const ARect: TRectF; const ADrawProc: TDrawProc); virtual; abstract;

    procedure DrawBitmap(const ABitmap: TBitmap; const SrcRect, DstRect: TRectF; const AOpacity: Single; const HighSpeed: Boolean = False); virtual; abstract;
    procedure FillText(const ARect: TRectF; const AText: string; const WordWrap: Boolean; const AOpacity: Single; const Flags: TFillTextFlags; const ATextAlign: TTextAlign; const AVTextAlign: TTextAlign = TTextAlign.Center); virtual; abstract;

    // 涂色 + 线色一次完成
    procedure DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush; const ACornerType: TCornerType = TCornerType.Round; const Inside: Boolean = False); overload; virtual; abstract;
    procedure DrawPath(const APath: TPathData; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush); overload; virtual; abstract;
    procedure DrawEllipse(const ARect: TRectF; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush; const Inside: Boolean = False); overload; virtual; abstract;
    procedure DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush; const Inside: Boolean = False); overload; virtual; abstract;
    procedure DrawPolygon(const Points: TPolygon; const AOpacity: Single; const AFill: TBrush; const AStroke: TStrokeBrush); overload; virtual; abstract;

    // 下列为 Canvas 原有函数
    { aligning }
    function AlignToPixel(const Value: TPointF): TPointF; overload; inline;
    function AlignToPixel(const Rect: TRectF): TRectF; overload; inline;
    function AlignToPixelVertically(const Value: Single): Single; inline;
    function AlignToPixelHorizontally(const Value: Single): Single; inline;

    procedure DrawLine(const APt1, APt2: TPointF; const AOpacity: Single); overload; virtual; abstract;
    procedure DrawLine(const APt1, APt2: TPointF; const AOpacity: Single; const ABrush: TStrokeBrush); overload; virtual; abstract;

    procedure FillRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ACornerType: TCornerType = TCornerType.Round); overload; virtual; abstract;
    procedure FillRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ABrush: TBrush; const ACornerType: TCornerType = TCornerType.Round); overload; virtual; abstract;
    procedure DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ACornerType: TCornerType = TCornerType.Round); overload; virtual; abstract;
    procedure DrawRect(const ARect: TRectF; const XRadius, YRadius: Single; const ACorners: TCorners; const AOpacity: Single; const ABrush: TStrokeBrush; const ACornerType: TCornerType = TCornerType.Round); overload; virtual; abstract;

    procedure FillPath(const APath: TPathData; const AOpacity: Single); overload; virtual; abstract;
    procedure FillPath(const APath: TPathData; const AOpacity: Single; const ABrush: TBrush); overload; virtual; abstract;
    procedure DrawPath(const APath: TPathData; const AOpacity: Single); overload; virtual; abstract;
    procedure DrawPath(const APath: TPathData; const AOpacity: Single; const ABrush: TStrokeBrush); overload; virtual; abstract;

    procedure FillEllipse(const ARect: TRectF; const AOpacity: Single); overload; virtual; abstract;
    procedure FillEllipse(const ARect: TRectF; const AOpacity: Single; const ABrush: TBrush); overload; virtual; abstract;
    procedure DrawEllipse(const ARect: TRectF; const AOpacity: Single); overload; virtual; abstract;
    procedure DrawEllipse(const ARect: TRectF; const AOpacity: Single; const ABrush: TStrokeBrush); overload; virtual; abstract;

    procedure FillArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single); overload; virtual; abstract;
    procedure FillArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single; const ABrush: TBrush); overload; virtual; abstract;
    procedure DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single); overload; virtual; abstract;
    procedure DrawArc(const Center, Radius: TPointF; StartAngle, SweepAngle: Single; const AOpacity: Single; const ABrush: TStrokeBrush); overload; virtual; abstract;

    procedure FillPolygon(const Points: TPolygon; const AOpacity: Single); virtual; abstract;
    procedure DrawPolygon(const Points: TPolygon; const AOpacity: Single); overload; virtual; abstract;

    procedure IntersectClipRect(const ARect: TRectF); virtual; abstract;
    procedure ExcludeClipRect(const ARect: TRectF); virtual; abstract;

    function GetScale: Single; inline;
    function GetMatrix: TMatrix; inline;
    function GetStroke: TStrokeBrush; inline;
    function GetFill: TBrush; inline;
    procedure SetFill(const Value: TBrush); inline;
    function GetFont: TFont; inline;
    function GetWidth: Integer; inline;
    function GetHeight: Integer; inline;
    property Scale: Single read GetScale;
    property Matrix: TMatrix read GetMatrix;
    property Stroke: TStrokeBrush read GetStroke;
    property Fill: TBrush read GetFill write SetFill;
    property Font: TFont read GetFont;
    property Width: Integer read GetWidth;
    property Height: Integer read GetHeight;
  end;

implementation

{ TAbstractCanvas }

function TAbstractCanvas.AlignToPixel(const Value: TPointF): TPointF;
begin
  Result := FCanvas.AlignToPixel(Value);
end;

function TAbstractCanvas.AlignToPixel(const Rect: TRectF): TRectF;
begin

end;

function TAbstractCanvas.AlignToPixelHorizontally(const Value: Single): Single;
begin

end;

function TAbstractCanvas.AlignToPixelVertically(const Value: Single): Single;
begin

end;

constructor TAbstractCanvas.Create(ACanvas: TCanvas);
begin
  FCanvas := ACanvas;
end;

function TAbstractCanvas.GetCanvas: TCanvas;
begin
  Result := FCanvas;
end;

function TAbstractCanvas.GetFill: TBrush;
begin
  Result := FCanvas.Fill;
end;

function TAbstractCanvas.GetFont: TFont;
begin
  Result := FCanvas.Font;
end;

function TAbstractCanvas.GetHeight: Integer;
begin
  Result := FCanvas.Height;
end;

function TAbstractCanvas.GetMatrix: TMatrix;
begin
  Result := FCanvas.Matrix;
end;

function TAbstractCanvas.GetScale: Single;
begin
  Result := FCanvas.Scale;
end;

function TAbstractCanvas.GetStroke: TStrokeBrush;
begin
  Result := FCanvas.Stroke;
end;

function TAbstractCanvas.GetWidth: Integer;
begin
  Result := FCanvas.Width;
end;

procedure TAbstractCanvas.SetFill(const Value: TBrush);
begin
  FCanvas.Fill := Value;
end;

end.
