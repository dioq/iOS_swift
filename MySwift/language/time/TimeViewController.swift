//
//  TimeViewController.swift
//  Swift_stu
//
//  Created by William on 2018/8/3.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showMyDateFunciton()
    }
    
    //Date扩展的一些用法
    func showMyDateFunciton(){
        let whichweekday2 = Date.getCurrentDay()
        print("今天是\(whichweekday2)日")
        let whichMonth = Date.getCurrentMonth()
        print("这个月是\(whichMonth)月")
        let whichYear = Date.getCurrentYear()
        print("今年是\(whichYear)年")
        let days = Date.getDaysInMonth(year: whichYear, month: whichMonth)
        print("这个月有\(days)天")
        let whichweekday = Date.firstWeekdayInMonth(year: whichYear, month: whichMonth)
        print("这个月的第一天是星期\(whichweekday)")
    }
    
    //时间戳转Date
    @IBAction func action4(_ sender: UIButton) {
        let timestamp = 1534695129535
        let timeSta:TimeInterval = TimeInterval(timestamp / 1000)
        let d1 = Date(timeIntervalSince1970: timeSta)
        print(d1)
        
        //再转成string
        //设置时区
        let timeZone = TimeZone.init(identifier: "GTM")
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // "dd"(只要天)
        let d2 = formatter.string(from: d1)
        print(d2)
    }
    
    //Date转String
    @IBAction func action02(_ sender: UIButton) {
        let date = Date()
        print(date)
        //设置时区
        let timeZone = TimeZone.init(identifier: "GTM")
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // "dd"(只要天)
        let d2 = formatter.string(from: date)
        print(d2)
    }
    
    //字符串转时期
    @IBAction func action03(_ sender: UIButton) {        
        let string = "2018-07-02 03:03:03"
        let timeZone = TimeZone.init(identifier: "Asia/Shanghai")//时区
        let dateFormatter = DateFormatter.init()
        dateFormatter.timeZone = timeZone//时区
        dateFormatter.locale = Locale.init(identifier: "zh_CN")//时区
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"//格式
        let date = dateFormatter.date(from: string)
        print(date!)
    }
    
    //当前时间的时间戳
    @IBAction func action01(_ sender: UIButton) {
        //获取当前时间
        let now = Date()
        //当前时间的时间戳
        let timeInterval:TimeInterval = now.timeIntervalSince1970  //秒级
        print("当前时间的时间戳(秒级)  :\(timeInterval)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
