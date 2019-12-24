//
//  OtherViewController.swift
//  Swift_Info
//
//  Created by hello on 2018/12/9.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    let indentifier = "SwiftCell"
    var dataArray:[UIViewController]!
    
    func getData() {
        dataArray = Array<UIViewController>()
        
        let encryptionVC = EncryptionViewController()
        encryptionVC.title = "加密与解密"
        dataArray.append(encryptionVC)
        
        let changeIconVC = ChangeIconViewController()
        changeIconVC.title = "更换App icon"
        dataArray.append(changeIconVC)
        
        let handleJSONVC = HandleJSONVC()
        handleJSONVC.title = "JSON数据的处理"
        dataArray.append(handleJSONVC)
        
        let localizableVC = LocalizableVC()
        localizableVC.title = "本地化"
        dataArray.append(localizableVC)
        
        let moveVC = MoveViewController()
        moveVC.title = "移动的小球"
        dataArray.append(moveVC)
        
        let trasitionVC = CATransitionVC()
        trasitionVC.title = "转场动画"
        dataArray.append(trasitionVC)
        
        let drawerVC = DrawerViewController()
        drawerVC.title = "抽屈效果"
        dataArray.append(drawerVC)
        
        let mySegmentVC = MySegmentVC()
        mySegmentVC.title = "自定义滑动导航"
        dataArray.append(mySegmentVC)
        
        let segmentVC = SegmentViewController()
        segmentVC.title = "自定义SegmentView"
        dataArray.append(segmentVC)
        
        let beginnerguideVC = BeginnerguideVC()
        beginnerguideVC.title = "新手引导"
        dataArray.append(beginnerguideVC)
        
        let useNetworkingVC = UseNetworkingToolVC()
        useNetworkingVC.title = "测试封装的Alamofire"
        dataArray.append(useNetworkingVC)
        
        let judgeNetVC = JudgeNetworkingVC()
        judgeNetVC.title = "网络监听"
        dataArray.append(judgeNetVC)
        
        let jumpVC = JumpAppVC()
        jumpVC.title = "App间跳转"
        dataArray.append(jumpVC)
        
        let cacheVC = CacheViewController()
        cacheVC.title = "清缓存"
        dataArray.append(cacheVC)
        
        let commentVC = CommentVC()
        commentVC.title = "自己实现的输入框始终在键盘上方 v2.0"
        dataArray.append(commentVC)
        
        let myComentVC = MyComentVC()
        myComentVC.title = "自己实现的输入框始终在键盘上方 v1.0"
        dataArray.append(myComentVC)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "小功能集合"
        getData()
        //设置数据源
        myTableView.dataSource = self
        //设置代理
        myTableView.delegate = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: indentifier)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath)
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
        //并在push后设置self.hidesBottomBarWhenPushed = false
        //这样back回来的时候，tabBar会恢复正常显示。
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        self.hidesBottomBarWhenPushed = false
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
