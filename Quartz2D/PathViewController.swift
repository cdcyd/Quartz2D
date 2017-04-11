//
//  PathViewController.swift
//  Quartz2D
//
//  Created by 佰道聚合 on 2017/3/16.
//  Copyright © 2017年 cyd. All rights reserved.
//

import UIKit

class PathView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let stringHeight = UIFont.boldSystemFont(ofSize: 12).lineHeight
        let attributes = [NSFontAttributeName:UIFont.boldSystemFont(ofSize: 12),
                          NSForegroundColorAttributeName:UIColor.white]
       
        drawString(str:"绘制点", point:CGPoint(x:15,y:40), attributes: attributes)
        drawString(str:"绘制直线", point:CGPoint(x:15,y:80), attributes: attributes)
        drawString(str:"绘制虚线", point:CGPoint(x:15,y:120), attributes: attributes)
        drawString(str:"绘制矩形", point:CGPoint(x:15,y:160), attributes: attributes)
        drawString(str:"绘制圆", point:CGPoint(x:15,y:200), attributes: attributes)
        drawString(str:"绘制椭圆", point:CGPoint(x:15,y:240), attributes: attributes)
        drawString(str:"绘制扇形", point:CGPoint(x:15,y:280), attributes: attributes)
        drawString(str:"绘制圆弧", point:CGPoint(x:15,y:320), attributes: attributes)
        
        // 获取当前的上下文
        let context = UIGraphicsGetCurrentContext()
        // 描边颜色
        context?.setStrokeColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor)
        // 填充颜色
        context?.setFillColor(UIColor(red: 0, green: 1, blue: 0, alpha: 1).cgColor)
        // 设置线宽
        context?.setLineWidth(1.0)
    
        // 点(矩形)(绘制的长和宽都是一个像素的矩形)
        let y1 = 40.0 + stringHeight/2 - 0.5
        context?.addRect(CGRect(x:80, y:y1, width:1, height:1))
        context?.strokePath()
        // 点(圆形)(绘制的一个半径是0.5个像素的圆)
        context?.addArc(center: CGPoint(x:100,y:y1), radius:0.5, startAngle:0 , endAngle:CGFloat(M_PI)*2, clockwise: true)
        context?.strokePath()
        
        // 直线
        let y2 = 80.0 + stringHeight/2
        // 设置绘制直线的起始点
        context?.move(to: CGPoint(x:80, y:y2))
        // 直线的终点
        context?.addLine(to: CGPoint(x:100, y:y2))
        context?.strokePath()
        
        // 虚线
        let y3 = 120.0 + stringHeight/2
        // 压栈，拷贝context到栈中(这里用到它是因为画虚线时会设置参数LineDash，这样后面的绘画将不会受到影响，否则后面的绘画都是虚线)
        context?.saveGState()
        // 设置虚线参数
        context?.setLineDash(phase: 1, lengths: [4])
        // 设置虚线的起始点
        context?.strokeLineSegments(between: [CGPoint(x:80,y:y3), CGPoint(x:100,y:y3)])
        // 出栈，设置为当前的上下文
        context?.restoreGState()
    
        // 矩形(描边)
        let y4:CGFloat = 160.0
        context?.addRect(CGRect(x:80, y:y4, width:stringHeight, height:stringHeight))
        context?.strokePath()
        // 矩形(填充)
        context?.addRect(CGRect(x:120, y:y4, width:stringHeight, height:stringHeight))
        context?.fillPath()

        // 圆(描边)
        let y5 = 200.0 + stringHeight/2
        // 通过圆心、半径、角度、划线方向(方向可能会影响填充)画圆
        context?.addArc(center: CGPoint(x:80+stringHeight/2,y:y5), radius:stringHeight/2, startAngle:0 , endAngle:CGFloat(M_PI)*2, clockwise: true)
        context?.strokePath()
        // 圆(填充)
        context?.addArc(center: CGPoint(x:120+stringHeight/2,y:y5), radius:stringHeight/2, startAngle:0 , endAngle:CGFloat(M_PI)*2, clockwise: true)
        context?.fillPath()
        
        // 椭圆(描边)
        let y6 = 240.0
        // 通过矩形画椭圆
        context?.addEllipse(in: CGRect(x: 80.0, y: y6, width: 30.0, height: Double(stringHeight)))
        context?.strokePath()
        
        // 椭圆(填充)
        context?.addEllipse(in: CGRect(x: 120.0, y: y6, width: 30.0, height: Double(stringHeight)))
        context?.fillPath()
        
        // 扇形(描边)
        let y7 = 280.0 + stringHeight/2
        context?.addArc(center: CGPoint(x:80+stringHeight/2,y:y7), radius:stringHeight/2, startAngle:0 , endAngle:CGFloat(M_PI_2), clockwise: true)
        context?.addLine(to: CGPoint(x:80+stringHeight/2,y:y7))
        context?.closePath()
        context?.strokePath()
        // 扇形(填充)
        context?.addArc(center: CGPoint(x:120+stringHeight/2,y:y7), radius:stringHeight/2, startAngle:0 , endAngle:CGFloat(M_PI_2), clockwise: true)
        context?.addLine(to: CGPoint(x:120+stringHeight/2,y:y7))
        context?.closePath()
        context?.fillPath()
        
        // 圆弧
        let y8:CGFloat = 320.0;
        context?.move(to: CGPoint(x:80,y:y8))
        context?.addArc(tangent1End: CGPoint(x:80,y:y8+stringHeight), tangent2End: CGPoint(x:120,y:y8+stringHeight), radius: stringHeight)
        context?.strokePath()
    }
}

class PathViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .init(rawValue: 0)
        let view = PathView(frame: self.view.bounds)
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
