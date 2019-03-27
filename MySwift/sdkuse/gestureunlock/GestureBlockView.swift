//
//  GestureBlockView.swift
//  LJKPopShowView
//
//  Created by 李金奎 on 2018/4/25.
//  Copyright © 2018年 李金奎. All rights reserved.
//

import UIKit

class GestureBlockView: UIView {
    // 回传选择的
    var sendGestureClousure:((_ numbers:Array<String>)->Void)?
    
    var pointViews = [PointView]()
    var startPoint: CGPoint!
    var endPoint: CGPoint!
    var selectedView = [String]()
    var selectedViewCenter = [CGPoint]()
    var touchEnd: Bool!
    
    // MARK 懒加载
    lazy var linePath: UIBezierPath = {
        let path = UIBezierPath()
        return path
    }()
    lazy var lineLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        return layer
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        touchEnd = false
        initView()
    }
    func initView(){
        let width: CGFloat = self.bounds.width
        let height: CGFloat = self.bounds.height
        startPoint = CGPoint()
        endPoint = CGPoint()
        // 布局手势按钮
        for i in 0...8 {
            let fI: CGFloat = CGFloat(i)
            let pointView = PointView.init(frame: CGRect(x: (fI.truncatingRemainder(dividingBy: 3)) * (width/2-31)+1, y: CGFloat(i/3)*(height/2-31)+1, width: 60, height: 60), ID: String.init(format: "%d", i + 1))
            self.addSubview(pointView)
            self.pointViews.append(pointView)
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.touchEnd {
            return
        }
        for touche: AnyObject in touches {
            let touch: UITouch = touche as! UITouch
            let point = touch.location(in: self)
            // 判断手势滑动是否在手势按钮范围
            for item in self.pointViews {
                let pointView: PointView = item
                //滑动到手势按钮范围，记录状态
                if pointView.frame.contains(point){
                    //如果开始按钮为zero，记录开始按钮，否则不需要记录开始按钮
                    if (self.startPoint.equalTo(CGPoint())) {
                        self.startPoint = pointView.center;
                    }
                    //判断该手势按钮的中心点是否记录，未记录则记录
                    if(!self.selectedViewCenter.contains(where: { (element) -> Bool in
                        return element == pointView.center
                    })){
                        self.selectedViewCenter.append(pointView.center)
                    }
                    //判断该手势按钮是否已经选中，未选中就选中
                    if (!self.selectedView.contains(where: { (element) -> Bool in
                        return element == pointView.ID
                    })){
                        self.selectedView.append(pointView.ID)
                        pointView.isSelected = true
                    }
                    
                }
                //如果开始点位不为zero则记录结束点位，否则跳过不记录
                if !self.startPoint.equalTo(CGPoint()) {
                    self.endPoint = point
                    drawLines()
                }
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //结束手势滑动的时候，将结束按钮设置为最后一个手势按钮的中心点，并画线
        self.endPoint = self.selectedViewCenter.last
        //如果endPoint还是为zero说明未滑动到有效位置，不做处理
        if self.endPoint.equalTo(CGPoint()) {
            return
        }
        self.drawLines()
        // 改变是欧式滑动结束的状态，为yes则无法再滑动手势划线
        self.touchEnd = true
        // 设置手势，返回设置的时候密码，否则继续下面的操作进行手势解锁
        // 手势密码不得小于4个点, 小于4个时把之前的所有痕迹
        if self.selectedView.count < 4{
            self.touchEnd = false
            for item in self.pointViews{
                let pointView: PointView = item
                pointView.isSelected = false
            }
            self.lineLayer.removeFromSuperlayer()
            self.selectedView.removeAll()
            self.startPoint = CGPoint()
            self.endPoint = CGPoint()
            self.selectedViewCenter.removeAll()
            return
        }
        
        if self.sendGestureClousure != nil {
            self.sendGestureClousure!(self.selectedView)
        }
    }
    
    func drawLines(){
        //结束手势滑动，不画线
        if self.touchEnd {
            return
        }
        // 移除path的点和lineLayer
        self.lineLayer.removeFromSuperlayer()
        self.linePath.removeAllPoints()
        // 画线
        self.linePath.move(to: self.startPoint)
        for item in self.selectedViewCenter {
            let pointValue: CGPoint = item
            self.linePath.addLine(to: pointValue)
        }
        self.linePath.addLine(to: self.endPoint)
        self.lineLayer.path = self.linePath.cgPath
        self.lineLayer.lineWidth = 4
        self.lineLayer.strokeColor = UIColor.init(red: 30/255, green: 180/255, blue: 244/255, alpha: 1.0).cgColor
        self.lineLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(self.lineLayer)
        self.layer.masksToBounds = true
    }
    
    //重置
    func reset() {
        self.touchEnd = false
        for item in self.pointViews{
            let pointView: PointView = item
            pointView.isSelected = false
        }
        self.lineLayer.removeFromSuperlayer()
        self.selectedView.removeAll()
        self.startPoint = CGPoint()
        self.endPoint = CGPoint()
        self.selectedViewCenter.removeAll()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
