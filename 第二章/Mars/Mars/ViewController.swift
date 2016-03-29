//
//  ViewController.swift
//  Mars
//
//  Created by chenyf on 16/2/29.
//  Copyright © 2016年 chenyf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainView = self.view
        let iv = UIImageView(image:UIImage(named:"Mars"))
        mainView.addSubview(iv)
     
        iv.center = iv.superview!.bounds.center
        iv.frame.makeIntegralInPlace()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

extension CGRect {
    var center : CGPoint {
    return CGPointMake(self.midX, self.midY)
    }
}
