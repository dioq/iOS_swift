//
//  UseNetworkingToolVC.swift
//  Swift_Info
//
//  Created by lzd_free on 2018/12/17.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class UseNetworkingToolVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "测试封装的Alamofire"
        
        //开启网络监听
        let isConnectiong = MyHttp.shareManager().monitorNetworking()
        print(isConnectiong)
    }
    
    @IBAction func getAction(_ sender: UIButton) {
        MyHttp.shareManager().request(urlString:api, method:.get, parameters: nil, headers: nil, success: { (response) in
            print(type(of: response))
            print(response)
        }, failure: { (error) in
            print(error)
        })
    }
    
    @IBAction func postAction(_ sender: UIButton) {

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
