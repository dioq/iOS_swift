//
//  PopMenuViewController.swift
//  Swift_Info
//
//  Created by hello on 2018/11/27.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class PopMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "自定义返回按钮+点击弹出选择框"
        let barButton = UIBarButtonItem.init(image: UIImage.init(named: "com_arrow_vc_back"), style: .plain, target: self, action: #selector(comeback))
        self.navigationItem.leftBarButtonItem = barButton
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "pop", style: .done, target: self, action: #selector(onClickPop))
    }
    
    @objc private func onClickPop(){
        let items: [String] = ["测试1","测试2"]
        let imgSource: [String] = ["contact","weichat"]
        NavigationMenuShared.showPopMenuSelecteWithFrameWidth(width: itemWidth, height: 160, point: CGPoint(x: ScreenInfo.Width - 30, y: 0), item: items, imgSource: imgSource) { (index) in
            ///点击回调
            switch index{
            case 0:
                EWToast.showCenterWithText(text: "点击测试1")
            case 1:
                EWToast.showCenterWithText(text: "点击测试2")
            default:
                break
            }
        }
    }
    
    @objc func comeback() {
        self.navigationController?.popViewController(animated: true)
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
