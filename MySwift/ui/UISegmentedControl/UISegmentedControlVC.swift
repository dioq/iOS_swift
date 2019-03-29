//
//  UISegmentedControlVC.swift
//  Swift_Info
//
//  Created by hello on 2019/1/3.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit
import SnapKit

class UISegmentedControlVC: UIViewController {

    var segmentedControl:UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "UISegmentedControl"
        //分段选项显示
        let items = ["资讯","视频","头条", "娱乐"]
        //初始化对象
        segmentedControl = UISegmentedControl(items:items)
        //添加
        self.view.addSubview(segmentedControl)
        //设置位置
        segmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(80)
            make.right.equalTo(self.view).offset(-10)
            make.left.equalTo(self.view).offset(10)
            make.height.equalTo(44)
        }
        //颜色设定
        segmentedControl.tintColor = UIColor.red
        //当前选中下标
        segmentedControl.selectedSegmentIndex = 1
        //是否根据segment的内容改变segment的宽度
        segmentedControl.apportionsSegmentWidthsByContent = true
        //添加事件
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged), for: UIControl.Event.valueChanged)
    }
    
    //选择点击后的事件
    @objc func segmentedControlChanged(sender:UISegmentedControl) {
        print(sender.tintColor!)//获取颜色
        let index = sender.selectedSegmentIndex
        print(index)//获取下标
        if let title = sender.titleForSegment(at: index) {//获取某一个下标下的标题
            print(title)
        }
        if let image = sender.imageForSegment(at: 2) {//获取某一个下标下得图片
            print(image.size)
        }
        //修改选项图片
//        sender.setImage(UIImage(named:"head"), forSegmentAt:sender.selectedSegmentIndex)
        //设置指定下标选项的宽度
//        sender.setWidth(100, forSegmentAt: sender.selectedSegmentIndex)
        //获取某一个下标segment的宽度
        print(sender.widthForSegment(at: 2))
    }

    @IBAction func addAction(_ sender: UIButton) {
        //添加图片选项
        segmentedControl.insertSegment(with: UIImage(named:"more icon"), at: 0, animated: true)
        //添加文字选项
        segmentedControl.insertSegment(withTitle: "Willam", at: 1, animated: true)
    }
    
    @IBAction func deleteAction(_ sender: UIButton) {
        //移除制定下标的选项
//        segmentedControl.removeSegment(at: 1, animated: true)
        
        //移出所有segment
        segmentedControl.removeAllSegments()
    }

}
