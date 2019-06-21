//
//  InputMobileViewController.swift
//  PowerBus
//
//  Created by 邹勇峰 on 2018/11/2.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class InputMobileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    func setupUI() {
        self.titleLabel.text = "更换手机号"
        view.addSubview(countryButton)
        mobileTextField.addTarget(self, action: #selector(mobileTextFieldChanged), for: .editingChanged)
        
        let logindButton = LoginButton(type: UIButtonType.custom)
        logindButton.frame = CGRect(x: ScreenWidth * 0.16, y: countryButton.maxY + 40 + 30, width: ScreenWidth * 0.68, height: 40)
        logindButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        logindButton.setTitle("下一步", for: UIControlState.normal)
        logindButton.titleLabel?.font = UIFont.font14()
        logindButton.backgroundColor = UIColor.mainColor()
        logindButton.titleLabel?.textAlignment = .center
        logindButton.addTarget(self, action:#selector(logindButtonClick), for:.touchUpInside)
        logindButton.setCornerRadius(20)
        view.addSubview(logindButton)
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
    
    @objc func logindButtonClick () {
        let vc = SendCodeViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func mobileTextFieldChanged () {
        
    }
    
    //getters
    private lazy var countryButton: UIButton = {
        let countryButton = LoginButton(type: UIButtonType.custom)
        countryButton.frame = CGRect(x: ScreenWidth * 0.16, y: ScreenHeight * 0.26, width: ScreenWidth * 0.68, height: 40)
        countryButton.setTitleColor(UIColor.textBlackColor(), for: UIControlState.normal)
        countryButton.setTitle("选择国家归属地", for: UIControlState.normal)
        countryButton.titleLabel?.font = UIFont.font14()
        countryButton.backgroundColor = UIColor.white
        countryButton.layer.borderColor = UIColor.mainColor().cgColor
        countryButton.layer.borderWidth = 1;
        countryButton.titleLabel?.textAlignment = .center
        countryButton.addTarget(self, action:#selector(countryButtonClick), for:.touchUpInside)
        countryButton.setCornerRadius(20)
        countryButton.setImage(UIImage.init(named: "icon_country"), for: .normal)
        return countryButton;
    }()
    
    private lazy var mobileTextField: UITextField = {
        let view = UIView.init(frame: CGRect(x: ScreenWidth * 0.16, y: countryButton.maxY + 15, width: ScreenWidth * 0.68, height: 40))
        view.setCornerRadius(20)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.mainColor().cgColor
        self.view.addSubview(view)
        
        
        let mobileTextField = UITextField.init(frame: CGRect.init(x: 20, y: 0, width: ScreenWidth *  0.68 - 80, height: 40))
        mobileTextField.placeholder = "请输入手机号码"
        mobileTextField.textAlignment = .center
        mobileTextField.font = UIFont.font14()
        mobileTextField.textColor = UIColor.textBlackColor()
        view.addSubview(mobileTextField)
        
        return mobileTextField;
    }()
}
