//
//  GCDViewController.swift
//  Swift_stu
//
//  Created by William on 2018/8/13.
//  Copyright © 2018年 William. All rights reserved.
//

import UIKit

class GCDViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //同步: 会阻塞当前线程.原因:不开启新的线程,使用当前线程
    @IBAction func syncAction(_ sender: UIButton) {
        let queue = DispatchQueue.global(qos: .default)
        queue.sync {
            print("target is starting")
            print(Thread.current,"======  sync")
            sleep(5)
            print("target is finished")
        }
        print(Thread.current,"======  out")
        print("the last line! ==== go here!")
    }
    //异步: 不会阻塞当前线程.原因:开启一条新线程,不使用当前线程,在新开启的线程中执行任务
    @IBAction func asyncAction(_ sender: UIButton) {
        let queue = DispatchQueue.global(qos: .default)
        queue.async {
            print("target is starting")
            print(Thread.current,"======  async")
            sleep(5)
            print("target is finished")
        }
        print(Thread.current,"======  out")
        print("the last line! ==== go here!")
    }
    
    //并发队列: 任务以FIFO从序列中移除，然后并发运行，可以按照任何顺序完成。用多条线程执行队列中所有任务
    @IBAction func concurrentAction(_ sender: UIButton) {
        let concurrentQueue = DispatchQueue.init(label: "con", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit)
        
        concurrentQueue.async {
            sleep(4)
            print(Thread.current,"======  1")
        }
        
        concurrentQueue.async {
            sleep(3)
            print(Thread.current,"======  2")
        }
        
        concurrentQueue.async {
            print(Thread.current,"======  3")
        }
        
        concurrentQueue.async {
            sleep(2)
            print(Thread.current,"======  4")
        }
        
        concurrentQueue.async {
            sleep(1)
            print(Thread.current,"======  5")
        }
    }
    
    //串行队列: 任务以FIFO从序列中一个一个执行。一次只调度一个任务，队列中的任务一个接着一个地执行（一个任务执行完毕后，再执行下一个任务）用一条线程处理队列中所有任务
    @IBAction func serialQueue(_ sender: UIButton) {
        let serialQueue = DispatchQueue.init(label: "serial")
        
        serialQueue.async {
            sleep(4)
            print(Thread.current,"======  1")
        }
        
        serialQueue.async {
            sleep(3)
            print(Thread.current,"======  2")
        }
        
        serialQueue.async {
            print(Thread.current,"======  3")
        }
        
        serialQueue.async {
            sleep(2)
            print(Thread.current,"======  4")
        }
        
        serialQueue.async {
            sleep(1)
            print(Thread.current,"======  5")
        }
    }
    
    //最大并发量
    @IBAction func action03(_ sender: UIButton) {
        /*
         信号量。用于控制访问资源的数量。比如系统有两个资源可以被利用，同时有三个线程要访问，只能允许两个线程访问，第三个会等待资源被释放后再访问。
         信号量的初始化方法：DispatchSemaphore.init(value: Int)，value表示允许访问资源的线程数量，当value为0时对访问资源的线程没有限制。
         信号量配套使用wait()函数与signal()函数控制访问资源。
         wait函数会阻塞当前线程直到信号量计数大于或等于1，当信号量大于或等于1时，将信号量计数-1, 然后执行后面的代码。signal()函数会将信号量计数+1。
         */
        
        //获取系统存在的全局队列
        let queue = DispatchQueue.global(qos: .default)
        //使用信号量保证正确性
        let n = 1 //最大并发量为n
        let semaphore = DispatchSemaphore(value: n) // 创建信号量，控制同时访问资源的最大线程数为n
        for i in 1...10 {
            queue.async {
                semaphore.wait() // 如果信号量计数>=1,将信号量计数减1;当信号量==0时等待
                print("finished:\(i)")
                semaphore.signal()//发信号，使原来的信号计数值+1
            }
        }
    }
    
    //concurrentPerform 指定次数的Block追加到队列中
    @IBAction func action02(_ sender: UIButton) {
        /*
         DispatchQueue.concurrentPerform函数是sync函数和Dispatch Group的关联API。按指定的次数将指定的Block追加到指定的Dispatch Queue中，并等待全部处理执行结束。
         因为concurrentPerform函数也与sync函数一样，会等待处理结束，因此推荐在async函数中异步执行concurrentPerform函数。concurrentPerform函数可以实现高性能的循环迭代。
         */
        
        //获取系统存在的全局并发队列
        let queue = DispatchQueue.global(qos: .default)
        //定义一个异步步代码块
        queue.async {
            //通过concurrentPerform，循环变量数组
            DispatchQueue.concurrentPerform(iterations: 6) {(index) -> Void in
                print(index)
            }
            
            //执行完毕，主线程更新
            DispatchQueue.main.async {
                print("done")
            }
        }
    }
    
    //多任务等待
    @IBAction func manyTagetAction(_ sender: UIButton) {
        //获取系统存在的全局并发队列
        let queue = DispatchQueue.global(qos: .default)
        //定义一个group
        let group = DispatchGroup()
        //并发任务，在队列中顺序执行
        queue.async(group: group) {
            sleep(2)
            print("block1")
        }
        queue.async(group: group) {
            print("block2")
        }
        queue.async(group: group) {
            print("block3")
        }
        
        //1,所有任务执行结束汇总，不阻塞当前线程
        //执行完上面的三个耗时操作(block1, block2, block3), 回到queue队列中执行下一步的任务
        group.notify(queue: queue) {
            print("group done")
        }
        print("接下来的操作   1")
        
        //2,等待上面任务(block1, block2, block3)执行，会阻塞当前线程，超时就执行下面的，上面的继续执行。可以无限等待 .distantFuture
        let result = group.wait(timeout: .now() + 10.0)
        switch result {
        case .success:
            sleep(2)
            print("不超时, 上面所有任务都执行完")
        case .timedOut:
            sleep(2)
            print("超时了, 上面的任务还没执行完")
        }
        print("接下来的操作   2")
    }
    
    
    /*
     网络请求我们一般都用异步的，并不知道什么时候是否完成了。如果想等所有网络请求都完成后，再执行通知，需要用下面的方法
     使用dispatch_group_enter(group)和dispatch_group_leave(group)，这种方式使用更为灵活，enter和leave必须配合使用，有几次enter就要有几次leave，否则group会一直存在, 造成死锁。当所有enter的block都leave后，会执行dispatch_group_notify的block。
     */
    @IBAction func targetFinished(_ sender: UIButton) {
        //创建一个并发队列
        let queue = DispatchQueue(label: "labelname", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit)
        //定义一个group
        let group = DispatchGroup()
        
        group.enter()
        queue.async(group: group) {
            let myqueue = DispatchQueue.init(label: "queue1")
            myqueue.asyncAfter(deadline: .now() + 2.0) {//在子线程执行
                print("异步网络任务1:请求完成!")
                group.leave()
            }
            print("finished 1")
        }
        
        group.enter()
        queue.async(group: group) {
            DispatchQueue.global().async {
                print("异步网络任务2:请求完成!")
                group.leave()
            }
            print("finished 2")
        }
        
        group.enter()
        queue.async(group: group) {
            DispatchQueue.global().asyncAfter(deadline: .now() + 3.0, execute: {
                print("异步网络任务3:请求完成!")
                group.leave()
            })
            print("finished 3")
        }
        
        /**
         可以试下去掉所有的group.enter()和group.leave(),去掉后异步任务还没执行完group.notify()就开始执行了
         对于异步任务来说，发起之后就算执行完了(并不会阻塞当前线程)
         */
        
        //1,所有任务执行结束汇总，不阻塞当前线程
        //执行完上面的三个耗时操作(block1, block2, block3), 回到主队列刷新页面
        group.notify(queue: DispatchQueue.main) {
            print("所有网络任务都完成了,刷新页面")
        }
        print("接下来的操作   1")
        
        //2,等待上面任务(block1, block2, block3)执行，会阻塞当前线程，超时就执行下面的，上面的继续执行。可以无限等待 .distantFuture
        let result = group.wait(timeout: .now() + 10.0)
        switch result {
        case .success:
            sleep(2)
            print("不超时, 上面所有任务都执行完")
        case .timedOut:
            sleep(2)
            print("超时了, 上面的任务还没执行完执行这了")
        }
        print("the last line! ==== go here!")
    }
    
    @IBAction func barrierAction(_ sender: UIButton) {
        let currentQueue = DispatchQueue.init(label: "queueID", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit)
        currentQueue.async {
            sleep(2)
            print("target1 finished")
        }
        
        currentQueue.async {
            sleep(1)
            print("target2 finished")
        }
        //障碍,等队列前面的所有任务都执行完，后面的才会执行
        currentQueue.async(flags: .barrier) {
            print("taget1 target2 is finished")
        }
        
        currentQueue.async {
            sleep(1)
            print("target3 finished")
        }
        
        currentQueue.async {
            print("target4 finished")
        }
        print("the last line! ==== go here!")
    }
    
    @IBAction func action01(_ sender: UIButton) {
        let deadline = DispatchTime.now() + 2.0
        print(#line,"Start")
        DispatchQueue.main.asyncAfter(deadline: deadline) {//在主线程执行
            print(#line,"End")
        }
        print(#line," go here!")
        
        //把任务添加到主队列中,一般用在子线程任务完成后更新UI(无延迟或延迟为0)
        print(#line,"Start")
        DispatchQueue.main.async {
            print(#line,"End")
        }
        print(#line," go here!")
        
        print(#line,"Start")
        DispatchQueue.global().asyncAfter(deadline: deadline) {//在子线程执行
            print(#line,"End")
        }
        print(#line," go here!")
    }
    
}
