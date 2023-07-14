//
//  JXPopupViewVC.swift
//  Swift_Info
//
//  Created by hello on 2018/11/7.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit
import JXPopupView

class JXPopupViewVC: UIViewController {
    var contentView: TestAlertView!
    var animationIndex: Int = 0 //指定弹出的动画
    var containerView: UIView!
    @IBOutlet weak var customView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Dismiss", style: .plain, target: self, action: #selector(btnClick))
    }

    @IBAction func customViewDisplayButtonClicked(_ sender: UIButton) {
        containerView = customView
        displayPopupView()
    }
    
    @IBAction func vcviewDisplayButtonClicked(_ sender: UIButton) {
        containerView = self.view
        displayPopupView()
    }
    
    @IBAction func windowDisplayButtonClicked(_ sender: UIButton) {
        containerView = UIApplication.shared.keyWindow!
        displayPopupView()
    }
    
    func displayPopupView() {
        //- 确定contentView的目标frame
        contentView = Bundle.main.loadNibNamed("TestAlertView", owner: nil, options: nil)?.first as? TestAlertView
        let x: CGFloat = (containerView.bounds.size.width - 200)/2
        let y: CGFloat = (containerView.bounds.size.height - 200)/2
        contentView.frame = CGRect(x: x, y: y, width: 200, height: 200)
        animationIndex = Int(arc4random() % 7)
        //- 确定动画效果
        var animator: JXPopupViewAnimationProtocol?
        switch animationIndex {
        case 0:
            animator = JXPopupViewFadeInOutAnimator() //从中心直接显现(有动画)
        case 1:
            animator = JXPopupViewZoomInOutAnimator() //从中心由小到大出现
        case 2:
            animator = JXPopupViewUpwardAnimator() //从下往上现
        case 3:
            animator = JXPopupViewDownwardAnimator() //从上面出现 滑到中心(从上到下)
        case 4:
            animator = JXPopupViewLeftwardAnimator() //从右边出现 (从右到左)
        case 5:
            animator = JXPopupViewRightwardAnimator() //从左边出现 (从左到右)
        case 6:
            animator = JXPopupViewBaseAnimator() //从中心显现(无动画)
        default:
            break
        }
        let popupView = JXPopupView(containerView: containerView, contentView: contentView, animator: animator!)
        //配置交互
        popupView.isDismissible = true // 点击背景允许视图消失
        popupView.isInteractive = true //出现的视图允许交互
        //可以设置为false，再点击弹框中的button试试？
//        popupView.isInteractive = false
        popupView.isPenetrable = false
        //- 配置背景
        /*背景的色度 blur是毛玻璃 solidColor是固定色值 */
        popupView.backgroundView.style = JXPopupViewBackgroundStyle.solidColor //JXPopupViewBackgroundStyle.blur
        /*毛玻璃 的轻重*/
        popupView.backgroundView.blurEffectStyle = UIBlurEffect.Style.light //UIBlurEffect.Style.dark
        /*背景的透明度*/
        popupView.backgroundView.color = UIColor.black.withAlphaComponent(0.3)
        popupView.display(animated: true, completion: nil)
    }
    
    //回收弹框视图
    @objc func btnClick() {
        guard contentView != nil else {
            return
        }
        //通过extension提供的jx_popupView属性，获取JXPopupView进行操作，可以不用全局持有JXPopupView属性
        contentView.jx_popupView?.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
