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

extension ContentViewController: DNSPageTitleViewDelegate {
    
    func titleView(_ titleView: DNSPageTitleView, didSelectAt index: Int) {
        print("点击了第\(index)个title")
    }
    
}

extension ContentViewController: DNSPageContentViewDelegate {
    
    func contentView(_ contentView: DNSPageContentView, didEndScrollAt index: Int) {
        print("didEndScrollAt index : \(index)")
    }
    
    func contentView(_ contentView: DNSPageContentView, scrollingWith sourceIndex: Int, targetIndex: Int, progress: CGFloat) {
        print("scrollingWith sourceIndex : \(sourceIndex)")
    }
    
}
