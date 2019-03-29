//
//  RxViewController.swift
//  Swift_Info
//
//  Created by hello on 2019/3/17.
//  Copyright © 2019 William. All rights reserved.
//
//https://www.imooc.com/article/32408
import UIKit
//import RxCocoa
//import RxSwift

class RxViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextField2: UITextField!
    
    
    //    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "RxSwift"
        /*
         /*
         UIButton
         按钮点击事件的绑定
         **/
         button.rx.tap.subscribe(onNext: {
         print("Rx button Tapped")
         }).disposed(by: disposeBag)
         //另一种写法
         button.rx.tap.bind{
         print("Rx button Tapped 2")
         }.disposed(by: disposeBag)
         
         /*
         UITextField
         监听单个 textField 内容的变化
         **/
         //方式一:
         myTextField.rx.text.orEmpty.asObservable().subscribe(onNext: {
         print("你输入的是: \($0)")
         }).disposed(by: disposeBag)
         //方式二:
         myTextField2.rx.text.orEmpty.changed.subscribe(onNext: {
         print("你输入的是: \($0)")
         }).disposed(by: disposeBag)
         */
    }
    
    @objc func buttonTapped() {
        print("normal button Tapped")
    }
    
}
