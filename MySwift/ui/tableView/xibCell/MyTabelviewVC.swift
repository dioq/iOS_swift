//
//  MyTabelviewVC.swift
//  swift_UI02
//
//  Created by William on 2018/7/30.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class MyTabelviewVC: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    var table:UITableView!
    let arry:[String] = ["我是谁", "我从哪里来", "要到哪里去","我是谁", "我从哪里来", "要到哪里去","我是谁", "我从哪里来", "要到哪里去","我是谁", "我从哪里来", "要到哪里去","我是谁", "我从哪里来", "要到哪里去"]
    
    let identifier = "cell"
    
    // 设置每个seccion的row数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arry.count
    }
    //设置section的数量
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //设置cell的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //设置tableview的cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MyCell? = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? MyCell
        cell?.imageView?.image = UIImage.init(named: "more icon")
        cell?.myLabel.text = arry[indexPath.row]
        if indexPath.row == 1 {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition:UITableView.ScrollPosition.none)
            cell?.accessoryType = .checkmark //右边选中 状态的标记
            cell?.myMark.backgroundColor = UIColor.red
        }
        
        if indexPath.row % 2 == 0 {
            cell?.isRequire = true
        }else {
            cell?.isRequire = false
        }
        
        return cell!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "table自定义xib cell"
        //设置UITableView的位置
        table = UITableView(frame: self.view.frame, style: UITableView.Style.plain)
        self.table.backgroundColor = UIColor.blue
        
        //设置数据源
        self.table.dataSource = self
        //设置代理
        self.table.delegate = self
        self.view.addSubview(table)
        self.table.register(UINib.init(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: identifier)
    }

}
