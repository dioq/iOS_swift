//
//  Scroll2ViewController.swift
//  Swift_Info
//
//  Created by hello on 2019/1/14.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class Scroll2ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置代理
        scrollView.delegate = self
        let imageView = UIImageView(image:UIImage(named:"pingtaoge"))
        scrollView.contentSize = imageView.bounds.size
        scrollView.addSubview(imageView)
        
        //设置最小和最大的缩放的比例，默认值都为1.0
        scrollView.minimumZoomScale = 0.4 //最小比例
        scrollView.maximumZoomScale = 2 //最大比例
    }

    /**
     要实现放大缩小功能，需要指定UIScrollView的允许缩放最大比例和最小比例（默认都是是1.0）。
     同时delegate属性指定一个委托类，委托类要继承UIScrollViewDelegate协议，并在委托类中实现viewForZooming方法。
     **/
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        for subview in scrollView.subviews {
            if subview.isKind(of: UIImageView.self) {
                return subview
            }
        }
        return nil
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        print("完成放大缩小时调用")
    }
}
