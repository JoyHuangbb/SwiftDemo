//
//  CountryCell.swift
//  PowerBus
//
//  Created by 邹勇峰 on 2018/10/30.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.titleLabel)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.init(frame: CGRect(x: 25, y: 0, width: 50, height: 44))
        titleLabel.textAlignment = NSTextAlignment.left
        titleLabel.textColor = UIColor.hexadecimalColor(hexadecimal: "#3e4d32")
        titleLabel.font = UIFont.systemFont(ofSize: 30)
        titleLabel.text = ""
        return titleLabel
    }()
}
