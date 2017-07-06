//
//  TransparentViewController.swift
//  Quartz2D
//
//  Created by 佰道聚合 on 2017/4/14.
//  Copyright © 2017年 cyd. All rights reserved.
//

import UIKit

class TransparentView: UIView {
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setShadow(offset: CGSize(width:-20, height:20), blur: 10, color: UIColor.green.cgColor)
        
        context?.beginTransparencyLayer(auxiliaryInfo: nil)
        context?.setFillColor(UIColor.orange.cgColor)
        context?.fill(CGRect(x: 50, y: 100, width: 60, height: 60))
        context?.setFillColor(UIColor.purple.cgColor)
        context?.fill(CGRect(x: 80, y: 130, width: 60, height: 60))
        context?.setFillColor(UIColor.brown.cgColor)
        context?.fill(CGRect(x: 110, y: 160, width: 60, height: 60))
        context?.endTransparencyLayer()
    }
}

class TransparentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = .init(rawValue: 0)
        let view = TransparentView(frame: self.view.bounds)
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
