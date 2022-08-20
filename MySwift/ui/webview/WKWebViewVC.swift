//
//  WKWebViewVC.swift
//  Swift_UI
//
//  Created by William on 2018/8/28.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewVC: UIViewController{
    
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loadUrl(_ sender: UIButton) {
        let urlStr = "https://www.baidu.com"
        let myURL = URL(string: urlStr)
        let myRequest = URLRequest(url: myURL!)
        myWebView.load(myRequest)
    }
    
    @IBAction func loadLocalWeb(_ sender: UIButton) {
        guard let pathString:String = Bundle.main.path(forResource: "t2", ofType: "html") else {
            print("找不到本地 web 路径")
            return
        }
        let url = URL.init(fileURLWithPath: pathString)
        let request = URLRequest.init(url: url)
        self.myWebView.load(request)
    }
    
    @IBAction func loadHTMLStringAction(_ sender: UIButton) {
        let msg = "<p><img src=\"myimage.jpg\" width=\"\" height=\"\" border=\"0\" vspace=\"0\" title=\"\" alt=\"\"/></p>"
        let myAppend = "<style>"
        let myAppend2 = "img{width: 100%;height: 100%;}"
        let myAppend3 = "body{margin:0px 0px 0px 0px;padding:0px 0px 0px 0px;}"
        let myAppendend = "</style>"
        let msgNew = msg + myAppend + myAppend2 + myAppend3 + myAppendend
        guard let pathString:String = Bundle.main.path(forResource: "t2", ofType: "html") else {
            print("找不到本地 web 路径")
            return
        }
        let url = URL.init(fileURLWithPath: pathString)
        // 在基础 html 网页中 添加一段 html代码
        myWebView.loadHTMLString(msgNew, baseURL: url)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
