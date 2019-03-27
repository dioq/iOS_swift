//
//  SelectedTBVC.swift
//  swift_UI02
//
//  Created by William on 2018/7/26.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class MultipleSelectedTBVC: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var items:[String] = ["条目1","条目2","条目3","条目4","条目5","条目6","条目7","条目8","条目9","条目10","条目11","条目12","条目13","条目14","条目15","条目16","条目17","条目18","条目19","条目20","条目21","条目22","条目23","条目24","条目25","条目26","条目27","条目28","条目29","条目30"]
    var myTableView:UITableView!
    let identifier = "mycell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "点击多选cell"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(btnClick))
        //创建表视图
        self.myTableView = UITableView(frame: self.view.bounds, style:UITableView.Style.plain)
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        //创建一个重用的单元格
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        self.view.addSubview(self.myTableView)
        
        //设置允许单元格多选
        self.myTableView.allowsMultipleSelection = true
    }
    
    //只有一个分区
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    //cell的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell   {
        //同一形式的单元格重复使用，在声明时已注册
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.imageView?.image = UIImage.init(named: "more icon")
        cell.textLabel?.text = self.items[indexPath.row]
        
        if indexPath.row == 3 { //把3 cell 设为默认的选中状态
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.none)
        }
        if indexPath.row == 24 { //把24 cell 设为默认的选中状态 (只有cell滑过24行时这句代码才会触发)
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.none)
        }
        
        //如果cell处于选中状态 就在右边标记，否则不标记
        if let selectedItems = self.myTableView.indexPathsForSelectedRows {
            if selectedItems.contains(indexPath){
                cell.accessoryType = .checkmark //打勾 //disclosureIndicator 右箭头
            }else{
                cell.accessoryType = .none
            }
        }
        
//        cell.selectionStyle = .none //选中状态的模式(无颜色变化)
        return cell
    }
    
    
    //初始化一个IndexPath
//    let indexPath = IndexPath.init(row: indexPath.row - 1, section: indexPath.section)
    //取到某个cell
//    let cell = self.myTableView.cellForRow(at: indexPath)
    //处理列表项的选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let cell = self.myTableView.cellForRow(at: indexPath)//取到当前cell
        cell?.accessoryType = .checkmark //右边选中 状态的标记
    }
    
    //处理列表项的取消选中事件
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = self.myTableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
    
    //确定按钮点击
    @objc func btnClick() {
        var selectedIndexs = [Int]()
        if let selectedItems = self.myTableView.indexPathsForSelectedRows {//取到tableView中所有选中的cell的indexPath
            for indexPath in selectedItems {
                selectedIndexs.append(indexPath.row)
            }
        }
        
        print("选中项的索引为：", selectedIndexs)
        print("选中项的值为：")
        for index in selectedIndexs {
            print(items[index])
        }
        
        self.navigationController?.popViewController(animated: true)
    }

}
