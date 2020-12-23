//
//  HGImageViewController.swift
//  Swift_Info
//
//  Created by lzd_free on 2019/2/5.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit
import Photos

class HGImageViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    let identifier = "cell"
    var dataArray = Array<UIImage>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "HGImage"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "选择", style: .plain, target: self, action: #selector(selectedManyImageAction))
        
        let layout = UICollectionViewFlowLayout()
        //Layout大小 长与宽
        layout.itemSize = CGSize(width:100,height:100)
        //列间距,行间距,偏移
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        //layout距周围距离
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        myCollectionView?.collectionViewLayout = layout
        myCollectionView?.delegate = self
        myCollectionView?.dataSource = self
        //注册一个cell
        myCollectionView?.register(UINib.init(nibName: "HGImageCell", bundle: nil), forCellWithReuseIdentifier: identifier)
    }

    @objc func selectedManyImageAction() {
        //开始选择照片，最多允许选择4张
        _ = self.presentHGImagePicker(maxSelected:4) { (assets) in
            self.dataArray.removeAll()
            //结果处理
            print("共选择了\(assets.count)张图片，分别如下：")
            for asset in assets {
                print(asset)
                print(type(of: asset))
                
                PHCachingImageManager.default().requestImage(for: asset, targetSize: CGSize.zero, contentMode: .aspectFit, options: nil, resultHandler: { (resultImage, dictionary) in
                    print(type(of: resultImage))
                    self.dataArray.append(resultImage!)
                })
            }
            self.myCollectionView.reloadData()
        }
    }
}

extension HGImageViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HGImageCell
        let image = dataArray[indexPath.row]
        cell.selectedImage.image = image
        return cell
    }
    
}
