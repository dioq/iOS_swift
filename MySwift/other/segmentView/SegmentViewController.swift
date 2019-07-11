//
//  SegmentViewController.swift
//  Swift_Info
//
//  Created by hello on 2019/1/14.
//  Copyright © 2019 William. All rights reserved.
//

/*自定义的滑动块 切换ViewController*/
/* 使用子控制器实现 */
import UIKit
import SnapKit

class SegmentViewController: UIViewController {

    var segmentedControl:UISegmentedControl!
    var scrollContainer: UIScrollView!
    var widthS:CGFloat = 0
    var heightS:CGFloat = 0
    
    var titles:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        titles = ["推荐","专题","真相","两性"]
        setTitlesView()
        configScrollView()
    }
    
    func setTitlesView() {
        //初始化对象
        segmentedControl = UISegmentedControl(items:titles)
        segmentedControl.selectedSegmentIndex = 0
        //添加
        self.view.addSubview(segmentedControl)
        //设置位置
        segmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(1)
            make.left.equalTo(self.view).offset(10)
            make.right.equalTo(self.view).offset(-10)
            make.height.equalTo(40)
        }
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged), for: UIControl.Event.valueChanged)
    }
    
    //选择点击后的事件
    @objc func segmentedControlChanged(sender:UISegmentedControl) {
        let index = sender.selectedSegmentIndex
//        print(index)
        scrollContainer.setContentOffset(CGPoint(x: widthS * CGFloat(index), y: 0), animated: true)
    }
    
    //配置scrollview
    func configScrollView()  {
        //scrollview容器
        scrollContainer = UIScrollView.init(frame: CGRect(x: 10, y: 45, width: ScreenWIDTH - 20, height: ScreenHEIGHT - 45))
        self.view.addSubview(scrollContainer)
        scrollContainer.backgroundColor = UIColor.white
        widthS = scrollContainer.bounds.width
        heightS = scrollContainer.bounds.height
        
        for index in 0..<titles.count {
            let vc: UIViewController = UIViewController.init()
            vc.view.frame = CGRect(x:CGFloat(index) * widthS, y:0, width:widthS, height:heightS)
            
            let temp1 = CGFloat(arc4random() % 255) / 255
            let temp2 = CGFloat(arc4random() % 255) / 255
            let temp3 = CGFloat(arc4random() % 255) / 255
            vc.view.backgroundColor = UIColor.init(red: temp1, green: temp2, blue: temp3, alpha: 1)
            //添加子控制器
            scrollContainer?.addSubview(vc.view)
            /** 添加子控制器 **/
            self.addChild(vc)
        }
        
        //配置scrollview容器
        scrollContainer?.contentSize = CGSize(width:CGFloat(titles.count) * widthS, height:0)
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

//用extension可以把所有的delegate单独写在一起,项止结构更直观
extension SegmentViewController:UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("减速停止了时执行")
        print(scrollView.contentOffset.x)
        let index = Int(scrollView.contentOffset.x / widthS)
        print(index)
        segmentedControl.selectedSegmentIndex = index
    }
}
