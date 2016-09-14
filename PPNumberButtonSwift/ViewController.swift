//
//  ViewController.swift
//  PPNumberButtonSwift
//
//  Created by AndyPang on 16/9/13.
//  Copyright © 2016年 AndyPang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        example1()
        example2()
        example3()
        example4()
    }
    
    // MARK: - 默认状态
    func example1() {
        
        let numberButton = PPNumberButtonSwift.init(frame: CGRect(x: 100, y: 100, width: 110, height: 30))
        //开启抖动动画
        numberButton.shakeAnimation(true)
        //加减按钮的闭包回调
        numberButton.numberResult { (number) in
            
            print(number)
        }
        
        view.addSubview(numberButton)
        
    }
    
    // MARK: - 边框状态
    func example2() {
        
        let numberButton = PPNumberButtonSwift.init(frame: CGRect(x: 100, y: 160, width: 200, height: 30))
        
        //设置边框颜色
        numberButton.borderColor(UIColor.grayColor())
        
        //加减按钮的闭包回调
        numberButton.numberResult { (number) in
            
            print(number)
        }
        
        view.addSubview(numberButton)
    }
    
    // MARK: - 自定义加减按钮的文字
    func example3() {
        
        let numberButton = PPNumberButtonSwift.init(frame: CGRect(x: 100, y: 220, width: 150, height: 44))
        //设置加减按钮的标题
        numberButton.setTitle(decreaseTitle: "加", increaseTitle: "减")
        //设置加减按钮标题的字体大小
        numberButton.buttonTitleFont(UIFont.systemFontOfSize(15))
        //开启抖动动画
        numberButton.shakeAnimation(true)
        //加减按钮的闭包回调
        numberButton.numberResult { (number) in
            
            print(number)
        }
        
        view.addSubview(numberButton)
    }
    
    // MARK: - 自定义加减按钮背景图片
    func example4() {
        
        let numberButton = PPNumberButtonSwift.init(frame: CGRect(x: 100, y: 300, width: 100, height: 30))
        
        //设置加减按钮的自定义图片
        numberButton.setImage(decreaseImage: UIImage.init(named: "decrease_highlight")!, increaseImage: UIImage.init(named: "timeline_relationship_icon_addattention-1")!)
        
        //开启抖动动画
        numberButton.shakeAnimation(true)
        //加减按钮的闭包回调
        numberButton.numberResult { (number) in
            
            print(number)
        }
        
        view.addSubview(numberButton)
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

