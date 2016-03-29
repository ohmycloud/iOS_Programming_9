//
//  ViewController.swift
//  imageRendering
//
//  Created by chenyf on 16/2/29.
//  Copyright © 2016年 chenyf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   @IBOutlet var b: UIButton!
   @IBOutlet var tbi: UITabBarItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let window = UIApplication.sharedApplication().delegate!.window! {
            window.tintColor = UIColor.redColor()
        }
        
        let im = UIImage(named: "Smiley")!.imageWithRenderingMode(.AlwaysTemplate)
        self.b.setBackgroundImage(im, forState: .Normal)
        
        
        let im2 = UIImage(named: "smiley2")!.imageWithRenderingMode(.AlwaysOriginal)
        self.tbi.image = im2
        
        let im3 = UIImage(named: "photo")!.imageWithAlignmentRectInsets(UIEdgeInsetsMake(0, 0, 24, 0))
        let iv  = UIImageView(image: im3)
        self.view.addSubview(iv)
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        // 为 imageView 添加约束
        NSLayoutConstraint.activateConstraints([
            iv.leadingAnchor.constraintEqualToAnchor(self.view.leadingAnchor),
            iv.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor)
            ])
        
        
        let im4 = UIImage(named: "photo")!
        let iv2 = UIImageView(image: im4)
        self.view.addSubview(iv2)
        iv2.translatesAutoresizingMaskIntoConstraints = false
        
        // 添加约束
        NSLayoutConstraint.activateConstraints([
            iv2.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor),
            iv2.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor)
            ])
        print(im4.alignmentRectInsets)
        print(iv2.alignmentRectInsets())
        
        let im5 = UIImage(named:"smiley2")!
        let b = UIButton(type: .System)
        b.setImage(im5.imageWithAlignmentRectInsets(UIEdgeInsetsMake(0, 0, 40, 0)), forState: .Normal)
        b.setTitle("Howdy", forState:.Normal)
        b.sizeToFit()
        self.view.addSubview(b)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

