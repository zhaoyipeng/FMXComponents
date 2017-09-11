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
// 2017-01-20, v0.1.0.0 : first release

unit FMX.ImageSlider;

interface
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
  FMX.ComponentsCommon;

type
  [ComponentPlatformsAttribute(TFMXPlatforms)]
  TFMXImageSlider = class(TLayout)
  private
    FContainer: TLayout;
    FPages: TList<TLayout>;
    FActivePage: Integer;
    FStartDrag: Boolean;
    FDownPos: TPointF;
    FDownIndex: Integer;
    FAnimation: TFloatAnimation;
    procedure SetActivePage(const Value: Integer);
    procedure SetPageCount(const Value: Integer);
    function GetPageCount: Integer;
  protected
    procedure Resize; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Single); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Single); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetPage(Index: Integer; AImage: TImage);
  published
    property ActivePage: Integer read FActivePage write SetActivePage;
    property PageCount: Integer read GetPageCount write SetPageCount;
    property Align;
    property Position;
    property Width;
    property Height;
  end;

implementation

{ TFMXImageSlider }

constructor TFMXImageSlider.Create(AOwner: TComponent);
begin
  inherited;
  FContainer := TLayout.Create(Self);
  FContainer.Parent := Self;
  FContainer.Stored := False;
  FAnimation := TFloatAnimation.Create(Self);
  FAnimation.PropertyName := 'Position.X';
  FAnimation.Parent := FContainer;
  FAnimation.Duration := 0.1;
  FPages := TList<TLayout>.Create;
  HitTest := True;
  ActivePage := -1;
  FStartDrag := False;
  AutoCapture := True;
end;

destructor TFMXImageSlider.Destroy;
begin
  FPages.Free;
  inherited;
end;

function TFMXImageSlider.GetPageCount: Integer;
begin
  Result := FPages.Count;
end;

procedure TFMXImageSlider.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Single);
begin
  inherited;
  if (PageCount > 0) and (Button = TMouseButton.mbLeft) then
  begin
    FStartDrag := True;
    FDownPos := PointF(X, Y);
    FDownIndex := FActivePage;
  end;
end;

procedure TFMXImageSlider.MouseMove(Shift: TShiftState; X, Y: Single);
var
  DeltaX, NewX: Single;
begin
  inherited;
  if FStartDrag then
  begin
    DeltaX := X - FDownPos.X;
    NewX := -FDownIndex * Width + DeltaX;
    FContainer.Position.X := NewX;
  end;
end;

procedure TFMXImageSlider.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Single);
var
  DeltaX: Single;
begin
  inherited;
  if FStartDrag then
  begin
    FStartDrag := False;
    DeltaX := X - FDownPos.X;
    if (DeltaX > Width * 0.4) then
    begin
      if FActivePage > 0 then
        FActivePage := FActivePage - 1;
    end
    else if DeltaX < (-Width * 0.4) then
    begin
      if FActivePage < PageCount - 1 then
        FActivePage := FActivePage + 1;
    end;

    FAnimation.StartValue := FContainer.Position.X;
    FAnimation.StopValue := - FActivePage * Width;
    FAnimation.Start;
  end;
end;

procedure TFMXImageSlider.Resize;
var
  I: Integer;
begin
  inherited;
  if PageCount = -1 then
    FContainer.Width := Width
  else
    FContainer.Width := PageCount * Width;
  for I := 0 to FPages.Count-1 do
  begin
    FPages[I].Width := Width;
    FPages[I].Height := Height;
    FPages[I].Position.X := I * Width;
  end;
end;

procedure TFMXImageSlider.SetActivePage(const Value: Integer);
begin
  if FActivePage <> Value then
  begin
    if (FActivePage = -1) then
      FContainer.Position.X := 0
    else
      FContainer.Position.X := -Width * FActivePage;
  end;
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
  L: TLayout;
begin
  if Value >= 0 then
  begin
    OldCount := PageCount;
    if OldCount < Value then
    begin
      for I := OldCount+1 to Value do
      begin
        L := TLayout.Create(Self);
        L.Parent := FContainer;
        L.Width := Self.Width;
        L.Height := Self.Height;
        L.Stored := False;
        L.Position.X := I * Width;
        FPages.Add(L);
      end;
    end
    else if OldCount > Value then
    begin
      for I := OldCount-1 downto Value do
      begin
        L := FPages[I];
  //      if L.ChildrenCount > 0 then
  //        L.Children[0].Parent := Self.Parent;
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

end.
