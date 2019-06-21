//
//  CurrentMobileViewController.swift
//  PowerBus
//
//  Created by 邹勇峰 on 2018/11/2.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class CurrentMobileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }

    func setupUI() {
        self.titleLabel.text = "当前手机号"
        let textLabel = UILabel.init(frame: CGRect(x: ScreenWidth * 0.066, y: 116, width: 150, height: 18))
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
        
        let textLabel1 = UILabel.init(frame: CGRect(x: 0, y: mobileLabel.maxY + 22, width: ScreenWidth, height: 32))
        textLabel1.textAlignment = NSTextAlignment.center
        textLabel1.textColor = UIColor.hexadecimalColor(hexadecimal: "#bebebe")
        textLabel1.font = UIFont.systemFont(ofSize: 12)
        textLabel1.numberOfLines = 0
        textLabel1.text = "更换手机号不影响软件的正常使用，更换后\n请使用新的手机号码登录。"
        view.addSubview(textLabel1)
        
        let logindButton = LoginButton(type: UIButtonType.custom)
        logindButton.frame = CGRect(x: ScreenWidth * 0.16, y: textLabel1.maxY + 40, width: ScreenWidth * 0.68, height: 40)
        logindButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        logindButton.setTitle("更换手机号", for: UIControlState.normal)
        logindButton.titleLabel?.font = UIFont.font14()
        logindButton.backgroundColor = UIColor.mainColor()
        logindButton.titleLabel?.textAlignment = .center
        logindButton.addTarget(self, action:#selector(logindButtonClick), for:.touchUpInside)
        logindButton.setCornerRadius(20)
        view.addSubview(logindButton)
        
    }
    
    @objc func logindButtonClick () {
        let vc = InputMobileViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
