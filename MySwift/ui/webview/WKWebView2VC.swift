//
//  WKWebViewHandleVC.swift
//  Swift_Info
//
//  Created by hello on 2018/11/9.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit
import WebKit

class WKWebView2VC: UIViewController,WKNavigationDelegate,WKUIDelegate {
    
    var myWebView:WKWebView!
    
    //加进度条
    lazy private var progressView:UIProgressView = {
        self.progressView = UIProgressView.init(frame: CGRect(x: 0, y: 1, width: UIScreen.main.bounds.width, height: 2))
        self.progressView.tintColor = UIColor.green      // 进度条颜色
        self.progressView.trackTintColor = UIColor.yellow // 进度条背景色
        return self.progressView
    }()
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "estimatedProgress"{
            progressView.alpha = 1.0
            progressView.setProgress(Float(myWebView.estimatedProgress), animated: true)
            if myWebView.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseOut, animations: {
                    self.progressView.alpha = 0
                }, completion: { (finish) in
                    self.progressView.setProgress(0.0, animated: false)
                })
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let webConfiguration = WKWebViewConfiguration()
        myWebView = WKWebView(frame: view.bounds, configuration: webConfiguration)
        let myURL = URL(string: "https://www.baidu.com")
        let myRequest = URLRequest(url: myURL!)
        myWebView.load(myRequest)
        view.addSubview(myWebView)
        myWebView.navigationDelegate = self //WKNavigationDelegate
        myWebView.uiDelegate = self //WKUIDelegate
        
        //加进度条
        view.addSubview(progressView)
        myWebView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
    }
    
    /*************************************** WKNavigationDelegate *******************************************/
    // 页面开始加载时调用
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("页面开始加载")
    }
    // 当内容开始返回时调用
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("内容开始返回")
    }
    // 页面加载完成之后调用
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("页面加载完成")
        self.title = webView.title //获取webview的title
    }
    // 跳转失败的时候调用
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("页面加载失败:",error)
    }
    // 内容加载失败
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("内容加载失败:",error)
    }
    // 接收到服务器跳转请求之后调用
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("接收到服务器跳转请求")
    }
    // 在收到响应后，决定是否跳转
    //    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
    //        print("收到响应后，决定是否跳转")
    //    }
    // 在发送请求之前，决定是否跳转
    //    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    //        print("发送请求之前，决定是否跳转")
    //    }
    
    
    /*************************************** WKUIDelegate *******************************************/
    // 创建一个新的WebView
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        print("创建一个新的WebView")
        
        if navigationAction.targetFrame?.isMainFrame != nil {
            self.myWebView.load(navigationAction.request)
        }
        return nil
    }
    
    /*************************************** uiDelegate *******************************************/
    // 监听通过JS调用警告框
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { (action) in
            completionHandler()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // 监听通过JS调用提示框
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { (action) in
            completionHandler(true)
        }))
        alert.addAction(UIAlertAction(title: "取消", style: .default, handler: { (action) in
            completionHandler(false)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // 监听JS调用输入框
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        // 类似上面两个方法
    }
    
    //controller 销毁时移出进度条
    deinit {
        myWebView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    
}
