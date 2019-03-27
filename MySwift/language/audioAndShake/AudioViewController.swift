//
//  AudioViewController.swift
//  Swift_stu
//
//  Created by William on 2018/8/7.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit
import AVFoundation //播放音效相关的API封装在AVFoundation框架中
import AudioToolbox

class AudioViewController: UIViewController {
    
    var systemSoundID:SystemSoundID = 0
    let path = Bundle.main.path(forResource: "soundEffect5", ofType: "mp3")
    var pathURL:NSURL!
    override func viewDidLoad() {
        super.viewDidLoad()
        pathURL = NSURL(fileURLWithPath: path!)
    }
    
    @IBAction func playAudio(_ sender: UIButton) {//播放
        AudioServicesCreateSystemSoundID(pathURL, &systemSoundID)
        AudioServicesPlaySystemSound(SystemSoundID(systemSoundID))
    }
    
    @IBAction func play2(_ sender: UIButton) {//播放且震动
        AudioServicesCreateSystemSoundID(pathURL, &systemSoundID)
        AudioServicesPlayAlertSound(SystemSoundID(systemSoundID))
    }
    
    @IBAction func play3(_ sender: UIButton) {//播放且监听
        AudioServicesCreateSystemSoundID(pathURL, &systemSoundID)
        AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(systemSoundID)) {
            print("播放完成了")
        }
    }
    
    @IBAction func play4(_ sender: UIButton) {//播放震动且监听
        AudioServicesCreateSystemSoundID(pathURL, &systemSoundID)
        AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(systemSoundID)) {
            print("播放震动完成")
        }
    }
    
    
    /** 另一个播放器,音量可调 **/
    var audioPlayer: AVAudioPlayer?
    @IBAction func play5(_ sender: UIButton) {
//        play9(sender)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: pathURL as URL)
            audioPlayer?.play()
//            audioPlayer?.volume = 80 //调节音量
        } catch {
            audioPlayer = nil
        }
    }
    
    //震动
    @IBAction func play9(_ sender: UIButton) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
