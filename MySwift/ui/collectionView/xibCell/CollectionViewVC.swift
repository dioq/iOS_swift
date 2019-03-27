//
//  CollectionViewVC.swift
//  swift_UI02
//
//  Created by William on 2018/8/14.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class CollectionViewVC: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    let identifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "xib collectionViewCell"
        
        let layout = UICollectionViewFlowLayout()
        //Layout大小 长与宽
        layout.itemSize = CGSize(width:80,height:80)
        //列间距,行间距,偏移
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        //layout距周围距离
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        myCollectionView?.collectionViewLayout = layout
        myCollectionView?.delegate = self
        myCollectionView?.dataSource = self
        //注册一个cell
        myCollectionView?.register(UINib.init(nibName: "MyCVCell", bundle: nil), forCellWithReuseIdentifier: identifier)
    }

    //每个区的item个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    //分区个数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //自定义cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MyCVCell
        cell.mylabel.text = "\(indexPath.row)"
        return cell
    }
    
}
