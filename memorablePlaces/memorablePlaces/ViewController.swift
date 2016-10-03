//
//  ViewController.swift
//  memorablePlaces
//
//  Created by anita on 9/20/16.
//  Copyright © 2016 anita. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var locationManager = CLLocationManager()
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do all the setup for location management
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
//        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action")
//        uilpgr.minimumPressDuration = 2
//        map.addGestureRecognizer(uilpgr)
    }

//    func action(gestureRecognizer: UIGestureRecognizer) {
//        var touchPoint = gestureRecognizer.locationInView(self.map)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

