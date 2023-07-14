//
//  URLRequestVC.swift
//  MySwift
//
//  Created by lzd_free on 2020/12/22.
//  Copyright © 2020 Dio. All rights reserved.
//

import UIKit

class URLSessionVC: UIViewController {
    
    @IBOutlet weak var showLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "原生网络请求"
        showLB.sizeToFit()
    }
    
    @IBAction func get_func(_ sender: UIButton) {
        self.showLB.text = ""
        let urlStr:String = "http://jobs8.cn:8090/get?name=Dio"
        let url = URL.init(string: urlStr)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        var headers:Dictionary<String,Any> = Dictionary()
        headers["Content-Type"] = "application/json"
        headers["User-Agent"] = "iOS"
        headers["Accept-Encoding"] = "gzip, deflate, br"
        headers["Accept"] = "*/*"
        config.httpAdditionalHeaders = headers
        config.timeoutIntervalForRequest = 30
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        let session:URLSession = URLSession(configuration: config)
        /*
         第一个参数：请求对象
         第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
         data：响应体信息（期望的数据）
         response：响应头信息，主要是对服务器端的描述
         error：错误信息，如果请求失败，则error有值
         */
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if(error == nil){
                //.解析服务器返回的数据
                //说明：（返回的数据是二进制,将二进制数据转换成String,便于后续处理）
                if let result = String(data: data!, encoding: String.Encoding.utf8){
                    DispatchQueue.main.async {
                        self.showLB.text = result
                    }
                }
            }
        }
        task.resume()//开始执行
    }
    
    @IBAction func post_func(_ sender: UIButton) {
        self.showLB.text = ""
        let urlStr = "http://jobs8.cn:8090/post"
        let url = URL(string: urlStr)
        var request = URLRequest.init(url: url!)
        //修改请求方法为POST
        request.httpMethod = "POST"
        //设置请求体
        /*
         //字json字符串 直接转成 二进制的Data
         let param_json_str = "{\"username\":\"Dio\",\"password\":\"13131313\",\"argot\":\"You are geat!\",\"num\":11111}"
         request.httpBody = param_json_str.data(using: String.Encoding.utf8)
         */
        //为了便于拼接参数,将所有参数放在Dictionary里然后 将Dictionary整体 转成 json的二进制
        var param_dict = Dictionary<String,Any>()
        param_dict["name"] = "Dio"
        //        param_dict["password"] = "1231313"
        //        param_dict["argot"] = "You are geat!"
        param_dict["age"] = 18
        let param_data = try? JSONSerialization.data(withJSONObject: param_dict, options: JSONSerialization.WritingOptions.init(rawValue: 0))
        
        request.httpBody = param_data
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        var headers:Dictionary<String,Any> = Dictionary()
        headers["Content-Type"] = "application/json"
        headers["User-Agent"] = "iOS"
        headers["Accept-Encoding"] = "gzip, deflate, br"
        headers["Accept"] = "*/*"
        config.httpAdditionalHeaders = headers
        config.timeoutIntervalForRequest = 30
        config.requestCachePolicy = .reloadRevalidatingCacheData
        let session:URLSession = URLSession(configuration: config)
        let dataTask: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            if(error == nil){
                if let result = String(data: data!, encoding: String.Encoding.utf8){
                    DispatchQueue.main.async {
                        self.showLB.text = result
                    }
                }
            }
        }
        //.执行任务
        dataTask.resume()
    }
    
    @IBAction func formdata_func(_ sender: UIButton) {
        self.showLB.text = ""
        let urlStr = "http://jobs8.cn:8090/postform"
        let url = URL(string: urlStr)
        var request = URLRequest.init(url: url!)
        //修改请求方法为POST
        request.httpMethod = "POST"
        //设置请求体
        //form-data拼接成字符后 转成 二进制的Data
        let param = "name=Dio&age=20"
        request.httpBody = param.data(using: String.Encoding.utf8)
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        var headers:Dictionary<String,Any> = Dictionary()
        headers["Content-Type"] = "application/x-www-form-urlencoded"
        headers["User-Agent"] = "iOS"
        headers["Accept-Encoding"] = "gzip, deflate, br"
        headers["Accept"] = "*/*"
        config.httpAdditionalHeaders = headers
        config.timeoutIntervalForRequest = 30
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        let session:URLSession = URLSession(configuration: config)
        let dataTask: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            if(error == nil){
                if let result = String(data: data!, encoding: String.Encoding.utf8){
                    DispatchQueue.main.async {
                        self.showLB.text = result
                    }
                }
            }
        }
        //.执行任务
        dataTask.resume()
    }
    
    @IBAction func downloadTask_func(_ sender: UIButton) {
        self.showLB.text = ""
        //1.创建会话对象
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        let session:URLSession = URLSession.init(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        //2.根据会话对象创建task
        let urlStr = "http://jobs8.cn:8090/download/test.png" //目前还没有写后台接口,这个功能先不测试
        let url = URL.init(string: urlStr)
        //3.创建可变的请求对象
        var request:URLRequest  = URLRequest(url: url!)
        //4.修改请求方法为POST
        request.httpMethod = "GET"
        //5.设置请求体-----可以不设置，有默认的
        //        request.httpBody = "".data(using: String.Encoding.utf8)
        //6.根据会话对象创建一个Task(发送请求）
        /*
         第一个参数：请求对象
         第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
         data：响应体信息（期望的数据）
         response：响应头信息，主要是对服务器端的描述
         error：错误信息，如果请求失败，则error有值
         */
        let downTask=session.downloadTask(with: request) { (data, response, error) in
            if(error != nil){
                print(error!.localizedDescription)
            }else {
                if let url = data {
                    print(url)
                }
                if let resp = response {
                    print(resp)
                }
            }
        }
        downTask.resume()
    }
    
    @IBAction func uploadTask_func(_ sender: Any) {
        self.showLB.text = ""
        let urlStr = "http://jobs8.cn:8090/upload"
        let url = URL.init(string: urlStr)
        //创建请求
        var request:URLRequest  = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        let uuid:String = "\(UUID())"
        let boundary = uuid.replacingOccurrences(of: "-", with: "")
        let newLine = "\r\n";
        
        let contentType = "multipart/form-data; charset=utf-8; boundary=\(boundary)"
        request.addValue(contentType, forHTTPHeaderField: "Content-Type")
        
        var param_data = Data()
        
        param_data += "--\(boundary)".data(using: String.Encoding.utf8)!
        param_data += newLine.data(using: String.Encoding.utf8)!
        
        let name = "file";//后台服务器根据这个名取到Request
        let filename = "pingtaoge.png"
        let type = "image/png"
        let content = "Content-Disposition: form-data; name=\(name); filename=\(filename); type=\(type)"
        param_data += content.data(using: String.Encoding.utf8)!
        param_data += newLine.data(using: String.Encoding.utf8)!
        param_data += newLine.data(using: String.Encoding.utf8)!
        
        let image:UIImage = UIImage.init(named: filename)!
        let imageData:Data  = UIImage.jpegData(image)(compressionQuality: 1.0)!
        param_data += imageData
        
        param_data += newLine.data(using: String.Encoding.utf8)!
        param_data += "--\(boundary)--".data(using: String.Encoding.utf8)!
        param_data += newLine.data(using: String.Encoding.utf8)!
        
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        let session:URLSession=URLSession.init(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        /*
         第一个参数：请求对象
         第二个参数：需要上传的二进制文件
         data：响应体信息（期望的数据）
         response：响应头信息，主要是对服务器端的描述
         error：错误信息，如果请求失败，则error有值
         */
        let upTask = session.uploadTask(with: request, from: param_data) { (data, response, error) in
            //上传完毕后
            if error != nil{
                print(error!)
            }else{
                if let result = String(data: data!, encoding: String.Encoding.utf8){
                    DispatchQueue.main.async {
                        self.showLB.text = result
                    }
                }
            }
        }
        upTask.resume()
    }
    
    @IBAction func uploadBinary_func(_ sender: UIButton) {
        self.showLB.text = ""
        let urlStr = "http://jobs8.cn:8090/upload"
        let url = URL.init(string: urlStr)
        //创建请求
        var request:URLRequest  = URLRequest(url: url!)
        //修改请求方法为POST
        request.httpMethod = "POST"
        
        let filename = "pingtaoge.png"
        let image:UIImage = UIImage.init(named: filename)!
        let imageData:Data  = UIImage.jpegData(image)(compressionQuality: 0.1)!
        
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        let session:URLSession=URLSession.init(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        /*
         第一个参数：请求对象
         第二个参数：需要上传的二进制文件
         data：响应体信息（期望的数据）
         response：响应头信息，主要是对服务器端的描述
         error：错误信息，如果请求失败，则error有值
         */
        let upTask = session.uploadTask(with: request, from: imageData) { (data, response, error) in
            //上传完毕后
            if error != nil{
                print(error!)
            }else{
                if let result = String(data: data!, encoding: String.Encoding.utf8){
                    DispatchQueue.main.async {
                        self.showLB.text = result
                    }
                }
            }
        }
        upTask.resume()
    }
    
}

extension URLSessionVC : URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("下载结束， 存储在(location.path)")
        //输出下载文件原来的存放目录
        print("location:\(location)")
        //location位置转换
        let locationPath = location.path
        //拷贝到用户目录
        let documnets:String = NSHomeDirectory() + "/Documents/1.png"
        //创建文件管理器
        let fileManager = FileManager.default
        try! fileManager.moveItem(atPath: locationPath, toPath: documnets)
        print("new location:\(documnets)")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        print("total: (totalBytesExpectedToWrite), current: (totalBytesWritten)")  //下载进度
    }
    
}
