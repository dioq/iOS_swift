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
    func openWhichOn(index: Int)
}

class MySetionHeaderView: UIView {
    
    @IBOutlet weak var sectionTitleLabel: UILabel!
    @IBOutlet weak var openBtn: UIButton!
    weak var openSectionDelegate:OpenDelegate?
    
    var sectionTitle: String!
    var section: Int = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if sectionTitle != nil {
            self.sectionTitleLabel.text = sectionTitle
        }
    }
    
    
    @IBAction func openAction(_ sender: UIButton) {
        if openSectionDelegate != nil {
            openSectionDelegate?.openWhichOn(index: section)
        }
    }
    
}
