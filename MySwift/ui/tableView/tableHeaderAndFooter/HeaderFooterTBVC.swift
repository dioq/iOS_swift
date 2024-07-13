//
//  HeaderFooterTBVC.swift
//  Swift_UI
//
//  Created by William on 2018/8/19.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class HeaderFooterTBVC: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    let identifier = "SwiftCell"
    
    //懒加载
    lazy var footerView:UIView = {
        let footerView = UIView.init(frame: CGRect(x: 0, y: 0, width: ScreenWIDTH, height: 150))
        footerView.backgroundColor = UIColor.purple
        return footerView
    }()
    
    //懒加载nib视图
    lazy var footerNibView:MyNibView = {
        let myview = Bundle.main.loadNibNamed("MyNibView", owner: self, options: nil)?.last as! MyNibView
        myview.frame = CGRect(x: 0, y: 0, width: ScreenWIDTH, height: 150)
        myview.backgroundColor = UIColor.green
        return myview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "tableView HeaderAndFooter"
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        //同一个视图不能既是header又是footer, tableview只会加载一个,若想加载两次必须要初始化两次
        /* 延迟一段时间后再加载,可以防止nib视图变形 */
        let headerView = Bundle.main.loadNibNamed("MyNibView", owner: self, options: nil)?.last as! MyNibView
        headerView.frame = CGRect(x: 0, y: 0, width: ScreenWIDTH, height: 150)
        let deadline = DispatchTime.now() + 0.2
        DispatchQueue.main.asyncAfter(deadline: deadline) {//在主线程执行,延迟执行防止形变
            self.myTableView.tableHeaderView = headerView
        }
        
        //        setUpOne()//不延迟直接添加nib视图，会形变
        //        setUpTwo()//加载代码创建的视图，不会出现视图变形的问题
        //        setUpThree()//添加懒加载的nib视图，也一样会变形
    }
    
    func setUpOne() {
        let footerView = Bundle.main.loadNibNamed("MyNibView", owner: self, options: nil)?.last as! MyNibView
        footerView.frame = CGRect(x: 0, y: 0, width: ScreenWIDTH, height: 150)
        footerView.backgroundColor = UIColor.green
        myTableView.tableFooterView = footerView
    }
    
    func setUpTwo() {
        myTableView.tableFooterView = footerView
    }
    
    func setUpThree() {
        myTableView.tableFooterView = footerNibView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //在本controller 的 view 完全出现后，再添加自己的视图和延时加载效果是一样的。
        myTableView.tableFooterView = footerNibView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //表示从现有的池子（标签已指定）取出排在队列最前面的那个 cell
        //使用dequeueReuseableCellWithIdentifier:可不注册，但是必须对获取回来的cell进行判断是否为空，若空则手动创建新的cell
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            //如果为空，表示池子里并没有创建过可用来reuse的cell，就表示这是个新的cell，那么就创建一个cell并放到池子里用于后续可能的reuse
            cell = UITableViewCell(style: .value1, reuseIdentifier: identifier)
        }
        cell!.imageView?.image = UIImage.init(named: "girl")
        cell!.textLabel?.text = "\(indexPath.row)"
        cell!.detailTextLabel?.text = "message"
        cell!.accessoryType = .disclosureIndicator
        return cell!
    }
    
}
