//
//  WriteBoardView.swift
//  Swift_Info
//
//  Created by hello on 2018/12/13.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class WriteBoardView: UIView {

    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
}
