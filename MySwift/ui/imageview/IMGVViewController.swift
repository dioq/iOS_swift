//
//  IMGVViewController.swift
//  MySwift
//
//  Created by hello on 2019/4/17.
//  Copyright © 2019 Dio. All rights reserved.
//

import UIKit

class IMGVViewController: UIViewController {
    
    @IBOutlet weak var imageV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //图片填充模式,不设置图片按自己尺寸大小显示,设置后可以填满整个ImageView
        self.imageV.contentMode = .scaleAspectFill
        playGIF()
    }
    
    func playGIF() {
        // 1、加载gif图片，并转成Data类型
        guard let imgPath = Bundle.main.path(forResource: "login_bg_gif_01.gif", ofType: nil) else { return }
        guard let imgData = NSData(contentsOfFile: imgPath) else { return }
        // 2、从data中读取数据：将data转成CGImageSource对象
        guard let imgSource = CGImageSourceCreateWithData(imgData, nil) else {
            return
        }
        // 3、获取在CGImageSource中图片的个数
        let imgCount = CGImageSourceGetCount(imgSource)
        
        // 4、遍历所有图片
        var imgs = [UIImage]()
        var totalDuration: TimeInterval = 0
        for i in 0..<imgCount {
            // 4.1、取出图片
            guard let cgimg = CGImageSourceCreateImageAtIndex(imgSource, i, nil) else { continue }
            let img = UIImage(cgImage: cgimg)
            if i == 0 { // 保证执行完一次gif后不消失
                imageV.image = img
            }
            imgs.append(img)
            
            // 4.2、取出持续的时间
            guard let properties = CGImageSourceCopyPropertiesAtIndex(imgSource, i, nil) as? Dictionary<CFString, Any> else {
                continue
            }
            guard let dict = properties[kCGImagePropertyGIFDictionary] as? Dictionary<CFString, Any> else { continue }
            guard let duration = dict[kCGImagePropertyGIFDelayTime] as? Double else { continue }
            totalDuration += duration
        }
        
        // 5、设置imageView的属性
        imageV.animationImages = imgs
        imageV.animationDuration = totalDuration
        imageV.animationRepeatCount = 0  // 执行一次，设置为0时无限执行
        
        // 6、开始播放
        imageV.startAnimating()
    }
    
}
