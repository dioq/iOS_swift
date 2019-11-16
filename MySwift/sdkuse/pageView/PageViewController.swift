//
//  PageViewController.swift
//  Swift_Info
//
//  Created by hello on 2019/1/27.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class PageViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    let indentifier = "SwiftCell"
    var dataArray = ["直接使用DNSPageView初始化","使用DNSPageViewManager分别设置"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "顶部滑动导航"
        if #available(iOS 11.0, *) {//iOS version >= 11.0
            self.myTableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: indentifier)
        myTableView.tableFooterView = UIView()
    }

}

extension PageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath)
        cell.textLabel?.text = self.dataArray[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc:UIViewController!
        self.hidesBottomBarWhenPushed = true
        switch indexPath.row {
        case 0:
            vc = ViewController1()
        case 1:
            vc = ViewController3()
        default:
            print("error")
        }
        self.navigationController?.pushViewController(vc, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
}
