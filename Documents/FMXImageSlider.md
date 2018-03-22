## TFMXImageSlider

![TFMXImageSlider](../SnapShots/FMXImageSlider.gif)  

A Simple Image Slider

一个简单的图片轮播控件

2018-01-31, v0.2.0.0 : merged with loko's change<br>

2018-03-21, v0.3.0.0 : merged with kwon hwang-jung's change<br>
1. add three Add methods to add bitmap directly<br>
2. add Next, Prev methods<br>
3. add AutoSlider property can auto slide<br>
4. add TimerInterval to control AutoSlider interval<br>
5. use ActivePage property move page, ex)ActivePage := 1<br>
6. add Datas property, can set tagstring on each page<br>
	
2018-03-21, v0.4.0.0 : merged with Mikkao's change 2018-03-01<br>
1. change OnPageChange event to TPageChangeEvent<br>
2. add OnPageAnimationFinish event<br>
3. add OnCanDragBegin event<br>

2018-03-21, v0.5.0.0 :<br>
1. rewrite slide method, now can support loop<br>

2018-03-22, v0.6.0.0 :<br>
1. add dot indicator, support dynamic change dot active/inactive color<br>