//
//  TwoCellTBVC.swift
//  Swift_UI
//
//  Created by William on 2018/8/19.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class TwoCellTBVC: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    let identifier1 = "cell01"
    let identifier2 = "cell02"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "加载两种不同的cell"
        
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UINib.init(nibName: "OneCell", bundle: nil), forCellReuseIdentifier: identifier1)
        myTableView.register(UINib.init(nibName: "TwoCell", bundle: nil), forCellReuseIdentifier: identifier2)
    }
    
    func numberOfSections(in tableView:UITableView) ->Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "titleForHeaderInSection"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "titleForFooterInSection"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier1, for: indexPath) as! OneCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier2, for: indexPath) as! TwoCell
            return cell
        }
    }

}
