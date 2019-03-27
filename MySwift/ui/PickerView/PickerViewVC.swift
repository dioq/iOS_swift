//
//  PickerViewVC.swift
//  Swift_UI
//
//  Created by William on 2018/10/21.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class PickerViewVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var myPickerView: UIPickerView!
    
    let colors = [["Red","Yellow","Green","Blue"],["a","b","c","d","e"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPickerView.delegate = self
        myPickerView.dataSource = self
        
        // 设置选择框的默认值
        myPickerView.selectRow(1, inComponent: 0, animated: true)
        myPickerView.selectRow(1, inComponent: 1, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {//返回多少列
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //每一列多少行
        return colors[component].count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //赋值
        return colors[component][row]
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        //每行多高
        return 40
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        // 每列多宽
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //选中所执行的方法
        print("row",row,"\tcomponent",component)
        print(colors[component][row])
        switch component {
        case 0:
            print(colors[component][row])
            break
        case 1:
            print(colors[component][row])
            break
        default:
            print("error")
        }
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
