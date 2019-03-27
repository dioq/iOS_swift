//
//  ScrollViewController.swift
//  Swift_Info
//
//  Created by hello on 2019/1/14.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController,UIScrollViewDelegate {
    
    var myscrollView:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "UIScrollView"
        view.backgroundColor = UIColor.blue
        
        myscrollView = UIScrollView.init(frame: CGRect(x: 10, y: 70, width: ScreenWIDTH - 20, height: ScreenHEIGHT - 150))
        //设置背景颜色
        myscrollView.backgroundColor = UIColor.green
        //内容大小
        let widthS = myscrollView.frame.width
        let heightS = myscrollView.frame.height
        myscrollView.contentSize = CGSize(width:(widthS * 2), height: (heightS * 2))
//        addImage()
        //是否可以滚动
        myscrollView.isScrollEnabled = true
        //会滚到顶点
        myscrollView.scrollsToTop = true
        //反弹效果
        myscrollView.bounces = true
        //分页显示
        myscrollView.isPagingEnabled = true
        //水平、垂直滚动条是否可见
        myscrollView.showsVerticalScrollIndicator = true
        myscrollView.showsHorizontalScrollIndicator = true
        //滚动条颜色
        myscrollView.indicatorStyle = .black
        //设置内边距
//        myscrollView.contentInset = UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20)
        //滚动偏移量
//        myscrollView.contentOffset = CGPoint(x: widthS, y: 0)
//        myscrollView.setContentOffset(CGPoint(x: widthS, y: 0), animated: true) //这个较优
        //使用UIScrollViewDelegate
        myscrollView.delegate = self
        
        view.addSubview(myscrollView)//添加到controller上去
    }
    
    func addImage() {
        let widthS = myscrollView.frame.width
        let heightS = myscrollView.frame.height
        //水平方向要展示的图
        let v = ["image1","image2","pingtaoge","placeholder"]
        for i in 0..<v.count {
            let hImageViews = UIImageView(image: UIImage(named:v[i]))
            hImageViews.frame = CGRect(x: widthS * CGFloat(i), y:0,width:widthS,height:heightS)
            myscrollView.addSubview(hImageViews)
        }
        //垂直方向要展示的图
        let h = ["coin1","coin2","coin3","coin4"]
        for i in 0..<h.count {
            let hImageViews = UIImageView(image: UIImage(named:h[i]))
            hImageViews.frame = CGRect(x: 0, y: heightS * CGFloat(i + 1), width:widthS, height:heightS)
            myscrollView.addSubview(hImageViews)
        }
        
        myscrollView.contentSize = CGSize(width:(widthS * CGFloat(v.count)), height: (heightS * CGFloat(h.count + 1)))
    }

    //MARK: scrollview代理
    //只要滚动一直触发contentOffset变化
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("只要滚动就会触发")
        print(scrollView.contentOffset.x)
    }
    
    //用户开始拖动scrollview时候被调用
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("开始拖拽视图")
        print(scrollView.contentOffset.x)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("结束拖拽视图")
        print(scrollView.contentOffset.x)
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("将要开始减速")
        print(scrollView.contentOffset.x)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("减速停止了时执行")
        print(scrollView.contentOffset.x)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("滚动动画停止时执行,代码改变时触发,也就是setContentOffset改变时")
    }
    
}
