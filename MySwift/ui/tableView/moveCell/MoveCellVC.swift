//
//  ModeCellVC.swift
//  Swift_Info
//
//  Created by hello on 2019/1/22.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class MoveCellVC: UIViewController {

    var myTableView:UITableView!
    let identifier = "cell"  //cell标识
    var dataArray:[String] = ["我是谁","我从哪里来","要到哪里去","我想要什么","我能干什么","我现在在做什么","我未来会做什么","我现在应该干什么"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let barButtonItem = UIBarButtonItem.init(title: "编辑", style: .plain, target: self, action: #selector(rightTopBtn(barButtonItem:)))
        self.navigationItem.rightBarButtonItem = barButtonItem
        
        //设置UItabView的位置
        myTableView = UITableView.init(frame: self.view.frame, style: UITableView.Style.plain)
        myTableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine //分割线样式
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        myTableView.backgroundColor = UIColor.blue
        view.addSubview(myTableView)
        myTableView.tableFooterView = UIView.init()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.setEditing(true, animated: true)//打开UItableView 的编辑模式
    }

    @objc func rightTopBtn(barButtonItem:UIBarButtonItem) {
        let isOr = myTableView.isEditing
        if isOr {
            barButtonItem.title = "编辑"
        }else{
            barButtonItem.title = "完成"
        }
        myTableView.setEditing(!isOr, animated: true)//打开UItableView 的编辑模式
    }
    
}

extension MoveCellVC:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.imageView?.image = UIImage.init(named: "search_selected")
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    //默认编辑模式下，每个cell左边有个红色的删除按钮，设置为None即可去掉
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    //去除编辑模式下的头部缩进
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        if indexPath.row == 0 {
//            return false
//        }
        return true //打开编辑(精准控制到每一个cell)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        if indexPath.row == 2 {
//            return false
//        }
        return true //允许移动(精准控制到每一个cell)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if sourceIndexPath != destinationIndexPath{
            //获取移动行对应的值
            let itemValue:String = self.dataArray[sourceIndexPath.row]
            //删除移动的值
            self.dataArray.remove(at: sourceIndexPath.row)
            //如果移动区域大于现有行数，直接在最后添加移动的值
            if destinationIndexPath.row > self.dataArray.count{
                self.dataArray.append(itemValue)
            }else{
                //没有超过最大行数，则在目标位置添加刚才删除的值
                self.dataArray.insert(itemValue, at:destinationIndexPath.row)
            }
        }
    }
    
}
