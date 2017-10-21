//
//  TextFieldTool.swift
//  FASTPAY
//
//  Created by Mac on 16/10/28.
//  Copyright © 2016年 ZF. All rights reserved.
//

import UIKit

enum textFieldType{
    
    case textFieldType_username
    case textFieldType_password
    case textFieldType_login

}

class TextFieldTool: NSObject {

    class func textFieldWithType(textField:UITextField ,type:textFieldType){
        textField.backgroundColor = UIColor.clear
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth =  1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        
        switch type {
        case .textFieldType_login:
            textField.backgroundColor = UIColor.clear

        default:
            textField.backgroundColor = UIColor.clear
            textField.layer.borderColor = UIColor.white.cgColor

        }
        
    }
    
    class func textFieldWithImage(textField:UITextField ,type:textFieldType ,imgName:String){
        textField.backgroundColor = UIColor.clear
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth =  1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        
        switch type {
        case .textFieldType_login:
            textField.backgroundColor = UIColor.clear
            
        default:
            
            textField.backgroundColor = UIColor.clear
            textField.layer.borderColor = UIColor.white.cgColor
            if imgName != "" {
                let merchantView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
                //把imageView 添加到view中 可以设置 左边 和 右边的输入 距离
                let merchantImageV = UIImageView()
                merchantImageV.image = UIImage.init(named: imgName)
                merchantImageV.frame = CGRect.init(x: 5, y:5, width: 20, height: 20)
                //图片变形
                merchantImageV.contentMode = UIViewContentMode.scaleAspectFit
                merchantView.addSubview(merchantImageV)
                textField.leftView = merchantView
                //显示leftview的方法
                textField.leftViewMode = UITextFieldViewMode.always
            }
            
            let line = UIView.init(frame: CGRect.init(x: 0, y:textField.frame.size.height-2, width: textField.frame.width, height: 0.5))
            line.backgroundColor = UIColor.lightGray
            textField.addSubview(line)
        }
        
    }

}


