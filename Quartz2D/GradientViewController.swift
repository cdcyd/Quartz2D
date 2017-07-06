//
//  GradientViewController.swift
//  Quartz2D
//
//  Created by 佰道聚合 on 2017/4/13.
//  Copyright © 2017年 cyd. All rights reserved.
//

import UIKit

class GradientView: UIView {
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        let path = CGMutablePath()
        path.addEllipse(in: CGRect(x: 50, y: 100, width: 100, height: 50))
        self.drawLinearGradient(context: context!, path: path)
        
        self.drawRadialGradient(context: context!)
        self.drawRadialGradientCircle(context: context!)
    }
    
    // 轴向渐变
    func drawLinearGradient(context:CGContext, path:CGPath){
        
        /**
         注：下面有两种位置：locations和str/end
         str/end：指在绘图上下文(context)绘制渐变色的起止位置，这两个点既确定了渐变色的绘制方向，又确定了渐变色的绘制范围
         locations：取值范围0~1，它指在确定渐变色的绘制范围后，以起始点为0，终止点为1，中间安比例确定位置
         */
        
        // 渐变位置与方向
        let rect = path.boundingBox
        let str = CGPoint(x: rect.minX, y: rect.minY)
        let end = CGPoint(x: rect.maxX, y: rect.maxY)
        
        // 渐变颜色与其对应位置 components中每4个数确定一个颜色RGBA
        let components:[CGFloat] = [1.0,0.0,0.0,1.0,0.0,1.0,0.0,1.0,0.0,0.0,1.0,1.0]
        let locations:[CGFloat] = [0.0,0.5,1.0]
        
        // gradient
        let gradient = CGGradient(colorSpace: CGColorSpaceCreateDeviceRGB(), colorComponents: components, locations: locations, count: locations.count)
        
        // 绘图
        context.saveGState()
        context.addPath(path)
        context.clip()
        /**
         kCGGradientDrawsBeforeStartLocation 开始位置之前就进行绘制，到结束位置之后不再绘制
         kCGGradientDrawsAfterEndLocation    开始位置之前不进行绘制，到结束点之后继续填充
         */
        context.drawLinearGradient(gradient!, start: str, end: end, options: CGGradientDrawingOptions.drawsAfterEndLocation)
        context.restoreGState()
    }
    
    // 径向渐变(圆柱)
    func drawRadialGradient(context:CGContext){

        let str = CGPoint(x: 55, y: 400)
        let end = CGPoint(x: 100, y: 250)
        let strRadius:CGFloat = 10.0
        let endRadius:CGFloat = 50.0
        
        // 渐变的位置、颜色
        let components:[CGFloat] = [1.0,0.0,0.0,1.0,0.0,0.0,1.0,1.0]
        let locations:[CGFloat] = [0.0,1.0]
        
        // gradient
        let gradient = CGGradient(colorSpace: CGColorSpaceCreateDeviceRGB(), colorComponents: components, locations: locations, count: locations.count)
        
        context.saveGState()
        context.drawRadialGradient(gradient!, startCenter: str, startRadius: strRadius, endCenter: end, endRadius: endRadius, options: CGGradientDrawingOptions.init(rawValue: 0))
        context.restoreGState()
    }
    
    // 径向渐变(圆)
    func drawRadialGradientCircle(context:CGContext){
        
        let str = CGPoint(x: 100, y: 500)
        let end = CGPoint(x: 100, y: 500)
        let strRadius:CGFloat = 0.0
        let endRadius:CGFloat = 50.0
        
        // 渐变的位置、颜色
        let components:[CGFloat] = [1.0,0.0,0.0,1.0,0.0,0.0,1.0,1.0]
        let locations:[CGFloat] = [0.0,1.0]
        
        // gradient
        let gradient = CGGradient(colorSpace: CGColorSpaceCreateDeviceRGB(), colorComponents: components, locations: locations, count: locations.count)
        
        context.saveGState()
        context.drawRadialGradient(gradient!, startCenter: str, startRadius: strRadius, endCenter: end, endRadius: endRadius, options: CGGradientDrawingOptions.init(rawValue: 0))
        context.restoreGState()
    }
}

class GradientViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = .init(rawValue: 0)
        let view = GradientView(frame: self.view.bounds)
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
