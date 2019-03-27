//
//  FilterView.swift
//  YiboGameIos
//
//  Created by William on 2018/10/17.
//  Copyright © 2018年 com.lvwenhan. All rights reserved.
//

import UIKit

class FilterView: UIView {
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var startTime: UIButton!
    @IBOutlet weak var endTime: UIButton!
    @IBOutlet weak var sureBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    var startTimeValueClousure:((_ text:String)->Void)?
    var endTimeValueClousure:((_ text:String)->Void)?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        startTime.addTarget(self, action: #selector(startAction), for: .touchUpInside)
        endTime.addTarget(self, action: #selector(endAction), for: .touchUpInside)
    }
    
    @objc func startAction() {
        if self.startTimeValueClousure != nil {
            self.startTimeValueClousure!("startAction")
        }
    }
    
    @objc func endAction() {
        if self.endTimeValueClousure != nil {
            self.endTimeValueClousure!("endAction")
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        //        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
