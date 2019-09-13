//
//  header.swift
//  swift_UI02
//
//  Created by William on 2018/7/30.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

//屏幕宽
let ScreenWIDTH = UIScreen.main.bounds.width
//屏幕高
let ScreenHEIGHT = UIScreen.main.bounds.height
//获取状态栏高度
let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
//获取导航栏高度
func getNavigationBarHeight() -> CGFloat {
    let nav = UINavigationController()
    let navigationHeight = nav.navigationBar.frame.size.height
    return navigationHeight
}
//获取tabBar高度
func getTabBarHeight() -> CGFloat {
    let tabBarCon = UITabBarController()
    let tabBarHeight = tabBarCon.tabBar.frame.size.height
    return tabBarHeight
}

//设置圆角
func configSideRadius(view: UIView, cornerRadius:CGFloat, color:UIColor?) {
    view.layer.cornerRadius = cornerRadius
    view.layer.masksToBounds = true  //是否把圆角边切去
    view.layer.borderWidth = 1   //设置边框 的宽度
    if color != nil {
        view.layer.borderColor = color?.cgColor
    }
}
