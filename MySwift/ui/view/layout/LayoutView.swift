//
//  LayoutView.swift
//  Swift_Info
//
//  Created by hello on 2019/1/28.
//  Copyright © 2019 William. All rights reserved.
//

import UIKit

class LayoutView: UIView {

    /*
     这个方法，默认没有做任何事情，需要子类进行重写。 系统在很多时候会去调用这个方法：
     1.初始化不会触发layoutSubviews，但是如果设置了不为CGRectZero的frame的时候就会触发。
     2.addSubview会触发layoutSubviews
     3.设置view的Frame会触发layoutSubviews，当然前提是frame的值设置前后发生了变化
     4.滚动一个UIScrollView会触发layoutSubviews
     5.旋转Screen会触发父UIView上的layoutSubviews事件
     6.改变一个UIView大小的时候也会触发父UIView上的layoutSubviews事件
     **/
    override func layoutSubviews() {
        super.layoutSubviews()
        print("layoutSubviews")
    }

    /*如果有需要刷新的标记，立即调用layoutSubviews进行布局*/
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        print("layoutIfNeeded")
    }
    
    /*
     标记view需要重新布局，但是不会立刻刷新，系统会自动调用layoutSubviews，然后自行调用layoutIfNedded后，立刻刷新。
     **/
    override func setNeedsLayout() {
        super.setNeedsLayout()
        print("setNeedsLayout")
    }
    
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        print("setNeedsDisplay")
    }
    
    /*
     这个方法是用来重绘的。
     drawRect在以下情况下会被调用：
     1、如果在UIView初始化时没有设置rect大小，将直接导致drawRect不被自动调用。drawRect调用是在Controller->loadView, Controller->viewDidLoad 两方法之后掉用的.所以不用担心在控制器中,这些View的drawRect就开始画了.这样可以在控制器中设置一些值给View(如果这些View draw的时候需要用到某些变量值).
     2、该方法在调用sizeToFit后被调用，所以可以先调用sizeToFit计算出size。然后系统自动调用drawRect:方法。3、通过设置contentMode属性值为UIViewContentModeRedraw。那么将在每次设置或更改frame的时候自动调用drawRect:。4、直接调用setNeedsDisplay，或者setNeedsDisplayInRect:触发drawRect:，但是有个前提条件是rect不能为0。以上1,2推荐；而3,4不提倡
     drawRect方法使用注意点：
     1、若使用UIView绘图，只能在drawRect：方法中获取相应的contextRef并绘图。如果在其他方法中获取将获取到一个invalidate的ref并且不能用于画图。drawRect：方法不能手动显示调用，必须通过调用setNeedsDisplay 或者 setNeedsDisplayInRect，让系统自动调该方法。2、若使用calayer绘图，只能在drawInContext: 中（类似于drawRect）绘制，或者在delegate中的相应方法绘制。同样也是调用setNeedDisplay等间接调用以上方法3、若要实时画图，不能使用gestureRecognizer，只能使用touchbegan等方法来掉用setNeedsDisplay实时刷新屏幕
     **/
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("draw")
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        print("sizeThatFits")
        return CGSize.init()
    }
    
    /*
     sizeToFit会自动调用sizeThatFits方法；
     sizeToFit不应该在子类中被重写，应该重写sizeThatFits
     sizeThatFits传入的参数是receiver当前的size，返回一个适合的size
     sizeToFit可以被手动直接调用sizeToFit和sizeThatFits方法都没有递归，对subviews也不负责，只负责自己
     **/
    override func sizeToFit() {
        super.sizeToFit()
        print("sizeToFit")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        print("updateConstraints")
    }
    
}
