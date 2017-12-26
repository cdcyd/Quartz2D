//
//  DrawIconViewController.swift
//  Quartz2D
//
//  Created by cyd on 2017/12/26.
//  Copyright © 2017年 cyd. All rights reserved.
//

import UIKit

class IconView: UIView {

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()

        // 画板
        let path = CGMutablePath()
        path.addRect(CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width))

        // 背景设置相关参数
        let rect = path.boundingBox
        let str = CGPoint(x: rect.minX, y: rect.minY)
        let end = CGPoint(x: rect.maxX, y: rect.maxY)
        let components:[CGFloat] = [183/255.0, 41/255.0, 131/255.0,1.0,
                                    33/255.0,  72/255.0,  138/255.0,1.0]
        let locations:[CGFloat] = [0.0,1.0]
        let gradient = CGGradient(colorSpace: CGColorSpaceCreateDeviceRGB(), colorComponents: components, locations: locations, count: locations.count)

        // 设置背景
        context?.saveGState()
        context?.addPath(path)
        context?.clip()
        context?.drawLinearGradient(gradient!, start: str, end: end, options: CGGradientDrawingOptions.drawsAfterEndLocation)
        context?.restoreGState()

        // 绘制文字
        let attributes = [NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 50),
                          NSAttributedStringKey.foregroundColor:UIColor.init(red: 166/255.0, green: 166/255.0, blue: 166/255.0, alpha: 1),
                          NSAttributedStringKey.textEffect: NSAttributedString.TextEffectStyle.letterpressStyle] as [NSAttributedStringKey : Any]
        let text = "CCTransition"
        let size = stringSize(str: text, size: CGSize(width: 999, height: UIFont.boldSystemFont(ofSize: 50).lineHeight), attributes: attributes)
        let x = (UIScreen.main.bounds.width - size.width)/2
        let y = (UIScreen.main.bounds.width - size.height)/2
        drawString(str:text, point:CGPoint(x:x,y:y), attributes: attributes)
    }
}

class DrawIconViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = .init(rawValue: 0)
        let view = IconView(frame: self.view.bounds)
        self.view.addSubview(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
