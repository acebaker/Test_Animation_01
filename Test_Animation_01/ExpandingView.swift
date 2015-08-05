//
//  ExpandingView.swift
//  Test_Animation_01
//
//  Created by Jeremy Juel on 6/27/15.
//  Copyright (c) 2015 Jeremy Juel. All rights reserved.
//

import UIKit

class ExpandingView: UIView {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var clipView: UIView!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    class func instanceFromNib() -> ExpandingView {
        return UINib(nibName: "ExpandingView", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! ExpandingView
    }
    
    func setUpAnimation() {
        shadowView.bounds = CGRectMake(0, 0, shadowView.bounds.width, 70)
        clipView.bounds = shadowView.bounds
        
        //shadowView.transform = CGAffineTransformMakeTranslation(0, 150)
    }
    
    func expandView() {
        let transform = CGAffineTransformIdentity
        
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: nil, animations: {
            self.shadowView.bounds = CGRectMake(0, 0, self.shadowView.bounds.width, 220)
            self.clipView.bounds = self.shadowView.bounds
            //self.shadowView.transform = transform
        }, completion: nil)
    }
    
    func collapseView() {
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: nil, animations: {
            self.shadowView.bounds = CGRectMake(0, 0, self.shadowView.bounds.width, 70)
            self.clipView.bounds = self.shadowView.bounds
            //self.shadowView.transform = CGAffineTransformMakeTranslation(0, 150)
        }, completion: nil)
    }
    
}
