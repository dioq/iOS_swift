//
//  SessionViewController.swift
//  Swift_Info
//
//  Created by hello on 2018/12/11.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class SessionViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    let identifier = "SwiftCell"
    var dataArray = [["a","b","c"],["d","e","f"],["g","h","i","j"],["k","l","m","n"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: identifier)

        let headerView = Bundle.main.loadNibNamed("MyNibView", owner: self, options: nil)?.last as! MyNibView
        headerView.frame.size = CGSize.init(width: ScreenWIDTH, height: 150)
        let deadline = DispatchTime.now() + 0.2
        DispatchQueue.main.asyncAfter(deadline: deadline) {//在主线程执行,延迟执行防止形变
            self.myTableView.tableHeaderView = headerView
        }
    }

    //section数量
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    //每个section里的cell数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray[section].count
    }
    //cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    //section头的高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    //section头的视图
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let myView = UIView()
//        myView.backgroundColor = UIColor.red
//        return myView
//    }
    /** 上一个方法和下一个方法 不能同时执行，会相互覆盖 **/
    //section头的标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "评论"
        }
        return nil
    }
    //section尾的高度
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    //section尾的视图
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let myView = UIView()
        myView.backgroundColor = UIColor.green
        return myView
    }
    /** 上一个方法和下一个方法 不能同时执行，会相互覆盖 **/
    //section尾的标题
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        if section == 0 {
//            return "评论"
//        }
//        return nil
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        ///使用dequeueReuseableCellWithIdentifier:forIndexPath:必须注册，但返回的cell可省略空值判断的步骤。
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = self.dataArray[indexPath.section][indexPath.row]
        cell.selectionStyle = .none //点击后背景颜色无变化
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //cell分割线 左边不留空隙
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
    }
    
}
