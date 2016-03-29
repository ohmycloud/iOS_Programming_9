//
//  ViewController.swift
//  UIImageDrawing
//
//  Created by chenyf on 16/2/29.
//  Copyright © 2016年 chenyf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let which = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        let mars = UIImage(named: "Mars")!
        let sz   = mars.size
        var im   = UIImage()
        
        switch which {
        case 1:
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width*2, sz.height), false, 0)
            
            mars.drawAtPoint(CGPointMake(0, 0))
            mars.drawAtPoint(CGPointMake(sz.width, 0))
            im = UIGraphicsGetImageFromCurrentImageContext() // 获取画得的图片
            UIGraphicsEndImageContext() // 关闭图像上下文
        case 2:
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width*2, sz.height*2), false, 0)
            mars.drawInRect(CGRectMake(0, 0, sz.width*2, sz.height*2))
            mars.drawInRect(CGRectMake(sz.width/2.0, sz.height/2.0, sz.width, sz.height), blendMode: .Multiply, alpha: 1.0)
            im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        case 3:
            // 只用半个Mars 宽度的画布
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width/2.0,sz.width), false, 0)
            // 左移半个 Mars 的宽度
            mars.drawAtPoint(CGPointMake(-sz.width/2.0, 0))
            im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
        default: break
            
        }
        
        let iv = UIImageView(image: im)
        self.view.addSubview(iv)
        
        // 添加约束
        iv.center = self.view.bounds.center
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension CGRect {
    var center: CGPoint {
        return CGPointMake(self.midX, self.midY)
    }
}
