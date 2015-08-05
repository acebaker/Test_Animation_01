//
//  ViewController.swift
//  Test_Animation_01
//
//  Created by Jeremy Juel on 6/26/15.
//  Copyright (c) 2015 Jeremy Juel. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    var markerShowing = false
    var theMarkerView = PlaceMarkerView()
    var expandingView = ExpandingView()
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadMarkerView()
        loadExpandingView()
        
    }
    
    func loadMarkerView() {
        theMarkerView = PlaceMarkerView.instanceFromNib()
        theMarkerView.frame = CGRectMake((self.view.bounds.width - theMarkerView.bounds.width)/2, (self.view.bounds.height - theMarkerView.bounds.height)/2, theMarkerView.bounds.width, theMarkerView.bounds.height)
        self.view.addSubview(theMarkerView)
        theMarkerView.setUpAnimation()
    }
    
    func loadExpandingView() {
        expandingView = ExpandingView.instanceFromNib()
        expandingView.frame = CGRectMake((self.view.bounds.width - expandingView.bounds.width)/2, (self.view.bounds.height - expandingView.bounds.height)/2, expandingView.bounds.width, expandingView.bounds.height)
        self.view.addSubview(expandingView)
        expandingView.setUpAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showHideButtonPressed(sender: AnyObject) {
        if markerShowing == true {
            //theMarkerView.hidePlaceMarker()
            expandingView.collapseView()
            markerShowing = false
        } else if markerShowing == false {
            //theMarkerView.showPlaceMarker()
            expandingView.expandView()
            markerShowing = true
        }
    }

}

