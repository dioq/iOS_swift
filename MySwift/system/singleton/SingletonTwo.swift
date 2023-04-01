//
//  SingletonTwo.swift
//  Swift_Info
//
//  Created by hello on 2019/3/20.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

//全局的常量
let singleton = SingletonTwo()

class SingletonTwo {
    static var shareSingletonTwo: SingletonTwo {
        return singleton
    }
}
