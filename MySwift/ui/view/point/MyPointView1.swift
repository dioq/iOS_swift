//
//  MyPointView1.swift
//  Swift_Info
//
//  Created by hello on 2019/1/30.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class MyPointView1: UIView {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        btn1.addTarget(self, action: #selector(actionIsTouch(button:)), for: .touchUpInside)
        btn2.addTarget(self, action: #selector(actionIsTouch(button:)), for: .touchUpInside)
        btn3.addTarget(self, action: #selector(actionIsTouch(button:)), for: .touchUpInside)
        btn4.addTarget(self, action: #selector(actionIsTouch(button:)), for: .touchUpInside)
        btn5.addTarget(self, action: #selector(actionIsTouch(button:)), for: .touchUpInside)
    }
    
    @objc func actionIsTouch(button:UIButton) {
        print("第\(button.tag)个button响应了")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("hitTest point:\t",point)
        let x = point.x

        let X = self.frame.origin.x
        let W = self.frame.width
        if x < (X + W) / 2 {//让左半边的button响应
            let count = self.subviews.count - 1
            for i in (0...count).reversed() {
                let view = self.subviews[i]
                if view.isKind(of: UIButton.classForCoder()) {
                    let p = view.convert(point, from: self)//将坐标系由self(这个view) 转换到view(这个view上来)
                    print("p:\t",p)
                    if view.point(inside: p, with: event){//假如转换后的坐标p,在这个视图内
                        return view.hitTest(p, with: event)
                    }
                }
            }
        }

        return self
    }
    
}
