//
//  SearchViewController.swift
//  Swift_Info
//
//  Created by hello on 2019/1/8.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    //使用懒加载方式来创建UITableView
    lazy var tableView:UITableView = {
        let tempTableView = UITableView (frame: self.view.bounds, style: UITableView.Style.plain)
        tempTableView.delegate = self
        tempTableView.dataSource = self
        tempTableView.tableFooterView = UIView.init()
        
        return tempTableView
    }()
    
    //使用懒加载方式来创建UISearchBar
    lazy var searchBar:UISearchBar = {
        let tempSearchBar = UISearchBar(frame:CGRect(x: 0, y: 0, width: ScreenWIDTH, height: 40))
        //tempSearchBar.prompt = "查找图书"
        tempSearchBar.placeholder = "请输入搜索关键字"
        tempSearchBar.showsCancelButton = true
        tempSearchBar.delegate = self
        
        return tempSearchBar
    }()
    
    let identifier = "cellId"
    var dataArray:Array<String> = ["UI","UIView","View","ViewController","Controller",
                                   "UIViewController","Search","UISearchBar","Swift"]
    var searchArray = Array<String>()
    var isSearch = false//默认在非搜索状态下
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableHeaderView = self.searchBar
        self.view.addSubview(tableView)
    }
    
    //根据输入的关键字来过滤搜索结果
    func filterBySubstring(filterStr:String!) {
        isSearch = true
        searchArray = dataArray.filter({ (element) -> Bool in
            return element.contains(filterStr)
        })
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch {
            return searchArray.count
        }else{
            return dataArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: identifier)
        }
        
        let row = indexPath.row
        if isSearch {
            cell?.textLabel?.text = searchArray[row]
        }else{
            cell?.textLabel?.text = dataArray[row]
        }
        
        return cell!
    }
    
    //点击取消按钮触发的方法
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearch = false
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
    
    //点击搜索按钮时触发的方法
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //过滤搜索结果
        filterBySubstring(filterStr:searchBar.text!)
    }
    
    //监控输入框的方法
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //过滤搜索结果
        print(searchText)
        filterBySubstring(filterStr:searchText)
    }
    
}
