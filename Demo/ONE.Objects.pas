//------------------------------------------------------------------------------
// 2016.07.19 Editor by Aone                                                   -
// 2016.10.11 修正等比问题                                                     -
//                                                                             -
// 本控件修改自 Delphi Berlin 10.1 的 TSelection (FMX.Controls.pas)            -
//                                                                             -
// 修改重点：                                                                  -
//  1. 移动点显示在上方                                                        -
//  2. 增加（左中，上中，右中，下中）控制点，含原来的总共有 8 个控制点         -
//                                                                             -
// 代码说明：                                                                  -
//  1. 代码内 {+++> 代表我增加的代码                                           -
//  2. 代码内 {---> 代表我删除的代码                                           -
//  3. 未来新版 Delphi 可以自己将 {+++> {---> 移植到新版代码内                 -
//  4. 本控件不含 Register; 若需要请自行加入                                   -
//------------------------------------------------------------------------------
// http://www.cnblogs.com/onechen/                                             -
//------------------------------------------------------------------------------

unit ONE.Objects;

interface

uses
  System.Classes, System.Types, System.UITypes, System.SysUtils,
{+++>}System.Math,
  System.UIConsts, System.Math.Vectors, FMX.Types, FMX.Graphics, FMX.Controls;

type
{ TOneSelection }

  TOneSelection = class(TControl)
  public const
    DefaultColor = $FF1072C5;
  public type
    TGrabHandle = (None, LeftTop, RightTop, LeftBottom, RightBottom{+++>}, CenterLeft, CenterTop, CenterRight, CenterBottom{<+++});
  private
    FParentBounds: Boolean;
    FOnChange: TNotifyEvent;
    FHideSelection: Boolean;
    FMinSize: Integer;
    FOnTrack: TNotifyEvent;
    FProportional: Boolean;
    FGripSize: Single;
    FRatio: Single;
    FActiveHandle: TGrabHandle;
    FHotHandle: TGrabHandle;
    FDownPos: TPointF;
    FShowHandles: Boolean;
    FColor: TAlphaColor;
    procedure SetHideSelection(const Value: Boolean);
    procedure SetMinSize(const Value: Integer);
    procedure SetGripSize(const Value: Single);
    procedure ResetInSpace(const ARotationPoint: TPointF; ASize: TPointF);
    function GetProportionalSize(const ASize: TPointF): TPointF;
    function GetHandleForPoint(const P: TPointF): TGrabHandle;
    procedure GetTransformLeftTop(AX, AY: Single; var NewSize: TPointF; var Pivot: TPointF);
    procedure GetTransformLeftBottom(AX, AY: Single; var NewSize: TPointF; var Pivot: TPointF);
    procedure GetTransformRightTop(AX, AY: Single; var NewSize: TPointF; var Pivot: TPointF);
    procedure GetTransformRightBottom(AX, AY: Single; var NewSize: TPointF; var Pivot: TPointF);
    procedure MoveHandle(AX, AY: Single);
    procedure SetShowHandles(const Value: Boolean);
    procedure SetColor(const Value: TAlphaColor);
  protected
    function DoGetUpdateRect: TRectF; override;
{---> procedure Paint; override;
{+++>}procedure AfterPaint; override;
    ///<summary>Draw grip handle</summary>
    procedure DrawHandle(const Canvas: TCanvas; const Handle: TGrabHandle; const Rect: TRectF); virtual;
    ///<summary>Draw frame rectangle</summary>
    procedure DrawFrame(const Canvas: TCanvas; const Rect: TRectF); virtual;
  public
    function PointInObjectLocal(X, Y: Single): Boolean; override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure DoMouseLeave; override;
    ///<summary>Grip handle where mouse is hovered</summary>
    property HotHandle: TGrabHandle read FHotHandle;
  published
    property Align;
    property Anchors;
    property ClipChildren default False;
    property ClipParent default False;
    property Cursor default crDefault;
    ///<summary>Selection frame and handle's border color</summary>
    property Color: TAlphaColor read FColor write SetColor default DefaultColor;
    property DragMode default TDragMode.dmManual;
    property EnableDragHighlight default True;
    property Enabled default True;
    property GripSize: Single read FGripSize write SetGripSize;
    property Locked default False;
    property Height;
    property HideSelection: Boolean read FHideSelection write SetHideSelection;
    property HitTest default True;
    property Padding;
    property MinSize: Integer read FMinSize write SetMinSize default 15;
    property Opacity;
    property Margins;
    property ParentBounds: Boolean read FParentBounds write FParentBounds default True;
    property Proportional: Boolean read FProportional write FProportional;
    property PopupMenu;
    property Position;
    property RotationAngle;
    property RotationCenter;
    property Scale;
    property Size;
    ///<summary>Indicates visibility of handles</summary>
    property ShowHandles: Boolean read FShowHandles write SetShowHandles;
    property Visible default True;
    property Width;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    {Drag and Drop events}
    property OnDragEnter;
    property OnDragLeave;
    property OnDragOver;
    property OnDragDrop;
    property OnDragEnd;
    {Mouse events}
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
    property OnTrack: TNotifyEvent read FOnTrack write FOnTrack;
  end;

implementation

{ TOneSelection }

constructor TOneSelection.Create(AOwner: TComponent);
begin
  inherited;
  AutoCapture := True;
  ParentBounds := True;
  FColor := DefaultColor;
  FShowHandles := True;
  FMinSize := 15;
  FGripSize := 3;
  SetAcceptsControls(False);
end;

destructor TOneSelection.Destroy;
begin
  inherited;
end;

function TOneSelection.GetProportionalSize(const ASize: TPointF): TPointF;
begin
  Result := ASize;
{---> if FRatio * Result.Y  > Result.X  then
{+++>}
  if ((FRatio * Result.Y  > Result.X) and
     not (FActiveHandle in [TGrabHandle.CenterTop, TGrabHandle.CenterBottom])) or
         (FActiveHandle in [TGrabHandle.CenterLeft, TGrabHandle.CenterRight]) then
{<+++}
  begin
    if Result.X < FMinSize then
      Result.X := FMinSize;
    Result.Y := Result.X / FRatio;
    if Result.Y < FMinSize then
    begin
      Result.Y := FMinSize;
      Result.X := FMinSize * FRatio;
    end;
  end
  else
  begin
    if Result.Y < FMinSize then
      Result.Y := FMinSize;
    Result.X := Result.Y * FRatio;
    if Result.X < FMinSize then
    begin
      Result.X := FMinSize;
      Result.Y := FMinSize / FRatio;
    end;
  end;
end;

function TOneSelection.GetHandleForPoint(const P: TPointF): TGrabHandle;
var
{+++>}w, h: Single;
  Local, R: TRectF;
begin
  Local := LocalRect;
  R := TRectF.Create(Local.Left - GripSize, Local.Top - GripSize, Local.Left + GripSize, Local.Top + GripSize);
  if R.Contains(P) then
    Exit(TGrabHandle.LeftTop);
  R := TRectF.Create(Local.Right - GripSize, Local.Top - GripSize, Local.Right + GripSize, Local.Top + GripSize);
  if R.Contains(P) then
    Exit(TGrabHandle.RightTop);
  R := TRectF.Create(Local.Right - GripSize, Local.Bottom - GripSize, Local.Right + GripSize, Local.Bottom + GripSize);
  if R.Contains(P) then
    Exit(TGrabHandle.RightBottom);
  R := TRectF.Create(Local.Left - GripSize, Local.Bottom - GripSize, Local.Left + GripSize, Local.Bottom + GripSize);
  if R.Contains(P) then
    Exit(TGrabHandle.LeftBottom);
{+++>}
  w := (Local.Right - Local.Left) / 2;
  h := (Local.Bottom - Local.Top) / 2;
  R := TRectF.Create(Local.Left - GripSize, (Local.Top + h) - GripSize, Local.Left + GripSize, (Local.Top + h) + GripSize);
  if R.Contains(P) then
    Exit(TGrabHandle.CenterLeft);
  R := TRectF.Create((Local.Left + w) - GripSize, Local.Top - GripSize, (Local.Left + w) + GripSize, Local.Top + GripSize);
  if R.Contains(P) then
    Exit(TGrabHandle.CenterTop);
  R := TRectF.Create(Local.Right - GripSize, (Local.Top + h) - GripSize, Local.Right + GripSize, (Local.Top + h) + GripSize);
  if R.Contains(P) then
    Exit(TGrabHandle.CenterRight);
  R := TRectF.Create((Local.Left + w) - GripSize, Local.Bottom - GripSize, (Local.Left + w) + GripSize, Local.Bottom + GripSize);
  if R.Contains(P) then
    Exit(TGrabHandle.CenterBottom);
{<+++}
  Result := TGrabHandle.None;
end;


procedure TOneSelection.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  // this line may be necessary because TOneSelection is not a styled control;
  // must further investigate for a better fix
  if not Enabled then
    Exit;

  inherited;

  FDownPos := TPointF.Create(X, Y);
  if Button = TMouseButton.mbLeft then
  begin
    FRatio := Width / Height;
    FActiveHandle := GetHandleForPoint(FDownPos);
  end;
end;

procedure TOneSelection.MouseMove(Shift: TShiftState; X, Y: Single);
var
  P, OldPos: TPointF;
  MoveVector: TVector;
  MovePos: TPointF;
  GrabHandle: TGrabHandle;
begin
  // this line may be necessary because TOneSelection is not a styled control;
  // must further investigate for a better fix
  if not Enabled then
    Exit;

  inherited;

  MovePos := TPointF.Create(X, Y);
  if not Pressed then
  begin
    // handle painting for hotspot mouse hovering
    GrabHandle := GetHandleForPoint(MovePos);
    if GrabHandle <> FHotHandle then
      Repaint;
    FHotHandle := GrabHandle;
  end
  else if ssLeft in Shift then
  begin
    if FActiveHandle = TGrabHandle.None then
    begin
      MoveVector := LocalToAbsoluteVector(TVector.Create(X - FDownPos.X, Y - FDownPos.Y));
      if ParentControl <> nil then
        MoveVector := ParentControl.AbsoluteToLocalVector(MoveVector);
      Position.Point := Position.Point + TPointF(MoveVector);
      if ParentBounds then
      begin
        if Position.X < 0 then
          Position.X := 0;
        if Position.Y < 0 then
          Position.Y := 0;
        if ParentControl <> nil then
        begin
          if Position.X + Width > ParentControl.Width then
            Position.X := ParentControl.Width - Width;
          if Position.Y + Height > ParentControl.Height then
            Position.Y := ParentControl.Height - Height;
        end
        else
          if Canvas <> nil then
          begin
            if Position.X + Width > Canvas.Width then
              Position.X := Canvas.Width - Width;
            if Position.Y + Height > Canvas.Height then
              Position.Y := Canvas.Height - Height;
          end;
      end;
      if Assigned(FOnTrack) then
        FOnTrack(Self);
      Exit;
    end;

    OldPos := Position.Point;
    P := LocalToAbsolute(MovePos);
    if ParentControl <> nil then
      P := ParentControl.AbsoluteToLocal(P);
    if ParentBounds then
    begin
      if P.Y < 0 then
        P.Y := 0;
      if P.X < 0 then
        P.X := 0;
      if ParentControl <> nil then
      begin
        if P.X > ParentControl.Width then
          P.X := ParentControl.Width;
        if P.Y > ParentControl.Height then
          P.Y := ParentControl.Height;
      end
      else
        if Canvas <> nil then
        begin
          if P.X > Canvas.Width then
            P.X := Canvas.Width;
          if P.Y > Canvas.Height then
            P.Y := Canvas.Height;
        end;
    end;
    MoveHandle(X, Y);
  end;
end;

function TOneSelection.PointInObjectLocal(X, Y: Single): Boolean;
begin
  Result := inherited or (GetHandleForPoint(TPointF.Create(X, Y)) <> TGrabHandle.None);
end;

procedure TOneSelection.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  // this line may be necessary because TOneSelection is not a styled control;
  // must further investigate for a better fix
  if not Enabled then
    Exit;

  inherited;

  if Assigned(FOnChange) then
    FOnChange(Self);
  FActiveHandle := TGrabHandle.None;
end;

procedure TOneSelection.DrawFrame(const Canvas: TCanvas; const Rect: TRectF);
begin
  Canvas.DrawDashRect(Rect, 0, 0, AllCorners, AbsoluteOpacity, FColor);
end;

procedure TOneSelection.DrawHandle(const Canvas: TCanvas; const Handle: TGrabHandle; const Rect: TRectF);
var
  Fill: TBrush;
  Stroke: TStrokeBrush;
begin
  Fill := TBrush.Create(TBrushKind.Solid, claWhite);
  Stroke := TStrokeBrush.Create(TBrushKind.Solid, FColor);
  try
    if Enabled then
      if FHotHandle = Handle then
        Canvas.Fill.Color := claRed
      else
        Canvas.Fill.Color := claWhite
    else
      Canvas.Fill.Color := claGrey;

    Canvas.FillEllipse(Rect, AbsoluteOpacity, Fill);
    Canvas.DrawEllipse(Rect, AbsoluteOpacity, Stroke);
  finally
    Fill.Free;
    Stroke.Free;
  end;
end;

{---> procedure TOneSelection.Paint;
{+++>}procedure TOneSelection.AfterPaint;
var
{+++>}w, h: Single;
  R: TRectF;
begin
  if FHideSelection then
    Exit;

  R := LocalRect;
  R.Inflate(-0.5, -0.5);
  DrawFrame(Canvas, R);

  if ShowHandles then
  begin
    R := LocalRect;
    DrawHandle(Canvas, TGrabHandle.LeftTop, TRectF.Create(R.Left - GripSize, R.Top - GripSize, R.Left + GripSize,
      R.Top + GripSize));
    DrawHandle(Canvas, TGrabHandle.RightTop, TRectF.Create(R.Right - GripSize, R.Top - GripSize, R.Right + GripSize,
      R.Top + GripSize));
    DrawHandle(Canvas, TGrabHandle.LeftBottom, TRectF.Create(R.Left - GripSize, R.Bottom - GripSize, R.Left + GripSize,
      R.Bottom + GripSize));
    DrawHandle(Canvas, TGrabHandle.RightBottom, TRectF.Create(R.Right - GripSize, R.Bottom - GripSize,
      R.Right + GripSize, R.Bottom + GripSize));
{+++>}
    w := (R.Right - R.Left) / 2;
    h := (R.Bottom - R.Top) / 2;
    DrawHandle(Canvas, TGrabHandle.CenterLeft,   TRectF.Create( R.Left      - GripSize, (R.Top + h) - GripSize,  R.Left      + GripSize, (R.Top + h) + GripSize));
    DrawHandle(Canvas, TGrabHandle.CenterTop,    TRectF.Create((R.Left + w) - GripSize,  R.Top      - GripSize, (R.Left + w) + GripSize,  R.Top      + GripSize));
    DrawHandle(Canvas, TGrabHandle.CenterRight,  TRectF.Create( R.Right     - GripSize, (R.Top + h) - GripSize,  R.Right     + GripSize, (R.Top + h) + GripSize));
    DrawHandle(Canvas, TGrabHandle.CenterBottom, TRectF.Create((R.Left + w) - GripSize,  R.Bottom   - GripSize, (R.Left + w) + GripSize,  R.Bottom   + GripSize));
{<+++}
  end;
end;

function TOneSelection.DoGetUpdateRect: TRectF;
begin
  Result := inherited;
  Result.Inflate((FGripSize + 1) * Scale.X, (FGripSize + 1) * Scale.Y);
end;


procedure TOneSelection.ResetInSpace(const ARotationPoint: TPointF; ASize: TPointF);
var
  LLocalPos: TPointF;
  LAbsPos: TPointF;
begin
  LAbsPos := LocalToAbsolute(ARotationPoint);
  if ParentControl <> nil then
  begin
    LLocalPos := ParentControl.AbsoluteToLocal(LAbsPos);
    LLocalPos.X := LLocalPos.X - ASize.X * RotationCenter.X * Scale.X;
    LLocalPos.Y := LLocalPos.Y - ASize.Y * RotationCenter.Y * Scale.Y;
    if ParentBounds then
    begin
      if LLocalPos.X < 0 then
      begin
        ASize.X := ASize.X + LLocalPos.X;
        LLocalPos.X := 0;
      end;
      if LLocalPos.Y < 0 then
      begin
        ASize.Y := ASize.Y + LLocalPos.Y;
        LLocalPos.Y := 0;
      end;
      if LLocalPos.X + ASize.X > ParentControl.Width then
        ASize.X := ParentControl.Width - LLocalPos.X;
      if LLocalPos.Y + ASize.Y > ParentControl.Height then
        ASize.Y := ParentControl.Height - LLocalPos.Y;
    end;
  end
  else
  begin
    LLocalPos.X := LAbsPos.X - ASize.X * RotationCenter.X * Scale.X;
    LLocalPos.Y := LAbsPos.Y - ASize.Y * RotationCenter.Y * Scale.Y;
  end;
{+++>}if not FProportional or (FProportional and SameValue(ASize.X / ASize.Y, FRatio, 0.0001{SingleResolution})) then // 修正如果等比时，超界不会变形 by Aone @ 2016.10.11
  SetBounds(LLocalPos.X, LLocalPos.Y, ASize.X, ASize.Y);
end;

procedure TOneSelection.GetTransformLeftTop(AX, AY: Single; var NewSize: TPointF; var Pivot: TPointF);
var
  LCorrect: TPointF;
begin
{+++>}
  if FActiveHandle = TGrabHandle.CenterTop  then AX := 0 else
  if FActiveHandle = TGrabHandle.CenterLeft then AY := 0;
{+++>}
  NewSize := Size.Size - TSizeF.Create(AX, AY);
  if NewSize.Y < FMinSize then
  begin
    AY := Height - FMinSize;
    NewSize.Y := FMinSize;
  end;
  if NewSize.X < FMinSize then
  begin
    AX := Width - FMinSize;
    NewSize.X := FMinSize;
  end;
  if FProportional then
  begin
    LCorrect := NewSize;
    NewSize := GetProportionalSize(NewSize);
{+++>}if not (FActiveHandle in [TGrabHandle.CenterTop, TGrabHandle.CenterLeft]) then begin
    LCorrect := LCorrect - NewSize;
    AX := AX + LCorrect.X;
    AY := AY + LCorrect.Y;
{+++>}end;
  end;
  Pivot := TPointF.Create(Width * RotationCenter.X + AX * (1 - RotationCenter.X),
    Height * RotationCenter.Y + AY * (1 - RotationCenter.Y));
end;

procedure TOneSelection.GetTransformLeftBottom(AX, AY: Single; var NewSize: TPointF; var Pivot: TPointF);
var
  LCorrect: TPointF;
begin
  {+++>}if FActiveHandle = TGrabHandle.CenterBottom then AX := 0;
  NewSize := TPointF.Create(Width - AX, AY);
  if NewSize.Y < FMinSize then
  begin
    AY := FMinSize;
    NewSize.Y := FMinSize;
  end;
  if NewSize.X < FMinSize then
  begin
    AX := Width - FMinSize;
    NewSize.X := FMinSize;
  end;
  if FProportional then
  begin
    LCorrect := NewSize;
    NewSize := GetProportionalSize(NewSize);
{+++>}if FActiveHandle <> TGrabHandle.CenterBottom then begin
    LCorrect := LCorrect - NewSize;
    AX := AX + LCorrect.X;
{---> AY := AY + LCorrect.Y;
{+++>}AY := AY - LCorrect.Y; // 修正等比缩放时，拉动左下角，右上角会跟着移动 by Aone @ 2016.10.10
{+++>}end;
  end;
  Pivot := TPointF.Create(Width * RotationCenter.X + AX * (1 - RotationCenter.X),
    Height * RotationCenter.Y + (AY - Height) * RotationCenter.Y);
end;

procedure TOneSelection.GetTransformRightTop(AX, AY: Single; var NewSize: TPointF; var Pivot: TPointF);
var
  LCorrect: TPointF;
begin
  {+++>}if FActiveHandle = TGrabHandle.CenterRight then AY := 0;
  NewSize := TPointF.Create(AX, Height - AY);
  if NewSize.Y < FMinSize then
  begin
    AY := Height - FMinSize;
    NewSize.Y := FMinSize;
  end;
  if AX < FMinSize then
  begin
    AX := FMinSize;
    NewSize.X := FMinSize;
  end;
  if FProportional then
  begin
    LCorrect := NewSize;
    NewSize := GetProportionalSize(NewSize);
{+++>}if FActiveHandle <> TGrabHandle.CenterRight then begin
    LCorrect := LCorrect - NewSize;
    AX := AX - LCorrect.X;
    AY := AY + LCorrect.Y;
{+++>}end;
  end;
  Pivot := TPointF.Create(Width * RotationCenter.X + (AX - Width) * RotationCenter.X,
    Height * RotationCenter.Y + AY * (1 - RotationCenter.Y));
end;

procedure TOneSelection.GetTransformRightBottom(AX, AY: Single; var NewSize: TPointF; var Pivot: TPointF);
var
  LCorrect: TPointF;
begin
  NewSize := TPointF.Create(AX, AY);
  if NewSize.Y < FMinSize then
  begin
    AY := FMinSize;
    NewSize.Y := FMinSize;
  end;
  if NewSize.X < FMinSize then
  begin
    AX := FMinSize;
    NewSize.X := FMinSize;
  end;
  if FProportional then
  begin
    LCorrect := NewSize;
    NewSize := GetProportionalSize(NewSize);
    LCorrect := LCorrect - NewSize;
    AX := AX - LCorrect.X;
    AY := AY - LCorrect.Y;
  end;
  Pivot := TPointF.Create(Width * RotationCenter.X + (AX - Width) * RotationCenter.X,
    Height * RotationCenter.Y + (AY - Height) * RotationCenter.Y);
end;

procedure TOneSelection.MoveHandle(AX, AY: Single);
var
  NewSize, Pivot: TPointF;
begin
  case FActiveHandle of
    TOneSelection.TGrabHandle.LeftTop: GetTransformLeftTop(AX, AY, NewSize, Pivot);
    TOneSelection.TGrabHandle.LeftBottom: GetTransformLeftBottom(AX, AY, NewSize, Pivot);
    TOneSelection.TGrabHandle.RightTop: GetTransformRightTop(AX, AY, NewSize, Pivot);
    TOneSelection.TGrabHandle.RightBottom: GetTransformRightBottom(AX, AY, NewSize, Pivot);
{+++>}
    TOneSelection.TGrabHandle.CenterLeft: GetTransformLeftTop(AX, AY, NewSize, Pivot);
    TOneSelection.TGrabHandle.CenterTop: GetTransformLeftTop(AX, AY, NewSize, Pivot);
    TOneSelection.TGrabHandle.CenterRight: GetTransformRightTop(AX, AY, NewSize, Pivot);
    TOneSelection.TGrabHandle.CenterBottom: GetTransformLeftBottom(AX, AY, NewSize, Pivot);
{<+++}
  end;
  ResetInSpace(Pivot, NewSize);
  if Assigned(FOnTrack) then
    FOnTrack(Self);
end;

procedure TOneSelection.DoMouseLeave;
begin
  inherited;
  FHotHandle := TGrabHandle.None;
  Repaint;
end;

procedure TOneSelection.SetHideSelection(const Value: Boolean);
begin
  if FHideSelection <> Value then
  begin
    FHideSelection := Value;
    Repaint;
  end;
end;

procedure TOneSelection.SetMinSize(const Value: Integer);
begin
  if FMinSize <> Value then
  begin
    FMinSize := Value;
    if FMinSize < 1 then
      FMinSize := 1;
  end;
end;

procedure TOneSelection.SetShowHandles(const Value: Boolean);
begin
  if FShowHandles <> Value then
  begin
    FShowHandles := Value;
    Repaint;
  end;
end;

procedure TOneSelection.SetColor(const Value: TAlphaColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    Repaint;
  end;
end;

procedure TOneSelection.SetGripSize(const Value: Single);
begin
  if FGripSize <> Value then
  begin
    if Value < FGripSize then
      Repaint;
    FGripSize := Value;
    if FGripSize > 20 then
      FGripSize := 20;
    if FGripSize < 1 then
      FGripSize := 1;
    HandleSizeChanged;
    Repaint;
  end;
end;

end.

