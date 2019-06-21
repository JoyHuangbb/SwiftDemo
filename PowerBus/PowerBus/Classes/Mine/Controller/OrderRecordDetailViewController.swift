//
//  OrderRecordDetailViewController.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/11/2.
//  Copyright © 2018 黄彬彬. All rights reserved.
//

import UIKit

class OrderRecordDetailViewController: BaseViewController {

    var titlesArray:Array<String> = ["租借时间:", "租借时长:", "租借地址:", "订单编号:", "设备类型:", "费用标准:", "充电时间:", "费用:"]
    var dataArray:Array<String> = ["2018-09-20 15：57：07", "5小时28分钟", "星巴克咖啡W4-W5", "2348239482340232348", "随身充电宝", "0.5澳元/小时，10分钟内免费", "2小时28分钟", "2.5澳元"]
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - touch events
    @objc func problemLabelClick() {
        let vc = UploadErrorViewController.init(nibName: nil, bundle: nil)
        vc.errorType = UploadErrorType.OrderError.rawValue
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - private methods
    func creatSubLabel() {
        var bottomHeight: CGFloat = line.maxY + 20
        for(indexs,item) in titlesArray.enumerated() {
            let titleLabel = UILabel.init(frame: CGRect(x: 30, y: bottomHeight, width: (self.view.width - 60) * 0.3, height: 30))
            titleLabel.textAlignment = NSTextAlignment.right
            titleLabel.textColor = UIColor.textGrayColor()
            titleLabel.font = UIFont.font16()
            titleLabel.text = item
            
            let contentLabel = UILabel.init(frame: CGRect(x: titleLabel.maxX, y: bottomHeight, width: (self.view.width - 60) * 0.7, height: 30))
            contentLabel.textAlignment = NSTextAlignment.right
            contentLabel.textColor = UIColor.textGrayColor()
            contentLabel.font = UIFont.font16()
            contentLabel.text = dataArray[indexs]
            contentLabel.tag = 100 + indexs
            
            if indexs >= titlesArray.count - 2 {//后两个特殊点
                titleLabel.height = 40
                titleLabel.width = (self.view.width - 60)/2.0
                contentLabel.height = 40
                contentLabel.width = (self.view.width - 60)/2.0
                contentLabel.x = titleLabel.maxX
                contentLabel.font = UIFont.systemFont(ofSize: 22)
            }
            bottomHeight = titleLabel.maxY
            
            self.view.addSubview(titleLabel)
            self.view.addSubview(contentLabel)
        }
    }
    
    //MARK - UI
    override func initLayout() {
        super.initLayout()
        self.titleLabel.text = "租借详情"
        self.view.addSubview(tipLabel)
        self.view.addSubview(line)
        self.creatSubLabel()
        self.view.addSubview(problemLabel)
    }

    private lazy var tipLabel: UILabel = {
        let tipLabel = UILabel.init(frame: CGRect(x: 0, y: NavBarHeight + 20, width: self.view.width, height: 60))
        tipLabel.textAlignment = NSTextAlignment.center
        tipLabel.textColor = UIColor.textBlackColor()
        tipLabel.font = UIFont.systemFont(ofSize: 20)
        tipLabel.text = "租 借 详 情"
        return tipLabel
    }()
    
    private lazy var line: UIView = {
        let line = UIView.init(frame: CGRect(x: 0, y: tipLabel.maxY, width: self.view.width, height: 0.5))
        line.backgroundColor = UIColor.cellLineColor()
        return line
    }()
    
    private lazy var problemLabel: UILabel = {
        let problemLabel = UILabel.init(frame: CGRect(x: 0, y: self.view.height - 35, width: self.view.width, height: 6))
        problemLabel.textAlignment = NSTextAlignment.center
        problemLabel.textColor = UIColor.textGrayColor()
        problemLabel.font = UIFont.font14()
        let string = NSMutableAttributedString.init(string: "对此订单有疑问?")
        string.addAttribute(.underlineStyle, value: NSNumber.init(value: 1), range: NSRange(location: 0, length: 8))
        problemLabel.attributedText = string
        problemLabel.isUserInteractionEnabled = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(problemLabelClick))
        problemLabel.addGestureRecognizer(tap)
        return problemLabel
    }()
}
