
//
//  Handy2Model.swift
//  Swift_Info
//
//  Created by lzd_free on 2018/12/15.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit
import HandyJSON

class Handy2Model: HandyJSON {
    var name:String!
    var age:Int!
    var phones:Array<Handy3Model>!
    required init(){}
}
