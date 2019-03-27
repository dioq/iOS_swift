//
//  LabelViewController.swift
//  Swift_Info
//
//  Created by hello on 2019/1/2.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit
import SnapKit

class LabelViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    var testLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "label功能测试"
//        test()
//        test2()
        test3()
    }
    
    func test3() {
        let myLabel = UILabel()
        myLabel.backgroundColor = UIColor.purple
        myLabel.text = "本着依法依规依事实的原则"
        self.view.addSubview(myLabel)
        myLabel.snp.makeConstraints { (maker) in
            maker.center.equalTo(self.view)
        }
        myLabel.sizeToFit()//渲染视图需要时间
        let deadline = DispatchTime.now() + 0.3
        DispatchQueue.main.asyncAfter(deadline: deadline) {//在主线程执行
            print(myLabel.frame)//延迟后才能打印出渲染后的坐标
        }
    }
    
    //一些基础用法
    func test2() {
        let myLabel = UILabel()
        myLabel.backgroundColor = UIColor.purple
        myLabel.text = "本着依法依规依事实的原则，相关部门对权健公司涉嫌传销犯罪和涉嫌虚假广告犯罪进行立案侦查"
        self.view.addSubview(myLabel)
        myLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view).offset(-10)
            make.right.equalTo(self.view).offset(-10)
            make.left.equalTo(self.view).offset(10)
            make.height.equalTo(90)
        }
        
//        myLabel.font = UIFont.systemFont(ofSize: 16)//字体大小
        myLabel.font = UIFont.boldSystemFont(ofSize: 16)//加粗类型
//        myLabel.font = UIFont.italicSystemFont(ofSize: 16) //斜体类型
//        myLabel.font = UIFont.fontNames(forFamilyName: "")[0]
        myLabel.textAlignment = .left//字体靠左 居中 靠右
        myLabel.numberOfLines = 0//最多显示行数, 0代表显示无穷多行
//        myLabel.adjustsFontSizeToFitWidth = true //根据文本框 自动调整字体大小
//        myLabel.shadowColor = UIColor.gray//label阴影颜色【要设置偏移位置】(字体的阴影颜色)
//        myLabel.shadowOffset = CGSize(width: 3, height: 3)//label阴影偏移位置
    }

    //可以计算加载文字后label的高度
    func test() {
        let article = "自“权健事件”联合调查组进驻以来，经过调查取证，事件处理工作取得了阶段性进展。本着依法依规依事实的原则，相关部门对权健公司涉嫌传销犯罪和涉嫌虚假广告犯罪进行立案侦查。据联合调查组介绍，经前期工作发现，权健公司在经营活动中，涉嫌传销犯罪和涉嫌虚假广告犯罪，公安机关已于2019年1月1日依法对其涉嫌犯罪行为立案侦查。同时，相关部门依法查处取缔不符合消防安全规定的火疗养生场所、开展集中打击清理整顿保健品乱象专项行动。"
        myLabel.text = article
        myLabel.sizeToFit()
        
        let testLabel = UILabel.init()
        view.addSubview(testLabel)
        testLabel.snp.makeConstraints { (make) in
            make.top.equalTo(myLabel.snp.bottom).offset(10)
            make.right.equalTo(self.view).offset(-10)
            make.left.equalTo(self.view).offset(10)
        }
        testLabel.backgroundColor = UIColor.orange
        testLabel.font = UIFont.systemFont(ofSize: 14)
        testLabel.text = article
        testLabel.textAlignment = .left//字体靠左 居中 靠右
        testLabel.numberOfLines = 0
        testLabel.sizeToFit()
        let labelHeight = testLabel.frame.height
        print(labelHeight)
    }

}
