//
//  FoldCellViewController.swift
//  MySwift
//
//  Created by Geek on 2019/12/24.
//  Copyright © 2019 Dio. All rights reserved.
//

import UIKit

class FoldCellViewController: UIViewController {
    
    var myTableView:UITableView!
    let identifier = "cellid"
    var dataArray = Array<FoldModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...3 {
            let model = FoldModel()
            model.sectionName = "Section: \(i)"
            var rowNameArr = Array<String>()
            for j in 0...3 {
                let rowName = "Section: \(i)  ======== row : \(j)"
                rowNameArr.append(rowName)
            }
            model.rowContent = rowNameArr
            self.dataArray.append(model)
        }
        
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
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier:identifier)
    }
    
    
}

extension FoldCellViewController:UITableViewDataSource,UITableViewDelegate,OpenDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = Bundle.main.loadNibNamed("MySetionHeaderView", owner: self, options: nil)?.last as! MySetionHeaderView
        let model = self.dataArray[section]
        sectionHeaderView.sectionTitle = model.sectionName!
        sectionHeaderView.section = section
        sectionHeaderView.openSectionDelegate = self
        return sectionHeaderView
    }
    
    func openWhichOn(index: Int) {
        let model = self.dataArray[index]
        model.isOpen = !model.isOpen
        self.dataArray[index] = model
        self.myTableView.reloadData()
    }
    
    //section尾的高度
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80
    }
    
    
    func numberOfSections(in tableView:UITableView) ->Int {
        return dataArray.count
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) ->Int {
        let model = self.dataArray[section]
        if model.isOpen {
            return model.rowContent!.count
        }
        return 0
    }
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let model = self.dataArray[indexPath.section]
        let valueStr = model.rowContent![indexPath.row]
        cell.textLabel?.text = valueStr
        cell.selectionStyle = .none //点击后背景颜色无变化
        return cell
    }
    
    //设置cell行高
    func tableView(_ tableView:UITableView, heightForRowAt indexPath:IndexPath) ->CGFloat {
        return 80
    }
    
    //处理选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //选中背景变灰 后 恢复
        print("选中的Cell 为:\(self.dataArray[indexPath.row])")
    }
}
