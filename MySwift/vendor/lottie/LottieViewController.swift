//
//  LottieViewController.swift
//  MySwift
//
//  Created by hello on 2019/4/7.
//  Copyright © 2019 Dio. All rights reserved.
//

import UIKit
import Lottie

class LottieViewController: UIViewController {
    
    var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Lottie"

        animationView = AnimationView(name: "water-loading")
        animationView.backgroundColor = UIColor.lightGray
        animationView.frame = CGRect.init(x: 10, y: 10, width: ScreenWIDTH - 20, height: ScreenWIDTH - 20)
        animationView.contentMode = .center //.scaleToFill
        animationView.loopMode = .autoReverse //.loop //.playOnce
        animationView.animationSpeed = 1.1 //播放速度
        self.view.addSubview(animationView)
    }
    
    @IBAction func start(_ sender: UIButton) {
        animationView.play(completion: { finished in
            print("animation has finished!  ====  ", finished)
        })
    }
    
}
