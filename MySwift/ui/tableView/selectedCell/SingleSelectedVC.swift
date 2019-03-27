//
//  SingleSelectedVC.swift
//  Swift_Info
//
//  Created by hello on 2019/1/25.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class SingleSelectedVC: UIViewController {

    var dataArray:[String] = ["条目1","条目2","条目3","条目4","条目5","条目6","条目7","条目8","条目9","条目10","条目11","条目12","条目13","条目14","条目15","条目16","条目17","条目18","条目19","条目20","条目21","条目22","条目23","条目24","条目25","条目26","条目27","条目28","条目29","条目30"]
    var myTableView:UITableView!
    let identifier = "mycell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "点击单选cell"

        //创建表视图
        self.myTableView = UITableView(frame: self.view.frame, style:UITableView.Style.plain)
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        //创建一个重用的单元格
        self.myTableView.register(UINib.init(nibName: "SelectedCell", bundle: nil), forCellReuseIdentifier: identifier)
        self.view.addSubview(self.myTableView)
    }
    
}

extension SingleSelectedVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SelectedCell
        cell.myTitleLB.text = dataArray[indexPath.row]
        
        //如果cell处于选中状态 就在右边标记，否则不标记
        if let selectedItems = tableView.indexPathsForSelectedRows {
            if selectedItems.contains(indexPath){
                cell.accessoryType = .checkmark //打勾 //disclosureIndicator 右箭头
                cell.backgroundColor = UIColor.green
                cell.myTitleLB.textColor = UIColor.red
            }else{
                cell.accessoryType = .none
                cell.backgroundColor = UIColor.white
                cell.myTitleLB.textColor = UIColor.black
            }
        }
        cell.selectionStyle = .none
        return cell
    }
    
    //处理列表项的选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if let cell = (tableView.cellForRow(at: indexPath) as? SelectedCell) {
            cell.accessoryType = .checkmark //右边选中 状态的标记
            cell.backgroundColor = UIColor.green
            cell.myTitleLB.textColor = UIColor.red
        }
    }
    
    //处理列表项的取消选中事件
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = (tableView.cellForRow(at: indexPath) as? SelectedCell) {
            cell.accessoryType = .none
            cell.backgroundColor = UIColor.white
            cell.myTitleLB.textColor = UIColor.black
        }
    }
    
}
