# iOS-000-FCSideBar

##Introduction 介紹
![demo gif](http://s24.postimg.org/9z7bdnl4z/demo.gif)


##How to use 使用

Example 範例：
將三個controller放入```customViewControllers```這個陣列，並設定每個controller的```sideBarName```。sideBar上的列表就會有相對應的名字，點選對應的名字即可切換到對應的controller。

Set ```sideBarName``` of controller. 

Put these controllers into ```customViewControllers```. 

There will be a sideBarName list on sideBar, selecting the corresponding name will switch to corresponding controller.
```
    self.fcAnimationOneController = [[FCAnimationOneController alloc] init];
    self.fcAnimationOneController.sideBarName = @"ControllerOne";
    
    self.fcAnimationTwoController = [[FCAnimationTwoController alloc] init];
    self.fcAnimationTwoController.sideBarName = @"ControllerTwo";

    self.fcAnimationThreeController = [[FCAnimationThreeController alloc] init];
    self.fcAnimationThreeController.sideBarName = @"ControllerThree";
    
    self.fcAnimationNavigationController.customViewControllers = @[self.fcAnimationOneController, self.fcAnimationTwoController, self.fcAnimationThreeController];
```
