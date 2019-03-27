//
//  SelectedCell.swift
//  Swift_Info
//
//  Created by hello on 2019/1/25.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class SelectedCell: UITableViewCell {

    @IBOutlet weak var myTitleLB: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
