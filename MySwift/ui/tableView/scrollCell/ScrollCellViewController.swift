//
//  ScrollCellViewController.swift
//  Swift_UI
//
//  Created by William on 2018/8/24.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class ScrollCellViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    let identifier = "SwiftCell"
    var dataArray = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n"]
    
    
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        //在初始化tableview的时候就去register一个自顶的cell, 这种写法在cellForRowAtIndexPath部分就不用去判断这个cell是否非空
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        //控制器
       timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(tickDown), userInfo: nil, repeats: true)
//        timer.invalidate()  //关闭定时器
    }
    
    @objc func tickDown(){
        let offsetY = self.myTableView.contentOffset.y + 10
        self.myTableView.setContentOffset(CGPoint(x: 0, y: offsetY), animated: true)//设置偏移量
        
        // 提前1个cell，开始加载更多数据源
        if (self.myTableView.indexPathsForVisibleRows?.contains(IndexPath.init(row: self.dataArray.count - 1, section: 0)))! {
            self.dataArray += self.dataArray
            self.myTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as UITableViewCell
        cell.textLabel?.text = self.dataArray[indexPath.row]
        return cell
    }
    
}
