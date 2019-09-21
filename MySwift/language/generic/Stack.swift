//
//  Stack.swift
//  MySwift
//
//  Created by hello on 2019/9/21.
//  Copyright © 2019 Dio. All rights reserved.
//

import Foundation

// 再定义一个泛型类型的栈，从泛型的栈中可以看出泛型类型
struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(item:Element){
        items.append(item)
    }
    mutating func pop() -> Element{
        return items.removeLast()
    }
}
