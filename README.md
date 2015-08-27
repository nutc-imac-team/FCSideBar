# FCSideBar

###Introduction 介紹
![demo gif](http://i.imgur.com/WqQi3Of.gif)


###Podfile

```
platform :ios, '8.4'
pod "FCSideBar", "~> 1.0.0"
```

###How to use 使用

1. create ```FCAnimationNavigationController```.
2. Put controllers into ```fcAnimationNavigationController.customViewControllers```.
3. Set each ```sideBarName``` of controller.
4. present to ```fcAnimationNavigationController```.
5. There will be a sideBarName list on sideBar, selecting the name will switch to corresponding controller.


<ol>
<li>創建<code>FCAnimationNavigationController</code>。</li>
<li>將欲加入的controller放入<code>fcAnimationNavigationController.customViewControllers</code>這個陣列。</li>
<li>設定每個controller的<code>sideBarName</code>。</li>
<li>將controller present到<code>fcAnimationNavigationController</code>。</li>
<li>sideBar上的列表就會有相對應的名字，點選對應的名字即可切換到對應的controller。</li>
</ol>

Here is sample code 以下為範例程式碼：
```
    self.fcAnimationOneController = [[FCAnimationOneController alloc] init];
    self.fcAnimationOneController.sideBarName = @"ControllerOne";
    
    self.fcAnimationTwoController = [[FCAnimationTwoController alloc] init];
    self.fcAnimationTwoController.sideBarName = @"ControllerTwo";

    self.fcAnimationThreeController = [[FCAnimationThreeController alloc] init];
    self.fcAnimationThreeController.sideBarName = @"ControllerThree";
    
    self.fcAnimationNavigationController.customViewControllers = @[self.fcAnimationOneController, self.fcAnimationTwoController, self.fcAnimationThreeController];
```

# 

##Warning
> **Controller that you want to put in customViewControllers must inherit FCBaseController.**
>
> **controller.view have been setted FCAnimationBaseView.**
>
> **Please use [controller.view addSubView:your customized view] if you want to set your customized view**

##注意
> **欲加入controller需繼承於FCBaseController。**
>
> **FCBaseController的view已經被設定為FCAnimationBaseView**
>
> **如果要將controller的view設定成自己製作的view，請用[controller.view addSubView:自製的View]**

# 

##Customized

Customize backgroundcolor of ```FCAnimationBaseView```

```- (void) setCustomSuperViewBackgroundColor:(UIColor*)customBackgroundColor;```

Customize sidebarcell and background color in sidebar

Use ```FCCustomSideBarCellDelegate```

```
FCCustomSideBarCellDelegate
- (FCNavigationViewCell*) fcCustomView:(UITableView*)customView fcCustomSideBarCellAtRow:(NSInteger)cellRow;
- (UIColor*) fcCustomViewColor;
```

##客製化

客製化```FCAnimationBaseView```的backgroundcolor

```- (void) setCustomSuperViewBackgroundColor:(UIColor*)customBackgroundColor;```

客製化Sidebarcell與Sidebar的背景顏色

使用```FCCustomSideBarCellDelegate```

```
FCCustomSideBarCellDelegate
- (FCNavigationViewCell*) fcCustomView:(UITableView*)customView fcCustomSideBarCellAtRow:(NSInteger)cellRow;
- (UIColor*) fcCustomViewColor;
```

