//
//  ViewController2.swift
//  Swift_Info
//
//  Created by hello on 2019/1/27.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit
import DNSPageView

class ViewController2: UIViewController {

    @IBOutlet weak var titleView: DNSPageTitleView!
    @IBOutlet weak var contentView: DNSPageContentView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 创建DNSPageStyle，设置样式
        let style = DNSPageStyle()
        style.isShowBottomLine = true
        style.titleViewBackgroundColor = UIColor.clear
        style.isShowCoverView = false
        style.isTitleViewScrollEnabled = true
        
        // 设置标题内容
        let titles = ["头条", "视频", "娱乐", "要问", "体育" , "科技" , "汽车" , "时尚" , "图片" , "游戏" , "房产"]
        
        // 设置默认的起始位置
        let startIndex = 0
        
        // 对titleView进行设置
        titleView.titles = titles
        titleView.style = style
        titleView.currentIndex = startIndex
        
        // 最后要调用setupUI方法
        titleView.setupUI()
        
        
        // 创建每一页对应的controller
        let childViewControllers: [ContentViewController] = titles.map { _ -> ContentViewController in
            let controller = ContentViewController()
            controller.view.backgroundColor = UIColor.random
            return controller
        }
        
        // 对contentView进行设置
        contentView.childViewControllers = childViewControllers
        contentView.currentIndex = startIndex
        contentView.style = style
        
        // 最后要调用setupUI方法
        contentView.setupUI()
        
        // 让titleView和contentView进行联系起来
        titleView.delegate = contentView
        contentView.delegate = titleView
    }

}
