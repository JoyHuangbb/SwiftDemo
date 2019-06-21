//
//  OrderRecordTableViewCell.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/11/2.
//  Copyright © 2018 黄彬彬. All rights reserved.
//

import UIKit

@objc protocol OrderRecordTableViewCellProtocol: NSObjectProtocol {
    @objc optional func orderRecordTableViewCellQuestionButtoncallBack()
}

class OrderRecordTableViewCell: UITableViewCell {
    
    var cellTag: Int?
    weak var delegate: OrderRecordTableViewCellProtocol?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func questionButtonClick() {
        if delegate != nil {
            delegate?.orderRecordTableViewCellQuestionButtoncallBack!()
        }
    }
    
    //MARK: - UI
    func setupUI() {
        self.contentView.addSubview(stateLabel)
        self.contentView.addSubview(questionButton)
        self.contentView.addSubview(machineTypeLabel)
        self.contentView.addSubview(line1)
        self.contentView.addSubview(orderNumberLabel)
        self.contentView.addSubview(addressLabel)
        self.contentView.addSubview(startTimeLabel)
        self.contentView.addSubview(line2)
        self.contentView.addSubview(durationLabel)
        self.contentView.addSubview(moneyLabel)
    }
    
    private lazy var stateLabel: UILabel = {
        let stateLabel = UILabel.init(frame: CGRect(x: 30, y: 0, width: 80, height: 40))
        stateLabel.textAlignment = NSTextAlignment.left
        stateLabel.textColor = UIColor.textBlackColor()
        stateLabel.font = UIFont.font13()
        
        let attri = NSMutableAttributedString.init(string: "")
        let attch = NSTextAttachment.init()
        attch.image = UIImage.init(named: "图层1021")
        attch.bounds = CGRect(x: 0, y: -5, width: 22, height: 22)
        let text = NSAttributedString(attachment: attch)
        let test1 = NSAttributedString(string: "正在使用", attributes: [kCTFontAttributeName as NSAttributedStringKey: UIFont.font13()])
        attri.append(text)
        attri.append(test1)
        stateLabel.attributedText = attri
        return stateLabel
    }()
    
    private lazy var questionButton: UIButton = {
        let questionButton = UIButton(type: UIButtonType.custom)
        questionButton.frame = CGRect(x: ScreenWidth - 52, y: 9, width: 22, height: 22)
        questionButton.setBackgroundImage(UIImage.init(named: "Questionmark拷贝2"), for: .normal)
        questionButton.addTarget(self, action:#selector(questionButtonClick), for:.touchUpInside)
        questionButton.clipsToBounds = true
        return questionButton
    }()
    
    private lazy var machineTypeLabel: UILabel = {
        let machineTypeLabel = UILabel.init(frame: CGRect(x: stateLabel.maxX + 10, y: stateLabel.y, width: questionButton.x - stateLabel.maxX - 20, height: stateLabel.height))
        machineTypeLabel.textAlignment = NSTextAlignment.right
        machineTypeLabel.textColor = UIColor.textBlackColor()
        machineTypeLabel.font = UIFont.font13()
        machineTypeLabel.text = "设置类型：随身充电宝"
        return machineTypeLabel
    }()
    
    private lazy var line1: UIView = {
       let line1 = UIView.init(frame: CGRect(x: 28, y: stateLabel.maxY, width: ScreenWidth - 56, height: 0.5))
        line1.backgroundColor = UIColor.cellLineColor()
        return line1
    }()
    
    private lazy var orderNumberLabel: UILabel = {
        let orderNumberLabel = UILabel.init(frame: CGRect(x: stateLabel.x, y: line1.y + 5, width: ScreenWidth - 60, height: 20))
        orderNumberLabel.textAlignment = NSTextAlignment.left
        orderNumberLabel.textColor = UIColor.textBlackColor()
        orderNumberLabel.font = UIFont.font12()
        orderNumberLabel.text = "订单编号：2155889966466"
        return orderNumberLabel
    }()
    
    private lazy var addressLabel: UILabel = {
        let addressLabel = UILabel.init(frame: orderNumberLabel.frame)
        addressLabel.y = orderNumberLabel.maxY
        addressLabel.textAlignment = NSTextAlignment.left
        addressLabel.textColor = UIColor.textBlackColor()
        addressLabel.font = UIFont.font12()
        addressLabel.text = "租借地址：Pizzar Marzano店"
        return addressLabel
    }()
    
    private lazy var startTimeLabel: UILabel = {
        let startTimeLabel = UILabel.init(frame: addressLabel.frame)
        startTimeLabel.y = addressLabel.maxY
        startTimeLabel.textAlignment = NSTextAlignment.left
        startTimeLabel.textColor = UIColor.textBlackColor()
        startTimeLabel.font = UIFont.font12()
        startTimeLabel.text = "开始时间：2018-09-05 15:12:12"
        return startTimeLabel
    }()
    
    private lazy var line2: UIView = {
        let line2 = UIView.init(frame: line1.frame)
        line2.y = startTimeLabel.maxY + 5
        line2.backgroundColor = UIColor.cellLineColor()
        return line2
    }()
    
    private lazy var durationLabel: UILabel = {
        let durationLabel = UILabel.init(frame: CGRect(x: 30, y: line2.maxY, width: ScreenWidth/2.0 - 30, height: 40))
        durationLabel.textAlignment = NSTextAlignment.center
        durationLabel.textColor = UIColor.textBlackColor()
        durationLabel.font = UIFont.font13()
        durationLabel.text = "租借时长：55分钟"
        return durationLabel
    }()
    
    private lazy var moneyLabel: UILabel = {
        let moneyLabel = UILabel.init(frame: durationLabel.frame)
        moneyLabel.x = ScreenWidth / 2.0
        moneyLabel.textAlignment = NSTextAlignment.center
        moneyLabel.textColor = UIColor.textBlackColor()
        moneyLabel.font = UIFont.font13()
        moneyLabel.text = "支付金额：0.5澳币"
        return moneyLabel
    }()
}
