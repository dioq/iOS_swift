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
        self.navigationItem.title =  "折叠 Cell"
        
        //设置UItabView的位置
        myTableView = UITableView.init(frame: self.view.frame, style: UITableView.Style.plain)
        self.view.addSubview(myTableView)
        myTableView.backgroundColor = UIColor.lightGray
        
        //设置数据源
        myTableView.dataSource = self
        //设置代理
        myTableView.delegate = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier:identifier)
        
        loadData()
    }
    
    func loadData() {
        for i in 0...3 {
            let model = FoldModel()
            model.sectionName = "Section \(i)"
            var rowNameArr = Array<String>()
            for j in 0...3 {
                let rowName = "  section: \(i)  ======== row : \(j)"
                rowNameArr.append(rowName)
            }
            model.rowContent = rowNameArr
            self.dataArray.append(model)
        }
        
        self.myTableView.reloadData()
    }
}

extension FoldCellViewController:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = Bundle.main.loadNibNamed("MySetionHeaderView", owner: self, options: nil)?.last as! MySetionHeaderView
        //        sectionHeaderView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
        let model = self.dataArray[section]
        sectionHeaderView.isOpen = model.isOpen
        sectionHeaderView.sectionTitle = model.sectionName!
        sectionHeaderView.section = section
        sectionHeaderView.openSectionDelegate = self
        return sectionHeaderView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    //设置cell行高
    func tableView(_ tableView:UITableView, heightForRowAt indexPath:IndexPath) ->CGFloat {
        return 62
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
        //        cell.selectionStyle = .none //点击后背景颜色无变化
        return cell
    }
    
    //处理选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击的Cell 为 section:\(indexPath.section) row:\(indexPath.row)")
    }
}

extension FoldCellViewController:OpenDelegate {
    func openWhichOne(index: Int) {
        let model = self.dataArray[index]
        model.isOpen = !model.isOpen
        self.dataArray[index] = model
        self.myTableView.reloadData()
    }
}
