//
//  PBBasePopView.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/28.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class PBBasePopView: UIView {
    
    var _superVc: UIViewController!
    var _contentHeight :CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //mark: - public methods
    
    /// 返回初始位置
    ///
    /// - Returns: 初始位置
    class func originalRect() -> CGRect {
        return CGRect(x: 0, y: ScreenHeight, width: ScreenWidth, height: 0)
    }
    
    /// 弹出视图
    ///
    /// - Parameters:
    ///   - superVc: 要加载到的视图
    ///   - title: 标题（可以不写）
    ///   - contentHeight: 内容高度，白色背景高度!!!
    ///   - animation: 注意到可能有些场景下不能有动画
    public func popFromSuperView(superVc: UIViewController, title: String, contentHeight: CGFloat, animation: Bool) {
        _superVc = superVc
        _contentHeight = contentHeight
        contentView.height = contentHeight
        if title.isEmpty {
            self.frame = CGRect(x: 0, y: ScreenHeight, width: ScreenWidth, height: _contentHeight)
            swipView.y = titleLabel.maxY
            titleLabel.removeFromSuperview()
        }else {
            swipView.y = titleLabel.maxY + 10
            self.frame = CGRect(x: 0, y: ScreenHeight, width: ScreenWidth, height: _contentHeight! + 16)
            self.addSubview(titleLabel)
            titleLabel.text = title
        }
        
        if animation == true {
            _superVc.view.addSubview(self)
            UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.y = ScreenHeight - self.height
            }, completion: nil)
        }else {
            _superVc.view.addSubview(self)
            self.y = ScreenHeight - self.height
        }
    }
    
    
    /// 视图消失
    public func dismissFromSuperView(animation: Bool) {
        if animation == true {
            UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.y = ScreenHeight
            }) { (true) in
                self.removeFromSuperview()
            }
        }else {
            self.y = ScreenHeight
            self.removeFromSuperview()
        }
    }
    
    //MARK: - touch event
     @objc func swipeGesture(_ swip:UISwipeGestureRecognizer) {
        if swip.direction == UISwipeGestureRecognizerDirection.down {
            self.swipDowm()
        }
    }
    
    public func swipDowm() {
        self.dismissFromSuperView(animation: true)
    }
    
    
    //MARK: - UI
    func initLayout() {
        self.backgroundColor = UIColor.clear
        self.addSubview(contentView)
        self.addSubview(titleLabel)
        self.addSubview(swipView)
        self.isUserInteractionEnabled = true
        let swip = UISwipeGestureRecognizer(target: self, action: #selector(PBBasePopView.swipeGesture(_ :)))
        swip.direction = UISwipeGestureRecognizerDirection.down
        self.addGestureRecognizer(swip)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 设置 子控件 frame, 也可以在这里使用自动布局
        contentView.corner(byRoundingCorners: [UIRectCorner.topLeft, UIRectCorner.topRight], radii: 20)
    }
    
    public lazy var contentView: UIView = {
        let contentView = UIView.init(frame: CGRect(x: 0, y: 16, width: ScreenWidth, height: 0))
        contentView.backgroundColor = UIColor.whiteColor()
        return contentView
    }()
    
    public lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: 115, height: 32))
        titleLabel.centerX = contentView.centerX
        titleLabel.backgroundColor = UIColor.mainColor()
        titleLabel.layer.cornerRadius = 16
        titleLabel.clipsToBounds = true
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.font = UIFont.font15()
        titleLabel.textColor = UIColor.whiteColor()
        return titleLabel
    }()
    
    public lazy var swipView: UIView = {
        let swipView = UIView.init(frame: CGRect(x: 0, y: titleLabel.maxY + 10, width: 55, height: 6))
        swipView.centerX = titleLabel.centerX
        swipView.layer.cornerRadius = swipView.height / 2.0
        swipView.layer.masksToBounds = true
        swipView.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "999999")
        return swipView
    }()

}
