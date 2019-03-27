//
//  SnapKitVC.swift
//  Swift_SDK
//
//  Created by William on 2018/9/26.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit
import SnapKit

class SnapKitVC: UIViewController {
    
    var myview:UIView!
    var isChange = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        myfunc01()
//        myfunc2()
        myfunc3()
    }
    
    func myfunc3() {
        let v1 = UIView()
        v1.backgroundColor = UIColor.red
        view.addSubview(v1)
        v1.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(30)
            make.top.equalTo(self.view).offset(100)
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        let v2 = UIView()
        v2.backgroundColor = UIColor.orange
        view.addSubview(v2)
        v2.snp.makeConstraints { (make) in
            /** 不指定距离内边距还是外边距 默认是距内框距离, 上下两种写法功能相同**/
            make.top.equalTo(v1).offset(5)
//            make.top.equalTo(v1.snp.top).offset(5)
            make.left.equalTo(v1).offset(8)
//            make.left.equalTo(v1.snp.left).offset(8)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        let v3 = UIView()
        v3.backgroundColor = UIColor.yellow
        view.addSubview(v3)
        v3.snp.makeConstraints { (make) in
            make.top.equalTo(v1.snp.bottom).offset(5)
            make.left.equalTo(v1.snp.right).offset(8)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
    
    /**************** 分割线 *****************/
    func myfunc2() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.action, target: self, action: #selector(rightTopBtn))
        
        myview = UIView()
        myview.backgroundColor = UIColor.red
        view.addSubview(myview)
        myview.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(100)
            make.left.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
            make.height.equalTo(130)
        }
    }
    
    //更新约束
    @objc func rightTopBtn(){
        if isChange {
            myview.snp.updateConstraints { (make) in
                make.top.equalTo(self.view).offset(230)
//                make.left.equalTo(self.view).offset(0)
//                make.right.equalTo(self.view).offset(0)
//                make.height.equalTo(130)
            }
        }else {
            myview.snp.updateConstraints { (make) in
                make.top.equalTo(self.view).offset(100)
//                make.left.equalTo(self.view).offset(0)
//                make.right.equalTo(self.view).offset(0)
//                make.height.equalTo(130)
            }
        }
        isChange = !isChange
    }
    
    /**************** 分割线 *****************/
    func myfunc01() {
        let view1 = UIView()
        view1.backgroundColor = UIColor.green
        self.view.addSubview(view1)
        view1.snp.makeConstraints { (make) in
            //距self.view的上边80
            make.top.equalTo(self.view).offset(80)
            //距self.view的左边30
            make.left.equalTo(self.view).offset(30)
            //距self.view的右边30（右边数字前要加减号,不然会变成超出右边30）
            make.right.equalTo(self.view).offset(-30)
            //距self.view的下边50（下边数字前要加减号,不然会变成超出下边50）
            make.bottom.equalTo(self.view).offset(-50)
        }
        
        func02(view1: view1)
    }
    
    func func02(view1:UIView) {
        let view2 = UIView()
        view2.backgroundColor = UIColor.brown
        self.view.addSubview(view2)
        view2.snp.makeConstraints { (make) in
            //距view1的上边50
            make.top.equalTo(view1).offset(50)
            //距view1的左边50
            make.left.equalTo(view1).offset(50)
            //设置长为100
            make.width.equalTo(100)
            //设置高为60
            make.height.equalTo(60)
       }
        func03(view1: view1, view2: view2)
    }
    
    func func03(view1:UIView, view2:UIView) {
        let view3 = UIView()
        view3.backgroundColor = UIColor.blue
        self.view.addSubview(view3)
        view3.snp.makeConstraints { (make) in
           //中心x坐标等于view1
            make.centerX.equalTo(view1)
            //中心y坐标等于view1(横和纵都相等就等于对view1居中)
            make.centerY.equalTo(view1)
            //长等于view2的2倍
            make.width.equalTo(view2).multipliedBy(2)
            //高等于view2的3分之一
            make.height.equalTo(view2).dividedBy(3)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
