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
        self.view = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let v = self.view
        v.backgroundColor = UIColor.brownColor()
        let label = UILabel()
        v.addSubview(label)
        label.text = "Hello World"
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([
            label.centerXAnchor.constraintEqualToAnchor(v.centerXAnchor),
            label.centerYAnchor.constraintEqualToAnchor(v.centerYAnchor),
            ]
        )
    }
}
