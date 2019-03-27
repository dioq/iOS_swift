//
//  MyView.swift
//  swift_UI02
//
//  Created by William on 2018/7/30.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var MyLabel: UILabel!
    var model:TestModel!
    
    //初始化nib时调用
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    //视图变化时调用
    override func layoutSubviews() {
        super.layoutSubviews()
        if let imgName = model.imageName {
            myImageView.image =  UIImage.init(named: imgName)
        }
        if let text = model.text {
            MyLabel.text = text
        }
    }

}
