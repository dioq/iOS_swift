//
//  AnimationVC2.swift
//  Swift_UI
//
//  Created by William on 2018/8/24.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class AnimationVC2: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imageArray = Array<UIImage>()
        for i in 1...5 {
            if let image = UIImage.init(named: "coin\(i).png") {
                imageArray.append(image)
            }
        }
        
        myImageView.animationImages = imageArray
        myImageView.animationDuration = 0.4 //动画间隔
    }
    
    @IBAction func action01(_ sender: UIButton) {
        myImageView.startAnimating()//开始动画
    }
    
    @IBAction func action02(_ sender: UIButton) {
        myImageView.stopAnimating()// 结束动画
    }
    
}
