//
//  BeginnerguideVC.swift
//  Swift_Info
//
//  Created by hello on 2018/12/21.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit
import KSGuideController

class BeginnerguideVC: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    var btn:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn = UIButton()
        btn.setTitle("英雄联盟▼", for: .normal)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        btn.addTarget(self, action: #selector(testAction), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: btn)
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "测试", style: .plain, target: self, action: #selector(testAction))
        
        showGuides()
    }
    
    @objc func testAction() {
        showGuides()
    }

    func showGuides() {
        KSGuideDataManager.reset(for: "MainGuide")
        var items = [KSGuideItem]()
        
        let item1 = KSGuideItem(sourceView: btn1, arrowImage: UIImage.init(named: "arrow"), text: "这是第一个button")
        items.append(item1)
        
        let item2 = KSGuideItem(sourceView: btn2, text: "第二个button")
        items.append(item2)
        
        let item3 = KSGuideItem(sourceView: btn3, arrowImage: UIImage.init(named: "arrow"), text: "这是第3个button")
        items.append(item3)
        
        if let barItem = self.navigationItem.rightBarButtonItem?.customView {
            let item4 = KSGuideItem(sourceView: barItem, text: "第二个button")
            items.append(item4)
        }
        
        let vc = KSGuideController(items: items, key: "MainGuide")
        vc.setIndexWillChangeBlock { (index, item) in
            print("Index will change to \(index)")
        }
        vc.setIndexDidChangeBlock { (index, item) in
            print("Index did change to \(index)")
        }
        vc.show(from: self) {
            print("Guide controller has been dismissed")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
