//
//  BFRefreshVC.swift
//  Swift_Info
//
//  Created by hello on 2019/1/3.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit
import BFRefresh

class BFRefreshVC: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.refreshBlock = {
            print("连接异常，重新刷新")
        }
    }
    
    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        if index == 0 {
            myTableView.set(loadType: .normal)
        } else if index == 1 {
            myTableView.set(loadType: .loading)
        } else if index == 2 {
            myTableView.set(loadType: .noData)
        } else if index == 3 {
            myTableView.set(loadType: .noNetwork)
        } else if index == 4 {
            myTableView.set(loadType: .error)
        }
    }

}
