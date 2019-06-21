//
//  BaseViewController.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/26.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//
//  controller基类，方便后期页面样式统一修改

import UIKit
import SVProgressHUD

class BaseViewController: UIViewController {
    
    //MARK: - life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true;
        view.backgroundColor = UIColor.white
        self.initLayout()
    }
    
    override func viewDidLayoutSubviews() {
        self.view.bringSubview(toFront: navigationView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - delegate
    
    //MARK: - touch events
    //返回按钮点击
    @objc func goBack() {
        let viewControllers = self.navigationController?.viewControllers
        if (viewControllers?.count)! > 1 {
            self.navigationController?.popViewController(animated: true)
        }else {
            self.dismiss(animated: true) {
            }
        }
    }
    
    //MARK: - public methods
    public func initLayout() {
        self.automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(navigationView)
        navigationView.addSubview(leftButton)
        navigationView.addSubview(rightButton)
        navigationView.addSubview(titleLabel)
    }
    
    //MARK: - private methods
    
    
    //MARK: - lazy init
    public lazy var navigationView: UIView = {
        let navigationView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: NavBarHeight))
        //用图片不行。。。。除非是1像素的图片
//        let bgImageView = UIImageView.init(image: UIImage.init(named: "顶部栏"))
//        bgImageView.frame = navigationView.frame
//        bgImageView.contentMode = UIViewContentMode.scaleAspectFill
//        bgImageView.clipsToBounds = true
//        navigationView.addSubview(bgImageView)
//        navigationView.clipsToBounds = true
        let line = UIView(frame: CGRect(x: 0, y: NavBarHeight - 0.5, width: ScreenWidth, height: 0.5))
        line.backgroundColor = UIColor.cellLineColor()
        navigationView.addSubview(line)
        navigationView.clipsToBounds = true
        return navigationView
    }()
    
    public lazy var leftButton: UIButton = {
       let leftButton = UIButton(type: UIButtonType.custom)
        leftButton.frame = CGRect(x: 12, y: StatusBarHeight + 10, width: 24, height: 24)
        leftButton.setBackgroundImage(UIImage.init(named: "返回"), for: UIControlState.normal)
        leftButton.addTarget(self, action:#selector(goBack), for: .touchUpInside)
        return leftButton
    }()
    
    public lazy var rightButton: UIButton = {
       let rightButton = UIButton(type: UIButtonType.custom)
        rightButton.frame = leftButton.frame
        rightButton.x = ScreenWidth - 34
        rightButton.setBackgroundImage(UIImage.init(named: "圆角矩形5拷贝12"), for: UIControlState.normal)
        rightButton.addTarget(self, action:#selector(goBack), for: .touchUpInside)
        rightButton.isHidden = true
        return rightButton
    }()
    
    public lazy var titleLabel: UILabel = {
       let titleLabel = UILabel.init(frame: CGRect(x: leftButton.maxX + 5, y: leftButton.y, width: rightButton.x - leftButton.maxX - 5, height: leftButton.height))
        titleLabel.textAlignment = NSTextAlignment.left
        titleLabel.font = UIFont.font15()
        titleLabel.textColor = UIColor.textBlackColor()
        return titleLabel
    }()

}
