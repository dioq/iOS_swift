//
//  StudyNibViewController.swift
//  Swift_Info
//
//  Created by hello on 2019/1/4.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class StudyNibViewController: UIViewController {

    var num = 0
    
    /**
     loadView 1 -> viewDidLoad 2 -> viewWillAppear 3 -> viewWillLayoutSubviews -> viewDidLayoutSubviews -> viewDidAppear -> viewWillDisappear -> viewDidDisappear
     **/
    
    //开始加载视图控制器自带的view 1
    override func loadView() {
        super.loadView()
        num += 1
        print("loadView     \(num)")
    }
    
    //视图控制器的view被加载完成 2
    override func viewDidLoad() {
        super.viewDidLoad()
        num += 1
        print("viewDidLoad  \(num)")
        self.view.backgroundColor = UIColor.red
    }
    
    //视图控制器的view将要显示在window上 3
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        num += 1
        print("viewWillAppear   \(num)")
    }
    
    //视图控制器的view开始更新Autolayout 4 (注: 这个方法不被调用)
    override func updateViewConstraints() {
        super.updateViewConstraints()
        num += 1
        print("updateViewConstraints    \(num)")
    }
    
    //视图控制器的view开始更新内容视图的位置 5
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        num += 1
        print("viewWillLayoutSubviews   \(num)")
    }
    
    //视图控制器的view已经更新内容视图的位置 6
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        num += 1
        print("viewDidLayoutSubviews    \(num)")
    }
    
    //视图控制器的view已经显示到window上 7
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        num += 1
        print("viewDidAppear    \(num)")
    }
    
    //视图控制的view将要从window上消失 8
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        num += 1
        print("viewWillDisappear    \(num)")
    }
    
    //视图控制器的view已经从window上消失 9
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        num += 1
        print("viewDidDisappear     \(num)")
    }

}
