//
//  AutoImageViewController.swift
//  Swift_Info
//
//  Created by hello on 2018/11/27.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit
//import LLCycleScrollView

class AutoImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bannerDemo = LLCycleScrollView.llCycleScrollViewWithFrame(CGRect.init(x: 0, y: 100, width: ScreenWIDTH, height: 200))
        // 是否自动滚动
        bannerDemo.autoScroll = true
        
        // 是否无限循环，此属性修改了就不存在轮播的意义了 😄
        bannerDemo.infiniteLoop = true
        
        // 滚动间隔时间(默认为2秒)
        bannerDemo.autoScrollTimeInterval = 2.2
        
        // 等待数据状态显示的占位图
        let placeImage = UIImage.init(named: "image2")
        bannerDemo.placeHolderImage = placeImage
        
        // 如果没有数据的时候，使用的封面图
        bannerDemo.coverImage = placeImage
        
        // 设置图片显示方式=UIImageView的ContentMode
        bannerDemo.imageViewContentMode = .scaleToFill
        
        // 设置滚动方向（ vertical || horizontal ）
        bannerDemo.scrollDirection = .horizontal
        
        // 设置当前PageControl的样式 (.none, .system, .fill, .pill, .snake)
        bannerDemo.customPageControlStyle = .snake
        
        // 非.system的状态下，设置PageControl的tintColor
        bannerDemo.customPageControlInActiveTintColor = UIColor.red
        
        // 设置.system系统的UIPageControl当前显示的颜色
        bannerDemo.pageControlCurrentPageColor = UIColor.white
        
        // 非.system的状态下，设置PageControl的间距(默认为8.0)
        bannerDemo.customPageControlIndicatorPadding = 8.0
        
        // 设置PageControl的位置 (.left, .right 默认为.center)
        bannerDemo.pageControlPosition = .center
        
        // 背景色
        bannerDemo.collectionViewBackgroundColor = UIColor.yellow
        
        // 网络图，本地图混合
        let imagesURLStrings = [
            "image1",
            "http://www.g-photography.net/file_picture/3/3587/4.jpg",
            "http://img2.zjolcdn.com/pic/0/13/66/56/13665652_914292.jpg",
            "http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
            "http://img3.redocn.com/tupian/20150806/weimeisheyingtupian_4779232.jpg",
            ];
        bannerDemo.imagePaths = imagesURLStrings

        // 添加到view
        view.addSubview(bannerDemo)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
