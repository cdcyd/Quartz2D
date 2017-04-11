//
//  CanvasViewController.swift
//  Quartz2D
//
//  Created by 佰道聚合 on 2017/3/16.
//  Copyright © 2017年 cyd. All rights reserved.
//

import UIKit

class GraphicsView: UIView {
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor)
        context?.fill(CGRect(x: 50, y: 50, width: 200, height: 100))
        
        context?.setFillColor(UIColor(red: 0, green: 0, blue: 1, alpha: 0.5).cgColor)
        context?.fill(CGRect(x: 50, y: 50, width: 100, height: 200))
    }
}

class CanvasViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = .init(rawValue: 0)
        let view = GraphicsView(frame: self.view.bounds)
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
