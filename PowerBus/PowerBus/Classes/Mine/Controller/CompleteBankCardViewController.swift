//
//  CompleteBankCardViewController.swift
//  PowerBus
//
//  Created by 邹勇峰 on 2018/10/31.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class CompleteBankCardViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }

    func setupUI() {
        
        self.titleLabel.text = "我的钱包"
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: ScreenHeight * 0.172, width: 50, height: 50))
        logoImageView.centerX = view.centerX
        logoImageView.image = UIImage.init(named: "icon_visa")
        logoImageView.contentMode = UIViewContentMode.scaleToFill
        logoImageView.clipsToBounds = true;
        view.addSubview(logoImageView)
        
        let pwdTextField = UITextField.init(frame: CGRect.init(x: ScreenWidth * 0.106 + 10, y: ScreenHeight * 0.324 - 25, width: ScreenWidth - ScreenWidth * 0.106 * 2 - 20, height: 25))
        pwdTextField.placeholder = "输入卡号"
        pwdTextField.font = UIFont.font14()
        pwdTextField.textColor = UIColor.textBlackColor()
        view.addSubview(pwdTextField)
        
        
        var line = UIView.init(frame: CGRect.init(x: ScreenWidth * 0.106, y: ScreenHeight * 0.324, width: ScreenWidth - ScreenWidth * 0.106 * 2, height: 0.5))
        line.backgroundColor = UIColor.cellLineColor()
        view.addSubview(line)
        
        let photoImageView = UIImageView(frame: CGRect(x: line.maxX - 10 - 24, y: ScreenHeight * 0.324 - 25, width: 24, height: 24))
        photoImageView.image = UIImage.init(named: "icon_takePhoto")
        photoImageView.contentMode = UIViewContentMode.scaleToFill
        view.addSubview(photoImageView)
        
        let dateTextField = UITextField.init(frame: CGRect.init(x: ScreenWidth * 0.106 + 10, y: ScreenHeight * 0.324 + 44 - 25, width: ScreenWidth - ScreenWidth * 0.106 * 2, height: 25))
        dateTextField.placeholder = "输入有效期限   月/年"
        dateTextField.font = UIFont.font14()
        dateTextField.textColor = UIColor.textBlackColor()
        view.addSubview(dateTextField)
        
        line = UIView.init(frame: CGRect.init(x: ScreenWidth * 0.106, y: ScreenHeight * 0.324 + 44, width: ScreenWidth - ScreenWidth * 0.106 * 2, height: 0.5))
        line.backgroundColor = UIColor.cellLineColor()
        view.addSubview(line)

        let cscTextField = UITextField.init(frame: CGRect.init(x: ScreenWidth * 0.106 + 10, y: ScreenHeight * 0.324 + 88 - 25, width: ScreenWidth - ScreenWidth * 0.106 * 2, height: 25))
        cscTextField.placeholder = "输入信用卡安全代码CSC"
        cscTextField.font = UIFont.font14()
        cscTextField.textColor = UIColor.textBlackColor()
        view.addSubview(cscTextField)
        
        line = UIView.init(frame: CGRect.init(x: ScreenWidth * 0.106, y: ScreenHeight * 0.324 + 88, width: ScreenWidth - ScreenWidth * 0.106 * 2, height: 0.5))
        line.backgroundColor = UIColor.cellLineColor()
        view.addSubview(line)

        
        let logindButton = LoginButton(type: UIButtonType.custom)
        logindButton.frame = CGRect(x: ScreenWidth * 0.16, y: ScreenHeight * 0.9 - 40, width: ScreenWidth * 0.68, height: 40)
        logindButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        logindButton.setTitle("确认添加", for: UIControlState.normal)
        logindButton.titleLabel?.font = UIFont.font14()
        logindButton.backgroundColor = UIColor.mainColor()
        logindButton.titleLabel?.textAlignment = .center
        logindButton.addTarget(self, action:#selector(logindButtonClick), for:.touchUpInside)
        logindButton.setCornerRadius(20)
        view.addSubview(logindButton)
    }
    
    @objc func logindButtonClick () {
        HUDManager.showSuccessHUD("添加成功")
        self.navigationController?.popToViewController((self.navigationController?.viewControllers[5])!, animated: true)
    }
}
