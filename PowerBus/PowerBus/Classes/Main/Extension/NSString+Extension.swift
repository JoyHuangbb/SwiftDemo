//
//  NSString+Extension.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/26.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

extension String {
    /// 计算文本的高度
    func textHeight(fontSize: CGFloat, width: CGFloat) -> CGFloat {
        return self.boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [.font: UIFont.systemFont(ofSize: fontSize)], context: nil).size.height
    }
}
