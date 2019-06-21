//
//  LoanPopView.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/28.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

@objc protocol LoanPopViewProtocol: NSObjectProtocol {
    @objc optional func loanPopViewSearchButtoncallBack()
    @objc optional func loanPopViewLoanButtoncallBack()
}


class LoanPopView: PBBasePopView {
    
    weak var delegate: LoanPopViewProtocol?

    class func retrunHeight() -> CGFloat {
        return 210
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initLayout() {
        super.initLayout()
        self.contentView.addSubview(logoImageView)
        self.contentView.addSubview(leftLabel)
        self.contentView.addSubview(rightLabel)
        self.contentView.addSubview(searchButton)
        self.contentView.addSubview(loanButton)
    }
    
    //MARK: - UI
    private lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: self.swipView.maxY + 10, width: 70, height: 70))
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
        leftLabel.text = "找到可租借的"
        return leftLabel
    }()

    private lazy var rightLabel: UILabel = {
        let rightLabel = UILabel.init(frame: CGRect(x: logoImageView.maxX + 5, y: 0, width:  ScreenWidth - leftLabel.width, height: leftLabel.height))
        rightLabel.centerY = logoImageView.centerY
        rightLabel.textAlignment = NSTextAlignment.left
        rightLabel.textColor = leftLabel.textColor
        rightLabel.font = leftLabel.font
        rightLabel.text = "充电宝了吗？"
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
    
    private lazy var loanButton: PBCustomButton = {
        let loanButton = PBCustomButton.init(frame: CGRect(x: ScreenWidth/2.0 + 15, y: logoImageView.maxY + 20, width: 150, height: 40))
        loanButton.delegate = self
        loanButton.tag = 101
        loanButton.leftTittle = "YES"
        loanButton.rightTittle = "立即租借"
        return loanButton
    }()
}

//MARK - 按钮回调
extension LoanPopView: PBCustomButtonProtocol {
    func callBack(tag: Int) {
        if tag == 100 {
            if (delegate != nil) {
                delegate?.loanPopViewSearchButtoncallBack!()
            }
        }else if tag == 101 {
            if (delegate != nil) {
                delegate?.loanPopViewLoanButtoncallBack!()
            }
        }
    }
}
