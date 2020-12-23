//
//  GTMViewController.swift
//  Swift_SDK
//
//  Created by William on 2018/8/16.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit
import GTMRefresh

class GTMViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var table:UITableView!
    var arry:[String] = ["我是谁", "我从哪里来", "要到哪里去"]
    
    // 设置每个seccion的row数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 10
        }
        return arry.count
    }
    //设置section的数量
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    //设置tableview的cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = "this is a test!!"
        }else{
            cell.textLabel?.text = arry[indexPath.row]
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.action, target: self, action: #selector(rightTopBtn))
        
        //设置UITableView的位置
        table = UITableView(frame: CGRect(x: 30, y: 70, width: 320, height: 450))
        self.table.backgroundColor = UIColor.blue
        
        //设置数据源
        self.table.dataSource = self
        //设置代理
        self.table.delegate = self
        self.view.addSubview(table)
        //注册UITableView，cellID为重复使用cell的Identifier
        self.table.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        
//        self.table.triggerRefreshing() //代码触发刷新
        
        //顶部刷新 自定义动画
        let header = DianpingRefreshHeader()
        self.table.gtm_addRefreshHeaderView(refreshHeader: header) {
            [weak self] in
            print("excute refreshBlock")
            self?.refresh()
        }
        
        //顶部刷新
//        self.table.gtm_addRefreshHeaderView {
//            [weak self] in
//            print("excute refreshBlock")
//            self?.refresh()
//        }
        
        //底部刷新
        self.table.gtm_addLoadMoreFooterView {
            [weak self] in
            self?.arry.append("aaa")
            self?.table.reloadData()
            self?.table.endRefreshing(isSuccess: true)
        }
    }
    
    
    // 顶部刷新
    func refresh() {
        self.arry.append("bbbb")
        self.table.reloadData()
        Thread.sleep(forTimeInterval: 1.5)
        self.table.endRefreshing(isSuccess: true)
    }
    
    
    @objc func rightTopBtn(){
        self.table.triggerRefreshing() //代码触发下拉刷新(最好只在进入页面时用一次)
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
