//
//  CommonQaCell.swift
//  PowerBus
//
//  Created by 邹勇峰 on 2018/11/2.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class CommonQaCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //        let bgView = UIView.init(frame: CGRect.init(x: ScreenWidth * 0.076, y: 8, width: ScreenWidth - ScreenWidth * 0.076 * 2, height: 111))
        //        bgView.backgroundColor = UIColor.white
        //        bgView.setCornerRadius(5)
        //        self.addSubview(bgView)
        
        self.addSubview(titleLabel)
        self.addSubview(logoImageView)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.init(frame: CGRect(x: ScreenWidth * 0.1, y: 0, width: ScreenWidth*0.7, height: 44))
        titleLabel.textAlignment = NSTextAlignment.left
        titleLabel.textColor = UIColor.textBlackColor()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.text = ""
        return titleLabel
    }()
    public lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView(frame: CGRect(x: ScreenWidth * 0.9 - 22, y: 11, width: 22, height: 22))
        logoImageView.contentMode = UIViewContentMode.scaleToFill
        logoImageView.image = UIImage.init(named: "icon_arrowDown")
        self.addSubview(logoImageView)
        return logoImageView
    }()
}
