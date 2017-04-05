//
//  ViewController.swift
//  memorablePlaces
//
//  Created by anita on 4/4/17.
//  Copyright © 2017 anita. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    var manager: CLLocationManager!
    
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest

        if activePlace == -1 {
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        } else {
            let latitude = NSString(string: places[activePlace]["lat"]!).doubleValue
            let longitude = NSString(string: places[activePlace]["lon"]!).doubleValue
            
            var coordinate = CLLocationCoordinate2DMake(latitude, longitude)
            var latDelta: CLLocationDegrees = 0.01
            var lonDelta: CLLocationDegrees = 0.01
            var span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
            var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
            
            self.map.setRegion(region, animated: true)
            
            var annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = places[activePlace]["name"]
            self.map.addAnnotation(annotation)

        }
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress(gestureRecognizer:)))
        uilpgr.minimumPressDuration = 2.0
        map.addGestureRecognizer(uilpgr)
    }

    func handleLongPress(gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizerState.began {
            var touchPoint = gestureRecognizer.location(in: self.map)
            var newCoordinate = self.map.convert(touchPoint, toCoordinateFrom: self.map)
            
            var location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
                
                var title = ""
                if (error == nil) {
                    if let p = placemarks?[0] {
//                    if let p = CLPlacemark(placemark: placemarks?[0] as! CLPlacemark!) {
                        var subThoroughfare: String = ""
                        var thoroughfare: String = ""
                        
                        if p.subThoroughfare != nil {
                            subThoroughfare = p.subThoroughfare!
                        }
                        
                        if p.thoroughfare != nil {
                            thoroughfare = p.thoroughfare!
                        }
                        
                        title = "\(subThoroughfare) \(thoroughfare)"
                    }
                }
                if title == "" {
                    title = "Added \(NSDate())"
                }
                
                places.append(["name":title, "lat":"\(newCoordinate.latitude)", "lon":"\(newCoordinate.longitude)"])
                var annotation = MKPointAnnotation()
                annotation.coordinate = newCoordinate
                annotation.title = "New Annotation"
                self.map.addAnnotation(annotation)
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var userLocation: CLLocation = locations[0] 
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        
        var latDelta: CLLocationDegrees = 0.01
        var lonDelta: CLLocationDegrees = 0.01
        var span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        var region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.map.setRegion(region, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

