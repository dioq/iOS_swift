//
//  MyNavgationController.swift
//  Swift_Info
//
//  Created by William on 2018/10/22.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class MyNavgationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = self //系统滑动手势
        defaultSetting()
    }
    
    func defaultSetting(){
        //导航栏的背景色与标题设置
        self.navigationBar.barStyle = UIBarStyle.default//样式
        self.navigationBar.barTintColor = UIColor.white//背景颜色
        self.navigationBar.isTranslucent = false//是否透明
        //字体设置
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black,
                                                  NSAttributedString.Key.font:UIFont.systemFont(ofSize: 17)]
    }
    
    //拦截控制器的push操作
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.children.count > 0{
            //导航栏返回按钮自定义
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "com_arrow_vc_back"), style: .plain, target: self, action: #selector(didBackButton))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    //点击事件
    @objc func didBackButton(){
        self.popViewController(animated:true)
    }
    
}

extension MyNavgationController:UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let count = self.children.count
        if count != 1 {//只要不等于1就返回true，说明此时具有滑动功能
            return true
        }else{
            return false
        }
    }
}
