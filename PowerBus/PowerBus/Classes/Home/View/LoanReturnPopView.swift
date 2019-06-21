//
//  LoanReturnPopView.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/29.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

@objc protocol LoanReturnPopViewProtocol: NSObjectProtocol {
    @objc optional func loanReturnPopViewSearchButtoncallBack()
    @objc optional func loanReturnPopViewReturnButtoncallBack()
}


class LoanReturnPopView: PBBasePopView {
    
    weak var delegate: LoanReturnPopViewProtocol?

    class func retrunHeight() -> CGFloat {
        return 320
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initLayout() {
        super.initLayout()
        self.addSubview(tipLabel)
        self.contentView.addSubview(leftTipLabel)
        self.contentView.addSubview(rightTipLabel)
        self.contentView.addSubview(timeLabel)
        self.contentView.addSubview(moneyLabel)
        self.contentView.addSubview(lineView)
        self.contentView.addSubview(logoImageView)
        self.contentView.addSubview(leftLabel)
        self.contentView.addSubview(rightLabel)
        self.contentView.addSubview(logoImageView)
        self.contentView.addSubview(searchButton)
        self.contentView.addSubview(returnButton)
    }
    
    private lazy var tipLabel: UILabel = {
        let tipLabel = UILabel.init(frame: CGRect(x: 0, y: self.swipView.maxY + 15, width: ScreenWidth, height: 25))
        tipLabel.textAlignment = NSTextAlignment.center
        tipLabel.textColor = UIColor.textGrayColor()
        tipLabel.font = UIFont.systemFont(ofSize: 22)
        tipLabel.text = "租借中..."
        return tipLabel
    }()
    
    private lazy var leftTipLabel: UILabel = {
        let leftTipLabel = UILabel.init(frame: CGRect(x: 15, y: tipLabel.maxY, width: ScreenWidth/2.0 - 15, height: 16))
        leftTipLabel.textAlignment = NSTextAlignment.center
        leftTipLabel.textColor = UIColor.textGrayColor()
        leftTipLabel.font = UIFont.font15()
        leftTipLabel.text = "已充时间"
        return leftTipLabel
    }()
    
    private lazy var rightTipLabel: UILabel = {
        let rightTipLabel = UILabel.init(frame: CGRect(x: ScreenWidth/2.0 + 15, y: tipLabel.maxY, width: ScreenWidth/2.0 - 15, height: 16))
        rightTipLabel.textAlignment = NSTextAlignment.center
        rightTipLabel.textColor = UIColor.textGrayColor()
        rightTipLabel.font = UIFont.font15()
        rightTipLabel.text = "预估费用"
        return rightTipLabel
    }()
    
    private lazy var timeLabel: UILabel = {
        let timeLabel = UILabel.init(frame: CGRect(x: 15, y: leftTipLabel.maxY + 5, width: ScreenWidth/2.0 - 15, height: 25))
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.textColor = UIColor.textGrayColor()
        timeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        timeLabel.text = "2小时28分钟"
        return timeLabel
    }()
    
    private lazy var moneyLabel: UILabel = {
        let moneyLabel = UILabel.init(frame: CGRect(x: ScreenWidth/2.0 + 15, y: leftTipLabel.maxY + 5, width: ScreenWidth/2.0 - 15, height: 25))
        moneyLabel.textAlignment = NSTextAlignment.center
        moneyLabel.textColor = UIColor.textGrayColor()
        moneyLabel.font = UIFont.boldSystemFont(ofSize: 20)
        moneyLabel.text = "2.5澳币"
        return moneyLabel
    }()
    
    private lazy var lineView: UIView = {
        let lineView = UIView.init(frame: CGRect(x: 15, y: moneyLabel.maxY + 15, width: ScreenWidth - 30, height: 0.5))
        lineView.backgroundColor = UIColor.cellLineColor()
        return lineView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: lineView.maxY + 25, width: 70, height: 70))
        logoImageView.centerX = self.contentView.centerX
        logoImageView.image = UIImage.init(named: "曲线1933")
        logoImageView.contentMode = UIViewContentMode.scaleAspectFill
        logoImageView.clipsToBounds = true;
        return logoImageView
    }()
    
    private lazy var leftLabel: UILabel = {
        let leftLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: (ScreenWidth - logoImageView.width) / 2.0 - 5, height: 15))
        leftLabel.centerY = logoImageView.centerY
        leftLabel.textAlignment = NSTextAlignment.right
        leftLabel.textColor = UIColor.textGrayColor()
        leftLabel.font = UIFont.font15()
        leftLabel.text = "找到可归还的"
        return leftLabel
    }()
    
    private lazy var rightLabel: UILabel = {
        let rightLabel = UILabel.init(frame: CGRect(x: logoImageView.maxX + 5, y: 0, width:  ScreenWidth - leftLabel.width, height: leftLabel.height))
        rightLabel.centerY = logoImageView.centerY
        rightLabel.textAlignment = NSTextAlignment.left
        rightLabel.textColor = leftLabel.textColor
        rightLabel.font = leftLabel.font
        rightLabel.text = "机柜了吗？"
        return rightLabel
    }()
    
    private lazy var searchButton: PBCustomButton = {
        let searchButton = PBCustomButton.init(frame: CGRect(x: (ScreenWidth - 30)/2.0 - 150, y: logoImageView.maxY + 20, width: 150, height: 40))
        searchButton.delegate = self
        searchButton.tag = 100
        searchButton.leftTittle = "NO"
        searchButton.rightTittle = "搜索机柜"
        return searchButton
    }()
    
    private lazy var returnButton: PBCustomButton = {
        let returnButton = PBCustomButton.init(frame: CGRect(x: ScreenWidth/2.0 + 15, y: logoImageView.maxY + 20, width: 150, height: 40))
        returnButton.delegate = self
        returnButton.tag = 101
        returnButton.leftTittle = "YES"
        returnButton.rightTittle = "立即归还"
        return returnButton
    }()
}

//MARK - 按钮回调
extension LoanReturnPopView: PBCustomButtonProtocol {
    func callBack(tag: Int) {
        if tag == 100 {
            if (delegate != nil) {
                delegate?.loanReturnPopViewSearchButtoncallBack!()
            }
        }else if tag == 101 {
            if (delegate != nil) {
                delegate?.loanReturnPopViewReturnButtoncallBack!()
            }
        }
    }
}
