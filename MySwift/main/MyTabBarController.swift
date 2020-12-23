//
//  MyTabBarController.swift
//  Swift_Info
//
//  Created by William on 2018/10/22.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myswift = LanguageViewController()
        let nav1 = MyNavgationController.init(rootViewController: myswift)
        nav1.tabBarItem.title = "language"
        let image1Normal = UIImage.init(named: "tab_home_normal")
        let image1NormalOriRender = image1Normal!.withRenderingMode(.alwaysOriginal)
        let image1Selected = UIImage.init(named: "tab_home_50")
        let image1SelectedOriRender = image1Selected!.withRenderingMode(.alwaysOriginal)
        nav1.tabBarItem.image = image1NormalOriRender
        nav1.tabBarItem.selectedImage = image1SelectedOriRender
        
        let ui = MyUIViewController()
        let nav2 = MyNavgationController.init(rootViewController: ui)
        nav2.tabBarItem.title = "UI"
        let image2Normal = UIImage.init(named: "tab_c2c_normal")
        let image2NormalOriRender = image2Normal!.withRenderingMode(.alwaysOriginal)
        let image2Selected = UIImage.init(named: "tab_c2c_50")
        let image2SelectedOriRender = image2Selected!.withRenderingMode(.alwaysOriginal)
        nav2.tabBarItem.image = image2NormalOriRender
        nav2.tabBarItem.selectedImage = image2SelectedOriRender
        
        let sdkVC = VenderViewController()
        let nav3 = MyNavgationController.init(rootViewController: sdkVC)
        nav3.tabBarItem.title = "Vender"
        let image3Normal = UIImage.init(named: "tab_team_normal")
        let image3NormalOriRender = image3Normal!.withRenderingMode(.alwaysOriginal)
        let image3Selected = UIImage.init(named: "tab_team_50")
        let image3SelectedOriRender = image3Selected!.withRenderingMode(.alwaysOriginal)
        nav3.tabBarItem.image = image3NormalOriRender
        nav3.tabBarItem.selectedImage = image3SelectedOriRender
        
        let otherVC = OtherViewController()
        let nav4 = MyNavgationController.init(rootViewController: otherVC)
        nav4.tabBarItem.title = "Other"
        let image4Normal = UIImage.init(named: "tab_mine_normal")
        let image4NormalOriRender = image4Normal!.withRenderingMode(.alwaysOriginal)
        let image4Selected = UIImage.init(named: "tab_mine_50")
        let image4SelectedOriRender = image4Selected!.withRenderingMode(.alwaysOriginal)
        nav4.tabBarItem.image = image4NormalOriRender
        nav4.tabBarItem.selectedImage = image4SelectedOriRender
        
        self.viewControllers = [nav1, nav2, nav3, nav4]
    }
    
}
