//
//  MultipleSelectedCVVC.swift
//  Swift_Info
//
//  Created by hello on 2019/1/25.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class MultipleSelectedCVVC: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    let identifier = "mycell"
    var dataArray = Array<String>()
    var selectedIndexPath:IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "CollectionView多选选cell"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "show", style: .plain, target: self, action: #selector(showAllSelected))
        makeData()
        
        let layout = UICollectionViewFlowLayout()
        //Layout大小 长与宽
        layout.itemSize = CGSize(width:100, height: 100)
        //列间距,行间距,偏移
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        myCollectionView.collectionViewLayout = layout
        myCollectionView?.delegate = self
        myCollectionView?.dataSource = self
        //注册一个cell
        myCollectionView!.register(UINib.init(nibName: "SelectedCollectionCell", bundle: nil), forCellWithReuseIdentifier:identifier)
        myCollectionView.allowsMultipleSelection = true //允许多选
    }

    func makeData() {
        for index in 0...50 {
            let value = "这是第\(index)个cell"
            dataArray.append(value)
        }
    }
    
    @objc func showAllSelected() {
        if let selectedItems = myCollectionView.indexPathsForSelectedItems {
            for item in selectedItems {
                print("section:\(item.section)\trow:\(item.row)")
            }
        }
    }
    
}

extension MultipleSelectedCVVC:UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! SelectedCollectionCell
        cell.myTitle.text = dataArray[indexPath.row]
        
        cell.setSelectedStatus()
        
        return cell
    }
    
    //允许选中时高亮
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //选中状态 触发
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        if let cell = collectionView.cellForItem(at: indexPath) as? SelectedCollectionCell {
            cell.setSelectedStatus()
        }
    }
    
    //取消选中状态 触发
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SelectedCollectionCell {
            cell.setSelectedStatus()
        }
    }
    
}
