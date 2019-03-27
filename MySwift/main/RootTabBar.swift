//
//  RootTabBar.swift
//  MyTabBar
//
//  Created by hello on 2019/1/15.
//  Copyright © 2019 hello. All rights reserved.
//

import UIKit

//上传按钮点击代理
protocol RootTabBarDelegate:NSObjectProtocol {
    func addClick()
}

class RootTabBar: UITabBar {
    
    weak var addDelegate: RootTabBarDelegate?
    
    private lazy var addButton:UIButton = {
        return UIButton()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addButton.setBackgroundImage(UIImage.init(named: "Icon_add"), for: .normal)
        addButton.addTarget(self, action: #selector(addButtonClick), for: .touchUpInside)
        self.addSubview(addButton)
        //tabbar设置背景色
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addButtonClick(){
        if addDelegate != nil{
            addDelegate?.addClick()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let buttonX = self.frame.size.width / 5
        var index = 0
        for barButton in self.subviews{
            if barButton.isKind(of: NSClassFromString("UITabBarButton")!){
                if index == 2{
                    // 设置添加按钮位置
                    addButton.frame.size = CGSize.init(width: (addButton.currentBackgroundImage?.size.width)!, height: (addButton.currentBackgroundImage?.size.height)!)
                    addButton.center = CGPoint.init(x: self.center.x, y: self.frame.size.height / 2 - 18)
                    index += 1
                }
                barButton.frame = CGRect.init(x: buttonX * CGFloat(index), y: 0, width: buttonX, height: self.frame.size.height)
                index += 1
            }
        }
        self.bringSubviewToFront(addButton)
    }
    
    // 重写hitTest方法，监听按钮的点击 让凸出tabbar的部分响应点击
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        /// 判断是否为根控制器
        if self.isHidden {
            /// tabbar隐藏 不在主页 系统处理
            return super.hitTest(point, with: event)
        }else{
            /// 将单钱触摸点转换到按钮上生成新的点
            let onButton = self.convert(point, to: self.addButton)
            /// 判断新的点是否在按钮上
            if self.addButton.point(inside: onButton, with: event){
                return addButton
            }else{
                /// 不在按钮上 系统处理
                return super.hitTest(point, with: event)
            }
        }
    }
    
}
