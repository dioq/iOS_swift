//
//  NIbViewController.swift
//  Swift_Info
//
//  Created by hello on 2019/3/11.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class NibViewController: UIViewController {

    @IBOutlet weak var myScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "演示xib + autolayerout"
        
        let stackView = Bundle.main.loadNibNamed("NibStackView", owner: self, options: nil)?.last as! NibStackView
        stackView.frame = CGRect(x: 0, y: 0, width: ScreenWIDTH, height: ScreenHEIGHT)
        myScrollView.addSubview(stackView)
        
        let height:CGFloat = stackView.bounds.size.height
        myScrollView.contentSize = CGSize(width:ScreenWIDTH, height: height)
        myScrollView.scrollsToTop = true  //会滚到顶点
        myScrollView.bounces = true  //反弹效果
    }

}
