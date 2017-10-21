//
//  UserInfoView.swift
//  FASTPAY
//
//  Created by Mac on 16/10/26.
//  Copyright © 2016年 ZF. All rights reserved.
//

import UIKit

class UserInfoView: ZFXibView {

    @IBOutlet weak var iconImg: UIImageView!
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var userPwd: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var rePwd: UIButton!
    
    @IBOutlet weak var forPwd: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        userName.text = "13552417395"
//        userPwd.text = "12345678"
        
        iconImg.image = UIImage.init(named: "logo2")
        TextFieldTool.textFieldWithType(textField: userName, type: textFieldType.textFieldType_username)
        TextFieldTool.textFieldWithType(textField: userPwd, type: textFieldType.textFieldType_password)
        let userView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        //把imageView 添加到view中 可以设置 左边 和 右边的输入 距离
        let userImageV = UIImageView()
        userImageV.image = UIImage(named: "userIcon")
        userImageV.frame = CGRect.init(x: 5, y:5, width: 20, height: 20)
        //图片变形
        userImageV.contentMode = UIViewContentMode.scaleAspectFit
        userView.addSubview(userImageV)
        userName.leftView = userView
        //显示leftview的方法
        userName.leftViewMode = UITextFieldViewMode.always
        
        let userPWDView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        //把imageView 添加到view中 可以设置 左边 和 右边的输入 距离
        let userPWDImageV = UIImageView()
        userPWDImageV.image = UIImage(named: "PWDIcon")
        userPWDImageV.frame = CGRect.init(x: 5, y:5, width: 20, height: 20)
        //图片变形
        userPWDImageV.contentMode = UIViewContentMode.scaleAspectFit
        userPWDView.addSubview(userPWDImageV)
        userPwd.leftView = userPWDView
        //显示leftview的方法
        userPwd.leftViewMode = UITextFieldViewMode.always

//        userName.layer.cornerRadius = 20
//        userName.layer.borderWidth =  1
//        userName.layer.borderColor = UIColor.lightGray.cgColor
//        userName.leftViewRect(forBounds: CGRect.init(x: 15, y: 0, width: 40, height: 40))
//        
//        let imgIcon = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 40))
//        imgIcon.image = UIImage.init(named: "1")
//        
//        userName.leftView = imgIcon
        
        userName.placeholder = "用户名"
        userPwd.placeholder = "密码"
        buttonTool.buttonWithType(btn: loginBtn, btntype: btnType.btnType_Login,tag:1000)
        
        
//        rePwd.setTitle("记住密码", for: UIControlState.selected)
//        rePwd.setTitle("记住密码", for: UIControlState.normal)
//        rePwd.setImage(UIImage.init(named: "kuang"), for: UIControlState.normal)
//        rePwd.setImage(UIImage.init(named: "kuang_select"), for: UIControlState.selected)
//        rePwd.layer.cornerRadius = 10
//        rePwd.tag = 1001
//        rePwd.addTarget(ViewToll.viewController(rePwd), action: #selector(btnClick(sender:)), for: UIControlEvents.touchUpInside)
//        rePwd.clipsToBounds = true
//        rePwd.setTitleColor(UIColor.white, for: UIControlState.normal)
//        rePwd.setTitleColor(UIColor.lightGray, for: UIControlState.highlighted)
//        rePwd.backgroundColor = UIColor.clear
        

        buttonTool.buttonWithType(btn: rePwd, btntype: btnType.btnType_Login_rePwd2,tag:1001)
        buttonTool.buttonWithType(btn: forPwd, btntype: btnType.btnType_Login_forget,tag:1002)

        
    }
    
    
    func btnClick(sender:UIButton){
        
        
        
    }

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
