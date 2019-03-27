//
//  EditCollectionCellVC.swift
//  Swift_Info
//
//  Created by hello on 2019/1/1.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class EditCollectionCellVC: UIViewController,UICollectionViewDataSource,
     UICollectionViewDelegate {

    @IBOutlet weak var myCollectionView: UICollectionView!
    let indentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "操作CollectionViewCell"
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
        myCollectionView?.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: indentifier)
        
        //绑定对长按的响应
        let longPress =  UILongPressGestureRecognizer(target:self,action:#selector(myHandleTableviewCellLongPressed(gestureRecognizer:)))
        longPress.minimumPressDuration = 1.0
        //将长按手势添加到需要实现长按操作的视图里
        myCollectionView?.addGestureRecognizer(longPress)
    }

    @objc func myHandleTableviewCellLongPressed(gestureRecognizer:UILongPressGestureRecognizer) {
        let pointTouch = gestureRecognizer.location(in: myCollectionView)//获取长按位置
        print(pointTouch)
        if gestureRecognizer.state == UIGestureRecognizer.State.began {
            print("长按开始\tUIGestureRecognizer.State.began")
            let indexPath = myCollectionView.indexPathForItem(at: pointTouch)//根位置 获取所在的indexPath
            if indexPath != nil {
                print("section = \(indexPath!.section), row = \(indexPath!.row)")
            }else{
                print("空")
            }
        }else if gestureRecognizer.state == UIGestureRecognizer.State.changed {
            print("长按状态改变\tUIGestureRecognizer.State.changed")
        }else if gestureRecognizer.state == UIGestureRecognizer.State.ended {
            print("长按结束\tUIGestureRecognizer.State.ended")
        }
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indentifier, for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }

}
