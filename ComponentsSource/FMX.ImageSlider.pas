// ***************************************************************************
//
// FMXComponents: Firemonkey Opensource Components Set from China
//
// A Simple Firemonkey Image Slider Component
//
// Copyright 2017 谢顿 (zhaoyipeng@hotmail.com)
//
// https://github.com/zhaoyipeng/FMXComponents
//
// ***************************************************************************
// version history
// 2017-01-20, v0.1.0.0 : first release
// 2018-01-31, v0.2.0.0 : merged with loko's change
// 2018-03-21, v0.3.0.0 : merged with kwon hwang-jung's change 2018-03-02
//         1. add three Add methods to add bitmap directly
//         2. add Next, Prev methods
//         3. add AutoSlider property can auto slide
//         4. add TimerInterval to control AutoSlider interval
//         5. use ActivePage property move page, ex)ActivePage := 1
//         6. add Datas property, can set tagstring on each page
// 2018-03-21, v0.4.0.0 : merged with Mikkao's change 2018-03-01
//         1. change OnPageChange event to TPageChangeEvent
//         2. add OnPageAnimationFinish event
//         3. add OnCanDragBegin event
// 2018-03-21, v0.5.0.0 :
//         1. rewrite slide method, now can support loop
// 2018-03-22, v0.6.0.0 :
//         1. add dot indicator, support dynamic change dot active/inactive color

unit FMX.ImageSlider;

interface

{$I FMXComponents.inc}

uses
  System.Classes,
  System.Generics.Collections,
  System.Types,
  System.UITypes,
  FMX.Types,
  FMX.Controls,
  FMX.Layouts,
  FMX.Objects,
  FMX.Ani,
  FMX.Utils,
  FMX.Graphics,
  FMX.ComponentsCommon;

