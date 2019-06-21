
//
//  UIView+Extension.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/26.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

extension UIView {
    // .x
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var rect = self.frame
            rect.origin.x = newValue
            self.frame = rect
        }
    }
    
    // .y
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var rect = self.frame
            rect.origin.y = newValue
            self.frame = rect
        }
    }
    
    // .maxX
    public var maxX: CGFloat {
        get {
            return self.frame.maxX
        }
    }
    
    // .maxY
    public var maxY: CGFloat {
        get {
            return self.frame.maxY
        }
    }
    
    // .centerX
    public var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    
    // .centerY
    public var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    
    // .width
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var rect = self.frame
            rect.size.width = newValue
            self.frame = rect
        }
    }
    
    // .height
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var rect = self.frame
            rect.size.height = newValue
            self.frame = rect
        }
    }
    
    func setCornerRadius(_ radius:CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
    /// 部分圆角
    ///
    /// - Parameters:
    ///   - corners: 需要实现为圆角的角，可传入多个
    ///   - radii: 圆角半径
    func corner(byRoundingCorners corners: UIRectCorner, radii: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
        self.clipsToBounds = true
    }
}
