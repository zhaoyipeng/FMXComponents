## TFMXGuesturePassword

![TFMXGuesturePassword](../SnapShots/FMXGuesturePassword.gif)  

A Guesture Password input Control 

手势密码输入控件

感谢 xubzhlin 的支持，原始控件来自于FMX-UI-Controls项目，经作者同意由 谢顿 收集整理
原项目地址为：https://github.com/xubzhlin/FMX-UI-Controls

version history

2017-09-06, v0.1.0.0 :

   first release
   
2017-09-07, v0.2.0.0 :

   fixed bugs, do not used TImage, change to internal TFixedMultiResBitmap add default draw method if the bitmap not set, if user do not want set bitmap, just drop the component onto form, it can be used
   
   
   重构并修复若干缺陷，移除TImage属性，改为内部的TFixedMultiResBitmap，如果未设置图像，控件使用自绘方式显示选中状态
