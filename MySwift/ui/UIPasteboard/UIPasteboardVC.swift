//
//  UIPasteboardVC.swift
//  MySwift
//
//  Created by Dio Brand on 2022/7/25.
//  Copyright © 2022 Dio. All rights reserved.
//

import UIKit

class UIPasteboardVC: UIViewController {

    @IBOutlet weak var show: UILabel!
    @IBOutlet weak var ShowImge: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "粘贴板"
    }
    
    @IBAction func copyString(_ sender: UIButton) {
        //复制字符串
        UIPasteboard.general.string = "欢迎访问 hangge.com"
    }
    
    @IBAction func copyStrinArray(_ sender: UIButton) {
        //复制字符串数组
        UIPasteboard.general.strings = ["hellow", "hangge.com"]
    }
    
    @IBAction func copyImage(_ sender: UIButton) {
        //复制图片
        let image = UIImage(named: "girl.png")
        UIPasteboard.general.image = image
    }
    
    @IBAction func readString(_ sender: UIButton) {
        self.show.text = nil
        self.show.text = UIPasteboard.general.string
    }
    
    @IBAction func readStrArr(_ sender: UIButton) {
        self.show.text = nil
        if let strings = UIPasteboard.general.strings {
            var str:String = ""
            for item in strings {
                print(item)
                str.append(contentsOf: item)
                str.append(contentsOf: "\t")
            }
            self.show.text = str
        }
    }
    
    @IBAction func readImage(_ sender: UIButton) {
        self.ShowImge.image = nil
        self.ShowImge.image = UIPasteboard.general.image
    }
    
}
