// ***************************************************************************
//
// FMXComponents: Firemonkey Opensource Components Set
//
// Copyright 2017 谢顿 (zhaoyipeng@hotmail.com)
//
// https://github.com/zhaoyipeng/FMXComponents
//
// ***************************************************************************
unit FMX.RegComponents;

interface

uses
  System.Classes
// 可根据需要注释调不需要的控件单元和注册
  , FMX.CircleScoreIndicator
  , FMX.ImageSlider
  , FMX.RatingBar
  , FMX.ScrollableList
  , FMX.SimpleBBCodeText
  , FMX.GesturePassword
  , FMX.CalendarControl
  , FMX.Seg7Shape
  , FMX.Toast
  , FMX.QRCode
  , FMX.LoadingIndicator
  , FMX.Callout
  , FMX.RotatingText
  , FMX.BezierAnimation
  , FMX.BezierPanel
  ;

procedure Register;

implementation

const
  FMX_COMPONENTS_PALETTE = 'FMXComponents';

procedure Register;
begin
  RegisterComponents(FMX_COMPONENTS_PALETTE, [TFMXCircleScoreIndicator]);
  RegisterComponents(FMX_COMPONENTS_PALETTE, [TFMXImageSlider]);
  RegisterComponents(FMX_COMPONENTS_PALETTE, [TFMXRatingBar]);
  RegisterComponents(FMX_COMPONENTS_PALETTE, [TFMXScrollableList]);
  RegisterComponents(FMX_COMPONENTS_PALETTE, [TFMXSimpleBBCodeText]);
  RegisterComponents(FMX_COMPONENTS_PALETTE, [TFMXGesturePassword]);
  RegisterComponents(FMX_COMPONENTS_PALETTE, [TFMXCalendarControl]);
  RegisterComponents(FMX_COMPONENTS_PALETTE, [TFMXSeg7Shape]);
  RegisterComponents(FMX_COMPONENTS_PALETTE, [TFMXToast]);
  RegisterComponents(FMX_COMPONENTS_PALETTE, [TFMXQRCode]);
  RegisterComponents(FMX_COMPONENTS_PALETTE, [TFMXLoadingIndicator]);
  RegisterComponents(FMX_COMPONENTS_PALETTE, [TFMXCallout]);
  RegisterComponents(FMX_COMPONENTS_PALETTE, [TFMXRotatingText]);
  RegisterComponents(FMX_COMPONENTS_PALETTE, [TFMXBezierAnimation]);
  RegisterComponents(FMX_COMPONENTS_PALETTE, [TFMXBezierPanel]);

end;

end.
