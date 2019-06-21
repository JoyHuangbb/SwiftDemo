//
//  HomeViewController.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/27.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit
import FDFullscreenPopGesture

class HomeViewController: BaseViewController, MAMapViewDelegate {
    
    var popViewArray: NSMutableArray? //可能需要个容器来存放页面上弹出的页面
    
    //MARK: - life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fd_interactivePopDisabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popViewArray = NSMutableArray.init()
        self.initLayout()
        
        if self.isLocationServiceOpen() == false {//检测定位权限
            self.clearPopView()
            popViewArray?.add(self.locaNoAuthPopView)
            self.locaNoAuthPopView.popFromSuperView(superVc: self, title: "", contentHeight: LoactionNoAuthPopView.retrunHeight(), animation: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.fd_interactivePopDisabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - touch events
    //个人中心按钮点击
    @objc func personalCenterButtonClick() {
        let vc = MineViewController.init(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //定位按钮点击
    @objc func locationButtonClick() {
        
        //我要租借
//        let view = LoanPopView.init(frame: LoanPopView.originalRect())
//        view.delegate = self
//        view.popFromSuperView(superVc: self, title: "我要租借", contentHeight: LoanPopView.retrunHeight(), animation: true)
//        popViewArray?.add(view)

        //定位权限
//        let view = LoactionNoAuthPopView.init(frame: LoactionNoAuthPopView.originalRect())
//        view.delegate = self
//        view.popFromSuperView(superVc: self, title: "", contentHeight: LoactionNoAuthPopView.retrunHeight(), animation: true)
//        popViewArray?.add(view)
        
        //搜索商家
//        let view = HomeSearchPopView.init(frame: HomeSearchPopView.originalRect())
//        view.popFromSuperView(superVc: self, title: "", contentHeight: HomeSearchPopView.retrunHeight(), animation: true)
//        popViewArray?.add(view)
        
        //商家详情
//        let view = HomeShopDetailPopView.init(frame: HomeShopDetailPopView.originalRect())
//        view.delegate = self
//        view.popFromSuperView(superVc: self, title: "", contentHeight: HomeShopDetailPopView.retrunHeight(), animation: true)
//        popViewArray?.add(view)
        
        //拒绝定位权限
//        let view = LocationAuthRefusePopView.init(frame: LocationAuthRefusePopView.originalRect())
//        view.popFromSuperView(superVc: self, title: "", contentHeight: LocationAuthRefusePopView.retrunHeight(), animation: true)
        
        //我要归还
//        let view = LoanReturnPopView.init(frame: LoanReturnPopView.originalRect())
//        view.delegate = self
//        view.popFromSuperView(superVc: self, title: "我要归还", contentHeight: LoanReturnPopView.retrunHeight(), animation: true)
//        popViewArray?.add(view)
        
        //蓝牙权限
        let view = BluetoothNoAuthPopView.init(frame: BluetoothNoAuthPopView.originalRect())
        view.delegate = self
        view.popFromSuperView(superVc: self, title: "", contentHeight: BluetoothNoAuthPopView.retrunHeight(), animation: true)
        popViewArray?.add(view)
        
        //拒绝蓝牙权限
//        let view = BluetoothAuthRefusePopView.init(frame: BluetoothAuthRefusePopView.originalRect())
//        view.popFromSuperView(superVc: self, title: "", contentHeight: BluetoothAuthRefusePopView.retrunHeight(), animation: true)
    }
    
    //MARK: - private methods
    /// 检测是否开启定位
    func isLocationServiceOpen() -> Bool {
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.denied {
            return false
        } else {
            return true
        }
    }
    
    /// 清除页面上的弹出视图（不一定都是要清除的啊。。。）
    func clearPopView() {
        for popView in self.popViewArray! {
            if  popView is PBBasePopView {
                let view = popView as! PBBasePopView
                view.dismissFromSuperView(animation: true)
            }
        }
    }
    
    //MARK: - UI
    override func initLayout() {
        super.initLayout()
        self.navigationView.isHidden = true
        self.view.addSubview(mapView)
        self.view.addSubview(functionView)
    }
    
    private lazy var mapView: MAMapView = {
        let mapView = MAMapView.init(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
        mapView.zoomLevel = 14
        mapView.userTrackingMode = MAUserTrackingMode.follow
        mapView.showsCompass = false
        mapView.showsScale = false
//        mapView.delegate = self
        return mapView
    }()
    
    private lazy var functionView: UIImageView = {
       let functionView = UIImageView.init(frame: CGRect(x: ScreenWidth - 70, y: 40, width: 42, height: 90))
        functionView.image = UIImage.init(named: "矩形1901")
        functionView.contentMode = UIViewContentMode.scaleToFill
        functionView.clipsToBounds = true
        functionView.isUserInteractionEnabled = true
        
        let personalCenterButton = UIButton(type: UIButtonType.custom)
        personalCenterButton.setBackgroundImage(UIImage.init(named: "个人中心图标"), for: .normal)
        personalCenterButton.setBackgroundImage(UIImage.init(named: "个人中心图标"), for: .normal)
        personalCenterButton.frame = CGRect(x: 10, y: 10, width: 23, height: 23)
        personalCenterButton.addTarget(self, action:#selector(personalCenterButtonClick), for:.touchUpInside)
        functionView.addSubview(personalCenterButton)
        
        let locationButton = UIButton(type: UIButtonType.custom)
        locationButton.setBackgroundImage(UIImage.init(named: "定位图标"), for: .normal)
        locationButton.setBackgroundImage(UIImage.init(named: "定位图标"), for: .normal)
        locationButton.frame = personalCenterButton.frame
        locationButton.y = functionView.height / 2.0 + 10
        locationButton.addTarget(self, action:#selector(locationButtonClick), for:.touchUpInside)
        functionView.addSubview(locationButton)
        
        return functionView
    }()
    
    //定位权限
    private lazy var locaNoAuthPopView:LoactionNoAuthPopView = {
        let locaNoAuthPopView = LoactionNoAuthPopView.init(frame: LoactionNoAuthPopView.originalRect())
        locaNoAuthPopView.delegate = self
        return locaNoAuthPopView
    }()
    
    //拒绝定位权限
    private lazy var locationAuthRefusePopView:LocationAuthRefusePopView = {
        let locationAuthRefusePopView = LocationAuthRefusePopView.init(frame: LoactionNoAuthPopView.originalRect())
        return locationAuthRefusePopView
    }()
}

//MARK: - protocol
//我要租借弹框
extension HomeViewController: LoanPopViewProtocol {
    func loanPopViewSearchButtoncallBack() {
        print("搜索机柜")
    }
    
    func loanPopViewLoanButtoncallBack() {
        print("立即租借")
    }
}

//位置权限弹框
extension HomeViewController: LoactionNoAuthPopViewProtocol {
    func locationNoAuthPopViewAllowButtoncallBack() {
        print("允许打开位置权限")
        let url = NSURL.init(string: UIApplicationOpenSettingsURLString)
        if UIApplication.shared.canOpenURL(url! as URL) {
            UIApplication.shared.openURL(url! as URL)
        }
    }
    
    func locationNoAuthPopViewRefuseButtoncallBack() {
        print("拒绝打开位置权限")
        self.clearPopView()
        self.popViewArray?.add(self.locationAuthRefusePopView)
        locationAuthRefusePopView.popFromSuperView(superVc: self, title: "", contentHeight: LoactionNoAuthPopView.retrunHeight(), animation: true)
    }
}

//商店详情弹框
extension HomeViewController: HomeShopDetailPopViewProtocol {
    func locationButtoncallBack() {
        print("开始导航")
    }
}

//我要归还弹框
extension HomeViewController: LoanReturnPopViewProtocol {
    func loanReturnPopViewSearchButtoncallBack() {
        print("搜索机柜")
    }
    
    func loanReturnPopViewReturnButtoncallBack() {
        print("立即归还")
        let vc = BluetoothConnectVC.init(nibName: nil, bundle: nil)
        vc.connectType = BluetoothConnectType.ReturnMachine.rawValue
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//蓝牙权限弹框
extension HomeViewController: BluetoothNoAuthPopViewProtocol {
    func bluetoothNoAuthPopViewRefuseButtoncallBack() {
         print("拒绝打开蓝牙权限")
        self.clearPopView()
        let view = BluetoothAuthRefusePopView.init(frame: BluetoothAuthRefusePopView.originalRect())
        view.popFromSuperView(superVc: self, title: "", contentHeight: BluetoothAuthRefusePopView.retrunHeight(), animation: true)
    }
    
    func bluetoothNoAuthPopViewAllowButtoncallBack() {
        print("允许打开蓝牙权限")
        let vc = BluetoothConnectVC.init(nibName: nil, bundle: nil)
        vc.connectType = BluetoothConnectType.LoanMachine.rawValue
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

