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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myDatePicker.addTarget(self, action: #selector(chooseDate(datePicker:)), for:UIControl.Event.valueChanged)
        
        
        myTextField.layer.cornerRadius = 5.0
        myTextField.layer.borderWidth = 0.7
        myTextField.layer.borderColor = UIColor.darkGray.cgColor
        myTextField.textAlignment = .center
        myTextField.placeholder = "这是一个UITextField"
        self.view.addSubview(myTextField)
        
        /// 日期选择器
        let datePicker = UIDatePicker()
        // MARK: - 日期选择器属性及样式
        datePicker.locale = NSLocale(localeIdentifier: "zh_cn") as Locale
        datePicker.timeZone = NSTimeZone.system
        datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        datePicker.addTarget(self, action: #selector(getDate(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.layer.backgroundColor = UIColor.white.cgColor
        datePicker.layer.masksToBounds = true
        
        // MARK: - 重点的一句
        myTextField.inputView = datePicker
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
    
}
