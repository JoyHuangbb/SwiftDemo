//
//  SVProgressHUD+Extension.swift
//  News
//
//  Created by 杨蒙 on 2017/12/23.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import SVProgressHUD

extension SVProgressHUD {
    /// 设置 SVProgressHUD 属性
    static func configuration() {
//        SVProgressHUD.setForegroundColor(.white)
        SVProgressHUD.setMinimumDismissTimeInterval(1.5)
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.light)
//        SVProgressHUD.setBackgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.3))
    }
}

class HUDManager: NSObject {
    public static func showSuccessHUD(_ text:String) {
        SVProgressHUD.configuration()
        SVProgressHUD.showSuccess(withStatus: text)
    }
    public static func show(_ text:String) {
        SVProgressHUD.configuration()
        SVProgressHUD.show(withStatus: text)
    }
    
    public static func dismiss() {
        SVProgressHUD.configuration()
        SVProgressHUD.dismiss()
    }
}

