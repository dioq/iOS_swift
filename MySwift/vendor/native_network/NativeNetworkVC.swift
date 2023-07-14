//
//  NativeNetworkVC.swift
//  MySwift
//
//  Created by lzd_free on 2020/12/29.
//  Copyright © 2020 Dio. All rights reserved.
//

import UIKit

class NativeNetworkVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func get_func(_ sender: UIButton) {
        let urlStr = "http://jobs8.cn:8090/get?name=dio"
        NetworkManager.shareManager().do_get(urlStr: urlStr) { responseObject in
            print(responseObject)
        } failure: { error in
            print(error)
        }
    }
    
    @IBAction func post_func(_ sender: UIButton) {
        let urlStr = "http://jobs8.cn:8090/post"
        var param_dict = Dictionary<String,Any>()
        param_dict["name"] = "Dio"
        param_dict["age"] = 18
        
        NetworkManager.shareManager().do_post(urlStr: urlStr, params: param_dict) { responseObject in
            print(responseObject)
        } failure: { error in
            print(error)
        }
    }
    
    @IBAction func formdata_func(_ sender: UIButton) {
        let urlStr = "http://jobs8.cn:8090/postform"
        var param_dict = Dictionary<String,String>()
        param_dict["name"] = "Dio"
        
        NetworkManager.shareManager().post_form(urlStr: urlStr, params: param_dict) { responseObject in
            print(responseObject)
        } failure: { error in
            print(error)
        }
    }
    
    @IBAction func uploadImage_func(_ sender: UIButton) {
        let urlStr = "http://jobs8.cn:8090/upload"
        let image:UIImage = UIImage.init(named: "pingtaoge")!
        NetworkManager.shareManager().uploadImage(urlStr: urlStr, image: image, name: "file", fileName: "test.png") { (response) in
            print(response)
        } failure: { (error) in
            print(error)
        }
    }
    
}
