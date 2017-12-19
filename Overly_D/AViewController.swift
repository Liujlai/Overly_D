//
//  AViewController.swift
//  Overly_D
//
//  Created by idea on 2017/12/19.
//  Copyright © 2017年 idea. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
    
    private var overlayController : OverlayController!
    var btn: UIButton!
    var btn1: UIButton!
    var btn2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btn = UIButton(frame: CGRect(x: 50, y: 200, width: 200, height: 100))
        btn.backgroundColor = UIColor.cyan
        btn.addTarget(self, action: #selector(self.sample), for: .touchUpInside)
        self.view.addSubview(btn)
        
        btn1 = UIButton(frame: CGRect(x: 50, y: 400, width: 200, height: 100))
        btn1.backgroundColor = UIColor.orange
        btn1.addTarget(self, action: #selector(self.sample1), for: .touchUpInside)
        self.view.addSubview(btn1)
        
        btn2 = UIButton(frame: CGRect(x: 300, y: 600, width: 50, height: 50))
        btn2.setImage(UIImage(named: "qzone_关闭.png"), for: .normal)
        btn2.addTarget(self, action: #selector(self.click), for: .touchUpInside)
        self.view.addSubview(btn2)
        self.view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func sample() {
        let sloganView = UIImageView(image: UIImage(named: "slogan.jpg"))
        sloganView.size = CGSize(width: UIScreen.width * 0.75, height: UIScreen.width * 0.9)
        sloganView.layer.cornerRadius = 4
        overlayController = OverlayController(aView: sloganView, overlayStyle: .BlackTranslucent)
        overlayController.transitionStyle = .FromLeft
        overlayController.isUsingElastic = true
        overlayController.present(animated: true)
    }
//    侧边栏
    func sample1() {
        let sidebarView = SnailSidebarView()
        sidebarView.size = CGSize(width: UIScreen.width - 70, height: UIScreen.height)
        sidebarView.backgroundColor = UIColor.rgb(r: 24, g: 28, b: 45).withAlphaComponent(0.8)
        sidebarView.setItems(items: ["我的故事", "消息中心", "我的收藏", "近期阅读", "离线阅读"])
        
        overlayController = OverlayController(aView: sidebarView, overlayStyle: .BlackTranslucent)
        overlayController.presentationStyle = .Left
        overlayController.isAllowDrag = true
        overlayController.present(animated: true)
    }
    
    func click(){
         self.navigationController?.pushViewController(BViewController() , animated: true)
    }
}
