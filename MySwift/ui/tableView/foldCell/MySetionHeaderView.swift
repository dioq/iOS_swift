//
//  SetionHeaderView.swift
//  TestDemo
//
//  Created by Geek on 2019/12/24.
//  Copyright © 2019 Geek. All rights reserved.
//

import UIKit

protocol OpenDelegate:NSObjectProtocol {
    //设置协议方法
    func openWhichOne(index: Int)
}

class MySetionHeaderView: UIView {
    
    @IBOutlet weak var sectionTitleLabel: UILabel!
    @IBOutlet weak var openBtn: UIButton!
    weak var openSectionDelegate:OpenDelegate?
    
    var sectionTitle: String!
    var section: Int = 0
    var isOpen = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if sectionTitle != nil {
            self.sectionTitleLabel.text = sectionTitle
        }
        
        var imageName:String?
        if isOpen {
            imageName = "arrow_up"
        }else {
            imageName = "arrow_down"
        }
        let imageBg = UIImage.init(named: imageName!)
        openBtn.setBackgroundImage(imageBg!, for: .normal)
    }
    
    
    @IBAction func openAction(_ sender: UIButton) {
        if openSectionDelegate != nil {
            openSectionDelegate?.openWhichOne(index: section)
        }
    }
    
}
