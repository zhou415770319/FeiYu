//
//  GlobalSets.swift
//  FeiYu
//
//  Created by 周飞 on 2017/9/10.
//  Copyright © 2017年 ZF. All rights reserved.
//

import Foundation
import ChameleonFramework
extension AppDelegate{
    
    /// 设置主题
    public func setThemes() -> Void {
        Chameleon.setGlobalThemeUsingPrimaryColor(.flatSand(),
                                                  withSecondaryColor: .flatMint(),
                                                  andContentStyle: .contrast)
    }
    
    func initRoutes() -> Void {
        
    }
    
}

