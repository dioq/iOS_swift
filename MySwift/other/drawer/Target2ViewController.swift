//
//  Target2ViewController.swift
//  Drawer
//
//  Created by hello on 2019/3/1.
//  Copyright © 2019 Dio. All rights reserved.
//

import UIKit

class Target2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "NEW"
        self.view.backgroundColor = UIColor.red
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.dismiss(animated: true, completion: nil)
    }
}
