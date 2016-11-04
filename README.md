# PPNumberButtonSwift
仿京东淘宝购物车商品的加减按钮的Swift版本,可定制程度较高, 使用简单,和Objective-C版本功能相同!

####如果你需要Objective-C版本,请戳: https://github.com/jkpang/PPNumberButton

![示例图](https://github.com/jkpang/PPNumberButton/blob/master/PPNumberButton.gif)

###新建 PP-iOS学习交流群 : 323408051 有关于PP系列封装的问题和iOS技术可以在此群讨论

##Requirements 要求
* iOS 8+
* Xcode 8+

##Installation 安装
###1.手动安装:
下载DEMO后,将PPNumberButtonSwift子文件夹拖入到项目中, 就可以直接使用,不用import任何东西.
###2.CocoaPods安装:
first
`pod 'PPNumberButtonSwift',:git => 'https://github.com/jkpang/PPNumberButtonSwift.git' `

then
`pod install或pod install --no-repo-update`

如果发现pod search PPNumberButtonSwift 不是最新版本，在终端执行pod setup命令更新本地spec镜像缓存(时间可能有点长),重新搜索就OK了
##Usage 使用方法

###1.默认样式

```swift
let numberButton = PPNumberButton.init(frame: CGRect(x: 100, y: 100, width: 110, height: 30))
//开启抖动动画
numberButton.shakeAnimation = true
//加减按钮的闭包回调
numberButton.numberResult { (number) in
    print(number)
}
        
view.addSubview(numberButton)
```
###2.边框样式

```swift
let numberButton = PPNumberButton.init(frame: CGRect(x: 100, y: 160, width: 200, height: 30))
        
//设置边框颜色
numberButton.borderColor(UIColor.grayColor())
//加减按钮的闭包回调
numberButton.numberResult { (number) in
    print(number)
}
        
view.addSubview(numberButton)
```
###3.自定义加减按钮的标题

```swift
let numberButton = PPNumberButton.init(frame: CGRect(x: 100, y: 220, width: 150, height: 44))
//设置加减按钮的标题
numberButton.setTitle(decreaseTitle: "加", increaseTitle: "减")
//设置加减按钮标题的字体大小
numberButton.buttonTitleFont(UIFont.systemFontOfSize(15))
//开启抖动动画
numberButton.shakeAnimation = true
//加减按钮的闭包回调
numberButton.numberResult { (number) in
    print(number)
}
        
view.addSubview(numberButton)

```
###4.自定义加减按钮的背景图片

```swift
let numberButton = PPNumberButton.init(frame: CGRect(x: 100, y: 300, width: 100, height: 30))
        
//设置加减按钮的自定义图片
numberButton.setImage(decreaseImage: UIImage.init(named: "decrease_highlight")!, increaseImage: UIImage.init(named: "timeline_relationship_icon_addattention-1")!)
//开启抖动动画
numberButton.shakeAnimation = true
//加减按钮的闭包回调
numberButton.numberResult { (number) in
    print(number)
}
        
view.addSubview(numberButton)


```
#####注: 加减号按钮的标题和背景图片只能设置其中一个,若全部设置,则以最后设置的类型为准

##使用xib创建
在控制器界面拖入UIView控件,在右侧的设置栏中将class名修改为PPNumberButton,按回车就OK了.

![示例图](https://github.com/jkpang/PPNumberButton/blob/master/photo.png)

====

####你的Star是我持续更新的动力!

##CocoaPods更新日志

* 2016.11.03(tag:0.2.0)--设置maxValue(最大值)与minValue(最小值)属性接口.
* 2016.09.24(tag:0.1.1)--适配Swift3
* 2016.09.14(tag:0.1.0)--Pods初始化

##联系方式:
* Weibo : @CoderPang
* Email : jkpang@outlook.com
* QQ群 : 323408051

![PP-iOS学习交流群群二维码](https://github.com/jkpang/PPCounter/blob/master/PP-iOS%E5%AD%A6%E4%B9%A0%E4%BA%A4%E6%B5%81%E7%BE%A4%E7%BE%A4%E4%BA%8C%E7%BB%B4%E7%A0%81.png)

##许可证
PPNumberButtonSwift 使用 MIT 许可证，详情见 LICENSE 文件。


