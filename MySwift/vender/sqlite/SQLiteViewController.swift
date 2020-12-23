//
//  SQLiteViewController.swift
//  Swift_SDK
//
//  Created by William on 2018/8/17.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class SQLiteViewController: UIViewController {
    // 数据库声明
    var database: Database!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 与数据库建立连接
        database = Database()
        // 建立列表（有列表后不再建立）
        database.tableLampCreate()
    }
    
    @IBAction func action01(_ sender: UIButton) {
        // 插入两条数据
        database.tableLampInsertItem(address: 51, name: "灯光1", colorValue: "#FFFFFF", lampType: 0)
//        database.tableLampInsertItem(address: 52, name: "灯光2", colorValue: "#AAAAAA", lampType: 1)
    }
    
    @IBAction func action02(_ sender: UIButton) {
        // 删除列表项
        database.tableLampDeleteItem(address: 51)
    }
    
    @IBAction func action03(_ sender: UIButton) {
        // 修改列表项
        database.tableLampUpdateItem(address: 51, newName: "客厅大灯")
    }
    
    @IBAction func action04(_ sender: UIButton) {
        // 根据条件查询
        database.readTableLampItem(address: 51)
    }
    
    @IBAction func action05(_ sender: UIButton) {
        print("结果如下:")
        // 遍历列表（检查插入结果）
        database.queryTableLamp()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
