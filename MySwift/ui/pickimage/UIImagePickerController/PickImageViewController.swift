//
//  PickImageViewController.swift
//  Swift_Info
//
//  Created by hello on 2018/12/6.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class PickImageViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var editSwitch: UISwitch!
    
    let pickVC = UIImagePickerController()
    let pickVC2 = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickVC.delegate = self
        pickVC2.delegate = self
    }

    @IBAction func fromCamar(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            pickVC.sourceType = .camera
            pickVC.allowsEditing = editSwitch.isOn
            self.present(pickVC, animated: true, completion: nil)
        } else {
            EWToast.showCenterWithText(text: "This camera is invalid!", duration: 3)
        }
    }
    
    @IBAction func pickImageAction(_ sender: UIButton) {
        //判断设置是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //指定图片控制器类型
            pickVC2.sourceType = UIImagePickerController.SourceType.photoLibrary
            //设置是否允许编辑
            pickVC2.allowsEditing = editSwitch.isOn
            //弹出控制器，显示界面
            self.present(pickVC2, animated: true, completion: {() -> Void in
            })
        }else{
            EWToast.showCenterWithText(text: "相册打不开", duration: 3)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //查看info对象
        print(info)
        
        //显示的图片
        var image:UIImage!
        if editSwitch.isOn {
            //获取编辑后的图片
            image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        }else{
            //获取选择的原图
            image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        }
        
        imageView.image = image
        
        //图片控制器退出
        picker.dismiss(animated: true, completion: {() -> Void in
        })
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

}
