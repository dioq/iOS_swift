//
//  DioNetwork.swift
//  MySwift
//
//  Created by lzd_free on 2020/12/29.
//  Copyright © 2020 Dio. All rights reserved.
//

import UIKit

class NetworkManager {
    private static var instance:NetworkManager?
    private init(){}
    
    public static func shareManager() -> NetworkManager {
        if instance == nil {
            instance = NetworkManager()
        }
        return instance!
    }
    
    private lazy var config:URLSessionConfiguration = {
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type":"application/json"]
        config.timeoutIntervalForRequest = 30
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        return config
    }()
    
    
    // get 请求
    func do_get(urlStr:String, success:@escaping(_ responseObject:String) -> Void, failure:@escaping(_ error:Error) -> Void) {
        let url = URL.init(string: urlStr)
        let request:URLRequest = URLRequest(url: url!)
        let session:URLSession = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if(error != nil){
                failure(error!)
                return
            }
            if let json_str = String(data: data!, encoding: String.Encoding.utf8){
                success(json_str)
            }
        }
        task.resume()//开始执行
    }
    
    // post 参数为 二进制数据
    func do_post_binary(urlStr:String, params:Data, success:@escaping(_ responseObject:String) -> Void, failure:@escaping(_ error:Error) -> Void) {
        let url = URL(string: urlStr)
        var request:URLRequest = URLRequest.init(url: url!)
        // POST
        request.httpMethod = "POST"
        //设置请求体
        request.httpBody = params
        
        let session:URLSession = URLSession(configuration: config)
        let dataTask: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            if(error != nil){
                failure(error!)
                return
            }
            
            if let json_str = String(data: data!, encoding: String.Encoding.utf8){
                success(json_str)
            }
        }
        // 执行任务
        dataTask.resume()
    }
    
    // post 参数为 json
    func do_post(urlStr:String, params:Dictionary<String, Any>, success:@escaping(_ responseObject:String) -> Void, failure:@escaping(_ error:Error) -> Void) {
        //设置请求体
        let param_data = (try? JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.init(rawValue: 0)))!
        do_post_binary(urlStr: urlStr, params: param_data) { responseObject in
            success(responseObject)
        } failure: { error in
            failure(error)
        }
    }
    
    
    /*
     form-data 表单提交
     form-data 表单里的 value类型 只有两种 Text 和 File
     这里所有的类型都是Text
     **/
    // post 参数 form
    func post_form(urlStr:String, params:Dictionary<String, String>, success:@escaping(_ responseObject:String) -> Void, failure:@escaping(_ error:Error) -> Void) {
        let url = URL(string: urlStr)
        var request:URLRequest = URLRequest.init(url: url!)
        // POST
        request.httpMethod = "POST"
        
        var param_str:String = ""
        for (key, value) in params {
            param_str += ("&"+key+"=\(value)")
        }
        param_str = String(param_str.suffix(param_str.count - 1))
        
        let param_data = param_str.data(using: String.Encoding.utf8)!
        //设置请求体
        request.httpBody = param_data
        
        
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        config.timeoutIntervalForRequest = 30
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        let session:URLSession = URLSession(configuration: config)
        let dataTask: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            if(error != nil){
                failure(error!)
                return
            }
            
            if let json_str = String(data: data!, encoding: String.Encoding.utf8){
                success(json_str)
            }
        }
        // 执行任务
        dataTask.resume()
    }
    
    /*
     上传图片
     form-data 表单提交
     form-data 表单里的 value类型 只有两种 Text 和 File
     **/
    func uploadImage(urlStr:String, image:UIImage, name:String = "file" ,fileName:String = "anewname", mimeType:String = "image/*",success:@escaping(_ responseObject:String) -> Void, failure:@escaping(_ error:Error) -> Void) {
        
        let url = URL.init(string: urlStr)
        //创建请求
        var request:URLRequest  = URLRequest(url: url!)
        //修改请求方法为POST
        request.httpMethod = "POST"
        
        let uuid:String = "\(UUID())"
        let boundary = uuid
        let newLine = "\r\n";
        
        
        let contentType = "multipart/form-data; charset=utf-8; boundary=\(boundary)"
        request.addValue(contentType, forHTTPHeaderField: "Content-Type")
        
        var param_data = Data()
        
        param_data += "--\(boundary)".data(using: String.Encoding.utf8)!
        param_data += newLine.data(using: String.Encoding.utf8)!
        
        let content = "Content-Disposition: form-data; name=\(name); filename=\(fileName)"
        param_data += content.data(using: String.Encoding.utf8)!
        param_data += newLine.data(using: String.Encoding.utf8)!
        param_data += newLine.data(using: String.Encoding.utf8)!
        
        let imageData:Data  = UIImage.jpegData(image)(compressionQuality: 1.0)!
        param_data += imageData
        
        param_data += newLine.data(using: String.Encoding.utf8)!
        param_data += "--\(boundary)--".data(using: String.Encoding.utf8)!
        param_data += newLine.data(using: String.Encoding.utf8)!
        
        let session:URLSession = URLSession(configuration: config)
        /*
         第一个参数：请求对象
         第二个参数：需要上传的二进制文件
         data：响应体信息（期望的数据）
         response：响应头信息，主要是对服务器端的描述
         error：错误信息，如果请求失败，则error有值
         */
        let upTask = session.uploadTask(with: request, from: param_data) { (data, response, error) in
            //上传完毕后
            if(error == nil){
                if let param_json_str = String(data: data!, encoding: String.Encoding.utf8){
                    success(param_json_str)
                }
            }else{
                failure(error!)
            }
        }
        upTask.resume()
    }
    
}
