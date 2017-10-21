//
//  YMFUserInfoView.swift
//  FASTPAY
//
//  Created by 周飞 on 2016/11/15.
//  Copyright © 2016年 ZF. All rights reserved.
//

import UIKit

class YMFUserInfoView: ZFXibView {
    @IBOutlet weak var iconImg: UIImageView!

    @IBOutlet weak var merchantNum: UITextField!
//    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var userPwd: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var registBtn: UIButton!
    var rePwdBtn: UIButton!
    
    @IBOutlet weak var forgetPwdBtn: UIButton!
    var isRememberPwd:Bool!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        rePwdBtn = UIButton.init(type: UIButtonType.custom)
        rePwdBtn.frame = CGRect.zero
        self.addSubview(rePwdBtn)
        iconImg.image = UIImage.init(named: "登录页")
//        TextFieldTool.textFieldWithImage(textField: userName, type: textFieldType.textFieldType_username, imgName: "登录页-输入用户名图标")
        TextFieldTool.textFieldWithImage(textField: userPwd, type: textFieldType.textFieldType_username, imgName: "登录页-输入密码")
        TextFieldTool.textFieldWithImage(textField: merchantNum, type: textFieldType.textFieldType_username, imgName: "登录页-主页图标")
        
        userPwd.isSecureTextEntry = true
        
        buttonTool.buttonWithType(btn: loginBtn, btntype: btnType.btnType_Login_regist,tag:1000)
        buttonTool.buttonWithType(btn: forgetPwdBtn, btntype:btnType.basic,tag:1008)
        buttonTool.buttonWithType(btn: registBtn, btntype: btnType.basic,tag:1009)
//        rePwdBtn = UIButton.init(type: UIButtonType.custom)
//        
//        rePwdBtn = buttonTool.creatButton(imageName: "kuang", title: "")
//        rePwdBtn.setImage(UIImage.init(named: "kuang_select"), for: UIControlState.selected)
//        rePwdBtn.frame = CGRect.init(x: loginBtn.frame.minX, y: loginBtn.frame.maxY+20, width: 30, height: 30)
//        rePwdBtn.addTarget(ViewToll.viewController(rePwdBtn), action: #selector(btnClick(sender:)), for: UIControlEvents.touchUpInside)
//        rePwdBtn.tag = 1001
//        self.addSubview(rePwdBtn)
        
//        let rePwdLab = UILabel.init(frame: CGRect.init(x: rePwdBtn.frame.maxX+10, y: loginBtn.frame.maxY+20, width: 80, height: 30))
//        rePwdLab.font = UIFont.systemFont(ofSize: 18)
//        rePwdLab.textColor = UIColor.white
//        
//        rePwdLab.text = "记住密码"
//        
//        self.addSubview(rePwdLab)
        
        let userDef = UserDefaults.standard
        if userDef.string(forKey: "userNmae") != "" {
            merchantNum.text = userDef.string(forKey: "userNmae")
        }
//        if userDef.string(forKey: "userPwd") != "" {
//            userPwd.text = userDef.string(forKey: "userPwd")
//        }
    }
    
    override func draw(_ rect: CGRect) {
        //添加边线
        
//        let line = UIView.init(frame: CGRect.init(x: 0, y: userName.frame.origin.y+userName.frame.height, width: self.frame.width, height: 0.5))
//        line.backgroundColor = UIColor.lightGray
//        self.addSubview(line)
//        let line1 = UIView.init(frame: CGRect.init(x: 0, y: userPwd.frame.origin.y+userPwd.frame.height, width: self.frame.width, height: 0.5))
//        line1.backgroundColor = UIColor.lightGray
//        self.addSubview(line1)
//        
//        let line2 = UIView.init(frame: CGRect.init(x: 0, y: merchantNum.frame.origin.y+merchantNum.frame.height, width: self.frame.width, height: 0.5))
//        line2.backgroundColor = UIColor.lightGray
//        self.addSubview(line2)

        
    }
    
    func btnClick(sender:UIButton){
        if sender.tag == 1001{
            
            isRememberPwd = !rePwdBtn.isSelected
            
            rePwdBtn.isSelected = isRememberPwd
            let userDef = UserDefaults.standard
            userDef.set(isRememberPwd, forKey: "isRememberPwd")
            if isRememberPwd == false {
                userDef.set("", forKey: "userNmae")
                userDef.set("", forKey: "userPwd")
            }
        }
//        else if sender.tag == 1002{
//            
//            ViewToll.viewController(self).navigationController?.pushViewController(YMFForgotPwdViewController(), animated: true)
//            
//        }


        
    }
    

    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
