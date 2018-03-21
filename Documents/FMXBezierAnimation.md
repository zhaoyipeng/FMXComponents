## [TFMXBezierAnimation](https://github.com/zhaoyipeng/FMXComponents/wiki/FMXBezierAnimation)

![FMXBezierAnimation](../SnapShots/FMXBezierAnimation.gif)  

TFMXBezierAnimation component inherit from TFloatAnimation, you can just drop a TFMXBezierAnimation component same as TFloatAnimation.

use these code to set the cubic-bezier parameters
```pascal
  BezierAnimation1.Duration := duration; 
  BezierAnimation1.SetData(X1, Y1, X2, Y2);
  BezierAnimation1.Start;
```
