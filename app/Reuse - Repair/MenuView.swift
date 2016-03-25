//
//  MenuView.swift
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

class MenuView: UITableViewController, CLLocationManagerDelegate {
    @IBOutlet weak var menuTable: UITableView!
    
    var addr1 = ""
    var addr2 = ""
    var url = ""
    var fwdMode = ""
    let locationManager = CLLocationManager()
    var devLat = 0.00
    var devLong = 0.00
    var online = true
    var bizDict : [[String: AnyObject]] = []
    var aboutDict : [[String: AnyObject]] = []
    var systemVersion = ""
    var vers = 0.00
    
    //static dictionary containing menu options
    let cellDictionary = [["mode": "Recyc", "option": "Recycling Depot options", "desc": "provded by Republic Services", "addr": "addr1"],["mode": "Recyc", "option": "Curbside Recycling options", "desc": "provded by Republic Services", "addr": "addr2"],["mode": "Reuse", "option": "Reuse", "desc": "where you can donate items for reuse by others"],["mode": "Repair", "option": "Repair", "desc": "businesses that render the unusable usable again"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        systemVersion = UIDevice.currentDevice().systemVersion;
        let arr = systemVersion.componentsSeparatedByString(".")
        vers = Double(arr[0] + "." + arr[1])!
        
        
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            
        }
        
        //check if device is online
        if vers < 8.0 {
            if OldReachability.isConnectedToNetwork() == false {
                online = false
                let alertController = UIAlertController(title: "Device is not connected to internet", message: "Please connect to the internet and relaunch application", preferredStyle: .Alert)
                let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(defaultAction)
                presentViewController(alertController, animated: true, completion: nil)
            }
        } else {
            if reachabilityCheck() == false {
                online = false
                let alertController = UIAlertController(title: "Device is not connected to internet", message: "Please connect to the internet and relaunch application", preferredStyle: .Alert)
                let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(defaultAction)
                presentViewController(alertController, animated: true, completion: nil)
            }
        }
        //get all business info as a single dictionary via API call
        if let data = NSData(contentsOfURL: NSURL(string: Config.url + "biz.php")!){
            bizDict = nsdataToJson(data) as! [[String: AnyObject]]
        }
        
        //get about blurb as well as depot and curbside PDF url addresses
        if let data = NSData(contentsOfURL: NSURL(string: Config.url + "getAbout.php")!){
            aboutDict = nsdataToJson(data) as! [[String: AnyObject]]
            addr1 = aboutDict[1]["notes"] as! String
            addr2 = aboutDict[2]["notes"] as! String
        }
        
        
        title = "Corvallis Reuse and Repair Directory"
        
    }
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel!.textColor = UIColor.whiteColor()
    }
   
    //use customized table to create uniform menu
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        fwdMode = cellDictionary[indexPath.row]["mode"]!
        
        if indexPath.section < 1
        {
            if indexPath.row == 0
            {
                url = addr1
            }
            else
            {
                url = addr2
            }
            if online == true {
                self.performSegueWithIdentifier("MenuToPDF", sender: self)
            }
        }
        if indexPath.section > 0 {
            if indexPath.row == 0
            {
                fwdMode = "Reuse"
            }
            else
            {
                fwdMode = "Repair"
            }
            
            if online == true {
                self.performSegueWithIdentifier("MenuToCategories", sender: self)
            }
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //get device's location
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        devLat = locValue.latitude
        devLong = locValue.longitude
        
        locationManager.stopUpdatingLocation()

    }
    func nsdataToJson(data: NSData) -> AnyObject? {
        do {
            return try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! [[String:AnyObject]]
        }
        catch let myJsonError {
            print (myJsonError)
        }
        return nil
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "MenuToPDF" {
            //forward data to PDFview
            let svc = segue.destinationViewController as! PDFView
            svc.selectedPDFLink = url
            svc.vers = vers
        }else if segue.identifier == "MenuToCategories"{
            //forward data to category List
            let svc = segue.destinationViewController as! CatView
            svc.mode = fwdMode
            svc.devLat = devLat
            svc.devLong = devLong
            svc.bizDict = bizDict
            svc.vers = vers
            
        } else {
            //forward data to AboutView
            let svc = segue.destinationViewController as! AboutView
            svc.about = aboutDict[0]["notes"] as! String
            svc.vers = vers
            
        }
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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