//
//  HotCell.swift
//  UI_Swift
//
//  Created by William on 2018/7/10.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class HotCell: UICollectionViewCell {
    
    var label:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label = UILabel.init(frame: self.bounds)
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
