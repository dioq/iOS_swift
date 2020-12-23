//
//  KingfisherViewController.swift
//  Swift_Info
//
//  Created by hello on 2018/11/28.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit
import Kingfisher

class KingfisherViewController: UIViewController {
    
    @IBOutlet weak var myImageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func onlyLoading(_ sender: UIButton) {
        let imageURL = URL.init(string: "https://www.baidu.com/img/bd_logo1.png")
        //直接设置一张url图片
        myImageView.kf.setImage(with: imageURL)
    }
    
    
    @IBAction func setPlaceAction(_ sender: UIButton) {
        let imageURL = URL.init(string: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png")
        let placeholder = UIImage.init(named: "loading")
        
        let processor = DownsamplingImageProcessor(size: myImageView.frame.size)
            >> RoundCornerImageProcessor(cornerRadius: 20)
        myImageView.kf.indicatorType = .activity
        myImageView.kf.setImage(with: imageURL, placeholder: placeholder,
                                options: [
                                    .processor(processor),
                                    .scaleFactor(UIScreen.main.scale),
                                    .transition(.fade(1)),
                                    .cacheOriginalImage
            ])
        { (result) in
            switch result {
            case .success(let value)://加载成功回调
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error)://加载失败回调
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
    
}
