//
//  SectionCollectionView.swift
//  Swift_Info
//
//  Created by hello on 2018/12/26.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class SectionCollectionView: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    let indentifier = "mycell"
    let reuseIdentifierHeader = "header1314"
    let reuseIdentifierFooter = "footer1313"
    
    var dataArray = [["A1","B1","C1","D1","E1","F1","G1","H1","I1","J1","K1","L1","M1","N1"],["A2","B2","C2","D2","E2","F2","G2","H2","I2","J2","K2","L2","M2","N2"],["A3","B3","C3","D3","E3","F3","G3","H3","I3","J3","K3","L3","M3","N3"],["A4","B4","C4","D4","E4","F4","G4","H4","I4","J4","K4","L4","M4","N4"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "section collectionView"
        
        let layout = UICollectionViewFlowLayout()
        //Layout大小 长与宽
        layout.itemSize = CGSize(width:80,height:80)
        //列间距,行间距,偏移
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        myCollectionView.collectionViewLayout = layout
        myCollectionView?.delegate = self
        myCollectionView?.dataSource = self
        //注册cell
        myCollectionView!.register(UINib.init(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:indentifier)
        //注册Header
        myCollectionView.register(UINib.init(nibName: "CollectionHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifierHeader)
        //注册Footer
        myCollectionView.register(UINib.init(nibName: "CollectionFooter", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: reuseIdentifierFooter)
    }
    
    //分区个数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataArray.count
    }
    
    //每个区的item个数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray[section].count
    }
    
    //Collectionview 的sectionhead 和footview 和uitableview不同,反倒和uitableviewcell 是一种写法
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableview = UICollectionReusableView()
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifierHeader, for: indexPath)
            headerView.backgroundColor = UIColor.yellow
            reusableview = headerView
        }
        else if kind == UICollectionView.elementKindSectionFooter {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifierFooter, for: indexPath)
            footerView.backgroundColor = UIColor.blue
            reusableview = footerView
        }
        
        return reusableview
    }
    
    
    /// UICollectionViewDelegateFlowLayout       (注:设置session header和footer尺寸时,必须已经添加了header和footer,否则会报错)
    //Collectionview的header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: ScreenWIDTH, height: 150)
    }
    //Collectionview的footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: ScreenWIDTH, height: 150)
    }
    
    //自定义cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indentifier, for: indexPath) as! MyCollectionViewCell
        cell.backgroundColor = UIColor.red
        cell.titleLB.text = dataArray[indexPath.section][indexPath.row]
        return cell
    }

}
