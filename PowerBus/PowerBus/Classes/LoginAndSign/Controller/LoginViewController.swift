//
//  LoginViewController.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/26.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationView.isHidden = true
        self.view.addSubview(logoImageView)
        self.view.addSubview(signButton)
        self.view.addSubview(loginLabel)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - touch events
    //注册按钮点击
    @objc func signButtonClick() {
        let vc = RegistViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //登录按钮点击
    @objc func loginLabelButtonClick() {
        let vc = UserLoginViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - lazy init
    private lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 160, height: 108))
        logoImageView.center = view.center
        logoImageView.y = 140
        logoImageView.image = UIImage.init(named: "主logo")
        logoImageView.contentMode = UIViewContentMode.scaleToFill
        logoImageView.clipsToBounds = true;
        return logoImageView
    }()
    
    private lazy var signButton: UIButton = {
        let signButton = UIButton(type: UIButtonType.custom)
        signButton.frame = CGRect(x: 0, y: 0, width: ScreenWidth*0.4, height: 40)
        signButton.center = self.view.center
        signButton.y = ScreenHeight*0.9 - signButton.height
        signButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        signButton.setTitle("新用户注册", for: UIControlState.normal)
        signButton.titleLabel?.font = UIFont.font15()
        signButton.backgroundColor = UIColor.mainColor()
        signButton.addTarget(self, action:#selector(signButtonClick), for:.touchUpInside)
        signButton.layer.cornerRadius = signButton.height/2.0
        signButton.clipsToBounds = true
        return signButton;
    }()
    
    private lazy var loginLabel: UILabel = {
        let loginLabel = UILabel.init(frame: CGRect(x: 0, y: signButton.maxY + 10, width: ScreenWidth, height: 15))
        loginLabel.textAlignment = NSTextAlignment.center
        loginLabel.textColor = UIColor.textGrayColor()
        loginLabel.font = UIFont.font12()
        let string = NSMutableAttributedString.init(string: "已有账户？点此登录")
        string.addAttribute(.underlineStyle, value: NSNumber.init(value: 1), range: NSRange(location: 5, length: 4))
        loginLabel.attributedText = string
        loginLabel.isUserInteractionEnabled = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(loginLabelButtonClick))
        loginLabel.addGestureRecognizer(tap)
        return loginLabel
    }()
    
}
