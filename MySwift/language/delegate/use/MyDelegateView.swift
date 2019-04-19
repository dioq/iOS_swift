//
//  MyView.swift
//  Delegate
//
//  Created by William on 2018/7/16.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

protocol DelegateName:NSObjectProtocol {
    //设置协议方法
    func mymethod(str:String)
}

class MyDelegateView: UIView {
    //指定协议对象
    weak var delegate:DelegateName?
    weak var myDelegate:TestProtocol?
    
    var btn:UIButton?
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViews() {
        btn = UIButton()
        self.addSubview(btn!)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.btn?.frame = CGRect(x: 30, y: 50, width: 150, height: 50)
        self.btn?.setTitle("touchDelegate", for: .normal)
        self.btn?.backgroundColor = UIColor.blue
        btn?.addTarget(self, action: #selector(clickHere), for: .touchUpInside)
    }
    
    @objc func clickHere(){
        print("MyView内部:click here!!")
        //执行协议
        delegate?.mymethod(str: "sendValue")
        if myDelegate != nil {
            myDelegate?.testMethod(str: "单独的Protocol文件")
        }
    }

}
