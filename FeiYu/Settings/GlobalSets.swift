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
        Chameleon.setGlobalThemeUsingPrimaryColor(.flatSkyBlue(),
                                                  withSecondaryColor: .flatMint(),
                                                  andContentStyle: .contrast)
    }
     
    /// 注册routes
    func initRoutes() -> Void {
        JLRoutes.init(forScheme: "FeiYu-Login").addRoute("/Main") { (params) -> Bool in
            let vc = LoginViewController.init()
            vc.title = "Login"
            self.makeKeyWindow(viewController: vc)
            return true
        }
        JLRoutes.init(forScheme: "FeiYu-Login").addRoute("/Main2") { (params) -> Bool in
            let vc = LoginTest1ViewController.init()
            vc.title = "Login"
            self.makeKeyWindow(viewController: vc)
            return true
        }
        JLRoutes.init(forScheme: "FeiYu-Login").addRoute("/Main3") { (params) -> Bool in
            let vc = LoginTest2ViewController.init()
            vc.title = "Login"
            self.makeKeyWindow(viewController: vc)
            return true
        }
        JLRoutes.init(forScheme: "FeiYu-Login").addRoute("/Main4") { (params) -> Bool in
            let vc = LoginViewController.init()
            vc.title = "Login"
            self.makeKeyWindow(viewController: vc)
            return true
        }
        JLRoutes.init(forScheme: "FeiYu-Login").addRoute("/Main5") { (params) -> Bool in
            let vc = LoginViewController.init()
            vc.title = "Login"
            self.makeKeyWindow(viewController: vc)
            return true
        }
        
        JLRoutes.init(forScheme: "FeiYu-Profile").addRoute("/Main") { (params) -> Bool in
            let vc = ProfileViewController.init()
            vc.title = "Profile"
            self.makeKeyWindow(viewController: vc)
            return true
        }
        JLRoutes.init(forScheme: "FeiYu-PreView").addRoute("/Main") { (params) -> Bool in
            let vc = PreViewViewController.init()
            vc.title = "PreView"
            self.makeKeyWindow(viewController: vc)
            return true
        }
        
        JLRoutes.init(forScheme: "FeiYu-CocoaC").addRoute("/Main") { (params) -> Bool in
            let vc = CocoaChinaViewController.init()
            vc.title = "CocoaChina"
            self.makeKeyWindow(viewController: vc)
            return true
        }
        
        JLRoutes.init(forScheme: "FeiYu-Code4").addRoute("/Main") { (params) -> Bool in
            let vc = Code4appViewController.init()
            vc.title = "Code4app"
            self.makeKeyWindow(viewController: vc)
            return true
        }
        
        JLRoutes.init(forScheme: "FeiYu-SwiftV").addRoute("/Main") { (params) -> Bool in
            let vc = SwiftVMainViewController.init()
            vc.title = "SwiftV"
            self.makeKeyWindow(viewController: vc)
            return true
        }
        
        
    }
    
    /// 显示主窗口
    ///
    /// - Parameter viewController: 要显示的窗口
    func makeKeyWindow(viewController : UIViewController) -> Void {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        
        self.window?.rootViewController = viewController
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
    }
    
    
    
}

