//
//  buttonTool.swift
//  FASTPAY
//
//  Created by Mac on 16/10/27.
//  Copyright © 2016年 ZF. All rights reserved.
//

import UIKit
enum btnType{
    case btnType_Login
    case btnType_Login_rePwd
    case btnType_Login_rePwd2

    case btnType_Login_phone
    case btnType_Login_regist
    case btnType_Login_forget
    case btnType_VerifCode
    case basic

}
class buttonTool: NSObject {

    func buttonWithBtnType(button:UIButton) ->UIButton{
        
        button.backgroundColor = UIColor.orange
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }
    
    
}


extension buttonTool {
    
    //把按钮直接不同属性的名字传进来，在这里我们传进来图片名字和标题
    class func creatButton(imageName:String, title:String) -> UIButton {
        
        let button = UIButton()
        button.setImage(UIImage(named: imageName), for: UIControlState.normal)
        button.setTitle(title, for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return button
    }
    
    
    class func buttonWithType(btn:UIButton ,btntype:btnType,tag:NSInteger){
        btn.layer.cornerRadius = 10
        btn.tag = tag
        btn.addTarget(ViewToll.viewController(btn), action: #selector(btnClick(sender:)), for: UIControlEvents.touchUpInside)
        btn.clipsToBounds = true
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.setTitleColor(UIColor.lightGray, for: UIControlState.highlighted)
        btn.backgroundColor = UIColor.clear

        switch btntype {
        case .btnType_Login_phone:
            btn.layer.cornerRadius = 10
            btn.setTitleColor(UIColor.white, for: UIControlState.normal)

            btn.backgroundColor = RGBA(r: 104, g: 138, b: 244, a: 1.0)
        case .btnType_Login:
            btn.layer.cornerRadius = 10
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 25)

            btn.backgroundColor = #colorLiteral(red: 0.2352941176, green: 0.4901960784, blue: 0.9254901961, alpha: 1)
            
            btn.setTitleColor(UIColor.white, for: UIControlState.normal)
            
        case .btnType_Login_regist:
            btn.layer.cornerRadius = 10
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            
            btn.backgroundColor = #colorLiteral(red: 0.2352941176, green: 0.4901960784, blue: 0.9254901961, alpha: 1)
            
            btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        case .btnType_Login_rePwd:
            btn.setTitle("记住密码", for: UIControlState.selected)
            btn.setTitle("记住密码", for: UIControlState.normal)
            btn.setImage(UIImage.init(named: "kuang"), for: UIControlState.normal)
            btn.setImage(UIImage.init(named: "kuang_select"), for: UIControlState.selected)
//            btn.setBackgroundImage(ImageTool.image(from: UIColor.clear), for: UIControlState.selected)
//            btn.setImage(UIImage.init(named: "kuang_select"), for: UIControlState.selected)
        case .btnType_Login_rePwd2:
            btn.setTitle("记住密码", for: UIControlState.selected)
            btn.setTitle("不记住密码", for: UIControlState.normal)
            btn.setImage(UIImage.init(named: "kuang"), for: UIControlState.normal)
            btn.setImage(UIImage.init(named: "kuang_select"), for: UIControlState.selected)
        case .btnType_VerifCode:
            btn.backgroundColor = UIColor.orange
            

        default :
            btn.setTitleColor(UIColor.lightGray, for: UIControlState.normal)

            btn.backgroundColor = UIColor.clear
            
        }
        
        
    }
    
    func btnClick(sender:UIButton){
        
        
        
    }
    
}
