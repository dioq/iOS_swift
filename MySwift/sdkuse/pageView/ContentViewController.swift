//
//  ContentViewController.swift
//  Demo
//
//  Created by Daniels on 2018/2/24.
//  Copyright © 2018 Daniels. All rights reserved.
//

import UIKit
import DNSPageView

class ContentViewController: UIViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

}

extension ContentViewController: PageTitleViewDelegate {
    
    func titleView(_ titleView: PageTitleView, didSelectAt index: Int) {
        print("点击了第\(index)个title")
    }
    
}

extension ContentViewController: PageContentViewDelegate {
    
    func contentView(_ contentView: PageContentView, didEndScrollAt index: Int) {
        print("didEndScrollAt index : \(index)")
    }
    
    func contentView(_ contentView: PageContentView, scrollingWith sourceIndex: Int, targetIndex: Int, progress: CGFloat) {
        print("scrollingWith sourceIndex : \(sourceIndex)")
    }
    
}
