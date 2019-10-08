//
//  MySwiftViewController.swift
//  Swift
//
//  Created by William on 2018/10/21.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class LanguageViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    
    //懒加载
    lazy var dataArray:[UIViewController] = {
        var dataArray = Array<UIViewController>()
        
        let genericVC = GenericViewController()
        genericVC.title = "泛型"
        dataArray.append(genericVC)
        
        let polyVC = PolyViewController()
        polyVC.title = "多态"
        dataArray.append(polyVC)
        
        let reflectVC = ReflectViewController()
        reflectVC.title = "反射"
        dataArray.append(reflectVC)
        
        let fVC = FViewController()
        fVC.title = "函数的特性"
        dataArray.append(fVC)
        
        let nibController = StudyNibViewController()
        nibController.title = "Nib ViewController的相关知识"
        dataArray.append(nibController)
        
        let controller = StudyViewController()
        controller.title = "ViewController的相关知识"
        dataArray.append(controller)
        
        let closureVC = MyClosureVC()
        closureVC.title = "closure 闭包"
        dataArray.append(closureVC)
        
        let singletonVC = ShowSingletonVC()
        singletonVC.title = "单例"
        dataArray.append(singletonVC)
        
        let stringVC = StringViewController()
        stringVC.title = "字符串处理"
        dataArray.append(stringVC)
        
        let regularVC = RegularViewController()
        regularVC.title = "正则表达式"
        dataArray.append(regularVC)
        
        let browserVC = BrowserVC()
        browserVC.title = "到浏览器"
        dataArray.append(browserVC)
        
        let deviceVC = DeviceViewController()
        deviceVC.title = "获取设备和项目信息"
        dataArray.append(deviceVC)
        
        let timeViewController = TimeViewController()
        timeViewController.title = "处理时间"
        dataArray.append(timeViewController)
        
        let audioViewController = AudioViewController()
        audioViewController.title = "音频和震动"
        dataArray.append(audioViewController)
        
        let shakeViewController = ShakeViewController()
        shakeViewController.title = "震动"
        dataArray.append(shakeViewController)
        
        let delegateVC = BaseDelegateVC()
        delegateVC.title = "基础delegate"
        dataArray.append(delegateVC)
        
        let myDelegateViewController = MyDelegateVC()
        myDelegateViewController.title = "使用Delegate"
        dataArray.append(myDelegateViewController)
        
        let sendValueViewController = ReceiveVC()
        sendValueViewController.title = "delegate页面间传值"
        dataArray.append(sendValueViewController)
        
        let myFirstVC = MyFirstVC()
        myFirstVC.title = "传值"
        dataArray.append(myFirstVC)
        
        let myNotificationVC = MyNotificationVC()
        myNotificationVC.title = "通知"
        dataArray.append(myNotificationVC)
        
        let lazyViewController = LazyViewController()
        lazyViewController.title = "控件懒加载"
        dataArray.append(lazyViewController)
        
        let gCDViewController = GCDViewController()
        gCDViewController.title = "GCD"
        dataArray.append(gCDViewController)
        
        let bezierPathViewController = BezierPathViewController()
        bezierPathViewController.title = "BezierPath"
        dataArray.append(bezierPathViewController)
        
        let propertyViewController = PropertyViewController()
        propertyViewController.title = "property"
        dataArray.append(propertyViewController)
        
        let threadViewController = ThreadViewController()
        threadViewController.title = "thread"
        dataArray.append(threadViewController)
        
        return dataArray
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Language"
        //设置数据源
        myTableView.dataSource = self
        //设置代理
        myTableView.delegate = self
        //注册UITableView，cellID为重复使用cell的Identifier
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        myTableView.tableFooterView = UIView()
    }

    //设置每个seccion的row数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    //设置section的数量
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //设置tableview的cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        let vc = dataArray[indexPath.row]
        cell.textLabel?.text = vc.title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    //点击cell触发
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = dataArray[indexPath.row]
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
