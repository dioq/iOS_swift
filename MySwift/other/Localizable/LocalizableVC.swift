//
//  LocalizationViewController.swift
//  Swift_Info
//
//  Created by hello on 2019/3/27.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class LocalizableVC: UIViewController {
    
    @IBOutlet weak var myImaeV: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "本地化"
        /*
         可以在iOS系统中调节系统 "iPhone语言" 来测试,文字和图片可以根据iOS系统的语言来调节
         **/
        let imageName = Bundle.main.localizedString(forKey: "mainImage", value: "", table: nil)
        self.myImaeV.image = UIImage.init(named: imageName)
        
        let text =  Bundle.main.localizedString(forKey: "mainText", value: "", table: nil)
        self.myLabel.text = text
    }
    
}
