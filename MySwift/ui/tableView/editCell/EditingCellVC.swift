//
//  EditingCellVC.swift
//  swift_UI02
//
//  Created by William on 2018/7/26.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class EditingCellVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var items:[String] = ["条目1","条目2","条目3","条目4","条目5"]
    var tableView:UITableView!
    let identifier = "mycell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "可编辑cell"
        let barButtonItem = UIBarButtonItem.init(title: "删除", style: .plain, target: self, action: #selector(btnClick(sender:)))
        self.navigationItem.rightBarButtonItem = barButtonItem

        //创建表视图
        self.tableView = UITableView(frame: self.view.frame, style:UITableView.Style.plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        //在初始化tableview的时候就去register一个自顶的cell,这种写法在cellForRowAtIndexPath部分就不用去判断这个cell是否非空
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        self.view.addSubview(self.tableView)
        
        //表格在编辑状态下允许多选
        self.tableView.allowsMultipleSelectionDuringEditing = true
        
        //绑定对长按的响应
        let longPress =  UILongPressGestureRecognizer(target:self,action:#selector(tableviewCellLongPressed(gestureRecognizer:)))
        longPress.minimumPressDuration = 1.0
        //将长按手势添加到需要实现长按操作的视图里
        self.tableView!.addGestureRecognizer(longPress)
    }
    
    
    //单元格长按事件响应
    @objc func tableviewCellLongPressed(gestureRecognizer:UILongPressGestureRecognizer) {
        if (gestureRecognizer.state == UIGestureRecognizer.State.ended){//长按结束时触发
            print("UIGestureRecognizerStateEnded");
            //在正常状态和编辑状态之间切换
            if(self.tableView.isEditing == false) {
                self.tableView.setEditing(true, animated:true)
            }else {
                self.tableView.setEditing(false, animated:true)
            }
        }
    }
    
    //在本例中，只有一个分区
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //同一形式的单元格重复使用，在声明时已注册
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = self.items[indexPath.row]
        return cell
    }
    
    
    //删除按钮点击
    @objc func btnClick(sender: AnyObject) {
        //获取选中项索引
        var selectedIndexs = [Int]()
        if let selectedItems = tableView!.indexPathsForSelectedRows {
            for indexPath in selectedItems {
                selectedIndexs.append(indexPath.row)
            }
        }
        
        //删除选中的数据
        for index in selectedIndexs {
            items.remove(at: index)
        }

        self.tableView.reloadData()//全部刷新
        /* 局部刷新 */
//        let indexPath = IndexPath.init(row: 0, section: 2)
//        self.tableView.reloadRows(at: [indexPath], with:.fade)
        /* 刷新所有可见的cell */
//        tableview.beginUpdates()
//        tableview.reloadRows(at: tableview.indexPathsForVisibleRows!, with: .none)
//        tableview.endUpdates()
        
        //退出编辑状态
        self.tableView.setEditing(false, animated:true)
    }

}
