//
//  ViewController.swift
//  ImageViewAnimation
//
//  Created by chenyf on 16/2/23.
//  Copyright © 2016年 chenyf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 后面必须跟着 !， 否则会报错
    @IBOutlet var b: UIButton!
    @IBOutlet var v: UIView!
    var pOrig: CGPoint!
    var pFinal: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let mars = UIImage(named: "Mars")!
//        UIGraphicsBeginImageContextWithOptions(mars.size, false, 0)
//        let empty = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
//        let arr = [mars, empty, mars, empty, mars]
//        let iv = UIImageView(image:empty)
//        iv.frame.origin = CGPointMake(100,100)
//        self.view.addSubview(iv)
//        iv.animationImages = arr
//        iv.animationDuration = 2
//        iv.animationRepeatCount = 0
//        iv.startAnimating()
        
    
        // 一个跳动的红点, 像心脏跳动
//        var arr = [UIImage]()
//        let w : CGFloat = 18
//        for i in 0 ..< 6 {
//            UIGraphicsBeginImageContextWithOptions(CGSizeMake(w,w), false, 0)
//            let con = UIGraphicsGetCurrentContext()!
//            CGContextSetFillColorWithColor(con, UIColor.redColor().CGColor)
//            let ii = CGFloat(i)
//            CGContextAddEllipseInRect(con, CGRectMake(0+ii,0+ii,w-ii*2,w-ii*2))
//            CGContextFillPath(con)
//            let im = UIGraphicsGetImageFromCurrentImageContext()
//            UIGraphicsEndImageContext()
//            arr += [im]
//        }
//        
//        let im = UIImage.animatedImageWithImages(arr, duration:0.5)
//        b.setImage(im, forState:.Normal) // b is a button in the interface
        
        
        // 视图溶解
      
        

//        let v2 = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100));
//        v2.backgroundColor = UIColor.greenColor()
//        v2.alpha = 0
//        self.v.superview!.addSubview(v2)
//        UIView.animateWithDuration(0.4, animations: {
//            self.v.alpha = 0
//            v2.alpha = 1
//            }, completion: {
//            _ in
//            self.v.removeFromSuperview()
//        })
        
//        UIView.animateWithDuration(0.4, animations: {
//            self.v.backgroundColor = UIColor.redColor()
//            UIView.performWithoutAnimation {
//                self.v.center.y += 100
//            }
//            })
        
//        UIView.animateWithDuration(2, animations: {
//            self.v.center.y += 100
//            })
//        self.v.center.y += 300
        
        
//        UIView.animateWithDuration(2, animations: {
//        self.v.center.y += 1300
//        self.v.center.y += 1800
//        self.v.backgroundColor = UIColor.redColor()
//        })
        
//        let opts = UIViewAnimationOptions.Autoreverse
//        UIView.animateWithDuration(1, delay: 0, options: opts, animations: {
//            self.v.center.x += 100
//            }, completion: nil)
        
//        
//        let opts  = UIViewAnimationOptions.Autoreverse
//        let xorig = self.v.center.x
//        UIView.animateWithDuration(1, delay: 0, options: opts, animations: {
//           self.v.center.x += 100
//         }, completion: {
//             _ in
//             self.v.center.x = xorig
//         })
        
        
//        
//        let count = 3
//        UIView.animateWithDuration(1, delay: 0, options: opts, animations: {
//            UIView.setAnimationRepeatCount(Float(count))
//            self.v.center.x += 100
//            }, completion: {
//                _ in
//                self.v.center.x = xorig
//            })
        
        
//        UIView.animateWithDuration(1, animations: {
//            self.v.center.x += 100
//            })
//        UIView.animateWithDuration(1, animations: {
//            self.v.center.y += 100
//            })
        
//        self.pOrig    = self.v.center
//        self.pFinal   = self.v.center
//        self.pFinal.x += 100
//        
//        UIView.animateWithDuration(4, animations: {
//            self.v.center = self.pFinal
//        })
        
        
        
        // 可重复动画
        self.pOrig = self.v.center
        let opts : UIViewAnimationOptions = [.Autoreverse, .Repeat]
        UIView.animateWithDuration(1, delay: 0, options: opts,
            animations: {
                self.v.center.x += 100
            }, completion: nil
        )
        
        b.addTarget(self, action: "cancelRepeatedAnimations", forControlEvents: .TouchUpInside)
        
        

    }
    
    // unrecognized selector sent to instance 0x7fc288eaf160'
    // 要把 Selector 中的方法放在 viewDidLoad 这个方法的外面, SB！
    func cancelAnimate() {
        self.v.layer.position = (self.v.layer.presentationLayer() as! CALayer).position
        self.v.layer.removeAllAnimations()
        UIView.animateWithDuration(0.1, animations: {
            self.v.center = self.pFinal

        })

    }
    
    func cancelRepeatedAnimations() {
        print("opps")
        UIView.animateWithDuration(0.1, delay: 0, options: .BeginFromCurrentState,
            animations: {
                self.v.center = self.pOrig
            }, completion: nil)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

