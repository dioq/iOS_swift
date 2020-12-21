//
//  CommentVC.swift
//  Swift_Info
//
//  Created by hello on 2019/2/1.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class CommentVC: UIViewController {

    var writeviewHeight:CGFloat = 50    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let startY = ScreenHEIGHT - (statusBarHeight + getNavigationBarHeight() + writeviewHeight)
        let writeBoard = AutoWriteBoard.init(frame: CGRect(x: 0, y: startY, width: ScreenWIDTH, height: writeviewHeight), targetView: self.view)
        writeBoard.backgroundColor = UIColor.cyan
        writeBoard.delegate = self
        view.addSubview(writeBoard)
    }
    
}

extension CommentVC:SendMessageDelegate {
    
    func sendMessage(message: String?) {
        print(message!)
    }
    
}
