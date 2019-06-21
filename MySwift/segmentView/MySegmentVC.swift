//
//  MySegmentVC.swift
//  Swift_Info
//
//  Created by hello on 2019/1/22.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class MySegmentVC: UIViewController {

    var titlesScrollView:UIScrollView!
    var scrollContainer:UIScrollView!
    var titlesArray = ["头条", "视频", "娱乐", "要问", "体育" , "科技" , "汽车" , "时尚" , "图片" , "游戏" , "房产"]
    var widthS:CGFloat = 0
    var heightS:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titlesScrollView = UIScrollView.init(frame: CGRect(x: 10, y: 1, width: ScreenWIDTH - 20, height: 55))
        titlesScrollView.tag = 101
        //设置背景颜色
        titlesScrollView.backgroundColor = UIColor.green
        let widthT = 80
        let heightT = 50
        titlesScrollView.contentSize = CGSize(width:((widthT + 2) * titlesArray.count), height: (heightT * 1))
        //是否可以滚动
        titlesScrollView.isScrollEnabled = true
        //会滚到顶点
        titlesScrollView.scrollsToTop = true
        //反弹效果
        titlesScrollView.bounces = true
        //分页显示
        titlesScrollView.isPagingEnabled = false
        //水平、垂直滚动条是否可见
        titlesScrollView.showsVerticalScrollIndicator = true
        titlesScrollView.showsHorizontalScrollIndicator = false
        titlesScrollView.delegate = self
        view.addSubview(titlesScrollView)//添加到controller上去
        
        for i in 0..<titlesArray.count {
            let btn = UIButton.init(frame: CGRect(x: (widthT + 1) * i, y: 1, width: widthT, height: heightT))
            btn.backgroundColor = UIColor.lightGray
            btn.setTitle(titlesArray[i], for: .normal)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.setTitleColor(UIColor.red, for: .selected)
            btn.titleLabel?.sizeToFit()
            btn.tag = 1000 + i
            titlesScrollView.addSubview(btn)
            btn.addTarget(self, action: #selector(selectedItem(button:)), for: .touchUpInside)
        }
        
        configScrollView()
    }
    
    @objc func selectedItem(button:UIButton) {
        let index = button.tag - 1000
        scrollContainer.setContentOffset(CGPoint(x: widthS * CGFloat(index), y: 0), animated: true)
        setTitleSelected(index: index)
    }
    
    func setTitleSelected(index:Int) {
        for i in 0..<titlesArray.count {
            if i != index {
                print(i)
                if let btn = (self.view.viewWithTag(i + 1000) as? UIButton) {
                    btn.isSelected = false
                }
            }else{
                if let btn = (self.view.viewWithTag(i + 1000) as? UIButton) {
                    btn.isSelected = true
//                    titlesScrollView.setContentOffset(CGPoint(x: centetx, y: 0), animated: true)
                }
            }
        }
    }
    
    //配置scrollview
    func configScrollView()  {
        scrollContainer = UIScrollView.init(frame: CGRect(x: 10, y: 57, width: ScreenWIDTH - 20, height: ScreenHEIGHT - 180))
        scrollContainer.tag = 102
        self.view.addSubview(scrollContainer)
        scrollContainer.backgroundColor = UIColor.white
        widthS = scrollContainer.bounds.width
        heightS = scrollContainer.bounds.height
        
        for index in 0..<titlesArray.count {
            let vc: UIViewController = UIViewController.init()
            vc.view.frame = CGRect(x:CGFloat(index) * widthS, y:0, width:widthS, height:heightS)
            
            vc.view.backgroundColor = UIColor.random
            //把子控制器的view添加到scrollView上
            scrollContainer?.addSubview(vc.view)
            /** 添加子控制器 **/
            self.addChild(vc)
        }
        
        //配置scrollview容器
        scrollContainer?.contentSize = CGSize(width:CGFloat(titlesArray.count) * widthS, height:0)
        scrollContainer?.showsHorizontalScrollIndicator = true
        scrollContainer?.delegate = self
        scrollContainer?.isPagingEnabled = true
        //会滚到顶点
        scrollContainer.scrollsToTop = true
        //反弹效果
        scrollContainer.bounces = true
        
        self.extendedLayoutIncludesOpaqueBars = false //扩展布局不包含导航栏
        if #available(iOS 11.0, *) {
            /**
             automatic 和scrollableAxes一样,scrollView会自动计算和适应顶部和底部的内边距并且在scrollView 不可滚动时,也会设置内边距.
             scrollableAxes 自动计算内边距.
             never不计算内边距
             always 根据safeAreaInsets 计算内边距
             **/
            scrollContainer.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false //自动计算滚动视图的内容边距
        }
    }

}

extension MySegmentVC:UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("减速停止了时执行")
        if scrollView.tag == 102 {
            print(scrollView.contentOffset.x)
            let index = Int(scrollView.contentOffset.x / scrollView.bounds.width)
            print(index)
            setTitleSelected(index: index)
        }
    }
    
}
