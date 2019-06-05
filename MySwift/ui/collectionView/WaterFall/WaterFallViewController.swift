//
//  WaterFallViewController.swift
//  MySwift
//
//  Created by hello on 2019/6/5.
//  Copyright © 2019 Dio. All rights reserved.
//

import UIKit

class WaterFallViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate  {

    let indentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //创建瀑布流视图布局类
        let layout = WaterFallLayout(itemCount: 50)
        //创建集合视图
        let collectionView = UICollectionView(frame: self.view.frame,collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        //注册载体数据类
        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: indentifier)
        self.view.addSubview(collectionView)
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indentifier, for: indexPath)
        cell.backgroundColor = UIColor.random
        return cell
    }
    
    //点击事件
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("点击了第\(indexPath.row)个item")
    }
    
}
