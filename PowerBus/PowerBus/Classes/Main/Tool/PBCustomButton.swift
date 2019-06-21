//
//  PBCustomButton.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/28.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

@objc protocol PBCustomButtonProtocol: NSObjectProtocol {
    @objc optional func callBack(tag: Int)
}

class PBCustomButton: UIView {
    
    weak var delegate: PBCustomButtonProtocol?
    
    var leftTittle: String?{
        didSet{
            leftLabel.text = leftTittle
        }
    }
    
    var rightTittle: String?{
        didSet{
            rightLabel.text = rightTittle
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func selfClick(_ tap:UITapGestureRecognizer) {
        if (delegate != nil) {
            delegate?.callBack!(tag: self.tag)
        }
    }
    
    //MARK: - UI
    func initLayout() {
        self.backgroundColor = UIColor .mainColor()
        self.setCornerRadius(self.height/2.0)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selfClick(_ :)))
        self.addGestureRecognizer(tap)
        self.addSubview(leftLabel)
        self.addSubview(rightLabel)
    }
    
    public lazy var leftLabel: UILabel = {
        let leftLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: self.width * 0.3, height: self.height))
        leftLabel.textAlignment = NSTextAlignment.center
        leftLabel.textColor = UIColor.whiteColor()
        leftLabel.backgroundColor = UIColor.tintMainColor()
        leftLabel.font = UIFont.font17()
        leftLabel.corner(byRoundingCorners: [UIRectCorner.topLeft, UIRectCorner.bottomLeft], radii: self.height/2.0)
        return leftLabel
    }()

    public lazy var rightLabel: UILabel = {
        let rightLabel = UILabel.init(frame: CGRect(x: leftLabel.maxX, y: 0, width: self.width * 0.7, height: self.height))
        rightLabel.textAlignment = leftLabel.textAlignment
        rightLabel.textColor = leftLabel.textColor
        rightLabel.backgroundColor = UIColor.mainColor()
        rightLabel.font = leftLabel.font
        rightLabel.corner(byRoundingCorners: [UIRectCorner.topRight, UIRectCorner.bottomRight], radii: self.height/2.0)
        return rightLabel
    }()


}
