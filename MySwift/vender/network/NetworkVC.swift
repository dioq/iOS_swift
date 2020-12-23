//
//  NetworkVC.swift
//  MySwift
//
//  Created by lzd_free on 2020/12/21.
//  Copyright © 2020 Dio. All rights reserved.
//

import UIKit

class NetworkVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "测试封装的Alamofire"
    }
    
    @IBAction func get_func(_ sender: UIButton) {
        let urlStr = "http://103.100.211.187:8848/getTest"
        
        MyNet.shareManager().doGet(urlString: urlStr) { (response) in
            print(response)
        } failure: { (error) in
            print(error)
        }
    }
    
    @IBAction func post_func(_ sender: UIButton) {
        let urlStr = "http://www.anant.club:8848/getPost"
        var param = Dictionary<String,Any>()
        param["username"] = "Dio"
        param["password"] = "13131313"
        param["argot"] = "You are geat!"
        param["num"] = 2222
        
        var headers = Dictionary<String,String>()
        headers["Accept-Encoding"] = "gzip, deflate, br"
        MyNet.shareManager().doPost(urlString: urlStr, parameters: param, headers: headers) { (response) in
            print(response)
        } failure: { (error) in
            print(error)
        }
        
    }
    
    @IBAction func submit_formdata_func(_ sender: UIButton) {
        let urlStr = "http://www.anant.club:8848/testFormdata"
        var params:Dictionary = Dictionary<String,String>()
        params["username"] = "dio"
        params["area"] = "guiyang"
        params["age"] = "18"
        params["action"] = "testaction"
        
        MyNet.shareManager().submitFormdata(urlStr: urlStr, parameters: params) { (response) in
            print(response)
        } failure: { (error) in
            print(error)
        }
        
    }
    
    @IBAction func uploadImage_func(_ sender: UIButton) {
        let urlStr = "http://103.100.211.187:8848/upload"
        let image1:UIImage? = UIImage(named: "pingtaoge")
        var imageArr = Array<UIImage>()
        imageArr.append(image1!)
        MyNet.shareManager().uploadImages(urlString: urlStr, images: imageArr, fileName: "random_name") { (response) in
            print(response)
        } failure: { (error) in
            print(error)
        }
    }
    
}
