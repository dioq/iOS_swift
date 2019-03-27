//
//  MyShareViewController.swift
//  Swift_Info
//
//  Created by hello on 2018/11/26.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit

class MyShareViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage.init(named: "taobaoLogo")
    }
    
    /*在真机上测, 并且手机上有weichat、QQ、twitter、facebook、weibo等才能进行分享*/
    @IBAction func shareAction(_ sender: UIButton) {
        let textToShare = "this is a test for sharing.百度"
        let imageToShare = UIImage.init(named: "taobaoLogo")
        let urlToShare = NSURL.init(string: "http://www.google.com")
        let items = [textToShare,imageToShare ?? "WeShare",urlToShare ?? "WeShare"] as [Any]
        let activityVC = UIActivityViewController(activityItems: items,applicationActivities: nil)
        activityVC.completionWithItemsHandler =  { activity, success, items, error in
            if activity != nil{
                print(activity!)
            }
            print(success)
            if items != nil{
                print(items!)
            }
            if error != nil{
                print(error!)
            }
        }
        //排除哪些App
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.postToTwitter]
        self.present(activityVC, animated: true, completion: { () -> Void in
            
        })
    }
    
    /*
     // UIActivityType
     // 发布到Facebook
     UIActivity.ActivityType.postToFacebook     NS_AVAILABLE_IOS(6_0);
     // 发布到Twitter
     UIActivity.ActivityType.postToTwitter      NS_AVAILABLE_IOS(6_0);
     // 发布到新浪微博
     UIActivityTypePostToWeibo        NS_AVAILABLE_IOS(6_0);
     // 信息
     UIActivityTypeMessage            NS_AVAILABLE_IOS(6_0);
     // 邮件
     UIActivityTypeMail               NS_AVAILABLE_IOS(6_0);
     // 打印
     UIActivityTypePrint              NS_AVAILABLE_IOS(6_0);
     // 复制到剪切板
     UIActivityTypeCopyToPasteboard   NS_AVAILABLE_IOS(6_0);
     // 指定给联系人
     UIActivityTypeAssignToContact    NS_AVAILABLE_IOS(6_0);
     // 保存至本地相册(记得修改info.plist的隐私权限)
     UIActivityTypeSaveToCameraRoll   NS_AVAILABLE_IOS(6_0);
     // 添加到阅读列表(Safari)
     UIActivityTypeAddToReadingList   NS_AVAILABLE_IOS(7_0);
     // 发布到Flickr(图片分享网站)
     UIActivityTypePostToFlickr       NS_AVAILABLE_IOS(7_0);
     // 发布到Vimeo(视频分享网站)
     UIActivityTypePostToVimeo        NS_AVAILABLE_IOS(7_0);
     // 发布到腾讯微博
     UIActivityTypePostToTencentWeibo NS_AVAILABLE_IOS(7_0);
     // AirDrop
     UIActivityTypeAirDrop            NS_AVAILABLE_IOS(7_0);
     // 在iBooks内打开
     UIActivityTypeOpenInIBooks       NS_AVAILABLE_IOS(9_0);
     */
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
