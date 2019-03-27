//
//  LZDCell.swift
//  swift_UI02
//
//  Created by William on 2018/7/30.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit
import SnapKit

class LZDCell: UITableViewCell {
    
    var myImageView:UIImageView?
    var myLabe:UILabel?
    var myView:UIView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier:String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    //刚开始会报错，后来加了一段
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //初始化
    func setupViews(){
        myImageView = UIImageView()
        self.contentView.addSubview(myImageView!)
        
        myLabe = UILabel()
        self.contentView.addSubview(myLabe!)
        
        myView = UIView()
        self.contentView.addSubview(myView!)
    }
    
    override func layoutSubviews() {//在这里设置其他属性
        super.layoutSubviews()
        myImageView?.snp.makeConstraints({ (make) in
            make.left.equalTo(self).offset(10)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
            make.width.equalTo(100)
        })
        
        myLabe?.snp.makeConstraints({ (make) in
            make.left.equalTo(myImageView!).offset(90)
            make.centerY.equalTo(self)
            make.width.equalTo(120)
            make.height.equalTo(20)
        })
        myLabe?.textAlignment = .center
        
        myView?.snp.makeConstraints({ (make) in
            make.right.equalTo(self).offset(-40)
            make.centerY.equalTo(self)
            make.width.equalTo(20)
            make.height.equalTo(20)
        })
        myView?.backgroundColor = UIColor.red
        configSideRadius(view: myView!)
    }
    
    //设置圆角
    func configSideRadius(view: UIView) {
        view.layer.cornerRadius = view.frame.width / 2 //圆角弧度
        view.layer.masksToBounds = true  //是否把圆角边切去
        view.layer.borderWidth = 3   //设置边框 的宽度
        view.layer.borderColor = UIColor.blue.cgColor  //设置边框的颜色
    }
    
    override func setSelected(_ selected: Bool, animated:Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
