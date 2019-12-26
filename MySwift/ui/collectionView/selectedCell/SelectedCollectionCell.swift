//
//  SelectedCollectionCell.swift
//  Swift_Info
//
//  Created by hello on 2019/1/24.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class SelectedCollectionCell: UICollectionViewCell {

    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var selectDot: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myTitle.sizeToFit()
    }

//    在cell复用之前调用,可以对cell中某些控件进行初始化,避免上一次遗留数据干扰本次使用
//    override func prepareForReuse() {
//        myTitle.textColor = UIColor.black
//        selectDot.setBackgroundImage(UIImage.init(named: "selected_off"), for: .normal)
//    }
    
    
    func setSelectedStatus() {
        if isSelected {
            myTitle.textColor = UIColor.red
            selectDot.setBackgroundImage(UIImage.init(named: "selected_on"), for: .normal)
        }else {
            myTitle.textColor = UIColor.black
            selectDot.setBackgroundImage(UIImage.init(named: "selected_off"), for: .normal)
        }
    }

}
