//
//  LoanMachineViewController.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/31.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//
//  考虑到可能到租借和归还的逻辑比较复杂，所以将此类和ReturnMachineViewController分开写

import UIKit

class LoanMachineViewController: BaseViewController {

    var timer: Timer!
    var timeNum:Float = 0
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLayout()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopTimer()
        HUDManager.dismiss()
    }
    
    //MARK: - touch evenets
    
    @objc func refuseButtonClick() {
        HUDManager.show("尝试重新租借")
        let vc = LoanOrderDetailVC.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //上报错误
    @objc func upLoadLabelButtonClick() {
        let vc = UploadErrorViewController.init(nibName: nil, bundle: nil)
        vc.errorType = UploadErrorType.LoanMachineError.rawValue
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //MARK: - private methods
    @objc func timeGo() {
        timeNum = timeNum + 0.1
        
        if timeNum > 1.1 {
            stopTimer()
        }else {
            progressView.setProgress(timeNum, animated: false)
            progressLabel.text = String(format: "%.0f%@", timeNum * 100, "%")
            progressLabel.centerX = progressView.x + progressView.width * CGFloat(timeNum)
        }
    }
    
    func stopTimer() {
        if timer != nil {
            timer!.invalidate() //销毁timer
            timer = nil
        }
    }
    
    
    //MARK - UI
    override func initLayout() {
        super.initLayout()
        self.leftButton.isHidden = true
        self.rightButton.isHidden = false
        self.titleLabel.text = "开始租借"
        self.view.addSubview(logoImageView)
        self.view.addSubview(tipLabel)
        self.view.addSubview(tip1Label)
        self.view.addSubview(progressView)
        self.view.addSubview(progressLabel)
        //模拟租借过程
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeGo), userInfo: nil, repeats: true)
        timer.fire()
        
        self.view.addSubview(tip2Label)
        self.view.addSubview(refuseButton)
        self.view.addSubview(upLoadLabel)
    }
    
    private lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: ScreenWidth * 0.64, height: ScreenWidth * 0.64))
        logoImageView.center = view.center
        logoImageView.image = UIImage.gifImageWithName("租借动画01")
        logoImageView.contentMode = UIViewContentMode.scaleToFill
        return logoImageView
    }()
    
    private lazy var tipLabel: UILabel = {
        let tipLabel = UILabel.init(frame: CGRect(x: 0, y: logoImageView.y - 40, width: self.view.width, height: 15))
        tipLabel.textAlignment = NSTextAlignment.center
        tipLabel.textColor = UIColor.textBlackColor()
        tipLabel.font = UIFont.font13()
        tipLabel.text = "等待指示灯亮起"
        return tipLabel
    }()
    
    private lazy var tip1Label: UILabel = {
        let tip1Label = UILabel.init(frame: CGRect(x: 0, y: tipLabel.y - 25, width: self.view.width, height: 20))
        tip1Label.textAlignment = NSTextAlignment.center
        tip1Label.textColor = UIColor.hexadecimalColor(hexadecimal: "3e3e3d")
        tip1Label.font = UIFont.font18()
        tip1Label.text = "正在等待充电宝，请不要关闭本页面"
        return tip1Label
    }()
    
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView.init(frame: CGRect(x: 60, y: logoImageView.maxY + 10, width: self.view.width - 120, height: 4))
        progressView.progressTintColor = UIColor.mainColor()
        progressView.trackTintColor = UIColor.textGrayColor()
        return progressView
    }()
    
    private lazy var progressLabel: UILabel = {
        let progressLabel = UILabel.init(frame: CGRect(x: progressView.x - 20, y: progressView.y - 16, width: 40, height: 12))
        progressLabel.textAlignment = NSTextAlignment.center
        progressLabel.textColor = UIColor.textGrayColor()
        progressLabel.font = UIFont.font11()
        progressLabel.text = "0%"
        return progressLabel
    }()
    
    private lazy var tip2Label: UILabel = {
        let tip2Label = UILabel.init(frame: CGRect(x: 0, y: progressView.y + 15, width: self.view.width, height: 20))
        tip2Label.textAlignment = NSTextAlignment.center
        tip2Label.textColor = UIColor.textBlackColor()
        tip2Label.font = UIFont.font18()
        tip2Label.text = "请从图示位置取走充电宝"
        return tip2Label
    }()
    
    private lazy var refuseButton: UIButton = {
        let refuseButton = UIButton(type: UIButtonType.custom)
        refuseButton.frame = CGRect(x: 0, y: 0, width: ScreenWidth*0.68, height: 40)
        refuseButton.center = self.view.center
        refuseButton.y = ScreenHeight*0.92 - refuseButton.height
        refuseButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        refuseButton.setTitle("无法取走充电宝？", for: UIControlState.normal)
        refuseButton.titleLabel?.font = UIFont.font15()
        refuseButton.backgroundColor = UIColor.mainColor()
        refuseButton.addTarget(self, action:#selector(refuseButtonClick), for:.touchUpInside)
        refuseButton.layer.cornerRadius = refuseButton.height/2.0
        refuseButton.clipsToBounds = true
        return refuseButton;
    }()
    
    private lazy var upLoadLabel: UILabel = {
        let upLoadLabel = UILabel.init(frame: CGRect(x: 0, y: refuseButton.maxY + 10, width: ScreenWidth, height: 15))
        upLoadLabel.textAlignment = NSTextAlignment.center
        upLoadLabel.textColor = UIColor.textGrayColor()
        upLoadLabel.font = UIFont.font12()
        let string = NSMutableAttributedString.init(string: "尝试重新租借失败？点此上报错误！")
        string.addAttribute(.underlineStyle, value: NSNumber.init(value: 1), range: NSRange(location: 9, length: 7))
        upLoadLabel.attributedText = string
        upLoadLabel.isUserInteractionEnabled = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(upLoadLabelButtonClick))
        upLoadLabel.addGestureRecognizer(tap)
        return upLoadLabel
    }()
}
