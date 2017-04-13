//
//  ShadowViewController.swift
//  Quartz2D
//
//  Created by 佰道聚合 on 2017/4/12.
//  Copyright © 2017年 cyd. All rights reserved.
//

import UIKit

class shadowView: UIView {
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(UIColor.green.cgColor)
        
        context?.saveGState()
        context?.addRect(CGRect(x: 50, y: 100, width: 100, height: 100))
        context?.setShadow(offset: CGSize(width:-15, height:15), blur: 8, color: UIColor.orange.cgColor)
        context?.fillPath()
        context?.restoreGState()
        
        context?.saveGState()
        context?.addRect(CGRect(x: 50, y: 300, width: 100, height: 100))
        context?.setShadow(offset: CGSize(width:-20, height:-20), blur: 10, color: UIColor.red.cgColor)
        context?.fillPath()
        context?.restoreGState()
    }
}

class ShadowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let view = shadowView(frame: self.view.bounds)
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
