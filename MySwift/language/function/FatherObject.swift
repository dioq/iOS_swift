//
//  FatherObject.swift
//  Swift_Info
//
//  Created by hello on 2019/2/1.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class FatherObject: NSObject {
    
    func testFunc(param1:Int, param2:Int) -> Int {
        print("here:FatherObject")
        return param1 + param2
    }
    
}
