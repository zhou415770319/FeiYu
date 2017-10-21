//
//  BtnView.swift
//  FASTPAY
//
//  Created by Mac on 16/10/26.
//  Copyright © 2016年 ZF. All rights reserved.
//

import UIKit


class BtnView: ZFXibView {

    @IBOutlet weak var registBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        registBtn.setTitleColor(UIColor.orange, for: UIControlState.normal)
//        
//        buttonTool.buttonWithType(btn: registBtn, btntype: btnType.btnType_Login_regist,tag:2000)
        
//        phoneBtn.backgroundColor = UIColor.orange
//        
//        phoneBtn.layer.cornerRadius = 15
//        
//        phoneBtn.clipsToBounds = true
//        phoneBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        
//        let btn = UIButton.creatButton(imageName: "", title: "zhoufei")
//        
//        btn.frame = CGRect.init(x: 10, y: 40, width: 300, height: 40)
//        btn.backgroundColor = UIColor.red
//        self.contentView.addSubview(btn)
        
        
//        phoneBtn = buttonTool().buttonWithBtnType(buttonTool)
        
    }
    
//    @IBAction func registBtnClick(_ sender: AnyObject) {
//        
////        let vc = RegistViewController (nibName: "RegistViewController", bundle: nil)
//        
////        let stor = UIStoryboard.init(name: "Main", bundle: nil)
////        let vc = stor.instantiateViewController(withIdentifier: "RegistViewController")
////        
////        let vc = UIStoryboard(name: "RegistViewController", bundle: nil).instantiateInitialViewController() as! UIViewController
//        ViewToll.viewController(registBtn).present(ZFRegistViewController(), animated: true) {
//            
//        }
//        
//        
//    }
    @IBAction func phoneBtnClick(_ sender: AnyObject) {
        
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
