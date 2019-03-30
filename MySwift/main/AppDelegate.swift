//
//  AppDelegate.swift
//  Swift_Info
//
//  Created by William on 2018/10/21.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit
import NicooPlayer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow.init(frame: UIScreen.main.bounds)//如果不用storyboard就在这里初始化window
        let tabBarCtr = MyTabBarController()
        self.window?.rootViewController = tabBarCtr
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        return true
    }
    
    //整个项目支持竖屏，播放页面需要横屏，导入播放器头文件，添加下面方法
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?)
        -> UIInterfaceOrientationMask {
        guard let num =  NicooPlayerOrietation(rawValue: orientationSupport.rawValue) else {
            return [.portrait]
        }
        return num.getOrientSupports()// 这里的支持方向，做了组件化的朋友，实际项目中可以考虑用路由去播放器内拿
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    //系统进入后台调用的方法
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("application进入后台")
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    //系统回到前台调用的方法
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("application回到前台")
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}