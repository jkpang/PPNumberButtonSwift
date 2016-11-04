//
//  ViewController.swift
//  PPNumberButtonSwift
//
//  Created by AndyPang on 16/9/25.
//  Copyright © 2016年 AndyPang. All rights reserved.
//

/*
 *********************************************************************************
 *
 *⭐️⭐️⭐️ 新建 PP-iOS学习交流群: 323408051 欢迎加入!!! ⭐️⭐️⭐️
 *
 * 如果您在使用 PPNumberButtonSwift 的过程中出现bug或有更好的建议,还请及时以下列方式联系我,我会及
 * 时修复bug,解决问题.
 *
 * Weibo : CoderPang
 * Email : jkpang@outlook.com
 * QQ 群 : 323408051
 * GitHub: https://github.com/jkpang
 *
 * PS:PPNumberButtonSwift的Objective-C版本:
 * https://github.com/jkpang/PPNumberButton
 *
 * 如果 PPNumberButtonSwift 好用,希望您能Star支持,你的 ⭐️ 是我持续更新的动力!
 *********************************************************************************
 */

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
        
        let numberButton = PPNumberButton.init(frame: CGRect(x: 100, y: 100, width: 110, height: 30))
        //开启抖动动画
        numberButton.shakeAnimation = true
        numberButton.maxValue = 10
        numberButton.minValue = 2
        //加减按钮的闭包回调
        numberButton.numberResult { (number) in
            
            print(number)
        }
        
        view.addSubview(numberButton)
        
    }
    
    // MARK: - 边框状态
    func example2() {
        
        let numberButton = PPNumberButton.init(frame: CGRect(x: 100, y: 160, width: 200, height: 30))
        
        //设置边框颜色
        numberButton.borderColor(UIColor.gray)
        
        //加减按钮的闭包回调
        numberButton.numberResult { (number) in
            
            print(number)
        }
        
        view.addSubview(numberButton)
    }
    
    // MARK: - 自定义加减按钮的文字
    func example3() {
        
        let numberButton = PPNumberButton.init(frame: CGRect(x: 100, y: 220, width: 150, height: 44))
        //设置加减按钮的标题
        numberButton.setTitle(decreaseTitle: "减", increaseTitle: "加")
        //设置加减按钮标题的字体大小
        numberButton.buttonTitleFont(UIFont.systemFont(ofSize: 15))
        //开启抖动动画
        numberButton.shakeAnimation = true
        //加减按钮的闭包回调
        numberButton.numberResult { (number) in
            
            print(number)
        }
        
        view.addSubview(numberButton)
    }
    
    // MARK: - 自定义加减按钮背景图片
    func example4() {
        
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
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
