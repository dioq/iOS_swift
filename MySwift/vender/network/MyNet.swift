//
//  MyNet.swift
//  MySwift
//
//  Created by lzd_free on 2020/12/21.
//  Copyright © 2020 Dio. All rights reserved.
//

import Foundation
import Alamofire

class MyNet {
    private static var instance:MyNet?
    private init(){}
    
    public static func shareManager() -> MyNet {
        if instance == nil {
            instance = MyNet()
        }
        return instance!
    }
    
    private let sharedSessionManager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30 //设置超时时间
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
    //Get 请求
    func doGet(urlString:String, headers:Dictionary<String, String>? = nil, success:@escaping(_ responseObject:String) -> Void, failure:@escaping(_ error:Error) -> Void) {
        
        sharedSessionManager.request(urlString, method:.get, encoding:JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            switch response.result{
            case .success:
                if let value = response.result.value {
                    //先将json对象转换成data
                    let data = try? JSONSerialization.data(withJSONObject: value, options: [])
                    //再将data转换成字符串
                    let resultStr = String(data: data!, encoding: String.Encoding.utf8)
                    success(resultStr!)
                }
            case .failure(let error):
                failure(error)
            }
            
        }
    }
    
    //Post 请求
    func doPost(urlString:String, parameters:Dictionary<String, Any>?, headers:Dictionary<String, String>? = nil, success:@escaping(_ responseObject:String) -> Void, failure:@escaping(_ error:Error) -> Void) {
        
        sharedSessionManager.request(urlString, method:.post, parameters:parameters, encoding:JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            switch response.result{
            case .success:
                if let value = response.result.value {
                    //                    print("type:", type(of: value))
                    //先将json对象转换成data
                    let data = try? JSONSerialization.data(withJSONObject: value, options: [])
                    //再将data转换成字符串
                    let resultStr = String(data: data!, encoding: String.Encoding.utf8)
                    success(resultStr!)
                }
            case .failure(let error):
                failure(error)
            }
            
        }
    }
    
    
    /*
     form-data 表单提交
     form-data 表单里的 value类型 只有两种 Text 和 File
     这里所有的类型都是Text
     **/
    func submitFormdata(urlStr:String, parameters:Dictionary<String, String>, headers:Dictionary<String, String>? = nil, success:@escaping(_ responseObject:String) -> Void, failure:@escaping(_ error:Error) -> Void) {
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            for item in parameters.keys{
                if let value:String = parameters[item] {
                    multipartFormData.append(value.data(using: .utf8)!, withName: item)
                }
            }
            
        },to: urlStr, headers:headers,encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                //连接服务器成功后，对json的处理
                upload.responseJSON { response in
                    if let result = response.result.value {
                        //先将json对象转换成data
                        let data = try? JSONSerialization.data(withJSONObject: result, options: [])
                        //再将data转换成字符串
                        let jsonStr = String(data: data!, encoding: String.Encoding.utf8)
                        success(jsonStr!)
                    }
                }
            case .failure(let error):
                //打印连接失败原因
                failure(error)
            }
        })
        
    }
    
    
    /*
     上传图片
     form-data 表单提交
     form-data 表单里的 value类型 只有两种 Text 和 File
     这里所有的类型都是File 并且 File是图片,实现了图片上传的功能
     **/
    func uploadImages(urlString:String, header:Dictionary<String, String>? = nil, images:Array<UIImage>, withName:String = "file" ,fileName:String, mimeType:String = "image/*",success:@escaping(_ responseObject:String) -> Void, failure:@escaping(_ error:Error) -> Void) {
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            //采用post表单上传
            // 参数解释：
            //withName:和后台服务器的name要一致 ；fileName:可以充分利用写成用户的id，但是格式要写对； mimeType：规定的，要上传其他格式可以自行百度查一下
            //            multipartFormData.append(imageData, withName: "fileName", fileName: "article\(userID).jpeg", mimeType: "image/jpeg")
            
            //如果需要上传多个文件,就多添加几个
            //multipartFormData.append(imageData, withName: "file", fileName: "123456.jpg", mimeType: "image/jpeg")
            //......
            
            for image in images {
                let imageData = UIImage.jpegData(image)(compressionQuality: 1.0)!
                multipartFormData.append(imageData, withName: withName, fileName: fileName, mimeType: mimeType)
            }
            
        },to: urlString, headers:header,encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                //连接服务器成功后，对json的处理
                upload.responseJSON { response in
                    if let result = response.result.value {
                        //先将json对象转换成data
                        let data = try? JSONSerialization.data(withJSONObject: result, options: [])
                        //再将data转换成字符串
                        let jsonStr = String(data: data!, encoding: String.Encoding.utf8)
                        success(jsonStr!)
                    }
                }
                //获取上传进度
                upload.uploadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                    print("图片上传进度: \(progress.fractionCompleted)")
                }
            case .failure(let error):
                //打印连接失败原因
                failure(error)
            }
        })
    }
}
