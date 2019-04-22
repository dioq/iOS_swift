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
    
    var imagePickerController:UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //检测前置摄像头是否可用
    func isFrontCameraAvailable() -> Bool {
        return UIImagePickerController.isCameraDeviceAvailable(UIImagePickerController.CameraDevice.front)
    }
    //检测后置摄像头是否可用
    func isRearCameraAvailable() -> Bool {
        return UIImagePickerController.isCameraDeviceAvailable(UIImagePickerController.CameraDevice.rear)
    }
    //photoLibrary是否支持图片库
    func isPhotoLibraryAvailable() -> Bool {
        return UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary)
    }
    
    @IBAction func fromCamera(_ sender: UIButton) {
        if imagePickerController == nil {
            imagePickerController = UIImagePickerController()//初始化控制器
            imagePickerController?.delegate = self //代理
        }
        if isFrontCameraAvailable() || isRearCameraAvailable() {
            imagePickerController?.sourceType = .camera
        }else {
            print("相机不可用")
            return
        }
        imagePickerController?.allowsEditing = editSwitch.isOn //允许拍照后裁剪
        self.present(imagePickerController!, animated: true, completion: nil)
    }
    
    @IBAction func fromAlbum(_ sender: UIButton) {
        if imagePickerController == nil {
            imagePickerController = UIImagePickerController()//初始化控制器
            imagePickerController?.delegate = self //代理
        }
        if isPhotoLibraryAvailable() {
            imagePickerController?.sourceType = .photoLibrary
        }else{
            print("相册不可用")
            return
        }
        imagePickerController?.allowsEditing = editSwitch.isOn //允许拍照后裁剪
        self.present(imagePickerController!, animated: true, completion: nil)
    }
    
    ///选择图片完成（从相册或者拍照完成）
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
        
        ///取消选择图片（拍照）
        picker.dismiss(animated: true, completion: {() -> Void in
        })
    }
    ///取消选择图片（拍照）
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
