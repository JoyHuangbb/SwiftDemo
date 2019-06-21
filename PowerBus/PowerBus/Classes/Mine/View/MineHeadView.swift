//
//  MineHeadView.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/29.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

typealias backButtonClick = () ->()

class MineHeadView: UIView {
    
    var backButtonCallBack: backButtonClick?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - private mothds
    func returnCustomeAttribute(string: String, font: UIFont, image: UIImage, width: CGFloat, height: CGFloat) -> NSMutableAttributedString {
        let attri = NSMutableAttributedString.init(string: "")
        let attch = NSTextAttachment.init()
        attch.image = image
        attch.bounds = CGRect(x: 0, y: -3, width: width, height: height)
        let text = NSAttributedString(attachment: attch)
        let test1 = NSAttributedString(string: string, attributes: [kCTForegroundColorAttributeName as NSAttributedStringKey: UIColor.red, kCTFontAttributeName as NSAttributedStringKey: font])
        attri.append(text)
        attri.append(test1)
        return attri
    }
    
    //MARK: - UI
    @objc func goBack() {
        backButtonCallBack!()
    }
    
    
    //MARK: - UI
    func initLayout() {
        self.backgroundColor = UIColor.whiteColor()
        self.addSubview(logoImageView)
        self.addSubview(rightButton)
        self.addSubview(nameLabel)
        self.addSubview(typeLabel)
    }
    
    private lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: StatusBarHeight + 20, width: 80, height: 80))
        logoImageView.centerX = self.centerX
        logoImageView.image = UIImage.init(named: "图层593")
        logoImageView.contentMode = UIViewContentMode.scaleToFill
        logoImageView.clipsToBounds = true;
        logoImageView.setCornerRadius(40)
        return logoImageView
    }()
    
    public lazy var rightButton: UIButton = {
        let rightButton = UIButton(type: UIButtonType.custom)
        rightButton.frame = CGRect(x: self.width - 54, y: StatusBarHeight +  20, width: 24, height: 24)
        rightButton.setBackgroundImage(UIImage.init(named: "圆角矩形5拷贝12"), for: UIControlState.normal)
        rightButton.addTarget(self, action:#selector(goBack), for: .touchUpInside)
        return rightButton
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.init(frame: CGRect(x: 0, y: logoImageView.maxY + 5, width: self.width, height: 17))
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.textColor = UIColor.textBlackColor()
        nameLabel.font = UIFont.font16()
        nameLabel.text = "Administrator"
        return nameLabel
    }()
    
    private lazy var typeLabel: UILabel = {
        let typeLabel = UILabel.init(frame: CGRect(x: 0, y: nameLabel.maxY, width: self.width, height: 24))
        typeLabel.textAlignment = NSTextAlignment.center
        typeLabel.textColor = UIColor.textGrayColor()
        typeLabel.attributedText = self.returnCustomeAttribute(string: "普通用户", font: UIFont.font14(), image: UIImage.init(named: "图层7拷贝")!, width: 18, height: 18)
        return typeLabel
    }()
    
}
