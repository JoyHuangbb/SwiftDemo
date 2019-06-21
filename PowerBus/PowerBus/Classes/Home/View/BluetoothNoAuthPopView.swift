//
//  BluetoothNoAuthPopView.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/29.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

@objc protocol BluetoothNoAuthPopViewProtocol: NSObjectProtocol {
    @objc optional func bluetoothNoAuthPopViewRefuseButtoncallBack()
    @objc optional func bluetoothNoAuthPopViewAllowButtoncallBack()
}

class BluetoothNoAuthPopView: PBBasePopView {
    
    weak var delegate: BluetoothNoAuthPopViewProtocol?
    
    class func retrunHeight() -> CGFloat {
        return 160
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - touch events
    @objc func refuseButtonClick() {
        if (delegate != nil) {
            delegate?.bluetoothNoAuthPopViewRefuseButtoncallBack!()
        }
    }
    
    @objc func allowButtonClick() {
        if (delegate != nil) {
            delegate?.bluetoothNoAuthPopViewAllowButtoncallBack!()
        }
    }
    
    //重写父类的滑动方法使该类无法滑动消失
    override func swipDowm() {
        
    }
    
    
    //MARK: - UI
    override func initLayout() {
        super.initLayout()
        self.addSubview(tipLabel)
        self.addSubview(refuseButton)
        self.addSubview(allowButton)
    }
    
    private lazy var tipLabel: UILabel = {
        let tipLabel = UILabel.init(frame: CGRect(x: 0, y: self.swipView.maxY + 25, width: ScreenWidth, height: 15))
        tipLabel.textAlignment = NSTextAlignment.center
        tipLabel.textColor = UIColor.textGrayColor()
        tipLabel.font = UIFont.font15()
        tipLabel.text = "请打开蓝牙权限以连接附近机柜"
        return tipLabel
    }()
    
    private lazy var refuseButton: UIButton = {
        let refuseButton = UIButton(type: UIButtonType.custom)
        refuseButton.frame = CGRect(x: (ScreenWidth - 30)/2.0 - 125, y: tipLabel.maxY + 15, width: 125, height: 40)
        refuseButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        refuseButton.setTitleColor(UIColor.white, for: UIControlState.highlighted)
        refuseButton.setTitle("拒绝", for: UIControlState.normal)
        refuseButton.titleLabel?.font = UIFont.font15()
        refuseButton.backgroundColor = UIColor.mainColor()
        refuseButton.addTarget(self, action:#selector(refuseButtonClick), for:.touchUpInside)
        refuseButton.setCornerRadius(refuseButton.height / 2.0)
        return refuseButton;
    }()
    
    private lazy var allowButton: UIButton = {
        let allowButton = UIButton(type: UIButtonType.custom)
        allowButton.frame = CGRect(x: ScreenWidth/2.0 + 15, y: refuseButton.y, width: refuseButton.width, height: refuseButton.height)
        allowButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        allowButton.setTitleColor(UIColor.white, for: UIControlState.highlighted)
        allowButton.setTitle("允许", for: UIControlState.normal)
        allowButton.titleLabel?.font = UIFont.font15()
        allowButton.backgroundColor = UIColor.mainColor()
        allowButton.addTarget(self, action:#selector(allowButtonClick), for:.touchUpInside)
        allowButton.setCornerRadius(refuseButton.height / 2.0)
        return allowButton;
    }()
}
