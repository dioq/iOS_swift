//
//  TestModel.swift
//  Swift_Info
//
//  Created by hello on 2018/12/13.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class TestModel: NSObject {
    
    var imageName:String!
    var text:String!
    
    override init() {}
    
    init(imageName:String?, text:String?) {
        if imageName != nil {
            self.imageName = imageName
        }
        if text != nil {
            self.text = text
        }
    }
    
}
