//
//  HomeSearchResultCell.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/28.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class HomeSearchResultCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(logoImageView)
        self.contentView.addSubview(distanceLabel)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(usefulLabel)
        self.contentView.addSubview(unUsefulLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - private mothds
    func returnCustomeAttribute(string: String, font: UIFont, image: UIImage, y: CGFloat, width: CGFloat, height: CGFloat) -> NSMutableAttributedString {
        let attri = NSMutableAttributedString.init(string: "")
        let attch = NSTextAttachment.init()
        attch.image = image
        attch.bounds = CGRect(x: 0, y: -2, width: width, height: height)
        let text = NSAttributedString(attachment: attch)
        let test1 = NSAttributedString(string: string, attributes: [kCTForegroundColorAttributeName as NSAttributedStringKey: UIColor.textGrayColor(), kCTFontAttributeName as NSAttributedStringKey: font])
        attri.append(text)
        attri.append(test1)
        return attri
    }
    
    
    private lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView(frame: CGRect(x: 45, y: 12.5, width: 50, height: 50))
        logoImageView.image = UIImage.init(named: "图层3拷贝2")
        logoImageView.contentMode = UIViewContentMode.scaleAspectFill
        logoImageView.setCornerRadius(logoImageView.height / 2.0)
        return logoImageView
    }()
    
    private lazy var distanceLabel: UILabel = {
        let distanceLabel = UILabel.init(frame: CGRect(x: ScreenWidth - (60 + 15), y: 0, width: 60, height: 75))
        distanceLabel.textAlignment = NSTextAlignment.center
        distanceLabel.textColor = UIColor.textBlackColor()
        distanceLabel.font = UIFont.font12()
        distanceLabel.numberOfLines = 2
        distanceLabel.text = "距离\n0.2公里"
        return distanceLabel
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.init(frame: CGRect(x: logoImageView.maxX + 15, y: logoImageView.y, width: distanceLabel.x - logoImageView.maxX - 30, height: 25))
        nameLabel.textAlignment = NSTextAlignment.left
        nameLabel.textColor = UIColor.textBlackColor()
        nameLabel.font = UIFont.font14()
        nameLabel.text = "KFC肯德基T6 - W1"
        return nameLabel
    }()
    
    private lazy var usefulLabel: UILabel = {
        let usefulLabel = UILabel.init(frame: CGRect(x: nameLabel.x, y: logoImageView.maxY - 25, width: nameLabel.width / 2.0, height: 25))
        usefulLabel.textAlignment = NSTextAlignment.left
        usefulLabel.textColor = UIColor.textBlackColor()
        usefulLabel.attributedText = self.returnCustomeAttribute(string: "可租借3个", font:UIFont.font12(), image: UIImage.init(named: "Flash拷贝3")!, y:-2, width:12, height:12)
        return usefulLabel
    }()
    
    private lazy var unUsefulLabel: UILabel = {
        let unUsefulLabel = UILabel.init(frame: usefulLabel.frame)
        unUsefulLabel.x = usefulLabel.maxX
        unUsefulLabel.textAlignment = NSTextAlignment.left
        unUsefulLabel.textColor = UIColor.textBlackColor()
        unUsefulLabel.attributedText = self.returnCustomeAttribute(string: "可归还1个", font:UIFont.font12(), image: UIImage.init(named: "Inbox拷贝2")!, y:-2, width:12, height:12)
        return unUsefulLabel
    }()
}
