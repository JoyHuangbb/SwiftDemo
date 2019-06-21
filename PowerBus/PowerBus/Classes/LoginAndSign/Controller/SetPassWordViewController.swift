//
//  SetPassWordViewController.swift
//  PowerBus
//
//  Created by 邹勇峰 on 2018/11/2.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class SetPassWordViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        self.titleLabel.text = "设置登录密码"
        
        self.view.addSubview(self.logindButton)
        
        self.pwdTextField1.addTarget(self, action: #selector(pwdTextField1EditChanged), for: .editingChanged)
        
        self.pwdTextField2.addTarget(self, action: #selector(pwdTextField2EditChanged), for: .editingChanged)
        
        self.codeTextField.addTarget(self, action: #selector(codeTextFieldEditChanged), for: .editingChanged)

        
    }
    
    @objc func registButtonClick(_ button:UIButton) {
        // 注册
        HUDManager.showSuccessHUD("注册成功")
        let vc = HomeViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func pwdButtonClick() {
        // 重置密码
        HUDManager.showSuccessHUD("密码设置成功")
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func codeBtnClick() {
        // 获取验证码
        HUDManager.showSuccessHUD("验证码已发送")
        
    }
    
    @objc func pwdTextField1EditChanged() {
        
    }
    
    @objc func pwdTextField2EditChanged() {
        
    }
    
    @objc func codeTextFieldEditChanged() {
        // 验证码输入
        
    }
    
    private lazy var logindButton: UIButton = {
        let logindButton = LoginButton(type: UIButtonType.custom)
        logindButton.frame = CGRect(x: ScreenWidth * 0.16, y: ScreenHeight * 0.17 + 165, width: ScreenWidth * 0.68, height: 40)
        logindButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        logindButton.setTitle("设置密码", for: UIControlState.normal)
        logindButton.titleLabel?.font = UIFont.font14()
        logindButton.backgroundColor = UIColor.mainColor()
        logindButton.titleLabel?.textAlignment = .center
        logindButton.addTarget(self, action:#selector(pwdButtonClick), for:.touchUpInside)
        logindButton.setCornerRadius(20)
        return logindButton;
    }()
    
    private lazy var pwdTextField1: UITextField = {
        let view = UIView.init(frame: CGRect(x: ScreenWidth * 0.16, y: ScreenHeight * 0.17, width: ScreenWidth * 0.68, height: 40))
        view.setCornerRadius(20)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.mainColor().cgColor
        self.view.addSubview(view)
        
        let logoImageView = UIImageView(frame: CGRect(x: view.width - 22 - 20, y: 9, width: 22, height: 22))
        logoImageView.image = UIImage.init(named: "icon_loginPwd")
        logoImageView.contentMode = UIViewContentMode.scaleToFill
        view.addSubview(logoImageView)
        
        let pwdTextField1 = UITextField.init(frame: CGRect.init(x: 20, y: 0, width: ScreenWidth *  0.68 - 80, height: 40))
        pwdTextField1.placeholder = "请输入新密码"
        pwdTextField1.font = UIFont.font14()
        pwdTextField1.textColor = UIColor.textBlackColor()
        view.addSubview(pwdTextField1)
        
        return pwdTextField1;
    }()
    private lazy var pwdTextField2: UITextField = {
        let view = UIView.init(frame: CGRect(x: ScreenWidth * 0.16, y: ScreenHeight * 0.17 + 55, width: ScreenWidth * 0.68, height: 40))
        view.setCornerRadius(20)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.mainColor().cgColor
        self.view.addSubview(view)
        
        let logoImageView = UIImageView(frame: CGRect(x: view.width - 22 - 20, y: 9, width: 22, height: 22))
        logoImageView.image = UIImage.init(named: "icon_again")
        logoImageView.contentMode = UIViewContentMode.scaleToFill
        view.addSubview(logoImageView)
        
        let pwdTextField2 = UITextField.init(frame: CGRect.init(x: 20, y: 0, width: ScreenWidth *  0.68 - 80, height: 40))
        pwdTextField2.placeholder = "请再次输入密码"
        pwdTextField2.font = UIFont.font14()
        pwdTextField2.textColor = UIColor.textBlackColor()
        view.addSubview(pwdTextField2)
        
        return pwdTextField2;
    }()
    private lazy var codeTextField: UITextField = {
        let view = UIView.init(frame: CGRect(x: ScreenWidth * 0.16, y: ScreenHeight * 0.17 + 110, width: ScreenWidth * 0.68, height: 40))
        view.setCornerRadius(20)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.mainColor().cgColor
        self.view.addSubview(view)
        
        let codeBtn = UIButton(frame: CGRect(x: view.width - 100, y: 0, width: 100, height: 40))
        codeBtn.addTarget(self, action: #selector(codeBtnClick), for: .touchUpInside)
        codeBtn.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "76816e")
        codeBtn.setCornerRadius(20)
        codeBtn.setTitle("获取验证码", for: .normal)
        codeBtn.titleLabel?.font = UIFont.font14()
        codeBtn.setTitleColor(UIColor.white, for: .normal)
        view.addSubview(codeBtn)
        
        let codeTextField = UITextField.init(frame: CGRect.init(x: 20, y: 0, width: ScreenWidth *  0.68 - 120, height: 40))
        codeTextField.placeholder = "请输入验证码"
        codeTextField.font = UIFont.font14()
        codeTextField.textColor = UIColor.textBlackColor()
        view.addSubview(codeTextField)
        
        return codeTextField;
    }()
 
}
