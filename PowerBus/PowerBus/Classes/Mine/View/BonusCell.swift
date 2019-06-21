//
//  BonusCell.swift
//  PowerBus
//
//  Created by 邹勇峰 on 2018/11/2.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class BonusCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        let bgView = UIView.init(frame: CGRect.init(x: ScreenWidth * 0.076, y: 8, width: ScreenWidth - ScreenWidth * 0.076 * 2, height: 111))
//        bgView.backgroundColor = UIColor.white
//        bgView.setCornerRadius(5)
//        self.addSubview(bgView)
        
        let bgImageView = UIImageView.init(frame: CGRect.init(x: ScreenWidth * 0.076, y: 8, width: ScreenWidth - ScreenWidth * 0.076 * 2, height: (ScreenWidth - ScreenWidth * 0.076 * 2) * 222/635))
        bgImageView.image = UIImage.init(named: "icon_bonusBg")
        self.addSubview(bgImageView)
        self.backgroundColor = UIColor.hexadecimalColor(hexadecimal: "#efefef")
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
