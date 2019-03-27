//
//  MyCVCell.swift
//  swift_UI02
//
//  Created by William on 2018/8/14.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class MyCVCell: UICollectionViewCell {

    @IBOutlet weak var mylabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configSideRadius(view: mylabel)
    }

    //MARK: 设置某个圆角
    func configSideRadius(view: UIView) {
        view.layer.cornerRadius = view.frame.width / 2 //圆角弧度
        view.layer.masksToBounds = true  //是否把圆角边切去
        view.layer.borderWidth = 2   //设置边框 的宽度
        view.layer.borderColor = UIColor.black.cgColor  //设置边框的颜色
    }
    
}
