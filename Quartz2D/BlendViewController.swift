//
//  BlendViewController.swift
//  Quartz2D
//
//  Created by 佰道聚合 on 2017/4/11.
//  Copyright © 2017年 cyd. All rights reserved.
//

import UIKit

class BlendCell: UITableViewCell {
    
    var titleLabel:UILabel = UILabel()
    var detailLabel:UILabel = UILabel()
    let left:CGFloat = 15.0
    let space:CGFloat = 10.0
    static let maxDetailWidth = MainScreenWidth() - 60
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        let titleFont:UIFont = UIFont.systemFont(ofSize: 14)
        let detailFont:UIFont = UIFont.systemFont(ofSize: 12)
        let titleHeight:CGFloat = titleFont.lineHeight
        
        titleLabel.frame = CGRect(x: left, y: space, width: BlendCell.maxDetailWidth, height: titleHeight)
        titleLabel.font = titleFont
        self.contentView.addSubview(titleLabel)
        
        detailLabel.frame = CGRect(x: left, y: space*2+titleHeight, width: BlendCell.maxDetailWidth, height: 30)
        detailLabel.numberOfLines = 0
        detailLabel.font = detailFont
        detailLabel.textColor = UIColor.brown
        self.contentView.addSubview(detailLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContent(model:[NSString:NSString]?){
        titleLabel.text = model?["title"] as String?
        detailLabel.text = model?["detail"] as String?
        
        let attributes = [NSFontAttributeName:UIFont.systemFont(ofSize: 12)]
        let size = stringSize(str: detailLabel.text! as NSString, size: CGSize(width:BlendCell.maxDetailWidth, height:999), attributes: attributes)
        detailLabel.frame = CGRect(x: left, y: space*2+detailLabel.font.lineHeight, width: size.width, height: size.height)
    }
    
    static func heightWithModel(model:[NSString:NSString]?) -> CGFloat {
        
        if model == nil {
            return 44
        }
        
        let size = stringSize(str: (model?["detail"])!, size: CGSize(width:self.maxDetailWidth, height:999), attributes: nil)
        return size.height + 15 * 3 + fontHeight(font: 14)
    }
}

class BlendView: UIView {
    
    var blendModel = CGBlendMode.normal
    
    override func draw(_ rect: CGRect) {
        
        let colors = [UIColor.purple,UIColor.orange,UIColor.blue,UIColor.green,UIColor.red,UIColor.cyan,UIColor.brown]
        let width = (self.bounds.width-180)/CGFloat(colors.count)
        let height = width*CGFloat(colors.count)+90.0
        
        let context = UIGraphicsGetCurrentContext()
        context?.setBlendMode(blendModel)
        
        for i in 0..<colors.count {
            context?.saveGState()
            context?.setFillColor(colors[i].cgColor)
            context?.addRect(CGRect(x:0, y:CGFloat(i)*width, width:self.bounds.width, height:width))
            context?.fillPath()
            context?.restoreGState()
        }
        
        for i in 0..<colors.count {
            context?.saveGState()
            context?.setFillColor(colors[i].cgColor)
            context?.addRect(CGRect(x:CGFloat(i)*width+90.0, y:0, width:width, height:height))
            context?.fillPath()
            context?.restoreGState()
        }
    }
}

class BlendViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var selectIndex:NSInteger = 0
    var blendView:BlendView?
    var dataSource:[[NSString:NSString]]!
    var blends:[NSString:CGBlendMode]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.edgesForExtendedLayout = .init(rawValue: 0)
        
        blends = ["普通混合模式(Normal)":CGBlendMode.normal,
                  "正片叠底混合模式(Mutiply)":CGBlendMode.multiply,
                  "屏幕混合模式(Screen)":CGBlendMode.screen,
                  "叠加混合模式(Overlay)":CGBlendMode.overlay,
                  "暗化混合模式(Darken)":CGBlendMode.darken,
                  "亮化混合模式(Lighten)":CGBlendMode.lighten,
                  "色彩减淡模式(ColorDodge)":CGBlendMode.colorDodge,
                  "色彩加深模式(ColorBurn)":CGBlendMode.colorBurn,
                  "柔光混合模式(SoftLight)":CGBlendMode.softLight,
                  "强光混合模式(hardLight)":CGBlendMode.hardLight,
                  "差值混合模式(Difference)":CGBlendMode.difference,
                  "排除混合模式(Exclusion)":CGBlendMode.exclusion,
                  "色相混合模式(Hue)":CGBlendMode.hue,
                  "饱和度混合模式(Saturation)":CGBlendMode.saturation,
                  "颜色混合模式(Color)":CGBlendMode.color,
                  "亮度混合模式(Luminosity)":CGBlendMode.luminosity]
        
