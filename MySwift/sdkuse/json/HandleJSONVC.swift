//
//  HandleJSONVC.swift
//  Swift_Info
//
//  Created by lzd_free on 2018/12/15.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit
import SwiftyJSON

class HandleJSONVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    let indentifier = "SwiftCell"
    var dataArray = ["json字符串转换成json数据","手动解析json数据","使用SwiftyJSON工具","使用HandyJSON工具"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        myTableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: indentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifier, for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            parseData()
        case 1:
            parseDataMyself()
        case 2:
            parseData3()
        case 3:
            parseData4()
        default:
            print("error")
        }
    }
    
    //json字符串转换成json数据
    func parseData() {
        let jsonString = "{\"name\":\"wall\",\"age\":\"22\",\"hobby\":\"ball\"}"
        print(type(of: jsonString))
        //将sting转Data
        let jsonData = jsonString.data(using: String.Encoding.utf8, allowLossyConversion: true)
        print(type(of: jsonData))
        //将Data转Any
        let json = try? JSONSerialization.jsonObject(with: jsonData!, options: .mutableContainers)
        print(type(of: json))
        print(json!)
    }
    
    //手动解析json数据
    func parseDataMyself() {
        let path = Bundle.main.path(forResource: "test", ofType: "json")
        //        print("path:\n",path!)
        let jsonData = NSData(contentsOfFile: path!)
        let json = try? JSONSerialization.jsonObject(with: jsonData! as Data, options: .allowFragments)
        print(type(of: json))
        let dict = json as! Dictionary<String, Any> //转化成字典
        let dataArr = dict["data"] as! Array<Any>
        /* 工程中存数据,这里以存所有电话信息为例 */
        var dataArray = Array<JsonModel>()
        for item in dataArr {
            let item2 = item as? Dictionary<String, Any>
            let name1 = item2!["name"]
            let age = item2!["age"]
            print(name1!,"\t\(age!)","岁")
            let phones = item2!["phones"] as! Array<Any>
            for item3 in phones {
                let item4 = item3 as! Dictionary<String, Any>
                let name2 = item4["name"]
                let number = item4["number"]
                print("单位:",name2!,"\t电话号:", number!)
                /* 工程中最后总是以Class类的形式存数据 */
                let jsonModel = JsonModel()
                jsonModel.name = name2 as? String
                jsonModel.number = number as? String
                dataArray.append(jsonModel)
            }
            print("==================== 结束了1个人的信息处理 ======================")
        }
        print("=============== 所有电话信息如下 ================")
        for item in dataArray {
            let name2 = item.name!
            let number = item.number!
            print("单位:",name2,"\t电话号:", number)
        }
    }
    
    //使用SwiftyJSON工具
    func parseData3() {
        let path = Bundle.main.path(forResource: "test", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        do {
            //        不用担心数组越界，不用判断节点，拆包什么的，代码如下：
            let json = try JSON(data: data! as Data)
            print(type(of: json))
//            print(json)
            if let number = json["data"][0]["phones"][0]["number"].string {
                //找到电话号码
                print("第一个联系人的第一个电话号码:",number)
            }
            for (index,subJson):(String, JSON) in json["data"] {
                let name1 = subJson["name"]
                let age = subJson["age"]
                print("第\(index)个人\t", name1,"\t\(age)","岁")
                let phones = subJson["phones"]
                for (index2, subJson2):(String, JSON) in phones {
                    let name2 = subJson2["name"]
                    let number = subJson2["number"]
                    print("第\(index2)个联系人\t 单位:",name2,"\t电话号:", number)
                }
                print("==================== 结束了\(index)个人的信息处理 ======================")
            }
        } catch  {
            print("error:\t",error)
        }
    }
    
    //使用HandyJSON工具
    func parseData4() {
        let path = Bundle.main.path(forResource: "test", ofType: "json")
        let jsonData = NSData(contentsOfFile: path!)
        print(type(of: jsonData))
        //再将Data转换成字符串
        let jsonString = String(data: jsonData! as Data, encoding: String.Encoding.utf8)
        print(type(of: jsonString))
        //HandyJSON 再解析字符串
        let handyModel = HandyModel.deserialize(from: jsonString!)
        let handy2ModelArr:Array<Handy2Model> = (handyModel?.data)!
        for item in handy2ModelArr {
            let name1 = item.name!
            let age = item.age!
            print(name1,"\t\(age)","岁")
            let handy3ModelArr:Array<Handy3Model> = item.phones
            for item2 in handy3ModelArr {
                let name2 = item2.name!
                let number = item2.number!
                print("单位:",name2,"\t电话号:", number)
            }
            print("==================== 结束了1人的信息处理 ======================")
        }
    }

}
