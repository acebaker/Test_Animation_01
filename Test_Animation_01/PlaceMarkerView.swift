//
//  PlaceMarkerView.swift
//  Test_Animation_01
//
//  Created by Jeremy Juel on 6/26/15.
//  Copyright (c) 2015 Jeremy Juel. All rights reserved.
//

import UIKit

class PlaceMarkerView: UIView {

    @IBOutlet weak var placeMarkerContainerView: UIView!
    @IBOutlet weak var placeTitleLabel: UILabel!
    @IBOutlet weak var placeRatingLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var distanceUnitsLabel: UILabel!
    @IBOutlet weak var placeImageView: UIImageView!
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    class func instanceFromNib() -> PlaceMarkerView {
        return UINib(nibName: "PlaceMarkerView", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! PlaceMarkerView
    }
    
    func setUpAnimation() {
        placeMarkerContainerView.layer.shadowOffset = CGSizeMake(1, 1)
        placeMarkerContainerView.layer.shadowOpacity = 0.3;
        placeMarkerContainerView.layer.shadowRadius = 3;
        
        placeMarkerContainerView.transform = CGAffineTransformMakeTranslation(0, placeMarkerContainerView.bounds.height+50)
        //placeMarkerContainerView.alpha = 0
        placeTitleLabel.transform = CGAffineTransformMakeTranslation(0, placeTitleLabel.bounds.height+50)
        placeTitleLabel.alpha = 0
        distanceLabel.transform = CGAffineTransformMakeTranslation(0, distanceLabel.bounds.height+50)
        distanceLabel.alpha = 0
        
        placeRatingLabel.transform = CGAffineTransformMakeTranslation(0, placeRatingLabel.bounds.height+50)
        placeRatingLabel.alpha = 0
        distanceUnitsLabel.transform = CGAffineTransformMakeTranslation(0, distanceUnitsLabel.bounds.height+50)
        distanceUnitsLabel.alpha = 0
        
        //placeImageView.transform = CGAffineTransformMakeTranslation(0, placeImageView.bounds.height+50)
        //placeImageView.alpha = 0
    }
    
    func showPlaceMarker() {
        var transform = CGAffineTransformIdentity
        
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: nil, animations: {
            self.placeMarkerContainerView.transform = transform
        }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: nil, animations: {
            //self.placeImageView.alpha = 1
            //self.placeImageView.transform = transform
        }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: nil, animations: {
            self.placeTitleLabel.alpha = 1
            self.placeTitleLabel.transform = transform
            
            self.distanceLabel.alpha = 1
            self.distanceLabel.transform = transform
        }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: nil, animations: {
            self.placeRatingLabel.alpha = 1
            self.placeRatingLabel.transform = transform
            
            self.distanceUnitsLabel.alpha = 1
            self.distanceUnitsLabel.transform = transform
        }, completion: nil)
    }

    func hidePlaceMarker() {
        UIView.animateWithDuration(0.35, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: nil, animations: {
            //self.placeImageView.alpha = 0
            //self.placeImageView.transform = CGAffineTransformMakeTranslation(0, self.placeImageView.bounds.height+50)
        }, completion: nil)
        
        UIView.animateWithDuration(0.35, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: nil, animations: {
            self.placeTitleLabel.alpha = 0
            self.placeTitleLabel.transform = CGAffineTransformMakeTranslation(0, self.placeTitleLabel.bounds.height+50)
            
            self.distanceLabel.alpha = 0
            self.distanceLabel.transform = CGAffineTransformMakeTranslation(0, self.distanceLabel.bounds.height+50)
        }, completion: nil)
        
        UIView.animateWithDuration(0.35, delay: 0.05, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: nil, animations: {
            self.placeRatingLabel.alpha = 0
            self.placeRatingLabel.transform = CGAffineTransformMakeTranslation(0, self.placeRatingLabel.bounds.height+50)
            
            self.distanceUnitsLabel.alpha = 0
            self.distanceUnitsLabel.transform = CGAffineTransformMakeTranslation(0, self.distanceUnitsLabel.bounds.height+50)
        }, completion: nil)
        
        UIView.animateWithDuration(0.35, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: nil, animations: {
            self.placeMarkerContainerView.transform = CGAffineTransformMakeTranslation(0, self.placeMarkerContainerView.bounds.height+50)
        }, completion: nil)
    }
    
    @IBAction func detailsButtonPressed(sender: AnyObject) {

    }
    
    
    
    
}
