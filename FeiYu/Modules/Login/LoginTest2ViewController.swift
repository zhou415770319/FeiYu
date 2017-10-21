//
//  LoginTest2ViewController.swift
//  FeiYu
//
//  Created by 周飞 on 2017/10/21.
//  Copyright © 2017年 ZF. All rights reserved.
//

import UIKit
import MBProgressHUD

class LoginTest2ViewController: BaseViewController {

    @IBOutlet weak var userinfoView: YMFUserInfoView!
    
    //    @IBOutlet weak var btnView: UIView!
    @IBOutlet weak var backView: UIImageView!
    
    var isRememberPwd:Bool!
    
    var menuBtn: SZFoldawayButton!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ZFSelectMenuManager.menu(withFrame: CGRect.init(x: UIScreen.main.bounds.size.width-40, y: 100, width: 40, height: 40), superView: view)
        
        self.title = "登录"
        self.view.backgroundColor = UIColor.white
        
        let desWidth = CGFloat(160.0)
        let desY = self.view.frame.size.height-60.0
        let padding = CGFloat(15)
        let lineWidth = (self.view.frame.size.width-desWidth-padding*4)/2
        
//        let descrip = UILabel.init(frame: CGRect.init(x: padding*2 + lineWidth, y: desY, width: desWidth, height: 30))
        let descrip = UILabel.init(frame: CGRect.init(x: 0, y: desY, width: UIWindow().bounds.size.width, height: 30))
        
        descrip.text = "中国创新支付集团"
        descrip.textAlignment = NSTextAlignment.center
        //        descrip.center.x = self.center.x
        self.view.addSubview(descrip)
        
//        let line3 = UIView.init(frame: CGRect.init(x: padding, y: desY+15, width: lineWidth, height: 1))
//        line3.backgroundColor = UIColor.lightGray
//        self.view.addSubview(line3)
//
//        let line4 = UIView.init(frame: CGRect.init(x: padding*3 + lineWidth + desWidth, y: desY+15, width: lineWidth, height: 1))
//        line4.backgroundColor = UIColor.lightGray
//        self.view.addSubview(line4)
        
//                backView.image = UIImage.init(named: "login_background")
        
        
        //        self.navigationController?.navigationBar.isTranslucent = false
        
        
        //        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        //        改变后需要及时刷新的调用
        //        [viewController setNeedsStatusBarAppearanceUpdate];
        //        [navigationController.navigationBar setTranslucent:NO];
        
        //        let backView = UIImageView.init(frame: self.view.frame)
        //        let backImage = UIImage.init(named: "login_background")!
        //
        //        backView.image = backImage
        //        backView.alpha = 0.8
        //        self.view.addSubview(backView)
        //        self.view.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "login_background")!)
        userinfoView.backgroundColor = UIColor.clear
        
        //        btnView.backgroundColor = UIColor.clear
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        //        userinfoView.rePwdBtn.isSelected = userDef.bool(forKey: "isRememberPwd")
        //
        let userDef = UserDefaults.standard
        
        if userDef.bool(forKey: "isfromRegister"){
            
            userinfoView.merchantNum.text = userDef.string(forKey: "userNmae")
            userinfoView.userPwd.text = userDef.string(forKey: "userPwd")
            
        }
        
        if userDef.bool(forKey: "isRememberPwd") {
            isRememberPwd = true
            userinfoView.merchantNum.text = userDef.string(forKey: "userNmae")
            userinfoView.userPwd.text = userDef.string(forKey: "userPwd")
            
        }else{
            isRememberPwd = false
            //            userinfoView.userName.text = ""
            userinfoView.userPwd.text = ""
            
        }
        
        //        userinfoView.userName.text = "000luwei"
        //        userinfoView.userPwd.text = "abcd123."
        //        userinfoView.center = self.view.center
        //        userinfoView.userName.text = "18610477472"
        //        userinfoView.merchantNum.text = "000110058120023"
        //        userinfoView.userPwd.text = "test.456"
        
