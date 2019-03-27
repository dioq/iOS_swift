//
//  MyTBViewVC.swift
//  swift_UI02
//
//  Created by William on 2018/7/30.
//  Copyright © 2018年 William. All rights

import UIKit

class MyTBViewVC: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    var myTableView:UITableView!
    let dataArray:[String] = ["我是谁","我从哪里来","要到哪里去","我是谁","我从哪里来","要到哪里去","我是谁","我从哪里来","要到哪里去","我是谁","我从哪里来","要到哪里去"]
    
    let identifier = "cell"  //cell标识
    
    //懒加载
    lazy var headerImage:UIImageView = {
        let headerImage = UIImageView()
        headerImage.image = UIImage.init(named: "girl.png")
        headerImage.frame = CGRect.init(x:0,y:0,width:ScreenWIDTH,height:200)
        return headerImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "自定义代码cell"
  
        //设置UItabView的位置
        myTableView = UITableView.init(frame: self.view.frame, style: UITableView.Style.plain)
        myTableView.backgroundColor = UIColor.white
        myTableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine //分割线样式
        self.view.addSubview(myTableView)
        
        //设置数据源
        myTableView.dataSource = self
        //设置代理
        myTableView.delegate = self
        //在初始化tableview的时候就去register这个自顶一个的cell, 这种写法在cellForRowAtIndexPath部分就不用去判断这个cell是否非空
        myTableView.register(LZDCell.self, forCellReuseIdentifier:identifier)
        myTableView.tableHeaderView = headerImage
    }
    
    func numberOfSections(in tableView:UITableView) ->Int {
        return 1
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) ->Int {
        return dataArray.count
    }
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath) ->UITableViewCell {
        let cell:LZDCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? LZDCell
        if indexPath.row == 1 {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition:UITableView.ScrollPosition.none)
            cell?.accessoryType = .checkmark //右边选中 状态的标记
//            cell?.myView?.backgroundColor = UIColor.yellow
        }
        cell!.myImageView?.image = UIImage.init(named: "girl")
        cell!.myLabe?.text = self.dataArray[indexPath.row]
        return cell!
    }
    
    //设置Section的表头高度
    func tableView(_ tableView:UITableView, heightForHeaderInSection section:Int) ->CGFloat {
        return 200
    }
    //设置cell行高
    func tableView(_ tableView:UITableView, heightForRowAt indexPath:IndexPath) ->CGFloat {
        return 120
    }
    
    //处理选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //选中背景变灰 后 恢复
        print("选中的Cell 为:\(self.dataArray[indexPath.row])")
    }

}
