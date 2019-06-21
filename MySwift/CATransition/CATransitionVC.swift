//
//  CATransitionVC.swift
//  Swift_Info
//
//  Created by hello on 2019/1/17.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit
import SnapKit

class CATransitionVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        
        let redView:UIView = UIView()
        redView.backgroundColor = UIColor.red
        self.view.insertSubview(redView, at: 0)
        redView.snp.makeConstraints { (make) in
            make.top.left.equalTo(self.view).offset(10)
            make.right.bottom.equalTo(self.view).offset(-10)
        }
        
        let blueView:UIView = UIView()
        blueView.backgroundColor = UIColor.blue
        self.view.insertSubview(blueView, at: 1)
        blueView.snp.makeConstraints { (make) in
            make.top.left.equalTo(self.view).offset(10)
            make.right.bottom.equalTo(self.view).offset(-10)
        }
    }
    
    /*
     1，公开动画效果：
     kCATransitionFade：翻页
     kCATransitionMoveIn：弹出
     kCATransitionPush：推出
     kCATransitionReveal：移除
     
     2，非公开动画效果：
     "cube"：立方体
     "suckEffect"：吸收
     "oglFlip"：翻转
     "rippleEffect"：波纹
     "pageCurl"：卷页
     "cameraIrisHollowOpen"：镜头开
     "cameraIrisHollowClose"：镜头关
     
     3，动画方向类型：
     kCATransitionFromRight：从右侧开始实现过渡动画
     kCATransitionFromLeft：从左侧开始实现过渡动画
     kCATransitionFromTop：从顶部开始实现过渡动画
     kCATransitionFromBottom：从底部开始实现过渡动画
     **/
    //点击切换两个红蓝视图
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let transition = CATransition()
        transition.duration = 3.0
        transition.type = CATransitionType.push //推送类型
        transition.subtype = CATransitionSubtype.fromLeft //从左侧
        self.view.exchangeSubview(at: 1, withSubviewAt: 0)
        self.view.layer.add(transition, forKey: nil)
    }
    
}
