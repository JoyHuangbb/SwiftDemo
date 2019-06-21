//
//  AddBankCardViewController.swift
//  PowerBus
//
//  Created by 邹勇峰 on 2018/10/31.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class AddBankCardViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }

    func setupUI() {
        self.titleLabel.text = "我的钱包"
        let titleLabel = UILabel.init(frame: CGRect.init(x: ScreenWidth * 0.066, y: 119, width: ScreenWidth - 100, height: 18))
        titleLabel.textColor = UIColor.hexadecimalColor(hexadecimal: "#515f47")
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.text = "添加你的信用卡"
        view.addSubview(titleLabel)
        
        let contentLabel = UILabel.init(frame: CGRect.init(x: ScreenWidth * 0.066, y: titleLabel.maxY, width: ScreenWidth - 100, height: 18))
        contentLabel.textColor = UIColor.hexadecimalColor(hexadecimal: "#515f47")
        contentLabel.font = UIFont.systemFont(ofSize: 8)
        contentLabel.text = "我们会以加密的方式保存你的信用卡信息"
        view.addSubview(contentLabel)
        
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 210, height: 210))
        logoImageView.center = view.center
        logoImageView.y = 0.332 * ScreenHeight
        logoImageView.image = UIImage.init(named: "icon_cardBg")
        logoImageView.contentMode = UIViewContentMode.scaleToFill
        logoImageView.clipsToBounds = true;
        view.addSubview(logoImageView)
        
        let bottomButton = UIButton.init(frame: CGRect.init(x: 0, y: logoImageView.maxY + 126, width: ScreenWidth, height: 15))
        bottomButton.titleLabel?.font = UIFont.font14()
        bottomButton .setTitleColor(UIColor.textGrayColor(), for: .normal)
        let string = NSMutableAttributedString.init(string: "无法识别？手动输入卡号绑定")
        string.addAttribute(.foregroundColor, value: UIColor.textGrayColor(), range: NSRange(location: 0, length: string.length))
        string.addAttribute(.underlineStyle, value: NSNumber.init(value: 1), range: NSRange(location: 5, length: 8))
        string.addAttribute(.foregroundColor, value: UIColor.hexadecimalColor(hexadecimal: "#515f47"), range: NSRange(location: 5, length: 8))
        bottomButton.setAttributedTitle(string, for: .normal)
        bottomButton.addTarget(self, action: #selector(bottomButtonClick), for: .touchUpInside)
        view.addSubview(bottomButton)
    }
    
    @objc func bottomButtonClick (){
        let vc = CompleteBankCardViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
