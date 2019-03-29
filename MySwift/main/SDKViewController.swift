//
//  SDKViewController.swift
//  Swift
//
//  Created by William on 2018/10/21.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class SDKViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    //懒加载
    lazy var dataArray:[UIViewController] = {
        var dataArray = Array<UIViewController>()
        
        let rxVC = RxViewController()
        rxVC.title = "RxSwift"
        dataArray.append(rxVC)
        
        let hGIMageVC = HGImageViewController()
        hGIMageVC.title = "多图选择HGImage"
        dataArray.append(hGIMageVC)
        
        let pageVC = PageViewController()
        pageVC.title = "顶部滑动导航"
        dataArray.append(pageVC)
        
        let handleJSONVC = HandleJSONVC()
        handleJSONVC.title = "JSON数据的处理"
        dataArray.append(handleJSONVC)
        
        let nicooVC = NicooPlayerVC()
        nicooVC.title = "NicooPlayer播放器"
        dataArray.append(nicooVC)
        
        let kingfisherVC = KingfisherViewController()
        kingfisherVC.title = "Kingfisher"
        dataArray.append(kingfisherVC)
        
        let autoImageVC = AutoImageViewController()
        autoImageVC.title = "轮播图"
        dataArray.append(autoImageVC)
        
        let fwpopmenuVC = FWMenuViewDemoVC()
        fwpopmenuVC.title = "点击弹出选择框2"
        dataArray.append(fwpopmenuVC)
        
        let popmenuVC = PopMenuViewController()
        popmenuVC.title = "点击弹出选择框"
        dataArray.append(popmenuVC)
        
        let shareVC = MyShareViewController()
        shareVC.title = "原生分享"
        dataArray.append(shareVC)
        
        let gestureVC = MyGestureVC()
        gestureVC.title = "手势解锁"
        dataArray.append(gestureVC)
        
        let jxpopupVC = JXPopupViewVC()
        jxpopupVC.title = "自定义弹出功能框"
        dataArray.append(jxpopupVC)
        
        let toastVC = ToastViewController()
        toastVC.title = "提示框"
        dataArray.append(toastVC)
        
        let snapVC = SnapKitVC()
        snapVC.title = "SnapKit约束"
        dataArray.append(snapVC)
        
        let request = RequestVC()
        request.title = "Alamofire"
        dataArray.append(request)
        
        let gTMViewController = GTMViewController()
        gTMViewController.title = "GTMRefresh"
        dataArray.append(gTMViewController)
        
        let sQLiteViewController = SQLiteViewController()
        sQLiteViewController.title = "SQLite"
        dataArray.append(sQLiteViewController)
        
        return dataArray
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //设置数据源
        myTableView.dataSource = self
        //设置代理
        myTableView.delegate = self
        //注册UITableView，cellID为重复使用cell的Identifier
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        myTableView.tableFooterView = UIView()
    }
    
    // 设置每个seccion的row数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    //设置tableview的cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        let vc = dataArray[indexPath.row]
        cell.textLabel?.text = vc.title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    //cell点击事件
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
