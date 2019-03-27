//
//  UIWebViewVC.swift
//  Swift_UI
//
//  Created by William on 2018/9/26.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class UIWebViewVC: UIViewController,UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        setUp()
//        func02()
        func03()
    }
    
    func setUp() {
        let filePath = Bundle.main.path(forResource: "myweb", ofType: "html")
        guard let path = filePath else {
            return
        }
        guard let url = URL(string: path) else {
            return
        }
        let request = URLRequest(url: url)
        webView.loadRequest(request)
        //        webView.scalesPageToFit = false
    }
    
    func func02() {
        let filePath = Bundle.main.path(forResource: "t2", ofType: "html")
        guard let path = filePath else {
            return
        }
        guard let url = URL(string: path) else {
            return
        }
        let request = URLRequest(url: url)
        webView.loadRequest(request)
        webView.delegate = self
//        webView.scalesPageToFit = true
    }
    
    func func03() {
        let widthimg = self.webView.frame.width
        let heightimg = self.webView.frame.height
        print(widthimg,"\t\t", heightimg)
        
        let msg = "<p><img src=\"https://yb6.me/img/rT8U/OtAImQJmy.jpg\" width=\"\" height=\"\" border=\"0\" vspace=\"0\" title=\"\" alt=\"\"/></p>"
        let myAppend = "<style>"
//        let myAppend2 = "img{width: \(widthimg)px;height: \(heightimg)px;}"
        let myAppend2 = "img{width: 100%;height: 100%;}"
        let myAppend3 = "body{margin:0px 0px 0px 0px;padding:0px 0px 0px 0px;}"
        let myAppendend = "</style>"
        let msgNew = msg + myAppend + myAppend2 + myAppend3 + myAppendend
        webView.loadHTMLString(msgNew, baseURL: URL.init(string: "https://skya077.yb876.com"))
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
//        webView.stringByEvaluatingJavaScript(from: "document.getElementsByTagName('img').width = '10px'")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView){
//        let str = "document.body.style.fontSize = '13px';"
//        let str = "document.getElementsByTagName('img').width = '10px'"
//        webView.stringByEvaluatingJavaScript(from: str)
//        let str2 = "document.getElementsByClassName(\"img\").height = '10px'"
//        webView.stringByEvaluatingJavaScript(from: str2)
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
