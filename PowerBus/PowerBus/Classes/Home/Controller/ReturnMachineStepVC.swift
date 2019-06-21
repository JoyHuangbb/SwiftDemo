//
//  ReturnMachineStepVC.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/31.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class ReturnMachineStepVC: BaseViewController {
    
    var imageArray:Array<String> = ["组56", "组57", "组58"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func initLayout() {
        super.initLayout()
        self.titleLabel.text = "如何归还充电宝"
        for(indexs,item) in imageArray.enumerated() {
            let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: ScreenWidth * 0.44, height: ScreenWidth * 0.44 * 11/17.0))
            logoImageView.center = view.center
            logoImageView.y = NavBarHeight +  60 + (50 + logoImageView.height)*CGFloat(indexs)
            logoImageView.image = UIImage.init(named: item)
            logoImageView.contentMode = UIViewContentMode.scaleToFill
            self.view.addSubview(logoImageView)
        }
    }

}
