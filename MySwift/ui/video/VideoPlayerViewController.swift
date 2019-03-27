//
//  AVPlayerViewController.swift
//  Swift_Info
//
//  Created by hello on 2018/11/29.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class VideoPlayerViewController: UIViewController {
    
    var player1:AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "play", style: .done, target: self, action: #selector(onClickPop))
    }
    
    @objc private func onClickPop(){
        let items: [String] = ["AVPlayer","pause","AVPlayerVC","推出"]
        let imgSource: [String] = ["contact", "contact", "contact", "contact"]
        NavigationMenuShared.showPopMenuSelecteWithFrameWidth(width: 120, height: 160, point: CGPoint(x: ScreenInfo.Width - 30, y: 0), item: items, imgSource: imgSource) { (index) in
            ///点击回调
            switch index{
            case 0:
                self.playerAction()
            case 1:
                self.player1.pause()
            case 2:
                self.playerAction1()
            case 3:
                self.player3()
            default:
                break
            }
        }
    }
    
    func playerAction() {
        for subview in self.view.subviews {//清除view上的所有视图
            subview.removeFromSuperview()
        }
        
//        let path = Bundle.main.path(forResource: "test", ofType: "mp4")

//        let url = URL.init(fileURLWithPath: path!)
        
        let url = URL.init(string: "http://pgmp9uwd0.bkt.clouddn.com/lu9IwKCPpLzin0AfhhffmeSgdiuQ.mp4?e=1543410570&token=pdWiVNxb2DqpyUOFuE1N_VudRUqNehUfpM-Jzsnd:-Ho6wikEpsXs2FhXsiNRqF5ykSE=")
        
        player1 = AVPlayer.init(url: url!)
        let layer = AVPlayerLayer.init(player: player1)
        layer.frame = CGRect(x: 0, y: 0, width: ScreenWIDTH, height: ScreenHEIGHT)
        view.layer.addSublayer(layer)
        player1.play()
    }
    
    func playerAction1() {
        for subview in self.view.subviews {//清除view上的所有视图
            subview.removeFromSuperview()
        }
//        for layer1 in view.layer.sublayers {
//
//        }
        
        let path = Bundle.main.path(forResource: "test", ofType: "mp4")
        let url = URL.init(fileURLWithPath: path!)
        
        let player = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        //添加view播放的模式
        playerViewController.view.frame = CGRect(x: 20, y: 100, width: self.view.bounds.width - 40, height: 200)
        self.addChild(playerViewController)
        self.view.addSubview(playerViewController.view)
    }

    //作为视图控制器弹窗
    func player3() {
        let path = Bundle.main.path(forResource: "test", ofType: "mp4")
        let url = URL.init(fileURLWithPath: path!)
        //控制器推出的模式
        let player = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        player.play()
        self.present(playerViewController, animated:true, completion: nil)
    }
    
}
