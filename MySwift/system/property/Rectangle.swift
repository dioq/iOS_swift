//
//  Rectangle.swift
//  MySwift
//
//  Created by hello on 2019/10/4.
//  Copyright © 2019 Dio. All rights reserved.
//

import Foundation

struct Point {
    var x = 0.0
    var y = 0.0
}
struct Size {
    var width = 0.0
    var height = 0.0
}
class Rectangle{
    //存储型数据
    var originPoint  = Point()
    var size = Size()
    
    //计算型属性
    var center:Point{
        //get方法：获取计算属性值
        get{
            let center_x = originPoint.x + size.width/2
            let center_y = originPoint.y + size.height/2
            return Point(x: center_x, y: center_y)
        }
        
        //如果没有set方法，是只读，
        /*
         set(newCenter){
            originPoint.x = newCenter.x - size.width/2
            originPoint.y = newCenter.y - size.height/2
         }
         */
        
        //set方法：设置计算属性新值
        //这里也可以省略括号和newCenter.使用newValue
        set{
            originPoint.x = newValue.x - size.width/2
            originPoint.y = newValue.y - size.height/2
        }
    }
    
    //计算属性：area属性只有get,可以不显式的声明出get；此属性为只读属性
    var area:Double{
        return size.width * size.height
    }
    
    init(origin: Point, size: Size){
        self.originPoint  = origin
        self.size  = size
    }
}
