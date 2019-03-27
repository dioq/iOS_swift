//
//  PhotosViewController.swift
//  Swift_Info
//
//  Created by lzd_free on 2019/2/2.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit
import Photos

class PhotosViewController: UIViewController {

    var myTableView:UITableView!
    let identifier = "cell"
    
    fileprivate var allPhotos: PHFetchResult<PHAsset>!
    fileprivate var smartAlbums: PHFetchResult<PHAssetCollection>!
    fileprivate var userCollections: PHFetchResult<PHCollection>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "相册图片多选"
//        self.automaticallyAdjustsScrollViewInsets = false
        fetchAlbumsFromSystemAlbum()
        
        //设置UItabView的位置
        myTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: ScreenWIDTH, height: ScreenHEIGHT - getTabBarHeight()), style: .plain)
        view.addSubview(myTableView)
        
        //设置数据源
        myTableView.dataSource = self
        //设置代理
        myTableView.delegate = self
        myTableView.register(PhotosTableViewCell.classForCoder(), forCellReuseIdentifier:identifier)
    }
    
    // 获取所有系统相册概览信息
    private func fetchAlbumsFromSystemAlbum() {
        let allPhotoOptions = PHFetchOptions()
        // 所有图片按时间排序
        allPhotoOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        allPhotos = PHAsset.fetchAssets(with: allPhotoOptions)
        print(allPhotos.count)//图片数量
        //智能相册，可以加载最近添加、最近删除等图片
        smartAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .albumRegular, options: nil)
        print(smartAlbums.count)//相册数量
        //个人新建的相册
        userCollections = PHCollectionList.fetchTopLevelUserCollections(with: nil)
        print(userCollections.count)//相册数量
    }
    
}

extension PhotosViewController: UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return smartAlbums.count
        case 2:
            return userCollections.count
        default:
            print("error")
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //section头的标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "所有图片"
        case 1:
            return "智能相册"
        case 2:
            return "个人相册"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PhotosTableViewCell
        switch  indexPath.section {
        case 0:
            cell.asset = allPhotos.firstObject
            cell.albumTitleAndCount = "所有照片 \(allPhotos.count)"
        case 1:
            let collection = smartAlbums.object(at: indexPath.row)
            cell.asset = PHAsset.fetchAssets(in: collection, options: nil).firstObject
            cell.albumTitleAndCount = collection.localizedTitle! + " \(PHAsset.fetchAssets(in: collection, options: nil).count)"
        case 2:
            let collection = userCollections.object(at: indexPath.row)
            cell.asset = PHAsset.fetchAssets(in: collection as! PHAssetCollection, options: nil).firstObject
            cell.albumTitleAndCount = collection.localizedTitle! + " \(PHAsset.fetchAssets(in: collection as! PHAssetCollection, options: nil).count)"
        default:
            print("error")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ShowPhotosVC()
        self.hidesBottomBarWhenPushed = true
        switch indexPath.section {
        case 0:
            vc.title = "所有照片"
            vc.allPhotos = self.allPhotos
        case 1:
            let collection = smartAlbums.object(at: indexPath.row)
            vc.title = collection.localizedTitle!
            vc.smartPHAssetCollection = collection
        case 2:
            let collection = userCollections.object(at: indexPath.row)
            vc.title = collection.localizedTitle!
            vc.userCPHCollection = collection
        default:
            print("error")
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
