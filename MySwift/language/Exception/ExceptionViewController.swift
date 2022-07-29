//
//  ExceptionViewController.swift
//  MySwift
//
//  Created by Dio Brand on 2022/7/30.
//  Copyright © 2022 Dio. All rights reserved.
//

import UIKit

enum RequestError : Error { //注意Swift的所有异常类型都继承于Error。
    case netError
    case serviceError
    case missingParameter(parameter: String)
    case isnil
}

enum DAOError : Error {
    case NoData
}

class ExceptionViewController: UIViewController {
    
    var type:Int = 0
    var listData:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func throwErrors() throws -> String {//（在可能会抛出异常的函数声明时必须加上关键字throws）
        type += 1
        if type == 1 {
            throw RequestError.netError //(函数内部通过throw来抛出自定义Error)
        }else if type == 2 {
            throw RequestError.serviceError
        }else if type == 3 {
            throw RequestError.missingParameter(parameter: "password")
        }
        type = 0
        return "success"
    }
    
    @IBAction func handle(_ sender: UIButton) {
        /*
         注意：如果try语句抛出异常则会跳出do代码块，并按顺序逐个catch，当一个catch捕获成功后，后面的catch不再执行。
         **/
        do {
            let ret = try throwErrors()
            print("ret = \(ret)")
        } catch {
            switch error {//这里要特别说明一下swift的error是异常,与OC中的NSError不是一回事,与OC中的NSException相似
            case RequestError.netError :
                print("是网络错误")
            case RequestError.serviceError :
                print("是服务端错误")
            default:
                print("缺少参数")
            }
        }
    }
    
    // 查询所有数据方法
    func findAll() throws -> [String] {
        guard listData.count > 0 else {
            // 抛出"没有数据"错误。
            throw DAOError.NoData
        }
        return listData
    }
    
    @IBAction func tryFunc(_ sender: UIButton) {
        /*
         try?会将错误转换为可选值，当调用try?＋函数或方法语句时候，如果函数或方法抛出错误，程序不会发崩溃，而返回一个nil，如果没有抛出错误则返回可选值。
         **/
        guard let datas  = try? findAll() else {
            print("datas is nil")
            return
        }
        print(datas)
    }
    
    
    func printNotes() {
        /*
         使用try!可以打破错误传播链条。
         错误抛出后传播给它的调用者，这样就形成了一个传播链条，但有的时候确实不想让错误传播下去，可以使用try!语句。
         
         代码printNotes()函数没有声明抛出错误，在调用它的时候不需要try关键字，错误传播链条在printNotes()函数内被打破了。
         代码将try findAll()语句改为try!findAll()，
         在try后面加了感叹号（!），这样编译器就不会要求printNotes()方法声明抛出错误了，
         try!打破了错误传播链条，但是如果真的发生错误就出现运行期错误，导致程序的崩溃。
         所以使用try!打破错误传播链条时，应该确保程序不会发生错误。
         **/
        let datas  = try! findAll()
        for item in datas {
            print("value : \(item)")
        }
    }
    
    @IBAction func tryFunc2(_ sender: UIButton) {
        printNotes()
    }
    
}
