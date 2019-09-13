//
//  Date+Extension.swift
//  DemoSwift
//
//  Created by yaoxinpan on 2018/6/7.
//  Copyright © 2018年 yaoxp. All rights reserved.
//

import Foundation

extension Date{
    /*
     几年几月 这个月有多少天
     */
    static func getDaysInMonth( year: Int, month: Int) -> Int{
        let calendar = Calendar.current
        
        var startComps = DateComponents()
        startComps.day = 1
        startComps.month = month
        startComps.year = year
        
        var endComps = DateComponents()
        endComps.day = 1
        endComps.month = month == 12 ? 1 : month + 1
        endComps.year = month == 12 ? year + 1 : year
        
        let startDate = calendar.date(from: startComps as DateComponents)
        let endDate = calendar.date(from:endComps as DateComponents)!
        
        let diff = calendar.dateComponents([.day], from: startDate!, to: endDate)
        
        return diff.day!
    }
    
    /*
     几年几月 这个月的第一天是星期几
     */
    static func firstWeekdayInMonth(year: Int, month: Int)->Int{
        let calender = Calendar.current
        var startComps = DateComponents()
        startComps.day = 1
        startComps.month = month
        startComps.year = year
        let startDate = calender.date(from: startComps as DateComponents)
        let firstWeekday = calender.ordinality(of: .weekday, in: .weekOfMonth, for: startDate!)
        let week = firstWeekday! - 1
        
        return week
    }
    
    
    static func dayOfWeek() -> Int {//今天是星期几
        let interval = Date().timeIntervalSince1970
        let days = Int(interval / 86400)// 24*60*60
        return (days - 3) % 7
    }
    static func getCurrentDay() ->Int { //今天是几日
        let com = self.getComponents()
        return com.day!
    }
    static func getCurrentMonth() ->Int {//这个月是几月
        let com = self.getComponents()
        return com.month!
    }
    
    static func getCurrentYear() ->Int {//这个月是哪一年
        let com = self.getComponents()
        return com.year!
    }
    
    private static func getComponents()->DateComponents{
        let calendar = Calendar.current
        //这里注意 swift要用[,]这样方式写
        let com = calendar.dateComponents([.year,.month,.day,.hour,.minute], from:Date())
        return com
    }
}
