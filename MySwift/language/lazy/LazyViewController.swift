//
//  LazyViewController.swift
//  Swift_stu
//
//  Created by William on 2018/8/15.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class LazyViewController: UIViewController {

    //懒加载
    lazy var headerImage:UIImageView = {
        let headerImage = UIImageView()
        headerImage.image = UIImage.init(named: "girl")
        headerImage.frame = CGRect.init(x:100,y:150,width:200,height:200)
        return headerImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(headerImage)
    }

}
