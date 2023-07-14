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
    
    
    //Get 请求
    func doGet(urlStr:String, success:@escaping(_ responseObject:String) -> Void, failure:@escaping(_ error:Error) -> Void) {
        
        let url = URL.init(string: urlStr)
        let request:URLRequest = URLRequest(url: url!)
        
        let session:URLSession = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if(error == nil){
                if let param_json_str = String(data: data!, encoding: String.Encoding.utf8){
                    success(param_json_str)
                }
            }else{
                failure(error!)
            }
            
        }
        task.resume()//开始执行
    }
    
    //字典转JSON 字符串
    func dictToJsonStr(dict:Dictionary<String,Any>) -> String {
        let param_data = try? JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.init(rawValue: 0))
        let param_json_str = String(data: param_data!, encoding: String.Encoding.utf8)
        return param_json_str!
    }
    
    //字典转formdata 参数格式
    func dictToFormdataStr(dict:Dictionary<String,Any>) -> String {
        var result:String = ""
        for (key, value) in dict {
            result += ("&"+key+"=\(value)")
        }
        return String(result.suffix(result.count - 1))
    }
    
    //Post 请求
    func doPost(urlStr:String, params:String, success:@escaping(_ responseObject:String) -> Void, failure:@escaping(_ error:Error) -> Void) {
        
        let url = URL(string: urlStr)
        var request:URLRequest = URLRequest.init(url: url!)
        //修改请求方法为POST
        request.httpMethod = "POST"
        //设置请求体
        request.httpBody = params.data(using: String.Encoding.utf8)
        
        let session:URLSession = URLSession(configuration: config)
        let dataTask: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            
            if(error == nil){
                if let param_json_str = String(data: data!, encoding: String.Encoding.utf8){
                    success(param_json_str)
                }
            }else{
                failure(error!)
            }
            
        }
        //.执行任务
        dataTask.resume()
    }
    
    
    /*
     form-data 表单提交
     form-data 表单里的 value类型 只有两种 Text 和 File
     这里所有的类型都是Text
     **/
    func submitFormdata(urlStr:String, params:String, success:@escaping(_ responseObject:String) -> Void, failure:@escaping(_ error:Error) -> Void) {
        
        let url = URL(string: urlStr)
        var request:URLRequest = URLRequest.init(url: url!)
        //修改请求方法为POST
        request.httpMethod = "POST"
        //设置请求体
        request.httpBody = params.data(using: String.Encoding.utf8)
        
        config.httpAdditionalHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        let session:URLSession = URLSession(configuration: config)
        let dataTask: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            
            if(error == nil){
                if let param_json_str = String(data: data!, encoding: String.Encoding.utf8){
                    success(param_json_str)
                }
            }else{
                failure(error!)
            }
            
        }
        //.执行任务
        dataTask.resume()
    }
    
    /*
     上传图片
     form-data 表单提交
     form-data 表单里的 value类型 只有两种 Text 和 File
     **/
    func uploadImage(urlStr:String, image:UIImage, withName:String = "file" ,fileName:String = "anewname", mimeType:String = "image/*",success:@escaping(_ responseObject:String) -> Void, failure:@escaping(_ error:Error) -> Void) {
        
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
        
        let content = "Content-Disposition: form-data; name=\(withName); filename=\(fileName)"
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
    
    
    /*
     上传二进制文件
     **/
    func uploadBinary(urlStr:String, binaryFile:UIImage, success:@escaping(_ responseObject:String) -> Void, failure:@escaping(_ error:Error) -> Void) {
        
        let url = URL.init(string: urlStr)
        //创建请求
        var request:URLRequest  = URLRequest(url: url!)
        //修改请求方法为POST
        request.httpMethod = "POST"
        
        let param_data:Data  = UIImage.jpegData(binaryFile)(compressionQuality: 1.0)!
        
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
