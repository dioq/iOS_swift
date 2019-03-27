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
        view.backgroundColor = UIColor.gray
//        setUpWKwebView()
        setUp()
//        loadLoaclWeb()
//        executeJS()
    }
    
    func executeJS() {
        let msg =  "<button onclick=\"window.open('https://5719c.com/index/loginInterface.do')\" target=\"_blank\" rel=\"external\" style=\"width: 100%;height: 100%;border: #fff;background: #fff;\"><img src=\"https://yb6.me/img/FSJZ/O9BVmU67H.jpg\" width=\"250px\" height=\"280px\" border=\"0\" vspace=\"0\" title=\"\" alt=\"\" \"/></button>"
        myWebView.loadHTMLString(msg, baseURL: URL.init(string: "https://skya077.yb876.com"))
    }
    
    func loadLoaclWeb() {
        let msg = "<p><img src=\"https://yb6.me/img/rT8U/OtAImQJmy.jpg\" width=\"\" height=\"\" border=\"0\" vspace=\"0\" title=\"\" alt=\"\"/></p>"
        let myAppend = "<style>"
        let myAppend2 = "img{width: 100%;height: 100%;}"
        let myAppend3 = "body{margin:0px 0px 0px 0px;padding:0px 0px 0px 0px;}"
        let myAppendend = "</style>"
        let msgNew = msg + myAppend + myAppend2 + myAppend3 + myAppendend
        myWebView.loadHTMLString(msgNew, baseURL: URL.init(string: "https://skya077.yb876.com"))
    }
    
    func setUp() {
        let myURL = URL(string: "https://m.huya.com/lpl")
        let myRequest = URLRequest(url: myURL!)
        myWebView.load(myRequest)
    }
    
    func setUpWKwebView() {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: view.bounds, configuration: webConfiguration)
        let myURL = URL(string: "https://www.jianshu.com/p/091bf2467d67")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        view.addSubview(webView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
