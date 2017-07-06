//
//  MaskViewController.swift
//  Quartz2D
//
//  Created by 佰道聚合 on 2017/4/14.
//  Copyright © 2017年 cyd. All rights reserved.
//

import UIKit

class MaskView: UIView {
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let image = UIImage.init(cgImage: (UIImage(named: "mask")?.cgImage!)!, scale: 1.0, orientation: .up)
        
        context?.translateBy(x: 0, y: 200)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.draw((image.cgImage)!, in: CGRect(x: 50, y: -50, width: 200, height: 200))
        
        let view = UIImageView(image: UIImage(named: "mask"))
        view.frame = CGRect(x: 50, y: 300, width: 200, height: 200)
        self.addSubview(view)
    }
}

class MaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = .init(rawValue: 0)
        let view = MaskView(frame: self.view.bounds)
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
