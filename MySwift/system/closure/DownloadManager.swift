//
//  DownloadManager.swift
//  MySwift
//
//  Created by hello on 2019/11/4.
//  Copyright © 2019 Dio. All rights reserved.
//

import UIKit

class DownloadManager: NSObject {
    
    func downloadWithURL(url:String, parameters:Dictionary<String, Any>, handler: @escaping (_ receiveData:Data?, _ error:Error?) -> Void) -> Void {
        let request:URLRequest = URLRequest.init(url: URL.init(string: url)!)
        let session:URLSession = URLSession.shared
        //执行请求任务
        let tast:URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.sync {
                handler(data,error)
            }
        }
        tast.resume()
    }
    
}
