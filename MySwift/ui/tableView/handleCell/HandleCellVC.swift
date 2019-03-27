//
//  HandleCellVC.swift
//  Swift_Info
//
//  Created by hello on 2018/10/25.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class HandleCellVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    let identifier = "SwiftCell"
    var dataArray = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "操作cell"
        let barButtonItem = UIBarButtonItem.init(title: "编辑", style: .plain, target: self, action: #selector(rightTopBtn(barButtonItem:)))
        self.navigationItem.rightBarButtonItem = barButtonItem
        
        myTableView.delegate = self
        myTableView.dataSource = self
        //在初始化tableview的时候就去register一个自顶的cell, 这种写法在cellForRowAtIndexPath部分就不用去判断这个cell是否非空
        ///使用dequeueReuseableCellWithIdentifier:forIndexPath:必须注册，但返回的cell可省略空值判断的步骤。
        myTableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: identifier)
    }
    
    @objc func rightTopBtn(barButtonItem:UIBarButtonItem) {
        let isOr = myTableView.isEditing
        myTableView.setEditing(!isOr, animated: true)//打开UItableView 的编辑模式
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        ///使用dequeueReuseableCellWithIdentifier:forIndexPath:必须注册，但返回的cell可省略空值判断的步骤。
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = self.dataArray[indexPath.row]
        return cell
    }

    //返回编辑类型，滑动删除
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row == 3 {//row等于3的cell不能删
            return UITableViewCell.EditingStyle.none
        }
        return UITableViewCell.EditingStyle.delete
    }
    //在这里修改删除按钮的文字
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "点击删除"
    }
    //点击删除按钮的响应方法，在这里处理删除的逻辑
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            self.dataArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
}
