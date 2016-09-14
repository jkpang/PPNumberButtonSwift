//
//  PPNumberButtonSwift.swift
//  PPNumberButtonSwift
//
//  Created by AndyPang on 16/9/13.
//  Copyright © 2016年 AndyPang. All rights reserved.
//

import UIKit

/// 定义一个闭包
typealias ResultClosure = (number: String)->()

public protocol PPNumberButtonDelegate: NSObjectProtocol {
    
    func numberButtonResult(numberButton: PPNumberButtonSwift, number: String)
}

@IBDesignable public class PPNumberButtonSwift: UIView {

    weak var delegate: PPNumberButtonDelegate?  // 代理
    var NumberResultClosure: ResultClosure?     // 闭包
    var isShakeAnimation: Bool = false         // 打开抖动动画
    var decreaseBtn: UIButton!     // 减按钮
    var increaseBtn: UIButton!     // 加按钮
    var textField: UITextField!    // 数量展示/输入框
    var timer: NSTimer!            // 快速加减定时器
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        //整个控件的默认尺寸(和某宝上面的按钮同样大小)
        if CGRectIsEmpty(frame) {self.frame = CGRect(x: 0, y: 0, width: 110, height: 30)}
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override public func awakeFromNib() {
        setupUI()
    }
    
    //设置UI布局
    private func setupUI() {
        backgroundColor = UIColor.whiteColor();
        layer.cornerRadius = 3.0;
        clipsToBounds = true;
        
        decreaseBtn = setupButton(title: "－")
        increaseBtn = setupButton(title: "＋")
        
        textField = UITextField.init()
        textField.text = "1"
        textField.font = UIFont.boldSystemFontOfSize(15)
        textField.delegate = self
        textField.keyboardType = UIKeyboardType.NumberPad
        textField.textAlignment = NSTextAlignment.Center
        self.addSubview(textField)
    }
    
