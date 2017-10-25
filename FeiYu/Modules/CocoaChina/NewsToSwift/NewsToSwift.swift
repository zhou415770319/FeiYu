//
//  NewsToSwift.swift
//  ZFSwiftCode
//
//  Created by w on 16/7/4.
//  Copyright © 2016年 ZF. All rights reserved.
//

import UIKit
import Foundation

class NewsToSwift: BaseViewController {
    
    lazy var tableViewInfos : NSMutableArray = {
        
        let arr = ["FunctionRealization","Login","ZFFooterTable","ZFEditingTable"]
        
        var arr1 = NSMutableArray.init(capacity: 1)
        
        for str in arr {
            let model = ZFTableViewCellModel.init()
            model.title = str;
            
            model.popToViewController = "\(str)ViewController"
            
            arr1.add(model)
        }
        
        return arr1
        
    }()

    override func viewDidLoad() {
        
        let tableView = ZFTableView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        tableView.cellInfos = tableViewInfos as [AnyObject]
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.view.addSubview(tableView)
        
    }
    
    
}
