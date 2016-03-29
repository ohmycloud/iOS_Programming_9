//
//  ViewController.swift
//  UIImageDrawing
//
//  Created by chenyf on 16/2/29.
//  Copyright © 2016年 chenyf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let which = 2
    override func viewDidLoad() {
        super.viewDidLoad()
        let mars   = UIImage(named: "Mars")!
        // 提取每半个 Mars 作为 CGImage
        let marsCG = mars.CGImage
        let sz     = mars.size
        var im     = UIImage()
        
        switch which {
        case 1:
            let marsLeft  = CGImageCreateWithImageInRect(marsCG, CGRectMake(0, 0, sz.width/2.0, sz.height))
            let marsRight = CGImageCreateWithImageInRect(marsCG, CGRectMake(sz.width/2.0, 0, sz.width/2.0, sz.height))
            
            // 绘制每个 CGImage
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width*1.5, sz.height), false, 0)
            let con = UIGraphicsGetCurrentContext()!
            CGContextDrawImage(con, CGRectMake(0, 0, sz.width/2.0, sz.height), flip(marsLeft!))
            CGContextDrawImage(con, CGRectMake(sz.width, 0, sz.width/2.0, sz.height), flip(marsRight!))
            im   = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        case 2:
            let szCG      = CGSizeMake(CGFloat(CGImageGetWidth(marsCG)), CGFloat(CGImageGetHeight(marsCG)))
            let marsLeft  = CGImageCreateWithImageInRect(marsCG, CGRectMake(0,0,szCG.width/2.0,szCG.height))
            let marsRight = CGImageCreateWithImageInRect(marsCG, CGRectMake(szCG.width/2.0, 0, szCG.width/2.0, szCG.height))
            UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width*1.5, sz.height), false, 0)

            // instead of calling flip, pass through UIImage
            UIImage(CGImage: marsLeft!, scale: mars.scale,orientation: mars.imageOrientation).drawAtPoint(CGPointMake(0,0))
            UIImage(CGImage: marsRight!, scale: mars.scale,orientation: mars.imageOrientation).drawAtPoint(CGPointMake(sz.width,0))
            im = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
        default: break
        }
        
        
        let iv = UIImageView(image:im)
        self.view.addSubview(iv)
        
        // 添加约束
        iv.center = self.view.bounds.center
    
    }
    
    func flip (im: CGImage) -> CGImage {
        let sz = CGSizeMake(
            CGFloat(CGImageGetWidth(im)),
            CGFloat(CGImageGetHeight(im)))
        UIGraphicsBeginImageContextWithOptions(sz, false, 0)
        CGContextDrawImage(UIGraphicsGetCurrentContext()!, CGRectMake(0, 0, sz.width, sz.height), im)
        let result = UIGraphicsGetImageFromCurrentImageContext().CGImage
        UIGraphicsEndImageContext()
        return result!
    }

}

extension CGRect {
    var center: CGPoint {
        return CGPointMake(self.midX, self.midY)
    }
}
