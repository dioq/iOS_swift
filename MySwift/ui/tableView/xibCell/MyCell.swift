//
//  MyCell.swift
//  swift_UI02
//
//  Created by William on 2018/7/30.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myMark: UIView!
    
    var isNeedLabel:UILabel!//加*号
    var isRequire = false
    
    //初始化
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        isNeedLabel = UILabel()
        self.addSubview(isNeedLabel)
        print("awakeFromNib:\t",isRequire)
    }
    
    //加载视图
    override func layoutSubviews() {
        super.layoutSubviews()
        
        isNeedLabel.text = "*"
        isNeedLabel.textColor = UIColor.red
        isNeedLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-50)
            make.top.equalTo(10)
            make.width.equalTo(8)
            make.height.equalTo(28)
        }
        isNeedLabel.isHidden = isRequire
        print("layoutSubviews:\t",isRequire)
        configSideRadius(view: myMark!)
    }
    
    
    //设置圆角
    func configSideRadius(view: UIView) {
        view.layer.cornerRadius = view.frame.width / 2 //圆角弧度
        view.layer.masksToBounds = true  //是否把圆角边切去
        view.layer.borderWidth = 2   //设置边框 的宽度
        view.layer.borderColor = UIColor.black.cgColor  //设置边框的颜色
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
