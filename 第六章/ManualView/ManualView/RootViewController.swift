//
//  RootViewController.swift
//  ManualView
//
//  Created by chenyf on 16/3/14.
//  Copyright © 2016年 chenyf. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    override func loadView() {
        let v = UIView()
        v.backgroundColor = UIColor.brownColor()
        self.view = v
        let label = UILabel()
        v.addSubview(label)
        label.text = "Hello World"
        label.autoresizingMask = [
            .FlexibleTopMargin,
            .FlexibleLeftMargin,
            .FlexibleRightMargin,
            .FlexibleBottomMargin,
        ]
        label.sizeToFit()
        label.center = CGPointMake(v.bounds.midX, v.bounds.midY)
        label.frame.makeIntegralInPlace()
    }
}
