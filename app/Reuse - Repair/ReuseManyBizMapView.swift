//
//  ReuseManyBizMapView.swift
//  Reuse - Repair
//
//  Travis Boaz, boazt@oregonstate.edu
//  Brian Stamm, stammbr@oregonstate.edu
//  Andrew Kasnevich, kasnevia@oregonstate.edu
//  CS 419 Winter 2016 - Group 2
//

import Foundation
import UIKit
import ReachabilitySwift

class ReuseManyBizMapView: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    @IBOutlet var mapView: GMSMapView!
    @IBOutlet weak var changeRadButton: UIBarButtonItem!
    
    var sub = ""
    var cat = ""
    var biz = ""
    var orderedDict : [[String: AnyObject]] = []
    var bizDict : [[String: AnyObject]] = []
    var devLat = 0.00
    var devLong = 0.00
    let locationManager = CLLocationManager()
    var id = 0
    var distFromDev = 0.0
    var vers = 0.00
    var radius = ""
    var img = ""

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //check if device is online
        if vers < 8.0 {
            if OldReachability.isConnectedToNetwork() == false {
                self.performSegueWithIdentifier("ReuseMapToMenu", sender: self)
            }
        } else {
            if reachabilityCheck() == false {
                self.performSegueWithIdentifier("ReuseMapToMenu", sender: self)
            }
        }
        
        
        self.navigationItem.title = sub + " - " + radius
        if radius == "Within 5 mi" {
            changeRadButton.title = "Over 5 mi"
            
        } else {
            changeRadButton.title = "Within 5 mi"
        }
        
        //provide means to return to list format
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "List", style: .Plain, target: self, action: "listTapped:")
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        mapView.delegate = self
    
    }
    func listTapped (sender: UIButton!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    //initialize map with device location
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            
            locationManager.startUpdatingLocation()
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true
        }
    }
    
    //add business icons to map corresponding to business location
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            
            mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            locationManager.stopUpdatingLocation()
            
            var count = 0
            var markerArr = [GMSMarker()]
            
            for i in orderedDict {
                
                let markLat : Double = NSString(string: i["lat"]! as! String).doubleValue
                let markLong : Double = NSString(string: i["long"]! as! String).doubleValue
                let distFromDev : Double = NSString(string: i["distDub"]! as! String).doubleValue
                
            
                if markLat != 0.00 {
                
                    let position = CLLocationCoordinate2DMake(markLat, markLong)
                    let dev = CLLocationCoordinate2DMake(devLat, devLong)
                    let marker = GMSMarker(position: position)
                    let devMarker = GMSMarker(position: dev)
                    
                    //initially only businesses within 5 miles are displayed
                    if radius == "Within 5 mi" {
                        if distFromDev <= 5.0 {
                            markerArr.append(marker)
                        }
                    } else {
                        markerArr.append(marker)
                    }
                    markerArr.append(devMarker)
                    
                    if count < 30 {
                        img = "\(count)a.png"
                    } else {
                        img = "30a.png"
                    }
                    
                    marker.icon = UIImage(named: img)
                    marker.map = mapView;
                    marker.title = String(count)
                    
                    
                }
                    count++
            }
            
            //zoom to include all of relevant makrers
            var bounds = GMSCoordinateBounds()
            for marker in markerArr {
                bounds = bounds.includingCoordinate(marker.position)
            }
            
            if let camera = mapView.cameraForBounds(bounds, insets:UIEdgeInsetsZero){
                mapView.camera = camera
                mapView.animateWithCameraUpdate(GMSCameraUpdate.zoomOut())
            }
            
        }
        
    }
    
    //resfresh map either zoomed in or out (the opposite of current state)
    @IBAction func changeRadButtonAction(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("ReuseMapToSelf", sender: self)
    }
    
    //segue app to business detail for business corresponding to tapped icon
    func mapView(mapView: GMSMapView, didTapMarker marker: GMSMarker) -> Bool {
        id = Int(marker.title!)!
        self.performSegueWithIdentifier("reuseMapToDet", sender: self)
        
        return true
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "reuseMapToDet"{
            //forward data to detailed Business View
            let svc = segue.destinationViewController as! ReuseBizDetView
            svc.sub = sub
            svc.biz = orderedDict[id]["biz"] as! String
            svc.id = orderedDict[id]["bid"] as! String
            svc.devLat = devLat
            svc.devLong = devLong
            svc.bizDict = bizDict
            svc.vers = vers
        }
        if segue.identifier == "ReuseMapToSelf"{
            //forward data to back to Reuse Many Business Map
            let svc = segue.destinationViewController as! ReuseManyBizMapView
            svc.cat = cat
            svc.sub = sub
            svc.devLat = devLat
            svc.devLong = devLong
            svc.orderedDict = orderedDict
            if radius == "Within 5 mi" {
                svc.radius = "Over 5 mi"
            } else {
                svc.radius = "Within 5 mi"
            }
            svc.bizDict = bizDict
            svc.vers = vers
            
        }
        
    }
    
    //used to check if device is online
    func reachabilityCheck() -> Bool {
        
        let reachability: Reachability
        do {
            reachability = try Reachability.reachabilityForInternetConnection()
        } catch {
            return false
        }
        
        if reachability.isReachable() {
            if reachability.isReachableViaWiFi() {
                return true
            } else {
                return true
            }
        } else {
            return false
        }
    }


}
