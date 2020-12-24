//
//  AuxiliarySkillsVC.swift
//  MySwift
//
//  Created by lzd_free on 2020/12/24.
//  Copyright © 2020 Dio. All rights reserved.
//

import UIKit

class AuxiliarySkillsVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "开发中一些辅助技巧"
        
        print("file: \n",#file,"\nfunction:\n",#function,"\nline:",#line)
        test1()
        test2()
        test3()
        
        let testClass = AuxiliarySkillsTestFile()
        testClass.test1()
        testClass.test2()
        testClass.test3()
    }
    
    func test1() {
        print("file: \n",#file,"\nfunction:\n",#function,"\nline:",#line)
    }
    func test2() {
        print("file: \n",#file,"\nfunction:\n",#function,"\nline:",#line)
    }
    func test3() {
        print("file: \n",#file,"\nfunction:\n",#function,"\nline:",#line)
    }
    
}
