// ***************************************************************************
//
// FMXComponents: Firemonkey Opensource Components Set from China
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
end;

end.
