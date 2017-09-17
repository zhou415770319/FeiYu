//
//  Code4appViewController.swift
//  FeiYu
//
//  Created by 周飞 on 2017/9/17.
//  Copyright © 2017年 ZF. All rights reserved.
//

import UIKit

class Code4appViewController: ZFBaseTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray
        
        self.setupOneChildViewController(UITableViewController.init(), title: "首页", image: "icon_tabbar_homepage", selectedImage: "icon_tabbar_homepage_selected")
        self.setupOneChildViewController(UITableViewController.init(), title: "首页", image: "icon_tabbar_homepage", selectedImage: "icon_tabbar_homepage_selected")
        self.setupOneChildViewController(UITableViewController.init(), title: "首页", image: "icon_tabbar_homepage", selectedImage: "icon_tabbar_homepage_selected")
        self.setupOneChildViewController(UITableViewController.init(), title: "我的", image: "icon_tabbar_homepage", selectedImage: "icon_tabbar_homepage_selected")
        // Do any additional setup after loading the view.
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