        //                userinfoView.userName.text = "13810617963"
        //                userinfoView.merchantNum.text = "000110048160020"
        //                userinfoView.userPwd.text = "123456"
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func btnClick(sender:UIButton){
        
        
        print(NSString.init(format: "%@%d", "--------tag--------" , sender.tag))
        
        if sender.tag == 1000{
            
            //直接跳转
            
            //            self.present((self.storyboard?.instantiateViewController(withIdentifier: "ZFHomeViewController"))!, animated: true, completion: {
            //
            //            })
            
            if !self.fixInfo() {
                return
            }
            let dict = NSMutableDictionary.init(capacity: 1)
            //            dict.setValue(userinfoView.userName.text, forKey: "userName")
            dict.setValue(userinfoView.userPwd.text, forKey: "password")
            dict.setValue(userinfoView.merchantNum.text, forKey: "merchantId")
            
            self.showProgressHUD()
            
            //直接跳转
            //            self.present((self.storyboard?.instantiateViewController(withIdentifier: "ZFHomeViewController"))!, animated: true, completion: {
            //
            //            })
            
//            NetworkingManager.standard().request(LINKURL_Login, parameters: dict, success: { (responseObject) in
//
//                let responseO = responseObject as! AFNResponseModel
//                let mode = ZFLoginModel.init(dictionary: responseO.dict)
//                print(responseO.dict)
//
//
//                if(mode?.retCode == "0000"){
//
//                    let userInfo = ZFAccountInfo.shared()
//                    userInfo?.accountInfo = mode?.accountInfo
//                    userInfo?.user = mode?.user
//                    userInfo?.merchBaseInfo = mode?.merchBaseInfo;
//
//                    let userDef = UserDefaults.standard
//                    userDef.set(self.userinfoView.merchantNum.text, forKey: "userNmae")
//                    //                    userDef.set(self.userinfoView.userPwd.text, forKey: "userPwd")
//                    //直接跳转
//                    self.present((self.storyboard?.instantiateViewController(withIdentifier: "ZFHomeViewController"))!, animated: true, completion: {
//
//                    })
//
//                }else{
//                    self.toastInfo(mode?.retMsg)
//                }
//
//            }, failture: { (error) in
//                let errorstr = error as! String
//                self.toastInfo(errorstr)
//            })
            
            
        }else if sender.tag == 1001{
            isRememberPwd = !isRememberPwd
            sender.isSelected = isRememberPwd
            let userDef = UserDefaults.standard
            userDef.set(isRememberPwd, forKey: "isRememberPwd")
            if isRememberPwd == false {
                userDef.set("", forKey: "userNmae")
                //                userDef.set("", forKey: "userPwd")
            }
        }
        else if sender.tag == 1002{
            
            let userDef = UserDefaults.standard
            userDef.set(self.userinfoView.merchantNum.text, forKey: "userNmae")
            //            userDef.set(self.userinfoView.userPwd.text, forKey: "userPwd")
            //            self.navigationController?.pushViewController(YMFForgotPwdViewController(), animated: true)
            
        }
        else if sender.tag == 1008{
//            let vc = RegistViewController()
//            vc.pageType = "forgetPwdPage"
//            let userDef = UserDefaults.standard
//            userDef.set(self.userinfoView.merchantNum.text, forKey: "userNmae")
//            userDef.set(self.userinfoView.userPwd.text, forKey: "userPwd")
//            self.navigationController?.pushViewController(vc, animated: true)
            
            NSLog("忘记密码")
        }else if sender.tag == 1009{
//            let vc = RegistViewController()
//            vc.pageType = "registPage"
//            let userDef = UserDefaults.standard
//            userDef.set(self.userinfoView.merchantNum.text, forKey: "userNmae")
//            userDef.set(self.userinfoView.userPwd.text, forKey: "userPwd")
//            self.navigationController?.pushViewController(vc, animated: true)
            
            NSLog("注册")
            
        }
        
    }
    
    func fixInfo()->Bool{
        if (self.userinfoView.merchantNum.text == "") {
            self.toastInfo("商户号不能为空")
            return false
        }
        //        if (self.userinfoView.userName.text == "") {
        //            self.toastInfo("用户名不能为空")
        //            return false
        //        }
        if (self.userinfoView.userPwd.text == "") {
            self.toastInfo("密码不能为空")
            return false
        }
        return true
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
