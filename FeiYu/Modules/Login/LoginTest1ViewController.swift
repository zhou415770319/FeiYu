//
//  LoginTest1ViewController.swift
//  FeiYu
//
//  Created by 周飞 on 2017/9/27.
//  Copyright © 2017年 ZF. All rights reserved.
//

import UIKit
import IBAnimatable

class LoginTest1ViewController: AnimatableViewController {

    
    @IBOutlet weak var creatAccount: UIButton!
    @IBOutlet weak var forgetPwd: UIButton!
    @IBOutlet weak var signBtn: AnimatableButton!
    
    var menuBtn: SZFoldawayButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatAccount.backgroundColor = UIColor.clear
        forgetPwd.backgroundColor = UIColor.clear
        ZFSelectMenuManager.menu(withFrame: CGRect.init(x: UIScreen.main.bounds.size.width-40, y: 100, width: 40, height: 40), superView: view)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func signIn(_ sender: AnimatableButton) {
        let url = "FeiYu-CocoaC"+"://Main"
        
        UIApplication.shared.openURL(URL.init(string: url)!)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
