//
//  LoanOrderDetailVC.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/31.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class LoanOrderDetailVC: BaseViewController {

    var bottomHeight:CGFloat = 0//记录最后一行的高度，有用
    var titlesArray:Array<String> = ["租借时间:", "租借时长:", "租借地址:", "订单编号:", "设备类型:", "费用标准:"]
    var dataArray:Array<String> = ["2018-09-20 15：57：07", "5小时28分钟", "星巴克咖啡W4-W5", "2348239482340232348", "随身充电宝", "0.5澳元/小时，10分钟内免费"]
    
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
        let vc = ReturnMachineStepVC.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - private methods
    func creatSubLabel() {
        bottomHeight = line.maxY + 20
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
            bottomHeight = titleLabel.maxY
            
            self.scroller.addSubview(titleLabel)
            self.scroller.addSubview(contentLabel)
        }
    }
    
    
    //MARK - UI
    override func initLayout() {
        super.initLayout()
        self.leftButton.isHidden = true
        self.rightButton.isHidden = false
        self.titleLabel.text = "订单详情"
        self.view.addSubview(scroller)
        scroller.addSubview(headView)
        scroller.addSubview(cellView)
        scroller.addSubview(tip2Label)
        scroller.addSubview(line)
        self.creatSubLabel()
        if self.scroller.height - bottomHeight > 50 {//还有空间可以放控件
            self.scroller.addSubview(self.problemLabel)
            problemLabel.y = self.scroller.height - 35
        }else {
            self.scroller.contentSize = CGSize(width: self.view.width, height: bottomHeight + 50)
            self.scroller.addSubview(self.problemLabel)
            problemLabel.y = bottomHeight + 15
        }
    }
    
    private lazy var scroller: UIScrollView = {
        let scroller = UIScrollView.init(frame: CGRect(x: 0, y: NavBarHeight, width: self.view.width, height: self.view.height - NavBarHeight))
        scroller.backgroundColor = UIColor.whiteColor()
        scroller.showsVerticalScrollIndicator = false
        scroller.contentSize = scroller.frame.size
        return scroller
    }()
    
    private lazy var headView: UIView = {
        let headView = UIView.init(frame: CGRect(x: 0, y: 0, width: self.view.width, height: 160))
        let tipLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: headView.width, height: 27))
        tipLabel.textAlignment = NSTextAlignment.center
        tipLabel.textColor = UIColor.textGrayColor()
        tipLabel.centerY = headView.centerY - 15
        let attri = NSMutableAttributedString.init(string: "")
        let attch = NSTextAttachment.init()
        attch.image = UIImage.init(named: "if_checkmark-拷贝2")
        attch.bounds = CGRect(x: 0, y: -2, width: 18, height: 18)
        let text = NSAttributedString(attachment: attch)
        let test1 = NSAttributedString(string: "  租借成功", attributes: [kCTFontAttributeName as NSAttributedStringKey: UIFont.systemFont(ofSize: 20)])
        attri.append(text)
        attri.append(test1)
        tipLabel.attributedText = attri
        
        let tip1Label = UILabel.init(frame: CGRect(x: 0, y: tipLabel.maxY + 15, width: headView.width, height: 15))
        tip1Label.textAlignment = NSTextAlignment.center
        tip1Label.textColor = UIColor.textGrayColor()
        tip1Label.font = UIFont.font13()
        tip1Label.text = "使用完成请尽快归还充电宝哦~"
        headView.addSubview(tipLabel)
        headView.addSubview(tip1Label)
        return headView
    }()
    
    private lazy var cellView: UIView = {
        let cellView = UIView.init(frame: CGRect(x: 0, y: headView.maxY, width: self.view.width, height: 7))
        cellView.backgroundColor = UIColor.cellLineColor()
        return cellView
    }()
    
    private lazy var tip2Label: UILabel = {
        let tip2Label = UILabel.init(frame: CGRect(x: 0, y: cellView.maxY, width: self.view.width, height: 60))
        tip2Label.textAlignment = NSTextAlignment.center
        tip2Label.textColor = UIColor.textBlackColor()
        tip2Label.font = UIFont.font16()
        tip2Label.text = "订 单 详 情"
        return tip2Label
    }()
    
    private lazy var line: UIView = {
        let line = UIView.init(frame: CGRect(x: 0, y: tip2Label.maxY, width: self.view.width, height: 0.5))
        line.backgroundColor = UIColor.cellLineColor()
        return line
    }()
    
    private lazy var problemLabel: UILabel = {
        let problemLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: self.view.width, height: 16))
        problemLabel.textAlignment = NSTextAlignment.center
        problemLabel.textColor = UIColor.textGrayColor()
        problemLabel.font = UIFont.font14()
        let string = NSMutableAttributedString.init(string: "如何归还充电宝？")
        string.addAttribute(.underlineStyle, value: NSNumber.init(value: 1), range: NSRange(location: 0, length: 8))
        problemLabel.attributedText = string
        problemLabel.isUserInteractionEnabled = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(problemLabelClick))
        problemLabel.addGestureRecognizer(tap)
        return problemLabel
    }()
}
