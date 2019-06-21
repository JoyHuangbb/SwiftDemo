//
//  BluetoothConnectVC.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/30.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

enum BluetoothConnectType: Int {
    case LoanMachine = 0 //租借的时候
    case ReturnMachine = 1 //归还的时候
}

class BluetoothConnectVC: BaseViewController {
    
    public var connectType:Int = 0

    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - private methods
    //开始链接
    func connectStart() {
        self.logoImageView.image = UIImage.init(named: "组35")
        self.logoImageView.frame = CGRect(x: 0, y: 0, width: ScreenWidth * 0.64, height: ScreenWidth * 0.64 * 17/50)
        self.logoImageView.center = self.view.center
        self.titleLabel.text = "等待蓝牙连接"
        self.tipLabel.text = "机柜正在使用，请稍等片刻尝试连接！"
        self.tip2Label.text = "正在等待中....."
    }
    
    //链接成功
    func connectSuccess() {
        self.logoImageView.image = UIImage.init(named: "Verify")
        self.logoImageView.frame = CGRect(x: 0, y: 0, width: ScreenWidth * 0.64, height: ScreenWidth * 0.64)
        self.logoImageView.center = self.view.center
        self.titleLabel.text = "蓝牙连接成功"
        self.tipLabel.text = "你的手机已成功连接到设备，开始租借吧~"
        self.tip2Label.text = "已连接至机柜09885"
        
        let time: TimeInterval = 1.5//再模拟1.5秒后跳转
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            DispatchQueue.once(token: "跳转", block: {
                let vc = LoanMachineViewController.init(nibName: nil, bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
            })
        }
    }
    
    
    //MARK: - UI
    override func initLayout() {
        super.initLayout()
        self.leftButton.isHidden = true
        self.rightButton.isHidden = false
        if self.connectType == BluetoothConnectType.LoanMachine.rawValue {
            self.titleLabel.text = "蓝牙连接"
        }else {
            self.titleLabel.text = "立即归还"
        }
        self.view.addSubview(logoImageView)
        self.view.addSubview(tipLabel)
        self.view.addSubview(tip1Label)
        self.view.addSubview(tip2Label)
        
        ///调试代码
        let deadline = DispatchTime.now() + 2.0
        DispatchQueue.global().asyncAfter(deadline: deadline) {
            DispatchQueue.main.async(execute: {
                if self.connectType == BluetoothConnectType.LoanMachine.rawValue {
                    
                    self.connectStart()
                    
                    let time: TimeInterval = 3//模拟1.5秒后连接成功了
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
                        self.connectSuccess()
                    }
                }else {
                    DispatchQueue.once(token: "跳转", block: {
                        self.logoImageView.image = UIImage.init(named: "Verify")
                        let vc = ReturnMachineViewController.init(nibName: nil, bundle: nil)
                        self.navigationController?.pushViewController(vc, animated: true)
                    })
                }
            })
        }
    }
    
    private lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: ScreenWidth * 0.64, height: ScreenWidth * 0.64))
        logoImageView.center = view.center
        logoImageView.image = UIImage.init(named: "组38")
        logoImageView.contentMode = UIViewContentMode.scaleToFill
        logoImageView.clipsToBounds = true;
         return logoImageView
    }()
    
    private lazy var tipLabel: UILabel = {
        let tipLabel = UILabel.init(frame: CGRect(x: 0, y: logoImageView.y - 40, width: self.view.width, height: 15))
        tipLabel.textAlignment = NSTextAlignment.center
        tipLabel.textColor = UIColor.textBlackColor()
        tipLabel.font = UIFont.font13()
        tipLabel.text = "请进入系统设置打开蓝牙进行连接设备"
        return tipLabel
    }()
    
    private lazy var tip1Label: UILabel = {
        let tip1Label = UILabel.init(frame: CGRect(x: 0, y: tipLabel.y - 25, width: self.view.width, height: 20))
        tip1Label.textAlignment = NSTextAlignment.center
        tip1Label.textColor = UIColor.hexadecimalColor(hexadecimal: "3e3e3d")
        tip1Label.font = UIFont.font18()
        tip1Label.text = "蓝牙连接"
        return tip1Label
    }()
    
    private lazy var tip2Label: UILabel = {
        let tip2Label = UILabel.init(frame: CGRect(x: 0, y: logoImageView.maxY + 30, width: self.view.width, height: 17))
        tip2Label.textAlignment = NSTextAlignment.center
        tip2Label.textColor = UIColor.textBlackColor()
        tip2Label.font = UIFont.font15()
        tip2Label.text = "正在连接中...."
        return tip2Label
    }()
}
