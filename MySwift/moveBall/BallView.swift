//
//  BallView.swift
//  Swift_Info
//
//  Created by hello on 2019/1/27.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class BallView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("touchesBegan -- end")
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
                return
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?){
        super.touchesEnded(touches, with: event)
        print("touchesEnded -- end")
    }

}
