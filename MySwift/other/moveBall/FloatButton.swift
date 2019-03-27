//
//  FloatButton.swift
//  Esports
//
//  Created by hello on 2019/1/27.
//  Copyright © 2019 hello. All rights reserved.
//

import UIKit

protocol ClickDelegate:NSObjectProtocol {
    //设置协议方法
    func clickMethod(value:String)
}

class FloatButton: UIButton {
    
    var startPoint:CGPoint!
    var endPoint:CGPoint!
    
    //指定协议对象
    weak var delegate:ClickDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        config(view: self)
    }
    
    //设置圆角
    func config(view: UIView) {
        view.layer.cornerRadius = view.frame.width / 2
        view.layer.masksToBounds = true
//        view.layer.borderColor = UIColor.blue.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print(touches.count)
        for touch in touches {
            startPoint = touch.location(in: self)
            print("startPoint:",startPoint!)
        }
        print("touchesBegan event begin!")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
        super.touchesMoved(touches, with: event)
        for touch:AnyObject in touches {
            if (touch.isKind(of: UITouch.self)) {
                let curPoint = touch.location(in: self)//现在位置
                let prePoint = touch.previousLocation(in: self)//之前位置
                let moveX = curPoint.x - prePoint.x
                let moveY = curPoint.y - prePoint.y
                var frame = self.frame
                frame.origin.x += moveX
                frame.origin.y += moveY
                self.frame = frame
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?){
        super.touchesEnded(touches, with: event)
        for touch in touches {
            endPoint = touch.location(in: self)
            print("endPoint:",endPoint!)
        }
//        print("touchesEnded event end!")
        if startPoint! == endPoint! {
            delegate?.clickMethod(value: "this is click!")
        }
    }
    
}
