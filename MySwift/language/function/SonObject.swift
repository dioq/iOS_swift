//
//  AObject.swift
//  Swift_Info
//
//  Created by hello on 2019/2/1.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class SonObject: FatherObject {
    
    //重写后父类中testFunc这个方法就不再调用了
    override func testFunc(param1: Int, param2: Int) -> Int {
        print("here:AObject")
        return param1 * param2
    }
    
}
