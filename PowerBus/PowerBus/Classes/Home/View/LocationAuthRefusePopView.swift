//
//  LocationAuthRefusePopView.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/29.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class LocationAuthRefusePopView: PBBasePopView {
    
    var timer: Timer!
    var timeNum:Float = 4

    class func retrunHeight() -> CGFloat {
        return 130
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - private methods
    @objc func timeGo() {
        timeNum = timeNum - 1
        
        if timeNum <= 0 {
            stopTimer()
            self.dismissFromSuperView(animation: true)
        }else {
            tipLabel.text = String(format: "%ld秒后关闭", Int(timeNum))
        }
    }
    
    func stopTimer() {
        if timer != nil {
            timer!.invalidate() //销毁timer
            timer = nil
        }
    }
    
    //重写父类的滑动方法使该类无法滑动消失
    override func swipDowm() {
        
    }
    
    override func dismissFromSuperView(animation: Bool) {
        super.dismissFromSuperView(animation: animation)
        self.stopTimer()
    }
    
    //MARK: - UI
    override func initLayout() {
        super.initLayout()
        self.addSubview(tipLabel)
        self.addSubview(logoImageView)
        self.addSubview(messageLabel)
        //开启定时服务
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeGo), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    private lazy var tipLabel: UILabel = {
        let tipLabel = UILabel.init(frame: CGRect(x: 0, y: self.swipView.maxY + 5, width: ScreenWidth, height: 15))
        tipLabel.textAlignment = NSTextAlignment.center
        tipLabel.textColor = UIColor.textGrayColor()
        tipLabel.font = UIFont.font12()
        tipLabel.text = "3秒后关闭"
        return tipLabel
    }()
    
    private lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView(frame: CGRect(x: 40, y: tipLabel.maxY + 10, width: 32, height: 32))
        logoImageView.image = UIImage.init(named: "圆角矩形688拷贝")
        logoImageView.contentMode = UIViewContentMode.scaleAspectFill
        logoImageView.setCornerRadius(logoImageView.height / 2.0)
        return logoImageView
    }()
    
    private lazy var messageLabel: UILabel = {
        let messageLabel = UILabel.init(frame: CGRect(x: logoImageView.maxX + 10, y: tipLabel.maxY, width: self.width - (logoImageView.maxX * 2 + 20), height: 50))
        messageLabel.textAlignment = NSTextAlignment.center
        messageLabel.textColor = UIColor.textBlackColor()
        messageLabel.font = UIFont.font15()
        messageLabel.numberOfLines = 0
        messageLabel.text = "如不打开定位权限将限制软件定位功能无法使用！"
        return messageLabel
    }()
}
