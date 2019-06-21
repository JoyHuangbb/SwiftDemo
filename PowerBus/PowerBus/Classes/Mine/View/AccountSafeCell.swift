//
//  AccountSafeCell.swift
//  PowerBus
//
//  Created by 邹勇峰 on 2018/11/2.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class AccountSafeCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(titleLabel)
        self.addSubview(detailLabel)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    public lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.init(frame: CGRect(x: ScreenWidth * 0.14, y: 0, width: 200, height: 44))
        titleLabel.textAlignment = NSTextAlignment.left
        titleLabel.textColor = UIColor.textGrayColor()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.text = ""
        return titleLabel
    }()
    public lazy var detailLabel: UILabel = {
        let detailLabel = UILabel.init(frame: CGRect(x:ScreenWidth - ScreenWidth * 0.14 - 200, y: 0, width: 200, height: 44))
        detailLabel.textAlignment = NSTextAlignment.right
        detailLabel.textColor = UIColor.textGrayColor()
        detailLabel.font = UIFont.systemFont(ofSize: 14)
        detailLabel.text = ""
        return detailLabel
    }()
}

class ThirdAccountCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(titleLabel)
        self.addSubview(logoImageView)
        self.addSubview(switchButton)
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.init(frame: CGRect(x: logoImageView.maxX + 20, y: 0, width: 200, height: 44))
        titleLabel.textAlignment = NSTextAlignment.left
        titleLabel.textColor = UIColor.textGrayColor()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.text = ""
        return titleLabel
    }()
    
    public lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView(frame: CGRect(x: ScreenWidth * 0.087, y: 10, width: 24, height: 24))
        logoImageView.contentMode = UIViewContentMode.scaleToFill
        self.addSubview(logoImageView)
        return logoImageView
    }()
    
    public lazy var switchButton: UIButton = {
        let switchButton = UIButton(type: UIButtonType.custom)
        switchButton.frame = CGRect(x: ScreenWidth - 32 - ScreenWidth * 0.087, y: 12.5, width: 32, height: 19)
        switchButton.addTarget(self, action:#selector(switchButtonClick), for:.touchUpInside)
        switchButton.setBackgroundImage(UIImage.init(named: "icon_open"), for: .selected)
        switchButton.setBackgroundImage(UIImage.init(named: "icon_close"), for: .normal)
        switchButton.isSelected = true
        self.addSubview(switchButton)
        return switchButton
    }()
    
    @objc func switchButtonClick() {
        switchButton.isSelected = !switchButton.isSelected
    }
}
