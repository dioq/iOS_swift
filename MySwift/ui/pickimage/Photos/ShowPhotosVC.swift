//
//  ShowPhotosVC.swift
//  Swift_Info
//
//  Created by lzd_free on 2019/2/7.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit
import Photos

class ShowPhotosVC: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    let identifier = "cell"
    var dataArray = Array<UIImage>()
    var allPhotos: PHFetchResult<PHAsset>?
    var smartPHAssetCollection: PHAssetCollection?
    var userCPHCollection: PHCollection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseData()
        let layout = UICollectionViewFlowLayout()
        //Layout大小 长与宽
        let itemWidth = (ScreenWIDTH - 20) / 3
        layout.itemSize = CGSize(width:itemWidth ,height:itemWidth)
        //列间距,行间距,偏移
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        //layout距周围距离
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        myCollectionView?.collectionViewLayout = layout
        myCollectionView?.delegate = self
        myCollectionView?.dataSource = self
        //注册一个cell
        myCollectionView?.register(UINib.init(nibName: "PhotosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifier)
    }

    func parseData() {
        let itemWidth = (ScreenWIDTH - 20) / 3
        let defaultSize = CGSize(width:itemWidth, height:itemWidth)
        
        if allPhotos != nil {
            for index in 0..<allPhotos!.count {
                let asset = allPhotos!.object(at: index)
                PHCachingImageManager.default().requestImage(for: asset, targetSize: defaultSize, contentMode: .aspectFill, options: nil, resultHandler: { (img, _) in
                    self.dataArray.append(img!)
                })
            }
        }

        if smartPHAssetCollection != nil {
            let assetArr = PHAsset.fetchAssets(in: smartPHAssetCollection!, options: nil)
            for index in 0..<assetArr.count{
                let asset = assetArr[index]
                PHCachingImageManager.default().requestImage(for: asset, targetSize: defaultSize, contentMode: .aspectFill, options: nil, resultHandler: { (img, _) in
                    self.dataArray.append(img!)
                })
            }
        }
        
        if userCPHCollection != nil {
            let assetArr = PHAsset.fetchAssets(in: userCPHCollection as! PHAssetCollection, options: nil)
            for index in 0..<assetArr.count{
                let asset = assetArr[index]
                PHCachingImageManager.default().requestImage(for: asset, targetSize: defaultSize, contentMode: .aspectFill, options: nil, resultHandler: { (img, _) in
                    self.dataArray.append(img!)
                })
            }
        }

    }
    
}

extension ShowPhotosVC: UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.myIMGV.image = self.dataArray[indexPath.row]
        return cell
    }
    
}