        dataSource = [["title":"普通混合模式(Normal)","detail":"该模式使用如下公式来计算前景绘图与背景绘图混合:result = (alpha * foreground) + (1 - alpha) *background，对于不透明的颜色值，当我们用普通混合模式时，所有绘制于背景之上的绘图都会遮掩住背景"],
                      ["title":"正片叠底混合模式(Mutiply)","detail":"正片叠底混合模式指定将前景的图片采样与背景图片采样相乘。结果颜色至少与两个采样颜色之一一样暗"],
                      ["title":"屏幕混合模式(Screen)","detail":"屏幕混合模式指定将前景图片采样的反转色与背景图片的反转色相乘。结果颜色至少与两种采样颜色之一一样亮"],
                      ["title":"叠加混合模式(Overlay)","detail":"叠加混合模式是将前景图片与背景图片或者正片叠底，或者屏幕化，这取决于背景颜色。背景颜色值与前景颜色值以反映出背景颜色的亮度与暗度"],
                      ["title":"暗化混合模式(Darken)","detail":"通过选择前景图片与背景图片更暗的采样来混合图片采样。背景图片采样被前景图片采样更暗的部分取代，而其它部分不变"],
                      ["title":"亮化混合模式(Lighten)","detail":"通过选择前景图片与背景图片更亮的采样来混合图片采样。背景图片采样被前景图片采样更亮的部分取代，而其它部分不变"],
                      ["title":"色彩减淡模式(ColorDodge)","detail":"加亮背景图片采样以反映出前景图片采样。被指定为黑色的前景图片采样值将不产生变化"],
                      ["title":"色彩加深模式(ColorBurn)","detail":"加深背景图片采样以反映出前景图片采样。被指定为白色的前景图片采样值将不产生变化"],
                      ["title":"柔光混合模式(SoftLight)","detail":"根据前景采样颜色减淡或加深颜色值。如果前景采样颜色比50%灰度值更亮，则减淡背景，类似于Dodge模式。如果前景采样颜色比50%灰度值更暗，则加强背景，类似于Burn模式。纯黑或纯白的图片采样将产生更暗或更亮的区域。但是但是不产生纯白或纯黑的颜色。该效果类似于将一个漫射光源放于一个前景图前。该效果用于在场景中添加高光效果"],
                      ["title":"强光混合模式(hardLight)","detail":"根据前景图片采样颜色正片叠加或屏幕化颜色。如果前景采样颜色比50%灰度值更亮，则减淡背景，类似于screen模式。如果前景采样颜色比50%灰度值更暗，则加深背景，类似于multiply模式。如果前景采样颜色等于50%灰度，则前景颜色不变。纯黑与纯白的颜色图片采样将产生纯黑或纯白的颜色值。该效果类似于将一个强光源放于一个前景图前。该效果用于在场景中添加高光效果"],
                      ["title":"差值混合模式(Difference)","detail":"将前景图片采样颜色值与背景图片采样值相减，相减的前后关系取决于哪个采样的亮度值更大。黑色的前景采样值不发生变化；白色值转化为背景的值"],
                      ["title":"排除混合模式(Exclusion)","detail":"该效果类似于Difference效果，只是对比度更低。黑色的前景采样值不发生变化；白色值转化为背景的值"],
                      ["title":"色相混合模式(Hue)","detail":"使用背景的亮度和饱和度与前景的色相混合"],
                      ["title":"饱和度混合模式(Saturation)","detail":"混合背景的亮度和色相前景的饱和度。背景中没有饱和度的区域不发生变化"],
                      ["title":"颜色混合模式(Color)","detail":"混合背景的亮度值与前景的色相与饱和度。该模式保留图片的灰度级"],
                      ["title":"亮度混合模式(Luminosity)","detail":"将背景图片的色相、饱和度与背景图片的亮度相混合。该模块产生一个与Color Blend模式相反的效果"]]

        // 渲染的view
        blendView = BlendView(frame: self.view.bounds)
        blendView?.backgroundColor = UIColor.clear
        self.view.addSubview(blendView!)
        
        // tableView
        let y = self.view.bounds.width - 180.0 + 90.0
        let table = UITableView(frame: CGRect(x:0, y:y, width:self.view.bounds.width, height:self.view.bounds.height - y - 64.0), style: UITableViewStyle.grouped)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = UITableViewCellSeparatorStyle.none
        table.tableFooterView = UIView()
        self.view.addSubview(table)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return BlendCell.heightWithModel(model:dataSource[indexPath.section])
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:BlendCell? = tableView.dequeueReusableCell(withIdentifier: "cell") as? BlendCell
        if cell == nil {
            cell = BlendCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        }
        
        if indexPath.section == selectIndex {
            cell?.accessoryView = UIImageView.init(image: UIImage(named:"对-ic"))
        }
        else{
            cell?.accessoryView = nil
        }
        cell?.setContent(model: dataSource[indexPath.section])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectIndex = indexPath.section
        
        // 延迟0.3秒刷新，先让动画执行完成
        let delay = DispatchTime.now() + .milliseconds(300)
        DispatchQueue.main.asyncAfter(deadline: delay) { 
            tableView.reloadData()
            let temp = self.dataSource[self.selectIndex]
            self.blendView!.blendModel = self.blends[temp["title"]!]!
            self.blendView!.setNeedsDisplay()
        }
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
