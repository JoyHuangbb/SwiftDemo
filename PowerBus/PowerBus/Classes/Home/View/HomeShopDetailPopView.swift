//
//  HomeShopDetailPopView.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/28.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

@objc protocol HomeShopDetailPopViewProtocol: NSObjectProtocol {
    @objc optional func locationButtoncallBack()
}

class HomeShopDetailPopView: PBBasePopView {

    weak var delegate: HomeShopDetailPopViewProtocol?
    
    class func retrunHeight() -> CGFloat {
        return 250
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - touch evetns
    @objc func cancelButtonClick() {
        self.dismissFromSuperView(animation: true)
    }
    
    @objc func locationButtonClick() {
        if (delegate != nil) {
            delegate?.locationButtoncallBack!()
        }
    }
    
    //MARK: - private mothds
    func returnCustomeAttribute(string: String, font: UIFont, image: UIImage, width: CGFloat, height: CGFloat) -> NSMutableAttributedString {
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
    
    //MARK: - UI
    override func initLayout() {
        super.initLayout()
        self.addSubview(logoImageView)
        self.addSubview(cancelButton)
        self.addSubview(nameLabel)
        self.addSubview(nameDetailLabel)
        self.addSubview(distanceLabel)
        self.addSubview(timeLabel)
        self.addSubview(addressLabel)
        self.addSubview(usefulLabel)
        self.addSubview(unUsefulLabel)
        self.addSubview(locationButton)
        self.addSubview(imgView)
    }
    
    private lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView(frame: CGRect(x: 30, y: self.swipView.maxY + 10, width: 50, height: 50))
        logoImageView.image = UIImage.init(named: "图层3拷贝2")
        logoImageView.contentMode = UIViewContentMode.scaleAspectFill
        logoImageView.setCornerRadius(logoImageView.height / 2.0)
        return logoImageView
    }()
    
    private lazy var cancelButton: UIButton = {
        let cancelButton = UIButton(type: UIButtonType.custom)
        cancelButton.frame = CGRect(x: ScreenWidth - 34, y: self.swipView.maxY - 15, width: 24, height: 24)
        cancelButton.setBackgroundImage(UIImage.init(named: "圆角矩形5拷贝12"), for: UIControlState.normal)
        cancelButton.addTarget(self, action:#selector(cancelButtonClick), for: .touchUpInside)
        return cancelButton
    }()

    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel.init(frame: CGRect(x: logoImageView.maxX + 15, y: logoImageView.y, width: self.width - logoImageView.maxX - 30, height: 17))
        nameLabel.textAlignment = NSTextAlignment.left
        nameLabel.textColor = UIColor.textBlackColor()
        nameLabel.font = UIFont.font15()
        nameLabel.text = "KFC肯德基T6 - W1"
        return nameLabel
    }()
    
    private lazy var nameDetailLabel: UILabel = {
        let nameDetailLabel = UILabel.init(frame: nameLabel.frame)
        nameDetailLabel.y = nameLabel.maxY + 3
        nameDetailLabel.textAlignment = NSTextAlignment.left
        nameDetailLabel.textColor = UIColor.textBlackColor()
        nameDetailLabel.font = UIFont.font12()
        nameDetailLabel.text = "abcdef ghijk lmn opq"
        return nameDetailLabel
    }()

    private lazy var distanceLabel: UILabel = {
        let distanceLabel = UILabel.init(frame: CGRect(x: self.width - (70 + 15), y: nameDetailLabel.maxY, width: 70, height: 40))
        distanceLabel.textAlignment = NSTextAlignment.center
        distanceLabel.textColor = UIColor.textBlackColor()
        distanceLabel.font = UIFont.font15()
        distanceLabel.numberOfLines = 2
        distanceLabel.text = "距离\n0.2公里"
        return distanceLabel
    }()
    
    private lazy var timeLabel: UILabel = {
        let timeLabel = UILabel.init(frame: CGRect(x: nameLabel.x, y: nameDetailLabel.maxY, width: distanceLabel.x - nameDetailLabel.x, height: 20))
        timeLabel.textAlignment = NSTextAlignment.left
        timeLabel.textColor = UIColor.textBlackColor()
        timeLabel.attributedText = self.returnCustomeAttribute(string: " 00:00 - 24:00", font:UIFont.font12(), image: UIImage.init(named: "Clock")!, width:12, height:12)
        return timeLabel
    }()
    
    private lazy var addressLabel: UILabel = {
        let addressLabel = UILabel.init(frame: CGRect(x: timeLabel.x, y: timeLabel.maxY, width: timeLabel.width, height: 40))
        addressLabel.textAlignment = NSTextAlignment.left
        addressLabel.textColor = UIColor.textBlackColor()
        addressLabel.numberOfLines = 2
        addressLabel.attributedText = self.returnCustomeAttribute(string: "浙江省杭州市 余杭区 浙江省杭州市 余杭区", font:UIFont.font12(), image: UIImage.init(named: "地址")!, width:12, height:12)
        return addressLabel
    }()

    private lazy var usefulLabel: UILabel = {
        let usefulLabel = UILabel.init(frame: CGRect(x: addressLabel.x, y: addressLabel.maxY, width: (self.width - addressLabel.x - 15) / 2.0, height: 20))
        usefulLabel.textAlignment = NSTextAlignment.left
        usefulLabel.textColor = UIColor.textBlackColor()
        usefulLabel.attributedText = self.returnCustomeAttribute(string: " 可租借3个", font:UIFont.font17(), image: UIImage.init(named: "Flash拷贝3")!, width:17, height:17)
        return usefulLabel
    }()
    
    private lazy var unUsefulLabel: UILabel = {
        let unUsefulLabel = UILabel.init(frame: CGRect(x: usefulLabel.maxX, y: addressLabel.maxY, width: (self.width - addressLabel.x - 15) / 2.0, height: 20))
        unUsefulLabel.textAlignment = NSTextAlignment.left
        unUsefulLabel.textColor = UIColor.textBlackColor()
        unUsefulLabel.attributedText = self.returnCustomeAttribute(string: "可归还1个", font:UIFont.font17(), image: UIImage.init(named: "Inbox拷贝2")!, width:17, height:17)
        return unUsefulLabel
    }()
    
    private lazy var locationButton: UIButton = {
        let locationButton = UIButton(type: UIButtonType.custom)
        locationButton.frame = CGRect(x: 0, y: unUsefulLabel.maxY + 15, width: ScreenWidth*0.68, height: 40)
        locationButton.centerX = self.centerX
        locationButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        locationButton.setTitle("开始导航", for: UIControlState.normal)
        locationButton.titleLabel?.font = UIFont.font15()
        locationButton.backgroundColor = UIColor.mainColor()
        locationButton.addTarget(self, action:#selector(locationButtonClick), for:.touchUpInside)
        locationButton.layer.cornerRadius = locationButton.height/2.0
        locationButton.clipsToBounds = true
        return locationButton
    }()
    
    private lazy var imgView: UIImageView = {
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 23, height: 23))
        imgView.center = locationButton.center
        imgView.x = locationButton.x + 30
        imgView.image = UIImage.init(named: "开始导航")
        imgView.contentMode = UIViewContentMode.scaleAspectFill
        imgView.clipsToBounds = true
        return imgView
    }()
}
