//
//  GlobalSets.swift
//  FeiYu
//
//  Created by 周飞 on 2017/9/10.
//  Copyright © 2017年 ZF. All rights reserved.
//

import Foundation
import ChameleonFramework
import JLRoutes
extension AppDelegate{
    
    /// 设置主题
    public func setThemes() -> Void {
        Chameleon.setGlobalThemeUsingPrimaryColor(.flatSand(),
                                                  withSecondaryColor: .flatMint(),
                                                  andContentStyle: .contrast)
    }
    
    func initRoutes() -> Void {
        JLRoutes.init(forScheme: "FeiYu-Login").addRoute("/Login") { (params) -> Bool in
            self.window = UIWindow.init(frame: UIScreen.main.bounds)
            let vc = LoginViewController.init()
            vc.title = "Login"
            self.window?.rootViewController = vc
            self.window?.backgroundColor = UIColor.white
            self.window?.makeKeyAndVisible()
            
            return true
        }
        JLRoutes.init(forScheme: "FeiYu-Profile").addRoute("/Main") { (params) -> Bool in
            self.window = UIWindow.init(frame: UIScreen.main.bounds)
            let vc = LoginViewController.init()
            vc.title = "Profile"
            self.window?.rootViewController = vc
            self.window?.backgroundColor = UIColor.white
            self.window?.makeKeyAndVisible()
            return true
        }
        JLRoutes.init(forScheme: "FeiYu-PreView").addRoute("/Main") { (params) -> Bool in
            self.window = UIWindow.init(frame: UIScreen.main.bounds)
            let vc = PreViewViewController.init()
            vc.title = "PreView"
            self.window?.rootViewController = vc
            self.window?.backgroundColor = UIColor.white
            self.window?.makeKeyAndVisible()
            return true
        }
        
        JLRoutes.init(forScheme: "Feiyu-CocoaChina").addRoute("/Main") { (params) -> Bool in
            self.window = UIWindow.init(frame: UIScreen.main.bounds)
            
            self.window?.rootViewController = LoginViewController.init()
            self.window?.backgroundColor = UIColor.white
            self.window?.makeKeyAndVisible()
            return true
        }
        
        JLRoutes.init(forScheme: "Feiyu-Code4app").addRoute("/Main") { (params) -> Bool in
            self.window = UIWindow.init(frame: UIScreen.main.bounds)
            
            self.window?.rootViewController = LoginViewController.init()
            self.window?.backgroundColor = UIColor.white
            self.window?.makeKeyAndVisible()
            return true
        }
        
        JLRoutes.init(forScheme: "Feiyu-SwiftV").addRoute("/Main") { (params) -> Bool in
            self.window = UIWindow.init(frame: UIScreen.main.bounds)
            
            self.window?.rootViewController = LoginViewController.init()
            self.window?.backgroundColor = UIColor.white
            self.window?.makeKeyAndVisible()
            return true
        }
        
        
    }
    
}

