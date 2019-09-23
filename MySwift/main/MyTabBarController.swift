//
//  MyTabBarController.swift
//  Swift_Info
//
//  Created by William on 2018/10/22.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController,RootTabBarDelegate {
    
    var imageArray = Array<UIImage>() //做动画用的图片数组
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //给数组添加动画图片
        var imageName:String!
        for index in 0...50 {
            if index < 10 {
                imageName = "tab_team_0\(index)"
            }else{
                imageName = "tab_team_\(index)"
            }
            let image = UIImage.init(named: imageName)
            self.imageArray.append(image!)
        }
        
        
        setUpChildViewController()
        setUpTabBar()
        
        //使用 UITabBarControllerDelegate
        self.delegate = self
        
        /** 添加自定义tabBar **/
        /*
        let tab = RootTabBar()
        tab.addDelegate = self
        self.setValue(tab, forKey: "tabBar")
        */
    }

    //自定义tabBar上的代理方法
    func addClick() {
        print("add succeed")
    }
    
    // 给TabBarController添加子 ViewController
    func setUpChildViewController() {
        let myswift = LanguageViewController()
        myswift.title = "language"
        /**下面这样加title标题上无效果**/
//        myswift.tabBarItem.title = "language"
        let imageHome:UIImage = UIImage.init(named: "tab_home_normal")!
        let imageOriginal = imageHome.withRenderingMode(.alwaysOriginal) //获取一张原图
        myswift.tabBarItem.image = imageOriginal
        myswift.tabBarItem.selectedImage = UIImage.init(named: "tab_home_50")
        let nav1 = MyNavgationController.init(rootViewController: myswift)
        
        let ui = MyUIViewController()
        ui.title = "UI"
        ui.tabBarItem.image = UIImage.init(named: "tab_c2c_normal")
        ui.tabBarItem.selectedImage = UIImage.init(named: "tab_c2c_50")
        let nav2 = MyNavgationController.init(rootViewController: ui)
        // 设置图片和文字之间的间距
        nav2.tabBarItem.imageInsets = UIEdgeInsets.init(top: -1, left: 0, bottom: 2, right: 0)
        nav2.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
        
        let sdkVC = SDKViewController()
        sdkVC.title = "SDK"
        sdkVC.tabBarItem.image = UIImage.init(named: "tab_team_normal")
        sdkVC.tabBarItem.selectedImage = UIImage.init(named: "tab_team_50")
        let nav3 = MyNavgationController.init(rootViewController: sdkVC)
        
        let otherVC = OtherViewController()
        otherVC.title = "other"
        otherVC.tabBarItem.image = UIImage.init(named: "tab_mine_normal")
        otherVC.tabBarItem.selectedImage = UIImage.init(named: "tab_mine_50")
        let nav4 = MyNavgationController.init(rootViewController: otherVC)
        
        self.viewControllers = [nav1, nav2, nav3, nav4]
    }
    
    //设置tabBar的一些属性
    func setUpTabBar() {
        self.selectedIndex = 1 //默认选中的item
        self.tabBar.barStyle = UIBarStyle.default //tabBar样式
        self.tabBar.isTranslucent = false //tabBar透明与否
        //        self.tabBar.barTintColor = UIColor.orange //tabBar背景颜色
        
        //字体点击前的颜色
//        let normalAttr:Dictionary<NSAttributedString.Key,Any> = [NSAttributedString.Key.foregroundColor:UIColor.red]
//        self.tabBarItem.setTitleTextAttributes(normalAttr, for: .normal)
        //字体点击后的颜色
        let selectedAttr:Dictionary<NSAttributedString.Key,Any> = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 114 / 255.0, green: 192 / 255.0, blue: 241 / 255.0, alpha: 1.0)]
        self.tabBarItem.setTitleTextAttributes(selectedAttr, for: .selected)
        
//        self.tabBar.tintColor = UIColor.init(red: 114 / 255.0, green: 192 / 255.0, blue: 241 / 255.0, alpha: 1.0) //点击后字体颜色
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("item name = ", item.title!)
    }

}

extension MyTabBarController:UITabBarControllerDelegate {
   
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
         //拦截tabBar的item的点击事件
//        let childVC = viewController.children
//        let targetVC = childVC[0]
//        if targetVC.isKind(of: OtherViewController.self) {
//            print("myself")
//            return false
//        }
        
        //tabBar上做动画的功能在Xcode11运行会出问题,等以后找到解决方法再做
        /*
        let index = tabBarController.children.firstIndex(of: viewController)
        let tabBarBtn = tabBarController.tabBar.subviews[index! + 1]
        let imageView:UIImageView = tabBarBtn.subviews.first as! UIImageView
        if index == 2 {//仅点击第三个item时显示动画
            imageView.animationImages = self.imageArray
            imageView.animationRepeatCount = 1
            imageView.animationDuration = Double(self.imageArray.count) * 0.025
            imageView.startAnimating()
        }else{//点击其他item停止动画
            imageView.stopAnimating()
        }
        */
        
        return true
    }
    
}
