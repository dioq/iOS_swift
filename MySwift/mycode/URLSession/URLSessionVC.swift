//
//  URLRequestVC.swift
//  MySwift
//
//  Created by lzd_free on 2020/12/22.
//  Copyright © 2020 Dio. All rights reserved.
//

import UIKit

class URLSessionVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "原生网络请求"
    }
    
    @IBAction func get_func(_ sender: UIButton) {
        let urlStr:String = "http://103.100.211.187:8848/getTest"
        let url = URL.init(string: urlStr)
        let request = URLRequest(url: url!)
        
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type":"application/json"]
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
                //说明：（此处返回的数据是JSON格式的，因此使用NSJSONSerialization进行反序列化处理）
                do {
                    let dict  = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    print(dict)
                } catch {
                    print("catch")
                }
            }
        }
        task.resume()//开始执行
    }
    
    @IBAction func post_func(_ sender: UIButton) {
        let urlStr = "http://www.anant.club:8848/getPost"
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
        //为了使用拼接参数,将所有参数放在Dictionary里然后 将Dictionary整体 转成 二进制json的Data
        var param_dict = Dictionary<String,Any>()
        param_dict["username"] = "Dio"
        param_dict["password"] = "1231313"
        param_dict["argot"] = "You are geat!"
        param_dict["num"] = 1999
        let param_data = try? JSONSerialization.data(withJSONObject: param_dict, options: JSONSerialization.WritingOptions.init(rawValue: 0))
        request.httpBody = param_data
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type":"application/json"]
        config.timeoutIntervalForRequest = 30
        config.requestCachePolicy = .reloadRevalidatingCacheData
        let session:URLSession = URLSession(configuration: config)
        let dataTask: URLSessionDataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if(error == nil){
                //（此处返回的数据是JSON格式的，因此使用NSJSONSerialization进行反序列化处理）
                do {
                    let dict  = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    print(dict)
                } catch {
                    print("catch")
                }
            }
        }
        //.执行任务
        dataTask.resume()
    }
    
    @IBAction func formdata_func(_ sender: UIButton) {
        let urlStr = "http://www.anant.club:8848/testFormdata"
        let url = URL(string: urlStr)
        var request = URLRequest.init(url: url!)
        //修改请求方法为POST
        request.httpMethod = "POST"
        //设置请求体
        //form-data拼接成字符后 转成 二进制的Data
        let param = "username=dio&area=guiyang&age=18&action=testaction"
        request.httpBody = param.data(using: String.Encoding.utf8)
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        config.timeoutIntervalForRequest = 30
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        let session:URLSession = URLSession(configuration: config)
        let dataTask: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            if(error == nil){
                //（此处返回的数据是JSON格式的，因此使用NSJSONSerialization进行反序列化处理）
                do {
                    let dict  = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    print(dict)
                } catch {
                    print("catch")
                }
            }
        }
        //.执行任务
        dataTask.resume()
    }
    
    @IBAction func downloadTask_func(_ sender: UIButton) {
        //1.创建会话对象
        let config:URLSessionConfiguration=URLSessionConfiguration.default
        let session:URLSession = URLSession.init(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        //2.根据会话对象创建task
        let urlStr = "" //目前还没有写后台接口,这个功能先不测试
        let url = URL.init(string: urlStr)
        //3.创建可变的请求对象
        var request:URLRequest  = URLRequest(url: url!)
        //4.修改请求方法为POST
        request.httpMethod = "POST"
        //5.设置请求体-----可以不设置，有默认的
        request.httpBody = "".data(using: String.Encoding.utf8)
        //6.根据会话对象创建一个Task(发送请求）
        /*
         第一个参数：请求对象
         第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
         data：响应体信息（期望的数据）
         response：响应头信息，主要是对服务器端的描述
         error：错误信息，如果请求失败，则error有值
         */
        let downTask=session.downloadTask(with: request) { (data, response, error) in
            if(error == nil){
                
            }
        }
        downTask.resume()
    }
    
    @IBAction func uploadTask_func(_ sender: Any) {
        let urlStr = "http://103.100.211.187:8848/upload"
        let url = URL.init(string: urlStr)
        //创建请求
        var request:URLRequest  = URLRequest(url: url!)
        //修改请求方法为POST
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
        let filename = "anewname"
        let content = "Content-Disposition: form-data; name=\(name); filename=\(filename)"
        param_data += content.data(using: String.Encoding.utf8)!
        param_data += newLine.data(using: String.Encoding.utf8)!
        param_data += newLine.data(using: String.Encoding.utf8)!
        
        let image:UIImage = UIImage.init(named: "pingtaoge")!
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
                //（此处返回的数据是JSON格式的，因此使用NSJSONSerialization进行反序列化处理）
                do {
                    let dict  = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    print(dict)
                } catch {
                    print("catch")
                }
            }
        }
        upTask.resume()
    }
    
    @IBAction func uploadBinary_func(_ sender: UIButton) {
        let urlStr = "https://upload.gmugmu.com/api/v1/base/resource/image/upload?source_info=eyJhcHBpZCI6IjI2MDAwMyIsInVpZCI6IjMyNDk3MjMyIiwicGFnZSI6ImNvbS5lb21jaGF0Lm1vZHVsZS5ob21lLkhvbWVQYWdlQWN0aXZpdHkiLCJ0aW1lIjoiMTYwNjI0Mjc3MDA5NiJ9&cc=TG73257&dev_name=nubia&oaid=&cpu=[Adreno_(TM)_630][ARMv7_639_placeholder]&lc=37427d9d8660d3f7&osversion=android_22&sid=02Yok7jQeFpBTR+Uz1tDaONajE3oi6XdrdqPwUyM/joBe9tJRE6grYwCweYmrwWh&ndid=&conn=wifi&ram=3650129920&msid=363635333236303436313030303634&icc=89860081133720371180&statistics=9ad290c3317d39cc8be58b98f74c86e7&mtid=e6352e4b164246b8b0be20f9c36f5abe&atid=302e30&tourist=&ongd=302e30&mtxid=00812dc6db02&evid=3535303335643264616635632d343464382d626465332d373262342d3034366638353761&cv=GM4.6.30_Android&proto=&logid=2006201,2001902,2002202,201802,202101,204005,204401,2005402,2006102,2001701,2003301,2005601,2005502,2001501,2005202,204301,2001802,2005801,2003502,2004701,2000802,201007,2001602,2004901,2002101,2003802,2005902,204101,2006001,2004801,2001202&ua=nubiaNX629J&uid=32497232&vv=202010141815&meid=363834373537373230363631353638&smid=&aid=b35517406764bf51"
        let url = URL.init(string: urlStr)
        //创建请求
        var request:URLRequest  = URLRequest(url: url!)
        //修改请求方法为POST
        request.httpMethod = "POST"
        
        let image:UIImage = UIImage.init(named: "pingtaoge")!
        let imageData:Data  = UIImage.jpegData(image)(compressionQuality: 1.0)!
        
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
                do {
                    let dict  = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    print(dict)
                } catch {
                    print("catch")
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