type
  TPageChangeEvent = procedure(Sender: TObject; NewPage, OldPage: Integer) of object;
  TPageAnimationFinishEvent = procedure(Sender: TObject; NewPage: Integer) of object;
  TCanBeginDragEvent = procedure(Sender: TObject; var CanBegin: Boolean) of object;

  TFMXImageSlider = class;

  TSliderDots = class(TControl)
  private
    FDotContainer: TLayout;
    FDotSize: Single;
    FActiveColor: TAlphaColor;
    FInActiveColor: TAlphaColor;
    FActiveIndex: Integer;
    procedure SetDotCount(const Value: Integer);
    function GetDotCount: Integer;
    procedure CreateDotShape;
    procedure SetDotSize(const Value: Single);
    procedure SetActiveColor(const Value: TAlphaColor);
    procedure SetInActiveColor(const Value: TAlphaColor);
    procedure SetActiveIndex(const Value: Integer);
  protected
    procedure HitTestChanged; override;
    function GetDot(Index: Integer): TControl;
    {$IFDEF VER320_up}
    procedure DoResized; override;
    {$ELSE}
    procedure Resize; override;
    {$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    property ActiveIndex: Integer read FActiveIndex write SetActiveIndex;
    property DotCount: Integer read GetDotCount write SetDotCount;
    property DotSize: Single read FDotSize write SetDotSize;
    property ActiveColor: TAlphaColor read FActiveColor write SetActiveColor;
    property InActiveColor: TAlphaColor read FInActiveColor write SetInActiveColor;
  end;

  [ComponentPlatformsAttribute(TFMXPlatforms)]
  TFMXImageSlider = class(TLayout)
  private
    FContainer: TControl;
    FIsTimer: Boolean;
    FAutoSlider: Boolean;
    FTimer: TTimer;
    FPages: TList<TControl>;
    FActivePage: Integer;
    FIsMove: Boolean;
    FStartDrag: Boolean;
    FBeforeDrag: Boolean;
    FDownPos: TPointF;
    FDownIndex: Integer;
    FAnimation: TAnimation;
    FOnPageAnimationFinish: TPageAnimationFinishEvent;
    FOnCanDragBegin: TCanBeginDragEvent;
    FOnItemTap: TTapEvent;
    FOnItemClick: TNotifyEvent;
    FOnPageChange: TPageChangeEvent;
    FAnimationInterval: Integer;
    FTransitionLayouts: array of TControl;
    FTranstionIsIn: Boolean;
    FTranstionStartX: Single;
    FDots: TSliderDots;
    procedure MoveToActivePage(IsIn: Boolean = True);
    procedure OnTimer(Sender: TObject);
    procedure AnimationProcess(Sender: TObject);
    procedure AnimationFinished(Sender: TObject);
    function GetAnimateDuration: Single;
    function GetDatas(Index: Integer): string;
    function GetPageCount: Integer;
    function GetTimerInterval: Integer;

    procedure SetActivePage(const Value: Integer); { change }
    procedure SetAnimateDuration(const Value: Single);
    procedure SetAutoSlider(const Value: Boolean);
    procedure SetPageCount(const Value: Integer);
    procedure SetDatas(Index: Integer; const Value: string);
    function SetDragBegin: Boolean;
    function GetDotsVisible: Boolean;
    procedure SetDotsVisible(const Value: Boolean);
    function GetDotActiveColor: TAlphaColor;
    function GetDotInActiveColor: TAlphaColor;
    procedure SetDotActiveColor(const Value: TAlphaColor);
    procedure SetDotInActiveColor(const Value: TAlphaColor);
  protected
    procedure SetTimerInterval(const Value: Integer);
    {$IFDEF VER320_up}
    procedure DoResized; override;
    {$ELSE}
    procedure Resize; override;
    {$ENDIF}
    procedure DoPageChange(NewPage, OldPage: Integer);
    procedure DoTap(Sender: TObject; const Point: TPointF);
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure AddImage(const Value: string; Image: TImage);
    procedure AddPage(const Value: string; Page: TControl);
    procedure PrepareSlide(DeltaX: Single); overload;
    procedure PrepareSlide(IsIn: Boolean); overload;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetPage(Index: Integer; AImage: TImage);
    procedure Add(Bitmap: TBitmap); overload;                //add bitmap
    procedure Add(Value: string; Bitmap: TBitmap); overload;  //add bitmap and value
    procedure Add(Value: string; Bitmap: TStream); overload;  //add bitmap stream and value
    procedure Clear;  //Page Clear;
    procedure Prev;   //Previous Page
    procedure Next;   //Next Page
    property Datas[Index: Integer]: string read GetDatas write SetDatas; //Page value(ex 0page = Datas[0])
  published
    property Align;
    property Height;
    property Position;
    property Width;
    property ActivePage: Integer read FActivePage write SetActivePage;    //page move
    property AnimateDuration: Single read GetAnimateDuration write SetAnimateDuration;
    property AutoSlider: Boolean read FAutoSlider write SetAutoSlider;    //auto slider property
    property DotActiveColor: TAlphaColor read GetDotActiveColor write SetDotActiveColor;
    property DotInActiveColor: TAlphaColor read GetDotInActiveColor write SetDotInActiveColor;
    property DotsVisible: Boolean read GetDotsVisible write SetDotsVisible;
    property PageCount: Integer read GetPageCount write SetPageCount;
    property TimerInterval: Integer read GetTimerInterval write SetTimerInterval; //auto slider timer
    property OnCanDragBegin: TCanBeginDragEvent read FOnCanDragBegin write FOnCanDragBegin;
    property OnItemClick: TNotifyEvent read FOnItemClick write FOnItemClick;     //page click event(use Desktop)
    property OnItemTap: TTapEvent read FOnItemTap write FOnItemTap;       //page tab event(use Mobile, Pad)
    property OnPageChange: TPageChangeEvent read FOnPageChange write FOnPageChange;
    property OnPageAnimationFinish: TPageAnimationFinishEvent read FOnPageAnimationFinish write FOnPageAnimationFinish;
  end;

implementation

type
  TMyAnimation = class(TAnimation)
  protected
    procedure ProcessAnimation; override;
  end;
{ TFMXImageSlider }

procedure TFMXImageSlider.Add(Bitmap: TBitmap);
begin
  Add('', Bitmap);
end;

procedure TFMXImageSlider.Add(Value: String; Bitmap: TBitmap);
var
  Img : TImage;
begin
  Img := TImage.Create(Self);
  Img.Bitmap.Assign(Bitmap);
  AddImage(Value, Img);
end;

procedure TFMXImageSlider.Add(Value: String; Bitmap: TStream);
var
  Img : TImage;
begin
  Img := TImage.Create(Self);
  Img.Bitmap.LoadFromStream(Bitmap);
  AddImage(Value, Img);
end;

procedure TFMXImageSlider.AddImage(const Value: string; Image: TImage);
var
  Page: TLayout;
begin
  Page := TLayout.Create(Self);
  Image.Stored    := False;
  Image.WrapMode := TImageWrapMode.Stretch;
  Image.Parent    := Page;
  Image.HitTest   := False;
  Image.Align     := TAlignLayout.Client;
  AddPage(Value, Page);
end;

procedure TFMXImageSlider.AddPage(const Value: string; Page: TControl);
begin
  Page.Parent := FContainer;
  Page.SetBounds(0,0, FContainer.Width, FContainer.Height);
  Page.Stored := False;
  Page.Visible := False;
  Page.TagString  := Value;
  Page.Tag        := FPages.Add(Page);
  FDots.DotCount := PageCount;
end;

procedure TFMXImageSlider.Clear;
var
  I: Integer;
begin
  for I := FPages.Count-1 downto 0 do
  begin
    FPages[I].DisposeOf;
  end;
  FPages.Clear;
  ActivePage := -1;
  FDots.DotCount := PageCount;
end;

constructor TFMXImageSlider.Create(AOwner: TComponent);
begin
  inherited;
  FContainer := TControl.Create(Self);
  FContainer.Align := TAlignLayout.Client;
  FContainer.Stored := False;
  FContainer.HitTest := False;
  FContainer.ClipChildren := True;
  FContainer.Parent := Self;

  FDots := TSliderDots.Create(Self);
  FDots.Stored := False;
  FDots.SetBounds(0, FContainer.Height - FDots.Height, FContainer.Width, FDots.Height);
  FDots.Parent := Self;

  FTimer          := TTimer.Create(Self);
  FTimer.Interval := 1000 * 5;
  FTimer.Enabled  := False;
  FTimer.OnTimer  := OnTimer;
  FAutoSlider     := False;
  FAnimation := TMyAnimation.Create(Self);
  FAnimation.Stored := False;
  FAnimation.Interpolation := TInterpolationType.Quintic;
  FAnimation.Parent := Self;
  FAnimation.Duration := 0.2;
  FAnimation.OnProcess := AnimationProcess;
  FAnimation.OnFinish := AnimationFinished;
  FPages        := TList<TControl>.Create;
  HitTest       := True;
  FActivePage   := -1;
  FStartDrag    := False;
  AutoCapture   := True;
end;

destructor TFMXImageSlider.Destroy;
begin
  FPages.Free;
  inherited;
end;

procedure TFMXImageSlider.DoPageChange(NewPage, OldPage: Integer);
begin
  if Assigned(FOnPageChange) then
    FOnPageChange(Self, NewPage, OldPage);
end;

procedure TFMXImageSlider.DoTap(Sender: TObject; const Point: TPointF);
begin
  if Assigned(FOnItemTap) then FOnItemTap(Sender, Point);
end;

function TFMXImageSlider.GetAnimateDuration: Single;
begin
  Result := FAnimation.Duration;
end;

function TFMXImageSlider.GetDatas(Index: Integer): string;
begin
  Result := FPages[Index].TagString;
end;

function TFMXImageSlider.GetDotActiveColor: TAlphaColor;
begin
  Result := FDots.ActiveColor;
end;

function TFMXImageSlider.GetDotInActiveColor: TAlphaColor;
begin
  Result := FDots.InActiveColor;
end;

function TFMXImageSlider.GetDotsVisible: Boolean;
begin
  Result := FDots.Visible;
end;

function TFMXImageSlider.GetPageCount: Integer;
begin
  Result := FPages.Count;
end;

function TFMXImageSlider.GetTimerInterval: Integer;
begin
  Result := FTimer.Interval;
end;

procedure TFMXImageSlider.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  inherited;
  FIsTimer := FTimer.Enabled;
  if FIsTimer then
    FTimer.Enabled := False;
  FIsMove := False;
  if (PageCount > 0) and (Button = TMouseButton.mbLeft) then
  begin
    FStartDrag := True;
    FBeforeDrag := True;
    FDownPos := PointF(X, Y);
    FDownIndex := FActivePage;
  end;
end;

procedure TFMXImageSlider.MouseMove(Shift: TShiftState; X, Y: Single);
var
  DeltaX: Single;
begin
  inherited;
  if FStartDrag then
  begin
    if FBeforeDrag and not SetDragBegin then
      exit;
    if Abs(FDownPos.X - X) > 5 then
      FIsMove := True;
    DeltaX := X - FDownPos.X;
    PrepareSlide(DeltaX);
  end;
end;

procedure TFMXImageSlider.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  DeltaX: Single;
  PrevPage: Integer;
begin
  inherited;
  if (not FIsMove) and FStartDrag then
  begin
    if FIsTimer then
      FTimer.Enabled := True;
    FStartDrag := False;
    if Assigned(FOnItemClick) then
      FOnItemClick(FPages[Self.ActivePage]);
    if Assigned(FOnItemTap) then
      FOnItemTap(FPages[Self.ActivePage], PointF(X, Y));
    Exit;
  end;
  if FStartDrag then
  begin
    FStartDrag := False;
    DeltaX := X - FDownPos.X;
    if (Abs(DeltaX) > Width * 0.4) and (PageCount > 0) then
    begin
      if (DeltaX > 0) then
      begin
        PrevPage := FActivePage;
        FActivePage := (FActivePage + PageCount - 1) mod PageCount;
      end
      else
      begin
        PrevPage := FActivePage;
        FActivePage := (FActivePage + 1) mod PageCount;
      end;
      DoPageChange(FActivePage, PrevPage);
      MoveToActivePage(DeltaX < 0);
    end
    else
    begin
      MoveToActivePage(DeltaX > 0);
    end;
    if FIsTimer then
      FTimer.Enabled := True;
  end;
end;

procedure TFMXImageSlider.MoveToActivePage(IsIn: Boolean);
begin
  PrepareSlide(IsIn);
  FAnimation.Start;
end;

procedure TFMXImageSlider.Next;
var
  PrevPage: Integer;
begin
  if (PageCount < 2) or (FAnimation.Running) then Exit;
  PrevPage := FActivePage;
  FActivePage := (FActivePage + 1) mod PageCount;
  DoPageChange(FActivePage, PrevPage);
  MoveToActivePage(True);
end;

procedure TFMXImageSlider.OnTimer(Sender: TObject);
begin
  Next;
end;

procedure TFMXImageSlider.PrepareSlide(DeltaX: Single);
var
  Layout1, Layout2: TControl;
  Index2: Integer;
begin
  Layout1 := FPages[FActivePage];
  Layout1.Position.X := DeltaX;
  if PageCount > 0 then
  begin
    if DeltaX > 0 then
      // Find the left page
      Index2 := (FActivePage + PageCount - 1) mod PageCount
    else
      Index2 := (FActivePage + 1) mod PageCount;
    Layout2 := FPages[Index2];
    Layout2.Visible := True;
    if DeltaX > 0 then
      Layout2.Position.X := Layout1.Position.X - Width
    else
      Layout2.Position.X := Layout1.BoundsRect.Right;
  end;
end;

procedure TFMXImageSlider.PrepareSlide(IsIn: Boolean);
var
  Layout1, Layout2: TControl;
  Index2: Integer;
  X: Single;
begin
  FTranstionIsIn := IsIn;
  Layout1 := FPages[FActivePage];
  if Layout1.Visible then
    FTranstionStartX := Layout1.Position.X
  else
  begin
    if IsIn then
      FTranstionStartX := Width
    else
      FTranstionStartX := -Width;
    Layout1.SetBounds(FTranstionStartX, 0, Width, Height);
    Layout1.Visible := true;
  end;
  if PageCount > 1 then
  begin
    if IsIn then
      Index2 := (FActivePage + PageCount - 1) mod PageCount
    else
      Index2 := (FActivePage + 1) mod PageCount;
    Layout2 := FPages[Index2];
    Layout2.Visible := True;
    if IsIn then
      X := Layout1.Position.X - Width
    else
      X := Layout1.BoundsRect.Right;
    Layout2.SetBounds(X, 0, Width, Height);
    SetLength(FTransitionLayouts, 2);
    FTransitionLayouts[0] := Layout1;
    FTransitionLayouts[1] := Layout2;
  end
  else
  begin
    SetLength(FTransitionLayouts, 1);
    FTransitionLayouts[0] := Layout1;
  end;
end;

procedure TFMXImageSlider.Prev;
var
  PrevPage: Integer;
begin
  if (PageCount < 2) or (FAnimation.Running) then Exit;
  PrevPage := FActivePage;
  FActivePage := (FActivePage - 1 + PageCount) mod PageCount;
  DoPageChange(FActivePage, PrevPage);
  MoveToActivePage(False);
end;

{$IFDEF VER320_up}
procedure TFMXImageSlider.DoResized;
{$ELSE}
procedure TFMXImageSlider.Resize;
{$ENDIF}
var
  I: Integer;
begin
  inherited;
  for I := 0 to FPages.Count - 1 do
  begin
    FPages[I].Width := FContainer.Width;
    FPages[I].Height := FContainer.Height;
  end;
  FDots.SetBounds(0, FContainer.Height - FDots.Height, FContainer.Width, FDots.Height);
end;

procedure TFMXImageSlider.SetActivePage(const Value: Integer);
var
  IsIn: Boolean;
  PrevPage, Delta: Integer;
begin
  if (Value < 0) or (Value > FPages.Count - 1) then // check if value valid
    exit;
  if FActivePage <> Value then
  begin
    PrevPage := FActivePage;
    if FActivePage = -1 then
    begin
      FActivePage := Value;
      FPages[FActivePage].SetBounds(0,0,Width,Height);
      FPages[FActivePage].Visible := True;
      DoPageChange(FActivePage, PrevPage);
      FDots.ActiveIndex := FActivePage;
    end
    else
    begin
      Delta := Abs(FActivePage - Value);
      // if current active page not neighbor of new active page, hide current page
      if (Delta <> 1) and (Delta <> (PageCount-1)) then
        FPages[FActivePage].Visible := False;
      IsIn := FActivePage < Value;
      FActivePage := Value; // set FActivePage
      DoPageChange(FActivePage, PrevPage);
      MoveToActivePage(IsIn);
    end;
  end;
end;

procedure TFMXImageSlider.SetAnimateDuration(const Value: Single);
begin
  FAnimation.Duration := Value;
end;

procedure TFMXImageSlider.AnimationFinished(Sender: TObject);
begin
  if FTransitionLayouts[0].Tag = FActivePage then
  begin
    if Length(FTransitionLayouts) = 2 then
      FTransitionLayouts[1].Visible := False;
  end
  else
  begin
    FTransitionLayouts[0].Visible := False;
  end;
  If Assigned(FOnPageAnimationFinish) then
    FOnPageAnimationFinish(Self, FActivePage);
  FBeforeDrag := True;
  FDots.ActiveIndex := FActivePage;
end;

procedure TFMXImageSlider.AnimationProcess(Sender: TObject);
var
  Start, Stop: Single;
begin
  Start := FTranstionStartX;
  Stop := 0;
  FTransitionLayouts[0].Position.X :=
    InterpolateSingle(Start, Stop, FAnimation.NormalizedTime);
  if Length(FTransitionLayouts) = 2 then
  begin
    if FTranstionIsIn then
      FTransitionLayouts[1].Position.X :=  FTransitionLayouts[0].Position.X - Width
    else
      FTransitionLayouts[1].Position.X :=  FTransitionLayouts[0].BoundsRect.Right;
  end;
end;

function TFMXImageSlider.SetDragBegin: Boolean;
var
  CanBeginDrag: Boolean;
begin
  Result := True;
  if Assigned(FOnCanDragBegin) then
  begin
    FBeforeDrag := False;
    FOnCanDragBegin(Self, CanBeginDrag);
    Result := CanBeginDrag;
  end;
end;

procedure TFMXImageSlider.SetAutoSlider(const Value: Boolean);
begin
  FAutoSlider := Value;
  FTimer.Enabled := Value;
end;

procedure TFMXImageSlider.SetDatas(Index: Integer; const Value: string);
begin
  FPages[Index].TagString := Value;
end;

procedure TFMXImageSlider.SetDotActiveColor(const Value: TAlphaColor);
begin
  FDots.ActiveColor := Value;
end;

procedure TFMXImageSlider.SetDotInActiveColor(const Value: TAlphaColor);
begin
  FDots.InActiveColor := Value;
end;

procedure TFMXImageSlider.SetDotsVisible(const Value: Boolean);
begin
  FDots.Visible := Value;
end;

procedure TFMXImageSlider.SetPage(Index: Integer; AImage: TImage);
begin
  if (Index >= 0) and (Index < PageCount) then
  begin
    AImage.HitTest := False;
    AImage.Parent := FPages[Index];
    AImage.Align := TAlignLayout.Client;
  end;
end;

procedure TFMXImageSlider.SetPageCount(const Value: Integer);
var
  OldCount: Integer;
  I: Integer;
  L: TControl;
begin
  if Value <> PageCount then
  begin
    OldCount := PageCount;
    if OldCount < Value then
    begin
      for I := OldCount + 1 to Value do
      begin
        AddPage('', TLayout.Create(Self));
      end;
    end
    else if OldCount > Value then
    begin
      for I := OldCount - 1 downto Value do
      begin
        L := FPages[I];
        L.DisposeOf;
      end;
      FPages.Count := Value;
    end;
    if Value > 0 then
    begin
      ActivePage := 0;
    end
    else
    begin
      ActivePage := -1;
    end;
  end;
end;

procedure TFMXImageSlider.SetTimerInterval(const Value: Integer);
begin
  FTimer.Interval := Value;
end;

{ TMyAnimation }

procedure TMyAnimation.ProcessAnimation;
begin
end;

{ TSliderDots }

constructor TSliderDots.Create(AOwner: TComponent);
begin
  inherited;
  FDotSize := 12;
  FActiveIndex := -1;
  FDotContainer := TLayout.Create(Self);
  FDotContainer.Stored := False;
  FDotContainer.Height := FDotSize;
  FDotContainer.HitTest := False;
  FDotContainer.Parent := Self;
  FInActiveColor := $FFDDDDDD;
  FActiveColor := $FF00B4FF;
  HitTest := False;
  Height := FDotSize * 2;
end;

procedure TSliderDots.CreateDotShape;
var
  Dot: TShape;
  X, W: Single;
  B: TRectF;
begin
  X := DotCount * DotSize * 2;
  Dot := TCircle.Create(Self);
  Dot.HitTest := False;
  Dot.SetBounds(X, 0, DotSize, DotSize);
  Dot.Stroke.Kind := TBrushKind.None;
  Dot.Fill.Kind := TBrushKind.Solid;
  Dot.Fill.Color := FInActiveColor;
  Dot.Parent := FDotContainer;
  X := (Self.Width - FDotContainer.Width) / 2;
  W := (DotCount * 2 - 1) * DotSize;
  B := TRectF.Create(X, 0, X + W, DotSize);
  B := B.SnapToPixel(Scene.GetSceneScale, False);
  FDotContainer.BoundsRect := B;
end;

{$IFDEF VER320_up}
procedure TSliderDots.DoResized;
{$ELSE}
procedure TSliderDots.Resize;
{$ENDIF}
var
  X, W: Single;
  B: TRectF;
begin
  inherited;
  X := (Self.Width - FDotContainer.Width) / 2;
  W := (DotCount * 2 - 1) * DotSize;
  B := TRectF.Create(X, 0, X + W, DotSize);
//  B := B.SnapToPixel(Scene.GetSceneScale, False);
  FDotContainer.BoundsRect := B;
end;


function TSliderDots.GetDot(Index: Integer): TControl;
begin
  Result := TControl(FDotContainer.Children[Index]);
end;

function TSliderDots.GetDotCount: Integer;
begin
  Result := FDotContainer.ChildrenCount;
end;

procedure TSliderDots.HitTestChanged;
begin
  inherited;

end;

procedure TSliderDots.SetActiveColor(const Value: TAlphaColor);
begin
  if FActiveColor <> Value then
  begin
    FActiveColor := Value;
    if (FActiveIndex >= 0) and (FActiveIndex < GetDotCount) then
    begin
      (GetDot(FActiveIndex) as TShape).Fill.Color := FActiveColor;
    end;
  end;
end;

procedure TSliderDots.SetActiveIndex(const Value: Integer);
begin
  if FActiveIndex <> Value then
  begin
    if (FActiveIndex >= 0) and (FActiveIndex < DotCount) then
    begin
      (GetDot(FActiveIndex) as TShape).Fill.Color := FInActiveColor;
    end;
    FActiveIndex := Value;
    if (FActiveIndex >= 0) and (FActiveIndex < DotCount) then
    begin
      (GetDot(FActiveIndex) as TShape).Fill.Color := FActiveColor;
    end;
  end;
end;

procedure TSliderDots.SetDotCount(const Value: Integer);
var
  OldCount: Integer;
  I: Integer;
  Dot: TFMXObject;
begin
  if Value <> DotCount then
  begin
    OldCount := DotCount;
    if OldCount < Value then
    begin
      for I := OldCount + 1 to Value do
      begin
        CreateDotShape;
      end;
    end
    else
    begin
      for I := OldCount - 1 downto Value do
      begin
        Dot := FDotContainer.Children[I];
        Dot.DisposeOf;
      end;
    end;
  end;
end;

procedure TSliderDots.SetDotSize(const Value: Single);
begin
  if FDotSize <> Value then
  begin
    FDotSize := Value;
    FDotContainer.Height := FDotSize;
    Height := FDotSize * 3;
  end;
end;

procedure TSliderDots.SetInActiveColor(const Value: TAlphaColor);
var
  I: Integer;
  Dot: TShape;
begin
  if FInActiveColor <> Value then
  begin
    FInActiveColor := Value;
    for I := 0 to DotCount-1 do
    begin
      if I <> FActiveIndex then
      begin
        Dot := GetDot(I) as TShape;
        Dot.Fill.Color := FInActiveColor;
      end;
    end;
  end;
end;

end.
