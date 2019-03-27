//
//  ViewController3.swift
//  Demo
//
//  Created by Daniels on 2018/2/24.
//  Copyright © 2018 Daniels. All rights reserved.
//

import UIKit
import DNSPageView

class ViewController3: UIViewController {

    private lazy var pageViewManager: DNSPageViewManager = {
        // 创建DNSPageStyle，设置样式
        let style = DNSPageStyle()
        style.isShowBottomLine = true
        style.isTitleViewScrollEnabled = true
        style.titleViewBackgroundColor = UIColor.clear

        // 设置标题内容
        let titles = ["头条", "视频", "娱乐", "要问", "体育" , "科技" , "汽车" , "时尚" , "图片" , "游戏" , "房产"]

        // 创建每一页对应的controller
        let childViewControllers: [ContentViewController] = titles.map { _ -> ContentViewController in
            let controller = ContentViewController()
            controller.view.backgroundColor = UIColor.random
            return controller
        }

        return DNSPageViewManager(style: style, titles: titles, childViewControllers: childViewControllers)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // 单独设置titleView的frame
        pageViewManager.titleView.frame = CGRect(x: 0, y: 0, width: 180, height: 40)
        navigationItem.titleView = pageViewManager.titleView

        // 单独设置contentView的大小和位置，可以使用autolayout或者frame
        let contentView = pageViewManager.contentView
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.view.addSubview(contentView)
            contentView.snp.makeConstraints { (maker) in
                maker.edges.equalToSuperview()
            }
        }

    }

}
