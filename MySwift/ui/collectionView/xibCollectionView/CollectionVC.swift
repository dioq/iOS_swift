//
//  CollectionVC.swift
//  swift_UI02
//
//  Created by William on 2018/8/1.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate{
    
    //声明两个存放字符串的数组
    var nowClassName = [String]()
    var surplusClassName = [String]()
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "xib collectionView"
        self.view.backgroundColor = UIColor.yellow
        
        let layout = UICollectionViewFlowLayout()
        //Layout大小 长与宽
        layout.itemSize = CGSize(width:80,height:35)
        //列间距,行间距,偏移
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        myCollectionView.collectionViewLayout = layout
        myCollectionView?.delegate = self
        myCollectionView?.dataSource = self
        //注册一个cell
        myCollectionView!.register(HotCell.self, forCellWithReuseIdentifier:"HotCell")
        myCollectionView?.backgroundColor = UIColor.brown
        saveData()
    }
    
    //添加数据
    private func saveData() {
        nowClassName += ["A-1","A-2","A-3","A-4","A-5","A-6","A-7","A-8","A-9","A-10","A-11"]
        surplusClassName += ["B-1","B-2","B-3","B-4","B-5","B-6","B-7","B-8","B-9","B-10","B-11"]
    }
    
    //每个区的item个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return nowClassName.count
        }else {
            return surplusClassName.count
        }
    }
    
    //分区个数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    //自定义cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotCell", for: indexPath) as! HotCell
        cell.backgroundColor = UIColor.red
        if indexPath.section == 0 {
            cell.label.text = nowClassName[indexPath.item]
        }else{
            cell.label.text = surplusClassName[indexPath.item]
        }
        return cell
    }

}
