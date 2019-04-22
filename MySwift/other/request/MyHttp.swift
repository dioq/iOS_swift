//
//  MyHttp.swift
//  Swift_Info
//
//  Created by hello on 2018/12/16.
//  Copyright © 2018 William. All rights reserved.
//

import Alamofire

enum MethodType {
    case get
    case post
    case put
    case delete
}

class MyHttp {
    
    private static var instance:MyHttp? = nil
    private init (){}
    
    class func shareManager() -> MyHttp {
        if instance == nil {
            instance = MyHttp.init()
        }
        return instance!
    }
    
    private static var isConnection:Bool = true
    func monitorNetworking() -> Bool {
        let manager = NetworkReachabilityManager()
        manager?.listener = { status in
            var statusStr: String?
            switch status {
            case .unknown: //未识别的网络
                statusStr = "未识别的网络"
                MyHttp.isConnection = false
                EWToast.showCenterWithText(text: statusStr!, duration: 3)
            case .notReachable://不可用的网络(未连接)
                statusStr = "不可用的网络(未连接)"
                MyHttp.isConnection = false
                EWToast.showCenterWithText(text: statusStr!, duration: 3)
            case .reachable://网络连接正常
                MyHttp.isConnection = true
                if (manager?.isReachableOnWWAN)! {
                    statusStr = "2G,3G,4G...的网络"
                } else if (manager?.isReachableOnEthernetOrWiFi)! {
                    statusStr = "wifi的网络";
                }
            }
        }
        manager?.startListening()
        let canConnect = manager?.isReachable
        return canConnect!
    }
    
    func request(urlString:String, method:MethodType, parameters:Dictionary<String, Any>?, headers:Dictionary<String, String>?, success:@escaping(_ responseObject:String) -> Void, failure:@escaping(_ error:Error) -> Void) {
        
        //每次网络状态发生改变都会改变self.isConnection值,,当网络不通畅时就不再发起网络请求
        if !MyHttp.isConnection {
            return
        }
        
        
        let myMethod:HTTPMethod
        switch method {
        case .get:
            myMethod = .get
        case .post:
            myMethod = .post
        case .put:
            myMethod = .put
        default:
            myMethod = .get
        }
        
        Alamofire.request(urlString, method:myMethod, parameters:parameters, encoding:JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result{
            case .success:
                if let value = response.result.value {
                    print("type:", type(of: value))
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
    
    //上传图片
    func uploadImages(urlString:String, header:Dictionary<String, String>?, images:Array<UIImage>, withName:String ,fileName:String, mimeType:String = "image/jpeg",success:@escaping(_ responseObject:Any) -> Void, failure:@escaping(_ error:Error) -> Void) {
        
        //每次网络状态发生改变都会改变self.isConnection值,当网络不通畅时就不再发起网络请求
        if !MyHttp.isConnection {
            return
        }
        
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
