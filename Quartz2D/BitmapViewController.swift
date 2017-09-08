//
//  BitmapViewController.swift
//  Quartz2D
//
//  Created by 佰道聚合 on 2017/3/16.
//  Copyright © 2017年 cyd. All rights reserved.
//

import UIKit

class BitmapView: UIView {
    
    override func draw(_ rect: CGRect) {

        // 获取当前的上下文
        var context = self.createBitmapImage(width: 200, height: 300)
        
        // 设置红色填充
        context?.setFillColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor)
        // 绘制一个矩形
        context?.fill(CGRect(x: 0, y: 0, width: 300, height: 400))
        // 关闭反锯齿效果
        context?.setAllowsAntialiasing(false)
        
        // 生成CGImage
        let cgImage = context?.makeImage()
        
        // 将图片绘制在view上
        context = UIGraphicsGetCurrentContext()
        context?.draw(cgImage!, in: CGRect(x: 50, y: 50, width: (cgImage?.width)!, height: (cgImage?.height)!))
    }
    
    func createBitmapImage(width:Int, height:Int) -> CGContext? {
        let bitmapPerRow = width * 4
        let bitmapCount = bitmapPerRow * height
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapData = calloc(bitmapCount, 1)
        
        let context = CGContext.init(data: bitmapData, width: width, height: height, bitsPerComponent: 8, bytesPerRow: bitmapPerRow, space: colorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue)
        if context == nil {
            free(bitmapData)
            return nil
        }
        return context
    }
}

class BitmapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = .init(rawValue: 0)
        let view = BitmapView(frame: self.view.bounds)
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