    // MARK: - 重新布局UI
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let height = frame.size.height
        let width = frame.size.width
        decreaseBtn.frame = CGRect(x: 0, y: 0, width: height, height: height)
        increaseBtn.frame = CGRect(x: width - height, y: 0, width: height, height: height)
        textField.frame = CGRect(x: height, y: 0, width: width - 2.0*height, height: height)
    }
    
    //设置加减按钮的公共方法
    private func setupButton(title title:String) -> UIButton {
        let button = UIButton.init();
        button.setTitle(title, forState: UIControlState.Normal)
        button.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        button.addTarget(self, action:#selector(self.touchDown(_:)) , forControlEvents: UIControlEvents.TouchDown)
        button.addTarget(self, action:#selector(self.touchUp(_:)) , forControlEvents:UIControlEvents.TouchUpOutside)
        button.addTarget(self, action:#selector(self.touchUp(_:)) , forControlEvents:UIControlEvents.TouchUpInside)
        button.addTarget(self, action:#selector(self.touchUp(_:)) , forControlEvents:UIControlEvents.TouchCancel)
        self.addSubview(button)
        return button;
    }
    
    // MARK: - 加减按钮点击响应
    //点击按钮: 单击逐次加减,长按连续加减
    @objc private func touchDown(button: UIButton) {
        textField.endEditing(false)
        if button == decreaseBtn {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.15, target: self, selector: #selector(self.decrease), userInfo: nil, repeats: true)
        } else {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.15, target: self, selector: #selector(self.increase), userInfo: nil, repeats: true)
        }
        timer.fire()
    }
    
    //松开按钮:清除定时器
    @objc private func touchUp(button: UIButton)  {
        cleanTimer()
    }
    
    // MARK: - 减运算
    @objc private func decrease() {
        if (textField.text?.characters.count)! == 0 || Int(textField.text!) <= 0 {
            textField.text = "1"
        }
        
        let number = Int(textField.text!)! - 1;
        if number > 0 {
            textField.text = "\(number)";

            //闭包回调
            NumberResultClosure?(number: "\(number)")
            //delegate的回调
            delegate?.numberButtonResult(self, number: "\(number)")
        } else {
            //添加抖动动画
            if isShakeAnimation {shakeAnimation()}
            print("数量不能小于1");
        }
    }
    
    // MARK: - 加运算
    @objc private func increase() {
        if (textField.text?.characters.count)! == 0 || Int(textField.text!) <= 0 {
            textField.text = "1"
        }
        
        let number = Int(textField.text!)! + 1;
        textField.text = "\(number)";
        //闭包回调
        NumberResultClosure?(number: "\(number)")
        //delegate的回调
        delegate?.numberButtonResult(self, number: "\(number)")
    }
    
    // MARK: - 抖动动画
    private func shakeAnimation() {
        let animation = CAKeyframeAnimation.init(keyPath: "position.x")
        //获取当前View的position坐标
        let positionX = layer.position.x
        //设置抖动的范围
        animation.values = [(positionX-10),(positionX),(positionX+10)]
        //动画重复的次数
        animation.repeatCount = 3
        //动画时间
        animation.duration = 0.07
        //设置自动反转
        animation.autoreverses = true
        //将动画添加到layer
        layer.addAnimation(animation, forKey: nil)
    }
    
    private func cleanTimer() {
        if ((timer?.valid) != nil) {
            timer.invalidate()
            timer = nil;
        }
    }
    
    deinit {
        cleanTimer()
    }
    
    
}

extension PPNumberButtonSwift: UITextFieldDelegate {
    
    // MARK: - UITextFieldDelegate
    public func textFieldDidEndEditing(textField: UITextField) {
        if (textField.text?.characters.count)! == 0 || Int(textField.text!) <= 0 {
            textField.text = "1"
        }
        
        //闭包回调
        NumberResultClosure?(number: "\(textField.text!)")
        //delegate的回调
        delegate?.numberButtonResult(self, number: "\(textField.text!)")

    }

}

// MARK: - 自定义UI接口
extension PPNumberButtonSwift {

    /**
     加减按钮的响应闭包回调
     */
    func numberResult(finished: ResultClosure) {
        NumberResultClosure = finished
    }
    
    /// 输入框中的内容
    var currentNumber: String? {
        get {
            return (textField.text!)
        }
        set {
            textField.text = newValue
        }
    }
    
    /**
     是否开启抖动动画,默认false
     */
    func shakeAnimation(isOpen: Bool) {
        isShakeAnimation = isOpen
    }
    
    /**
     输入框中的字体属性
     */
    func inputFieldFont(inputFieldFont: UIFont) {
        textField.font = inputFieldFont;
    }
    
    /**
     加减按钮的字体属性
     */
    func buttonTitleFont(buttonTitleFont: UIFont) {
        increaseBtn.titleLabel!.font = buttonTitleFont;
        decreaseBtn.titleLabel!.font = buttonTitleFont;
    }
    
    /**
     设置按钮的边框颜色
     */
    func borderColor(borderColor: UIColor) {
        layer.borderColor = borderColor.CGColor;
        decreaseBtn.layer.borderColor = borderColor.CGColor;
        increaseBtn.layer.borderColor = borderColor.CGColor;
        
        layer.borderWidth = 0.5;
        decreaseBtn.layer.borderWidth = 0.5;
        increaseBtn.layer.borderWidth = 0.5;
    }
    
    //注意:加减号按钮的标题和背景图片只能设置其中一个,若全部设置,则以最后设置的类型为准
    
    /**
     设置加/减按钮的标题
     
     - parameter decreaseTitle: 减按钮标题
     - parameter increaseTitle: 加按钮标题
     */
    func setTitle(decreaseTitle decreaseTitle: String, increaseTitle: String) {
        decreaseBtn.setImage(nil, forState: UIControlState.Normal)
        increaseBtn.setImage(nil, forState: UIControlState.Normal)
        
        decreaseBtn.setTitle(decreaseTitle, forState: UIControlState.Normal)
        increaseBtn.setTitle(increaseTitle, forState: UIControlState.Normal)
    }
    
    /**
     设置加/减按钮的背景图片
     
     - parameter decreaseImage: 减按钮背景图片
     - parameter increaseImage: 加按钮背景图片
     */
    func setImage(decreaseImage decreaseImage: UIImage, increaseImage: UIImage) {
        decreaseBtn.setTitle(nil, forState: UIControlState.Normal)
        increaseBtn.setTitle(nil, forState: UIControlState.Normal)
        
        decreaseBtn.setImage(decreaseImage, forState: UIControlState.Normal)
        increaseBtn.setImage(increaseImage, forState: UIControlState.Normal)
    }

}

