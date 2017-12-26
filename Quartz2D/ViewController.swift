//
//  ViewController.swift
//  Quartz2D
//
//  Created by 佰道聚合 on 2017/3/16.
//  Copyright © 2017年 cyd. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {

    var dataSource = [NSStringFromClass(CanvasViewController.self)+"-初识CoreGraphics",
                      NSStringFromClass(BitmapViewController.self)+"-位图",
                      NSStringFromClass(PathViewController.self)+"-路径",
                      NSStringFromClass(BlendViewController.self)+"-混合",
                      NSStringFromClass(ShadowViewController.self)+"-阴影",
                      NSStringFromClass(GradientViewController.self)+"-渐变",
                      NSStringFromClass(TransparentViewController.self)+"-透明",
                      NSStringFromClass(MaskViewController.self)+"-遮罩",
                      NSStringFromClass(DrawIconViewController.self)+"-Icon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Quartz2D"
        
        let tableView = UITableView(frame: self.view.bounds)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = dataSource[indexPath.row].components(separatedBy: "-").last!
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcClass = NSClassFromString(dataSource[indexPath.row].components(separatedBy: "-").first!) as? UIViewController.Type
        if vcClass != nil {
            let vc = vcClass!.init()
            vc.title = dataSource[indexPath.row].components(separatedBy: "-").last!
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

