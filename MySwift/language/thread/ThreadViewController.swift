//
//  ThreadViewController.swift
//  Swift_stu
//
//  Created by William on 2018/8/15.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class ThreadViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    //xib 添加的button的点击事件都在mainThread
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //开子线程2
    @IBAction func action5(_ sender: UIButton) {
        self.performSelector(inBackground: #selector(newTest(sender:)), with: "a message")
        let currentThread = Thread.current
        print("当前线程为:\(currentThread)\t\tname:\(currentThread.name!)")
    }
    @objc func newTest(sender:String){
        let currentThread = Thread.current
        print("当前线程为:\(currentThread)\t\tname:\(currentThread.name!)")
        print(sender)
    }
    
    
    //开子线程
    @IBAction func action04(_ sender: UIButton) {
        // 程序启动后开子线程下载图片,图片下载完成之后回到主线程设置图片
//        Thread.detachNewThreadSelector(#selector(downloadImage), toTarget: self, with: nil)
        let thread = Thread.init(target: self, selector:#selector(downloadImage), object: nil)
        thread.name = "Dio"
        thread.start()
    }
    @objc func downloadImage() {
        // 获得要下载图片的url
        let url = URL.init(string: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png")
        // 把url地址指向资源的二进制下载到本地
        let imageData = try? Data.init(contentsOf: url!)
        // 把二进制数据转换为图片
        if imageData != nil{
            let image = UIImage.init(data: imageData!)
            // 打印查看当前线程(应该是在子线程中下载图片)
            print("当前线程为\(Thread.current)")
            
            // 线程间通信,回到主线程
            self.performSelector(onMainThread: #selector(showImage(image:)), with: image, waitUntilDone:true)
        }
    }
    @objc func showImage(image:UIImage) {
        myImageView.image = image
        print("处理UI刷新操作的线程:\(Thread.current)")
    }
    
    
    // 设置总票数为100张
    var totalTickets = 100
    @IBAction func action03(_ sender: UIButton) {
        // 创建三条线程分别代表售票员A、售票员B、售票员C
        let thread01 = Thread.init(target: self, selector:#selector(saleTickect), object: nil)
        let thread02 = Thread.init(target: self, selector:#selector(saleTickect), object: nil);
        let thread03 = Thread.init(target: self, selector:#selector(saleTickect), object: nil);
        // 设置线程的名称
        thread01.name = "售票员A"
        thread02.name = "售票员B"
        thread03.name = "售票员C"
        // 开启线程
        thread01.start()
        thread02.start()
        thread03.start()
    }
    // 模拟售票的函数
    @objc func saleTickect() {
        while(true) {
            // 加互斥锁
            /*
             * 1）同OC中的@synchronized(self) {}
             * 2）objc_sync_enter(self)和objc_sync_exit(self)必须成对使用,把要加锁的代码放在中间
             */
            objc_sync_enter(self)
            // 检查是否有余票,如果有则卖出去一张
            Thread.sleep(forTimeInterval: 1)
            let temp = totalTickets
            if(temp > 0) {
                totalTickets = temp - 1
                print("\(Thread.current.name!)卖出去了一张票,还剩\(totalTickets)")
            } else {
                print("\(Thread.current.name!)发现票已经卖完了")
                break
            }
            objc_sync_exit(self)
        }
    }
    
    
//    手动开线程
    @IBAction func action02(_ sender: UIButton) {
        let currentThread = Thread.current
        print("当前线程为:\(currentThread)\t\tname:\(currentThread.name!)")
        let mythread = Thread.init(target: self, selector: #selector(threadFunc01), object: nil)
        mythread.name = "线程A"
        mythread.start()
        print("go main thread!!")
    }
    @objc func threadFunc01() {
        print("go threadFunc01 up")
        let currentThread = Thread.current
        print("当前线程为:\(currentThread)\t\tname:\(currentThread.name!)")
        Thread.sleep(forTimeInterval: 10)
        print("go threadFunc01 down")
    }
    
    
    //线程休眠
    @IBAction func action01(_ sender: UIButton) {
        print("11111 go here!!!")
        let closure = {(val1: Int, val2: Int) -> Bool in
            print("444444in is here!!")
            Thread.sleep(forTimeInterval: 3)
            print("closure is here!!")
            return val1 > val2
        }
        print("22222out is here!!")
        let yes:Bool = closure(18, 16)
        print("33333out is here!!")
        print(yes)
    }

}
