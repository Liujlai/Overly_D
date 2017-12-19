//
//  BViewController.swift
//  Overly_D
//
//  Created by idea on 2017/12/19.
//  Copyright © 2017年 idea. All rights reserved.
//

import UIKit

class BViewController: UIViewController ,OverlayControllerDelegate{

    private var overlayController : OverlayController!
    var btn: UIButton!
    var btn1: UIButton!
    var btn2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btn = UIButton(frame: CGRect(x: 50, y: 200, width: 200, height: 100))
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(self.sample3), for: .touchUpInside)
        self.view.addSubview(btn)
        
        btn1 = UIButton(frame: CGRect(x: 50, y: 400, width: 200, height: 100))
        btn1.backgroundColor = UIColor.purple
        btn1.addTarget(self, action: #selector(self.sample4), for: .touchUpInside)
        self.view.addSubview(btn1)
        
        btn2 = UIButton(frame: CGRect(x: 300, y: 600, width: 50, height: 50))
        btn2.setImage(UIImage(named: "qzone_关闭.png"), for: .normal)
        btn2.addTarget(self, action: #selector(self.click), for: .touchUpInside)
        self.view.addSubview(btn2)
        self.view.backgroundColor = UIColor.white
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func sample3() {
        let array = [
            "微信好友", "朋友圈", "新浪微博", "QQ好友", "跳转"
        ]
        let size = CGSize(width: 60, height: 80)
        let sheetView = sheetFast(itemSize: size, hasClose: true, items: array, prefixName: "shared_")
        sheetView.height += 45;
        
        overlayController = OverlayController(aView: sheetView, overlayStyle: .BlackTranslucent)
        overlayController.presentationStyle = .Bottom
        overlayController.isAllowDrag = true
        overlayController.isUsingElastic = true
        overlayController.delegate = self;
        overlayController.present(animated: true)
    }
    
    func sample4() {
        let array = [
            "说说", "照片", "视频", "签到", "大头贴"
        ]
        let size = CGSize(width: 65, height: 90)
        let qzoneView = sheetFast(itemSize: size, hasClose: false, items: array, prefixName: "qzone_")
        qzoneView.closeClosure = {(anyObj : AnyObject) -> Void in self.dismiss() }
        qzoneView.close.setImage(UIImage(named: "qzone_关闭"), for: .normal)
        
        overlayController = OverlayController(aView: qzoneView, overlayStyle: .BlackTranslucent)
        overlayController.presentationStyle = .Top
        overlayController.present(animated: true)
    }
    
    // MARK: - sheetFast
    
    func sheetFast(itemSize: CGSize, hasClose: Bool, items array: Array<String>, prefixName: String) -> SnailSheetView {
        var items: [BannerItem] = []
        for (_, name) in array.enumerated() {
            let item = BannerItem()
            item.title = name
            if let img = UIImage(named: prefixName.appending(name)) { item.image = img }
            items.append(item)
        }
        let sheet = SnailSheetView()
        sheet.width = UIScreen.width
        sheet.items = items
        sheet.close.isHidden = hasClose
        sheet.bannerTouchClosure = {(anyObj: Any, index: Int) -> Void in
            let sheetView = anyObj as! SnailSheetView
            if let text = sheetView.bannerViews[index].label.text { print(text) }
        }
        return sheet
    }
    // MARK: - Dismiss popups
    
    func dismiss() {
        overlayController.dismiss(animated: true)
    }
    func click(){
        self.navigationController?.popViewController(animated: true)
    }
}
