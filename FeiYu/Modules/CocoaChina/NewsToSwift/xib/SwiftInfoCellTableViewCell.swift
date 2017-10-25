//
//  SwiftInfoCellTableViewCell.swift
//  ZFSwiftCode
//
//  Created by w on 16/7/22.
//  Copyright © 2016年 ZF. All rights reserved.
//

import UIKit
import SDWebImage
class SwiftInfoCellTableViewCell: ZFTableViewCell {

    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.title.text = self.cellInfo.title;
        self.icon.sd_setImage(with: URL(fileURLWithPath: self.cellInfo.imgUrl));
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
