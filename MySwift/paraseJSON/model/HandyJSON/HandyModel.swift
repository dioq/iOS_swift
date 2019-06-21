//
//  HandyModel.swift
//  Swift_Info
//
//  Created by lzd_free on 2018/12/15.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit
import HandyJSON

class HandyModel: HandyJSON {
    var code:Int!
    var msg:String!
    var data:[Handy2Model]!
    
    required init(){}
}
