//
//  MobileRegistViewController.swift
//  PowerBus
//
//  Created by 邹勇峰 on 2018/10/28.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class MobileRegistViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupUI()
    }
    
    func setupUI() {
        self.navigationView.isHidden = true
        
        self.view.addSubview(self.loginLabel)
        
        self.view.addSubview(self.countryButton)
        
        self.view.addSubview(self.bottomLabel)
        
        self.view.addSubview(self.pwdButton)
        
        self.view.addSubview(self.logindButton)
        
        self.mobileTextField.addTarget(self, action: #selector(mobileTextFieldEditChanged), for: .editingChanged)
        
        self.pwdTextField.addTarget(self, action: #selector(pwdTextFieldEditChanged), for: .editingChanged)
        
    }
    
    //MARK: - touch events
    @objc func countryButtonClick() {
        // 选择国家
        let vc = ChooseCountryController.init(nibName: nil, bundle: nil)
        vc.userTapped = { [weak self] (text) in
            self?.countryButton.setTitle(text, for: .normal)
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func registButtonClick(_ button:UIButton) {
        // 注册
        HUDManager.showSuccessHUD("注册成功")
        let vc = HomeViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func pwdButtonClick() {
        // 重置密码
        let vc = SetPassWordViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func codeBtnClick() {
        // 获取验证码
        HUDManager.showSuccessHUD("验证码已发送")

    }
    
    @objc func mobileTextFieldEditChanged() {
        // 手机号输入
        
    }
    
    @objc func pwdTextFieldEditChanged() {
        // 验证码输入
        
    }
    
    //MARK: - lazy init
    private lazy var loginLabel: UILabel = {
        let loginLabel = UILabel.init(frame: CGRect(x: ScreenWidth * 0.16, y: ScreenHeight * 0.17, width: 150, height: 18))
        loginLabel.textAlignment = NSTextAlignment.left
        loginLabel.textColor = UIColor.textBlackColor()
        loginLabel.font = UIFont.font18()
        loginLabel.text = "手机号码注册"
        return loginLabel
    }()
    
    private lazy var countryButton: UIButton = {
        let countryButton = LoginButton(type: UIButtonType.custom)
        countryButton.frame = CGRect(x: ScreenWidth * 0.16, y: ScreenHeight * 0.26, width: ScreenWidth * 0.68, height: 40)
        countryButton.setTitleColor(UIColor.textBlackColor(), for: UIControlState.normal)
        countryButton.setTitle("选择国家归属地", for: UIControlState.normal)
        countryButton.titleLabel?.font = UIFont.font13()
        countryButton.backgroundColor = UIColor.white
        countryButton.layer.borderColor = UIColor.mainColor().cgColor
        countryButton.layer.borderWidth = 1;
        countryButton.titleLabel?.textAlignment = .center
        countryButton.addTarget(self, action:#selector(countryButtonClick), for:.touchUpInside)
        countryButton.setCornerRadius(20)
        countryButton.setImage(UIImage.init(named: "icon_country"), for: .normal)
        return countryButton;
    }()
    
    private lazy var logindButton: UIButton = {
        let logindButton = LoginButton(type: UIButtonType.custom)
        logindButton.frame = CGRect(x: ScreenWidth * 0.16, y: countryButton.maxY + 134, width: ScreenWidth * 0.68, height: 40)
        logindButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        logindButton.setTitle("注册", for: UIControlState.normal)
        logindButton.titleLabel?.font = UIFont.font13()
        logindButton.backgroundColor = UIColor.mainColor()
        logindButton.titleLabel?.textAlignment = .center
        logindButton.addTarget(self, action:#selector(registButtonClick(_:)), for:.touchUpInside)
        logindButton.setCornerRadius(20)
        return logindButton;
    }()
    
    private lazy var pwdButton: UIButton = {
        let pwdButton = UIButton(type: UIButtonType.custom)
        pwdButton.frame = CGRect(x: ScreenWidth - 150 - ScreenWidth * 0.1, y: ScreenHeight * 0.086, width: 150, height: 13)
        pwdButton.setTitleColor(UIColor.hexadecimalColor(hexadecimal: "#666666"), for: UIControlState.normal)
        pwdButton.setTitle("重置密码", for: UIControlState.normal)
        pwdButton.titleLabel?.font = UIFont.font13()
        pwdButton.contentHorizontalAlignment = .right
        pwdButton.addTarget(self, action: #selector(pwdButtonClick), for: .touchUpInside)
        return pwdButton;
    }()
    
    private lazy var mobileTextField: UITextField = {
        let view = UIView.init(frame: CGRect(x: ScreenWidth * 0.16, y: countryButton.maxY + 18, width: ScreenWidth * 0.68, height: 40))
        view.setCornerRadius(20)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.mainColor().cgColor
        self.view.addSubview(view)
        
        let logoImageView = UIImageView(frame: CGRect(x: view.width - 22 - 20, y: 9, width: 22, height: 22))
        logoImageView.image = UIImage.init(named: "icon_loginMobile")
        logoImageView.contentMode = UIViewContentMode.scaleToFill
        view.addSubview(logoImageView)
        
        let mobileTextField = UITextField.init(frame: CGRect.init(x: 20, y: 0, width: ScreenWidth *  0.68 - 80, height: 40))
        mobileTextField.placeholder = "请输入手机号码"
        mobileTextField.font = UIFont.font13()
        mobileTextField.textColor = UIColor.textBlackColor()
        view.addSubview(mobileTextField)
        
        return mobileTextField;
    }()
    
    private lazy var pwdTextField: UITextField = {
        let view = UIView.init(frame: CGRect(x: ScreenWidth * 0.16, y: countryButton.maxY + 76, width: ScreenWidth * 0.68, height: 40))
        view.setCornerRadius(20)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.mainColor().cgColor
        self.view.addSubview(view)
        
        let codeBtn = UIButton(frame: CGRect(x: view.width - 100, y: 0, width: 100, height: 40))
        codeBtn.addTarget(self, action: #selector(codeBtnClick), for: .touchUpInside)
        codeBtn.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "76816e")
        codeBtn.setCornerRadius(20)
        codeBtn.setTitle("获取验证码", for: .normal)
        codeBtn.titleLabel?.font = UIFont.font13()
        codeBtn.setTitleColor(UIColor.white, for: .normal)
        view.addSubview(codeBtn)
        
        let pwdTextField = UITextField.init(frame: CGRect.init(x: 20, y: 0, width: ScreenWidth *  0.68 - 120, height: 40))
        pwdTextField.placeholder = "请输入验证码"
        pwdTextField.font = UIFont.font13()
        pwdTextField.textColor = UIColor.textBlackColor()
        view.addSubview(pwdTextField)
        
        return pwdTextField;
    }()
    private lazy var bottomLabel: UILabel = {
        let bottomLabel = UILabel.init(frame: CGRect(x: 0, y: ScreenHeight - 29 - 0.04 * ScreenHeight, width: ScreenWidth, height: 29))
        bottomLabel.textAlignment = NSTextAlignment.center
        bottomLabel.textColor = UIColor.textGrayColor()
        bottomLabel.font = UIFont.font12()
        bottomLabel.numberOfLines = 2
        let string = NSMutableAttributedString.init(string: "开始使用PowerBus即表示您同意协议：\n《服务协议》&《隐私政策》")
        string.addAttribute(.underlineStyle, value: NSNumber.init(value: 1), range: NSRange(location: 22, length: 6))
        string.addAttribute(.underlineStyle, value: NSNumber.init(value: 1), range: NSRange(location: 29, length: 6))

        bottomLabel.attributedText = string
        bottomLabel.isUserInteractionEnabled = true
        return bottomLabel
    }()

}


