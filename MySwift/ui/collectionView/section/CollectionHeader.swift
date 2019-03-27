//
//  CollectionHeader.swift
//  Swift_Info
//
//  Created by hello on 2018/12/26.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class CollectionHeader: UICollectionReusableView {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var contentLB: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
}
