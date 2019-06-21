//
//  WalletPayCell.swift
//  PowerBus
//
//  Created by 邹勇峰 on 2018/10/30.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class WalletPayCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.titleLabel)
        self.addSubview(logoImageView)

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.init(frame: CGRect(x: ScreenWidth * 0.066 + 22 + 25, y: 0, width: ScreenWidth - (ScreenWidth * 0.066 + 22 + 25), height: 50))
        titleLabel.textAlignment = NSTextAlignment.left
        titleLabel.textColor = UIColor.textBlackColor()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.text = ""
        return titleLabel
    }()
    
    public lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView(frame: CGRect(x: ScreenWidth * 0.066, y: 13, width: 24, height: 24))
        logoImageView.contentMode = UIViewContentMode.scaleToFill
        return logoImageView
    }()
}

class BankCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.titleLabel)
        self.addSubview(logoImageView)
        self.addSubview(detailLabel)

    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.init(frame: CGRect(x: ScreenWidth * 0.066 + 22 + 25, y: 13, width: ScreenWidth - (ScreenWidth * 0.066 + 22 + 25), height: 14))
        titleLabel.textAlignment = NSTextAlignment.left
        titleLabel.textColor = UIColor.textBlackColor()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.text = ""
        return titleLabel
    }()
    
    public lazy var detailLabel: UILabel = {
        let detailLabel = UILabel.init(frame: CGRect(x: ScreenWidth * 0.066 + 22 + 25, y: 30, width: ScreenWidth - (ScreenWidth * 0.066 + 22 + 25), height: 12))
        detailLabel.textAlignment = NSTextAlignment.left
        detailLabel.textColor = UIColor.textBlackColor()
        detailLabel.font = UIFont.systemFont(ofSize: 12)
        detailLabel.text = "**** 2463"
        return detailLabel
    }()
    
    public lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView(frame: CGRect(x: ScreenWidth * 0.066, y: 13, width: 24, height: 24))
        logoImageView.contentMode = UIViewContentMode.scaleToFill
        self.addSubview(logoImageView)
        return logoImageView
    }()
}
