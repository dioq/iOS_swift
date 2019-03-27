//
//  HeaderView.swift
//  Swift_UI
//
//  Created by William on 2018/8/19.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class MyNibView: UIView {
 
    @IBOutlet weak var myIMGV: UIImageView!
    @IBOutlet weak var myLB: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}
