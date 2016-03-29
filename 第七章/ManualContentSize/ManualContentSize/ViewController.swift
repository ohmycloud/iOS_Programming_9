//
//  ViewController.swift
//  ManualContentSize
//
//  Created by chenyf on 16/3/20.
//  Copyright © 2016年 chenyf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let sv = UIScrollView(frame: self.view.bounds)
//        sv.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
//        self.view.addSubview(sv)
//        sv.backgroundColor = UIColor.whiteColor()
//        
//        var y: CGFloat = 10
//        for i in 0..<30 {
//            let lab = UILabel()
//            lab.text = "这是标签 \(i)"
//            lab.sizeToFit()
//            lab.frame.origin = CGPointMake(10, y)
//            lab.backgroundColor = UIColor.redColor()
//            lab.frame.size.width = self.view.bounds.width - 20
//            lab.autoresizingMask = .FlexibleWidth
//            sv.addSubview(lab)
//            y += lab.bounds.size.height + 10
//        }
//        
//        var  sz = sv.bounds.size
//        sz.height = y
//        sv.contentSize = sz // *
        
        
        // 重写
        let sv = UIScrollView()
        sv.backgroundColor = UIColor.whiteColor()
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        var con = [NSLayoutConstraint]()
        con.appendContentsOf(
            NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|[sv]|",
            options:[], metrics:nil,
            views:["sv":sv]))
        con.appendContentsOf(
            NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|[sv]|",
            options:[], metrics:nil,
            views:["sv":sv]))
        var previousLab : UILabel? = nil
        for i in 0 ..< 30 {
            let lab = UILabel()
            // lab.backgroundColor = UIColor.redColor()
            lab.translatesAutoresizingMaskIntoConstraints = false
            lab.text = "This is label \(i+1)"
            sv.addSubview(lab)
            con.appendContentsOf(
            NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-(10)-[lab]",
            options:[], metrics:nil,
            views:["lab":lab]))
            if previousLab == nil { // first one, pin to top
            con.appendContentsOf(
            NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-(10)-[lab]",
            options:[], metrics:nil,
            views:["lab":lab]))
        } else { // all others, pin to previous
            con.appendContentsOf(
            NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[prev]-(10)-[lab]",
            options:[], metrics:nil,
            views:["lab":lab, "prev":previousLab!]))
            }
            previousLab = lab
        }
        //NSLayoutConstraint.activateConstraints(con)
        // ... everything else as before ...
        // last one, pin to bottom, this dictates content size height!
        con.appendContentsOf(
            NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[lab]-(10)-|",
            options:[], metrics:nil,
            views:["lab":previousLab!]))
        NSLayoutConstraint.activateConstraints(con)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

