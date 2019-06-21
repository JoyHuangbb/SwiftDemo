//
//  UIColor+Extension.swift
//  PowerBus
//
//  Created by 黄彬彬 on 2018/10/26.
//  Copyright © 2018年 黄彬彬. All rights reserved.
//

import UIKit

extension UIColor{
    //16进制颜色转RGB
    class func hexadecimalColor(hexadecimal:String)->UIColor{
        var cstr = hexadecimal.trimmingCharacters(in:  CharacterSet.whitespacesAndNewlines).uppercased() as NSString;
        if(cstr.length < 6){
            return UIColor.clear;
        }
        if(cstr.hasPrefix("0X")){
            cstr = cstr.substring(from: 2) as NSString
        }
        if(cstr.hasPrefix("#")){
            cstr = cstr.substring(from: 1) as NSString
        }
        if(cstr.length != 6){
            return UIColor.clear;
        }
        var range = NSRange.init()
        range.location = 0
        range.length = 2
        //r
        let rStr = cstr.substring(with: range);
        //g
        range.location = 2;
        let gStr = cstr.substring(with: range)
        //b
        range.location = 4;
        let bStr = cstr.substring(with: range)
        var r :UInt32 = 0x0;
        var g :UInt32 = 0x0;
        var b :UInt32 = 0x0;
        Scanner.init(string: rStr).scanHexInt32(&r);
        Scanner.init(string: gStr).scanHexInt32(&g);
        Scanner.init(string: bStr).scanHexInt32(&b);
        return UIColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1);
    }
    
    //MARK: - 统一设置颜色，方便后期替换维护
    //UI设计稿上标注的颜色可能不对。。。
    //主色调
    class func mainColor() ->UIColor {
        return UIColor.hexadecimalColor(hexadecimal: "#263719")
    }
    
    //浅色主色调
    class func tintMainColor() ->UIColor {
        return UIColor.hexadecimalColor(hexadecimal: "#435533")
    }
    
    class func textGrayColor() ->UIColor {
//        return UIColor.hexadecimalColor(hexadecimal: "#262626")
        return UIColor.hexadecimalColor(hexadecimal: "#999999")
    }
    
    class func textBlackColor() ->UIColor {
//        return UIColor.hexadecimalColor(hexadecimal: "#090606")
        return UIColor.hexadecimalColor(hexadecimal: "#666666")
    }
    
    class func whiteColor() ->UIColor {
        return UIColor.hexadecimalColor(hexadecimal: "#FFFFFF")
    }
    
    //分割线颜色
    class func cellLineColor() ->UIColor {
        return UIColor.hexadecimalColor(hexadecimal: "#d9d9d9")
    }
    
}
