//
//  UploadErrorViewController.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/30.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

enum UploadErrorType: Int {
    case LoanMachineError = 0 //租借错误
    case ReturnMachineError = 1 //归还错误
    case OrderError = 2 //订单问题
}

class UploadErrorViewController: BaseViewController {
    
    public var errorType:Int = 0

    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - touch events
    @objc func chooseImage() {
        print("上传图片")
    }
    
    @objc func submitButtonClick() {
        print("提交反馈")
    }
    
    //MARK - UI
    override func initLayout() {
        super.initLayout()
        self.titleLabel.text = "上报错误反馈"
        if self.errorType == UploadErrorType.OrderError.rawValue {
            self.titleLabel.text = "订单问题反馈"
        }
        self.view.addSubview(placeholderTextView)
        self.view.addSubview(line)
        self.view.addSubview(addImageView)
        self.view.addSubview(submitButton)
    }
    
    private lazy var placeholderTextView: PlaceholderTextView = {
        var placeholderString = "请输入你遇到的详细问题，我们将尽快为你解决"
        if self.errorType == UploadErrorType.OrderError.rawValue {
            placeholderString = "请输入您对订单的详细问题，我们将尽快为你解决"
        }
        let placeholderTextView = PlaceholderTextView(placeholder: placeholderString, placeholderColor: UIColor.lightGray, frame: CGRect(x: 0, y: NavBarHeight + 5, width: self.view.width, height: 150))
        placeholderTextView.isShowCountLabel = true
        placeholderTextView.limitWords = 200
        placeholderTextView.isReturnHidden = true
        placeholderTextView.becomeFirstResponder()
        return placeholderTextView
    }()
    
    private lazy var line: UIView = {
        let line = UIView.init(frame: CGRect(x: 0, y: placeholderTextView.maxY, width: self.view.width, height: 0.5))
        line.backgroundColor = UIColor.cellLineColor()
        return line
    }()
    
    private lazy var addImageView: UIView = {
        let addImageView = UIView.init(frame: CGRect(x: 30, y: line.maxY + 35, width: 90, height: 90))
        addImageView.layer.borderWidth = 0.5
        addImageView.layer.borderColor = UIColor.cellLineColor().cgColor
        addImageView.clipsToBounds = true
        addImageView.isUserInteractionEnabled = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        addImageView.addGestureRecognizer(tap)
        
        let imageView = UIImageView.init(frame: CGRect(x: 25, y: 25, width: 40, height: 40))
        imageView.image = UIImage.init(named: "圆角矩形1096拷贝")
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        imageView.clipsToBounds = true;
        addImageView.addSubview(imageView)
        return addImageView;
    }()
    
    private lazy var submitButton: UIButton = {
        let submitButton = UIButton(type: UIButtonType.custom)
        submitButton.frame = CGRect(x: 0, y: 0, width: ScreenWidth*0.68, height: 40)
        submitButton.center = self.view.center
        submitButton.y = ScreenHeight*0.9 - submitButton.height
        submitButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        submitButton.setTitle("提交", for: UIControlState.normal)
        submitButton.titleLabel?.font = UIFont.font15()
        submitButton.backgroundColor = UIColor.mainColor()
        submitButton.addTarget(self, action:#selector(submitButtonClick), for:.touchUpInside)
        submitButton.layer.cornerRadius = submitButton.height/2.0
        submitButton.clipsToBounds = true
        return submitButton;
    }()
}
