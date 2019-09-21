//
//  NicooPlayerVC.swift
//  Swift_Info
//
//  Created by hello on 2018/11/29.
//  Copyright © 2018 William. All rights reserved.
//

import UIKit
import NicooPlayer

class NicooPlayerVC: UIViewController {
    
    private lazy var fateherView: UIView = {
        let view = UIView()
        view.frame = CGRect(x:0, y: 100, width: ScreenWIDTH, height: ScreenHEIGHT * 9 / 16)
        view.backgroundColor = UIColor.gray
        return view
    }()
    //懒加载初始化播放器
    private lazy var playerView: NicooPlayerView = {
        let player = NicooPlayerView(frame: self.fateherView.bounds, bothSidesTimelable: true)
        player.videoLayerGravity = .resizeAspectFill
        player.delegate = self //调用网络出错时 的处理接口
        return player
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(fateherView)
//        let path = Bundle.main.path(forResource: "test", ofType: "mp4")
//        let url = URL.init(fileURLWithPath: path!)
        
//        let path = Bundle.main.path(forResource: "TPout", ofType: "swf")
//        let url = URL.init(fileURLWithPath: path!)
        
        let urlStr1 = "http://funbox-w6.dwstatic.com/80/12/1902/9001691-99-1546914911.mp4"
        let url = URL(string: urlStr1)
        
        playerView.playVideo(url, "VideoName", fateherView)
        // 初始化播放器，并从某个时间点开始播放
        //playerView.replayVideo(url, "视屏名称", fateherView, 10.0)
    }
    
}

extension NicooPlayerVC: NicooPlayerDelegate {
    
    func retryToPlayVideo(_ videoModel: NicooVideoModel?, _ fatherView: UIView?) {
        
    }
    
    func retryToPlayVideo(_ player: NicooPlayerView, _ videoModel: NicooVideoModel?, _ fatherView: UIView?) {
        print("网络不可用时调用")
        let url = URL(string: videoModel?.videoUrl ?? "")
        if  let sinceTime = videoModel?.videoPlaySinceTime, sinceTime > 0 {
            playerView.replayVideo(url, videoModel?.videoName, fatherView, sinceTime)
        }else {
            playerView.playVideo(url, videoModel?.videoName, fatherView)
        }
    }
    
}
