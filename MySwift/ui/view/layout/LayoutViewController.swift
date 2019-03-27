//
//  LayoutViewController.swift
//  Swift_Info
//
//  Created by hello on 2019/1/28.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class LayoutViewController: UIViewController {
    
    var layout:LayoutView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton.init(type: UIButton.ButtonType.custom)
        btn.frame.size = CGSize.init(width: 44, height: 44)
        btn.setTitle("动画", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(play(button:)), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: btn)
        
        layout = LayoutView.init(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        layout.backgroundColor = UIColor.green
        view.addSubview(layout)
    }
    
    @objc func play(button:UIButton) {
        if button.isSelected {
            UIView.animate(withDuration: 3) {
                self.layout.backgroundColor = UIColor.red
                self.layout.frame = CGRect(x: 170, y: 400, width: 200, height: 200)
            }
        }else {
            UIView.animate(withDuration: 3) {
                self.layout.backgroundColor = UIColor.green
                self.layout.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
            }
        }
        button.isSelected = !button.isSelected
    }
    
}
