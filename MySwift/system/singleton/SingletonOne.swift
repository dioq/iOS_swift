//
//  SingletonOne.swift
//  Swift_Info
//
//  Created by hello on 2019/3/20.
//  Copyright © 2019 William. All rights reserved.
//

import Foundation

//一句话搞定，静态常理。所有地方用到的都是同一个
class SingletonOne {
    static let shareSingletonOne = SingletonOne()
    private init() {}
}
