
//
//  JumpAppVC.swift
//  Swift_Info
//
//  Created by hello on 2018/12/14.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class JumpAppVC: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    let indentifier = "mycell"
    var dataArray:[String] = ["调自己的ObjectiveC","调微信","调mail",]
    var schemesInfoArray = ["ObjectiveC2.718://William2.718?message=hiOC","weixin://scanqrcode","mailto:william17162018@gmail.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: indentifier)
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let schemesInfo = schemesInfoArray[indexPath.row]
        let url = URL.init(string: schemesInfo)
        let dict = Dictionary<UIApplication.OpenExternalURLOptionsKey, Any>()
        if UIApplication.shared.canOpenURL(url!) {
            UIApplication.shared.open(url!, options:dict ) { (make) in
                print(make)
            }
        } else {
            print("不可以打开")
        }
    }

}
