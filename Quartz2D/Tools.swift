//
//  Tools.swift
//  Quartz2D
//
//  Created by 佰道聚合 on 2017/3/16.
//  Copyright © 2017年 cyd. All rights reserved.
//

import UIKit

// 屏幕总宽
public func MainScreenWidth() -> CGFloat{
    return UIScreen.main.bounds.width
}

// 屏幕总高
public func MainScreenHeight() -> CGFloat{
    return UIScreen.main.bounds.height
}

// 计算字体高度
public func fontHeight(font:CGFloat) -> CGFloat{
    return UIFont.systemFont(ofSize: font).lineHeight
}

// 计算字符串宽高
public func stringSize(str:String, size:CGSize, attributes:[NSAttributedStringKey : Any]?) -> CGSize{
    var reSize = str.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil).size
    reSize = CGSize(width:Int(reSize.width+1), height:Int(reSize.height+1))
    return reSize
}

// 绘制字符串
public func drawString(str:String, point:CGPoint, attributes:[NSAttributedStringKey : Any]?){
    str.draw(at:point, withAttributes:attributes)
}

