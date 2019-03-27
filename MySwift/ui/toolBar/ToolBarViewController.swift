//
//  ToolBarViewController.swift
//  Swift_Info
//
//  Created by hello on 2019/1/15.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class ToolBarViewController: UIViewController {
    
    func showHeight() {
        //状态栏
        let statusHeight = UIApplication.shared.statusBarFrame.size.height
        print("状态栏:\(statusHeight)")
        //导航栏
        let navigationHeight = self.navigationController!.navigationBar.frame.size.height
        print("导航栏:\(navigationHeight)")
        //toolBar
        let toolBarHeight = self.navigationController?.toolbar.frame.size.height
        print("toolBar:\(toolBarHeight!)")
        //tabBar
        //在非tabBarController中使用
        let tabBarVC = UITabBarController()//这儿取你当前tabBarVC的实例
        let tabBarHeight = tabBarVC.tabBar.frame.size.height
        print("tabBar:\(tabBarHeight)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showHeight()
        test()
//        test2()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.toolbar.isHidden = true
    }
    
    //方法二:显示 navigationController 自带的ToolBar
    func test2() {
        //在UINavigationController导航控制器中存在UIToolBar的，而且默认时被隐藏的
        self.navigationController?.toolbar.isHidden = false
        self.navigationController?.setToolbarHidden(false, animated: true)
    }
    
    // 方法一:自己创建
    func test() {
        //创建toolBal导航栏实例
        let toolbar = UIToolbar.init(frame: CGRect(x: 0, y: ScreenHEIGHT - 49, width: 375, height: 49))
        //设置toolBar风格
        toolbar.barStyle = .black
        //将该控件添加到视图中
        view.addSubview(toolbar)
        
        //创建控件上的按钮单元
        let additem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(testAction(barButton:)))
        additem.tag = 100
        let edititem = UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(testAction(barButton:)))
        edititem.tag = 101
        let titleitem = UIBarButtonItem.init(title: "title", style: .done, target: self, action: #selector(testAction(barButton:)))
        titleitem.tag = 102
        
        //创建灵活调节按钮单元,设置间隔
        let flexibleitem = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        //将按钮单元都添加到数组中
        let items = [additem, flexibleitem, edititem, flexibleitem, titleitem]
        
        //设置导航栏上的按钮单元
        toolbar.setItems(items, animated: true)
    }

    @objc func testAction(barButton:UIBarButtonItem) {
        switch barButton.tag {
        case 100:
            print("触发了 additem")
        case 101:
            print("触发了 edititem")
        case 102:
            print("触发了 titleitem")
        default:
            print("error")
        }
    }
}
