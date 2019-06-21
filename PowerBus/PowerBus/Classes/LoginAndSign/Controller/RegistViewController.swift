//
//  RegistViewController.swift
//  PowerBus
//
//  Created by 邹勇峰 on 2018/10/28.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class RegistViewController: BaseViewController {

    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    //MARK: - setupUI
    func setupUI() {
        self.navigationView.isHidden = true
        self.view.addSubview(self.loginLabel)
        self.view.addSubview(self.faceBookButton)
        self.view.addSubview(self.googleButton)
        self.view.addSubview(self.mobileButton)
        self.view.addSubview(self.bottomLabel)
        //        self.fd_interactivePopDisabled = true
    }
    
    //MARK: - touch events
    @objc func faceBookButtonClick() {
        let vc = MobileRegistViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func googleButtonClick() {
        let vc = MobileRegistViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func mobileButtonClick() {
        let vc = MobileRegistViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - lazy init
    private lazy var loginLabel: UILabel = {
        let loginLabel = UILabel.init(frame: CGRect(x: ScreenWidth * 0.16, y: ScreenHeight * 0.17, width: 150, height: 18))
        loginLabel.textAlignment = NSTextAlignment.left
        loginLabel.textColor = UIColor.textBlackColor()
        loginLabel.font = UIFont.font18()
        loginLabel.text = "新用户注册"
        return loginLabel
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
    
    private lazy var faceBookButton: UIButton = {
        let faceBookButton = LoginButton(type: UIButtonType.custom)
        faceBookButton.frame = CGRect(x: ScreenWidth * 0.16, y: ScreenHeight * 0.26, width: ScreenWidth * 0.68, height: 40)
        faceBookButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        faceBookButton.setTitle("Facebook", for: UIControlState.normal)
        faceBookButton.titleLabel?.font = UIFont.font13()
        faceBookButton.backgroundColor = UIColor.mainColor()
        faceBookButton.titleLabel?.textAlignment = .center
        faceBookButton.addTarget(self, action:#selector(faceBookButtonClick), for:.touchUpInside)
        faceBookButton.setCornerRadius(20)
        faceBookButton.setImage(UIImage.init(named: "icon_faceBook"), for: .normal)
        return faceBookButton;
    }()
    
    private lazy var googleButton: UIButton = {
        let googleButton = LoginButton(type: UIButtonType.custom)
        googleButton.frame = CGRect(x: ScreenWidth * 0.16, y: faceBookButton.maxY + 18, width: ScreenWidth * 0.68, height: 40)
        googleButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        googleButton.setTitle("Google", for: UIControlState.normal)
        googleButton.titleLabel?.font = UIFont.font13()
        googleButton.titleLabel?.textAlignment = .center
        googleButton.backgroundColor = UIColor.mainColor()
        googleButton.addTarget(self, action:#selector(googleButtonClick), for:.touchUpInside)
        googleButton.setCornerRadius(20)
        googleButton.setImage(UIImage.init(named: "icon_google"), for: .normal)
        return googleButton;
    }()
    
    private lazy var mobileButton: UIButton = {
        let mobileButton = LoginButton(type: UIButtonType.custom)
        mobileButton.frame = CGRect(x: ScreenWidth * 0.16, y: googleButton.maxY + 18, width: ScreenWidth * 0.68, height: 40)
        mobileButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        mobileButton.setTitle("手机号码注册", for: UIControlState.normal)
        mobileButton.titleLabel?.font = UIFont.font13()
        mobileButton.titleLabel?.textAlignment = .center
        mobileButton.backgroundColor = UIColor.mainColor()
        mobileButton.addTarget(self, action:#selector(mobileButtonClick), for:.touchUpInside)
        mobileButton.setCornerRadius(20)
        mobileButton.setImage(UIImage.init(named: "icon_mobile"), for: .normal)
        return mobileButton;
    }()
    
}
