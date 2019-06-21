//
//  SendCodeViewController.swift
//  PowerBus
//
//  Created by 邹勇峰 on 2018/11/2.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class SendCodeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    func setupUI() {
        self.titleLabel.text = "当前手机号"
        let textLabel = UILabel.init(frame: CGRect(x: ScreenWidth * 0.066, y: 101, width: 150, height: 18))
        textLabel.textAlignment = NSTextAlignment.left
        textLabel.textColor = UIColor.textBlackColor()
        textLabel.font = UIFont.font15()
        textLabel.text = "当前手机号："
        view.addSubview(textLabel)
        
        let mobileLabel = UILabel.init(frame: CGRect(x: 0, y: textLabel.maxY + 38, width: ScreenWidth, height: 30))
        mobileLabel.textAlignment = NSTextAlignment.center
        mobileLabel.textColor = UIColor.hexadecimalColor(hexadecimal: "#000000")
        mobileLabel.font = UIFont.systemFont(ofSize: 30)
        mobileLabel.text = "+86 188 **** 9856"
        view.addSubview(mobileLabel)
        
        let bgView = UIView.init(frame: CGRect(x: ScreenWidth * 0.16, y: mobileLabel.maxY + 44, width: ScreenWidth * 0.68, height: 40))
        bgView.setCornerRadius(20)
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.mainColor().cgColor
        self.view.addSubview(bgView)
        
        let codeBtn = UIButton(frame: CGRect(x: bgView.width - 100, y: 0, width: 100, height: 40))
        codeBtn.addTarget(self, action: #selector(codeBtnClick), for: .touchUpInside)
        codeBtn.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "76816e")
        codeBtn.setCornerRadius(20)
        codeBtn.setTitle("获取验证码", for: .normal)
        codeBtn.titleLabel?.font = UIFont.font14()
        codeBtn.setTitleColor(UIColor.white, for: .normal)
        bgView.addSubview(codeBtn)
        
        let pwdTextField = UITextField.init(frame: CGRect.init(x: 20, y: 0, width: ScreenWidth *  0.68 - 120, height: 40))
        pwdTextField.placeholder = "请输入验证码"
        pwdTextField.font = UIFont.font14()
        pwdTextField.textColor = UIColor.textBlackColor()
        bgView.addSubview(pwdTextField)
        
        let logindButton = LoginButton(type: UIButtonType.custom)
        logindButton.frame = CGRect(x: ScreenWidth * 0.16, y: bgView.maxY + 15, width: ScreenWidth * 0.68, height: 40)
        logindButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        logindButton.setTitle("确认更换", for: UIControlState.normal)
        logindButton.titleLabel?.font = UIFont.font14()
        logindButton.backgroundColor = UIColor.mainColor()
        logindButton.titleLabel?.textAlignment = .center
        logindButton.addTarget(self, action:#selector(logindButtonClick), for:.touchUpInside)
        logindButton.setCornerRadius(20)
        view.addSubview(logindButton)
    }

    @objc func codeBtnClick() {
        // 获取验证码
        HUDManager.showSuccessHUD("验证码已发送")
        
    }
    
    @objc func logindButtonClick() {
        // 获取验证码
        HUDManager.showSuccessHUD("绑定成功")
        self.navigationController?.popToViewController((self.navigationController?.viewControllers[5])!, animated: true)

    }
}
