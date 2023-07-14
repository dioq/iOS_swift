//
//  PointView.swift
//  LJKPopShowView
//
//  Created by 李金奎 on 2018/4/25.
//  Copyright © 2018年 李金奎. All rights reserved.
//

import UIKit

class PointView: UIView {
    var ID: String!
    var _isSelected: Bool!
    
    //选中
    var isSelected: Bool {
        get {
            return _isSelected
        }
        set {
            _isSelected = newValue
            if _isSelected {
                centerLayer.isHidden = false
                borderLayer.strokeColor = UIColor.init(red: 30/255, green: 180/255, blue: 244/255, alpha: 1.0).cgColor
            } else {
                centerLayer.isHidden = true
                borderLayer.strokeColor = UIColor.init(red: 105/255, green: 108/255, blue: 111/255, alpha: 1.0).cgColor
            }
        }
    }
    
    //外层手势按钮
    lazy var contentLayer: CAShapeLayer = {
        let width: CGFloat = self.bounds.width
        let height: CGFloat = self.bounds.height
        let layer = CAShapeLayer()
        let path: UIBezierPath = UIBezierPath.init(roundedRect: CGRect(x: CGFloat(2), y: CGFloat(2), width: width - 4, height: height - 4), cornerRadius: (width - 4) / 2)
        layer.fillColor = UIColor.init(red: 46/255, green: 47/255, blue: 50/255, alpha: 1.0).cgColor
        layer.strokeColor = UIColor.init(red: 26/255, green: 27/255, blue: 29/255, alpha: 1.0).cgColor
        layer.strokeStart = 0
        layer.strokeEnd = 1
        layer.lineWidth = 2
        layer.cornerRadius = width / 2.0
        layer.path = path.cgPath
        return layer
    }()
    //手势按钮边框
    lazy var borderLayer: CAShapeLayer = {
        let width: CGFloat = self.bounds.width
        let height: CGFloat = self.bounds.height
        let layer = CAShapeLayer()
        let path: UIBezierPath = UIBezierPath.init(arcCenter: CGPoint(x: width/2.0, y: height/2), radius: width / 2, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: false)
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.init(red: 105/255, green: 108/255, blue: 111/255, alpha: 1.0).cgColor
        layer.strokeStart = 0
        layer.strokeEnd = 1
        layer.lineWidth = 2
        layer.path = path.cgPath
        return layer
    }()
    //选中时，中间样式
    lazy var centerLayer: CAShapeLayer = {
        let width: CGFloat = self.bounds.width
        let height: CGFloat = self.bounds.height
        let layer = CAShapeLayer()
        let path: UIBezierPath = UIBezierPath.init(roundedRect: CGRect(x: width/2 - (width - 4)/4, y: height/2 - (height - 4)/4, width: (width - 4)/2, height: (width - 4)/2), cornerRadius: (width - 4) / 4)
        layer.fillColor = UIColor.init(red: 30/255, green: 180/255, blue: 244/255, alpha: 1.0).cgColor
        layer.strokeColor = UIColor.init(white: 0, alpha: 0.7).cgColor
        layer.lineWidth = 3
        layer.cornerRadius = width / 2.0
        layer.path = path.cgPath
        return layer
    }()
    
    init(frame: CGRect, ID: String) {
        super.init(frame: frame)
        self.ID = ID
        initView()
    }
    func initView(){
        self.layer.addSublayer(self.contentLayer)
        self.layer.addSublayer(self.borderLayer)
        self.layer.addSublayer(self.centerLayer)
        self.centerLayer.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
