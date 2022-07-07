//
//  MyUIViewController.swift
//  Swift
//
//  Created by William on 2018/10/21.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class MyUIViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    
    //懒加载
    lazy var dataArray:[UIViewController] = {
        var dataArray = Array<UIViewController>()
        
        let steperVC = UISteperVC()
        steperVC.title = "UIStepper"
        dataArray.append(steperVC)
        
        let fontVC = MyFontViewController()
        fontVC.title = "自定义字体"
        dataArray.append(fontVC)
        
        let imageVC = IMGVViewController()
        imageVC.title = "imageview"
        dataArray.append(imageVC)
        
        let skillNiblVC = Nib1ViewController()
        skillNiblVC.title = "xib使用技巧"
        dataArray.append(skillNiblVC)
        
        let nibVC = NibViewController()
        nibVC.title = "演示xib + autolayerout"
        dataArray.append(nibVC)
        
        let touchVC = UITouchViewController()
        touchVC.title = "UITouch"
        dataArray.append(touchVC)
        
        let toolBarVC = ToolBarViewController()
        toolBarVC.title = "UIToolbar"
        dataArray.append(toolBarVC)
        
        let scrollVC2 = Scroll2ViewController()
        scrollVC2.title = "UIScrollView2"
        dataArray.append(scrollVC2)
        
        let scrollVC = ScrollViewController()
        scrollVC.title = "UIScrollView"
        dataArray.append(scrollVC)
        
        let searchVC = SearchViewController()
        searchVC.title = "search"
        dataArray.append(searchVC)
        
        let segmentVC = UISegmentedControlVC()
        segmentVC.title = "UISegmentedControl"
        dataArray.append(segmentVC)
        
        let switchVC = UISwitchVC()
        switchVC.title = "UISwitch"
        dataArray.append(switchVC)
        
        let labelVC = LabelViewController()
        labelVC.title = "UILabel"
        dataArray.append(labelVC)
        
        let photoVC = PhotosViewController()
        photoVC.title = "Photos"
        dataArray.append(photoVC)
        
        let pickImageVC = PickImageViewController()
        pickImageVC.title = "UIImagePickerController"
        dataArray.append(pickImageVC)
        
        let avplayerVC = VideoPlayerViewController()
        avplayerVC.title = "视频播放"
        dataArray.append(avplayerVC)
        
        let pickerVC = PickerViewVC()
        pickerVC.title = "UIPickerView"
        dataArray.append(pickerVC)
        
        let closureVC = ClosureVC()
        closureVC.title = "闭包"
        dataArray.append(closureVC)
        
        let datePickerVC = DatePickerVC()
        datePickerVC.title = "DatePicker"
        dataArray.append(datePickerVC)
        
        let webVC = UIWebViewVC()
        webVC.title = "UIWebView"
        dataArray.append(webVC )
        
        let wk2 = WKWebViewHandleVC()
        wk2.title = "WKWebView使用delegate"
        dataArray.append(wk2)
        
        let wk = WKWebViewVC()
        wk.title = "WKWebView"
        dataArray.append(wk)
        
        let gesture = GestureVC()
        gesture.title = "手势"
        dataArray.append(gesture)
        
        let foldCellVC = FoldCellViewController()
        foldCellVC.title = "折叠 Cell"
        dataArray.append(foldCellVC)
        
        let moveVC = MoveCellVC()
        moveVC.title = "cell交换位置"
        dataArray.append(moveVC)
        
        let waterFallVC = WaterFallViewController()
        waterFallVC.title = "瀑布流"
        dataArray.append(waterFallVC)
        
        let scrollCell = ScrollCellViewController()
        scrollCell.title = "滚动cell"
        dataArray.append(scrollCell)
        
        let sessionVC = SessionViewController()
        sessionVC.title = "session的相关处理"
        dataArray.append(sessionVC)
        
        let handleCellVC = HandleCellVC()
        handleCellVC.title = "操作cell"
        dataArray.append(handleCellVC)
        
        let editingCellVC = EditingCellVC()
        editingCellVC.title = "可编辑cell"
        dataArray.append(editingCellVC)
        
        let singleSelectedVC = SingleSelectedVC()
        singleSelectedVC.title = "tableview单选cell"
        dataArray.append(singleSelectedVC)
        
        let selectedTBVC = MultipleSelectedTBVC()
        selectedTBVC.title = "tableview多选cell"
        dataArray.append(selectedTBVC)
        
        let myTBViewVC = MyTBViewVC()
        myTBViewVC.title = "自定义代码cell"
        dataArray.append(myTBViewVC)
        
        let myTabelviewVC = MyTabelviewVC()
        myTabelviewVC.title = "table自定义xib cell"
        dataArray.append(myTabelviewVC)
        
        let headerFooterTBVC = HeaderFooterTBVC()
        headerFooterTBVC.title = "tableView HeaderAndFooter"
        dataArray.append(headerFooterTBVC)
        
        let twoCellTBVC = TwoCellTBVC()
        twoCellTBVC.title = "加载两种不同的cell"
        dataArray.append(twoCellTBVC)
        
        let sectionCVVC = SectionCollectionView()
        sectionCVVC.title = "section collectionView"
        dataArray.append(sectionCVVC)
        
        let myCollectionViewVC = MyCollectionViewVC()
        myCollectionViewVC.title = "纯代码collectionView"
        dataArray.append(myCollectionViewVC)
        
        let selectedVC = SingleSelectedCellVC()
        selectedVC.title = "CollectionView单选cell"
        dataArray.append(selectedVC)
        
        let multipCVVC = MultipleSelectedCVVC()
        multipCVVC.title = "CollectionView多选选cell"
        dataArray.append(multipCVVC)
        
        let editCollectionCellVC = EditCollectionCellVC()
        editCollectionCellVC.title = "操作CollectionViewCell"
        dataArray.append(editCollectionCellVC)
        
        let collectionViewVC = CollectionViewVC()
        collectionViewVC.title = "xib collectionViewCell"
        dataArray.append(collectionViewVC)
        
        let collectionVC = CollectionVC()
        collectionVC.title = "collectionView xib"
        dataArray.append(collectionVC)
        
        let pointVC = PointViewController()
        pointVC.title = "点击监控"
        dataArray.append(pointVC)
        
        let layoutVC = LayoutViewController()
        layoutVC.title = "iOS layout的相关方法"
        dataArray.append(layoutVC)
        
        let viewVC = ViewVC()
        viewVC.title = "自定义xib view"
        dataArray.append(viewVC)
        
        let animationVC = AnimationVC()
        animationVC.title = "动画效果"
        dataArray.append(animationVC)
        
        let ani2 = AnimationVC2()
        ani2.title = "播放动画"
        dataArray.append(ani2)
        
        let pasteboardVC = UIPasteboardVC()
        pasteboardVC.title = "UIPasteboard"
        dataArray.append(pasteboardVC)
        
        let alertViewController = AlertViewController()
        alertViewController.title = "提示框UIAlertController"
        dataArray.append(alertViewController)
        
        let buttonViewController = ButtonViewController()
        buttonViewController.title = "button"
        dataArray.append(buttonViewController)
        
        let textViewVC = TextViewVC()
        textViewVC.title = "TextView"
        dataArray.append(textViewVC)
        
        let textFieldViewController = TextFieldViewController()
        textFieldViewController.title = "TextField"
        dataArray.append(textFieldViewController)
        
        let defineView = DefineViewVC()
        defineView.title = "定义一个视图"
        dataArray.append(defineView)
        
        return dataArray
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "UI"
        //设置数据源
        myTableView.dataSource = self
        //设置代理
        myTableView.delegate = self
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        myTableView.tableFooterView = UIView()
    }
    
    //设置每个seccion的row数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    //设置section的数量
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //设置tableview的cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        let vc = dataArray[indexPath.row]
        cell.textLabel?.text = vc.title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    //点击cell触发
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = dataArray[indexPath.row]
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    
}
