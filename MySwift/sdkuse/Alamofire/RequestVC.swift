//
//  RequestVC.swift
//  Swift_SDK
//
//  Created by William on 2018/8/21.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit
import Alamofire

class RequestVC: UIViewController {
    
    var dataArray = Array<Value>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func action01(_ sender: UIButton) {
        //http://slavex.3dabuliu.com/bbs/game/撸圈八卦/1/20/getList
        Alamofire.request("http://127.0.0.1/project01/mysql.php", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            print("response.request:\n",response.request!)  // original URL request
            print("response.response:\n",response.response!) // URL response
            print("response.data:\n",response.data!)     // server data
            print("response.result\n",response.result)   // result of response serialization
            print("===================================== 以上为请求信息==========================================")
            
            if(response.error == nil){
                print("请求成功")
                //使用HandyJSON解析
                if let result = response.result.value {
                    //先将json对象转换成data
                    let data = try? JSONSerialization.data(withJSONObject: result, options: [])
                    //再将data转换成字符串
                    let jsonStr = String(data: data!, encoding: String.Encoding.utf8)
                    //HandyJSON 再解析字符串
                    let result3 = Model.deserialize(from: jsonStr)
                    for item in (result3?.content)! {
                        self.dataArray.append(item)
                    }
                }
                
//                if let JSON = response.result.value {
//                    self.handerJSON(json: JSON)
//                }
            }else{
                print("请求失败:\n\(response.error!)")
            }
        }
    }
    
    func handerJSON(json:Any) { //自己手动解析
        let dict = json as! Dictionary<String, Any>
        let arr = dict["content"] as! NSArray
        for item1 in arr {
            let item = item1 as! Dictionary<String, Any>
//            print("firstname:",item["firstname"]!, "lastname:",item["lastname"]!, "email:",item["email"]!)
            let value = Value()
            value.firstname = item["firstname"]! as? String
            value.lastname = item["lastname"]! as? String
            value.email = item["email"]! as? String
            dataArray.append(value)
        }
    }
    
    @IBAction func showresutl(_ sender: UIButton) {
        for model in dataArray {
            print("firstname:",model.firstname!, "lastname:",model.lastname!, "email:",model.email!)
        }
    }
    
    
    @IBAction func TestGoAPI(_ sender: UIButton) {
        //JSONEncoding.default 传过去的参数格式是json串
        let num = arc4random() % 1000
        let parameters:Dictionary<String, String> = ["username":"Jim\(num)","passwords":"baba"]
        Alamofire.request("http://127.0.0.1:10000/register", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            print(parameters)
            if(response.error == nil){
                print("请求成功")
                print("response.request:\n",response.request!)  // original URL request
                print("response.response:\n",response.response!) // URL response
                print("response.data:\n",response.data!)     // server data
                print("response.result\n",response.result)   // result of response serialization
                print("response.connection\n",response.description)   // result of response serialization
                print("===================================== 以上为请求信息==========================================")
            }else{
                print("请求失败:\n\(response.error!)")
            }
        }
    }

}
