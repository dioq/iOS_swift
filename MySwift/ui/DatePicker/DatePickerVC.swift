//
//  DatePickerVC.swift
//  Swift_UI
//
//  Created by William on 2018/10/17.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class DatePickerVC: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    @IBOutlet weak var myTextField: UITextField!
    /// 日期选择器
    var datePicker = UIDatePicker()
    
    @IBOutlet weak var buttonYMDHM: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myDatePicker.addTarget(self, action: #selector(chooseDate(datePicker:)), for:UIControl.Event.valueChanged)
        
        myTextField.layer.cornerRadius = 5.0
        myTextField.layer.borderWidth = 0.7
        myTextField.layer.borderColor = UIColor.darkGray.cgColor
        myTextField.textAlignment = .center
        myTextField.placeholder = "这是一个UITextField"
        
        // MARK: - 日期选择器属性及样式
        datePicker.locale = NSLocale(localeIdentifier: "zh_cn") as Locale
        datePicker.timeZone = NSTimeZone.system
        datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        datePicker.addTarget(self, action: #selector(getDate(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.layer.backgroundColor = UIColor.white.cgColor
        datePicker.layer.masksToBounds = true
        
        // MARK: - 重点的一句
        myTextField.inputView = datePicker
        
        self.view.addSubview(myTextField)
        
        buttonYMDHM.addTarget(self, action: #selector(outDate), for: UIControl.Event.touchUpInside)
    }

    /**
     获取选择的时间
     */
    @objc func chooseDate(datePicker:UIDatePicker) {
        let  chooseDate = datePicker.date
        let  dateFormater = DateFormatter.init()
        dateFormater.dateFormat = "YYYY-MM-dd HH:mm:ss"
        print(dateFormater.string(from: chooseDate))
    }
    
    
    // MARK: - 日期选择器选择处理方法
   @objc func getDate(datePicker: UIDatePicker) {
        let formatter = DateFormatter()
        let date = datePicker.date
        formatter.dateFormat = "MM月dd日 HH:mm"
        let dateStr = formatter.string(from: date)
        myTextField.text = dateStr
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myTextField.resignFirstResponder()
    }
    
    
    @objc func outDate() {
        let dateFormatter = "yyyy-MM-dd HH:mm"
        
        let datePicker = DatePickerView.datePicker(style: .yearMonthDayHourMinute, scrollToDate: Date()) { date in
            guard let date = date else { return }
            
            let dateStr = date.toString(dateFormatter)
            self.buttonYMDHM.setTitle(dateStr, for: .normal)
        }
        
        let date = Date.date(buttonYMDHM.currentTitle!, formatter: dateFormatter)
        
        if let date = Date.date("2000-01-01 00:00", formatter: dateFormatter) {
            datePicker.minLimitDate = date
        }
        
        if let date = Date.date("2050-01-05 18:18", formatter: dateFormatter) {
            datePicker.maxLimitDate = date
        }
        
        datePicker.scrollToDate = date == nil ? Date() : date!
        
        datePicker.show()
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
