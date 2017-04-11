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
        
        // 开始位图绘制，并设置画布的大小
        UIGraphicsBeginImageContext(self.bounds.size)
        
        // 获取当前的上下文
        let context = UIGraphicsGetCurrentContext()
        // 设置红色填充
        context?.setFillColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor)
        // 绘制一个矩形
        context?.fill(CGRect(x: 50, y: 50, width: 200, height: 100))
        // 关闭反锯齿效果
        context?.setAllowsAntialiasing(false)
        
        // 结束位图绘制
        UIGraphicsEndImageContext()
        
        // 绘制成CGImage
        let cgImage = context?.makeImage()
        // 将图片显示的view上
        let imageView = UIImageView(image: UIImage(cgImage: cgImage!))
        self.addSubview(imageView)
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
