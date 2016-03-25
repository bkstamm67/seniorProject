//
//  BizView.swift
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

class BizView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var data : [[String: String]] = []
    var cellDictionary : [[String: AnyObject]] = []
    var bizDict : [[String: AnyObject]] = []
    var orderedDict : [[String: AnyObject]] = []
    var cat = ""
    var id = ""
    var fwdBiz = ""
    var fwdCat = ""
    var fwdID = ""
    var img = ""
    var devLat = 0.00
    var devLong = 0.00
    var distDub = 0.00
    var vers = 0.00
    var bizArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //check if device is online
        if vers < 8.0 {
            if OldReachability.isConnectedToNetwork() == false {
                let alertController = UIAlertController(title: "Device is not connected to internet", message: "Please connect to the internet and relaunch application", preferredStyle: .Alert)
                let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(defaultAction)
                presentViewController(alertController, animated: true, completion: nil)
            }
        } else {
            if reachabilityCheck() == false {
                let alertController = UIAlertController(title: "Device is not connected to internet", message: "Please connect to the internet and relaunch application", preferredStyle: .Alert)
                let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(defaultAction)
                presentViewController(alertController, animated: true, completion: nil)
            }
        }

        title = cat
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //access repair business list via API call
        if let data = NSData(contentsOfURL: NSURL(string: Config.url + "getCatBiz.php?id=" + id)!){
            bizArray = nsdataToJson(data) as! [Int]
        }
        
        let geokey = "&key=" + Config.apiKey
        let getDistanceURL = "https://maps.googleapis.com/maps/api/distancematrix/json?origins="
        
        
        //use google places API to calculate distance to business from device
        for i in bizDict {
            for j in bizArray as! [Int] {
                let bizID : Int = NSString(string: i["business_id"]! as! String).integerValue
                
                if bizID == j  {
                    
                    let loc = i["city"]
                    let biz = i["name"]
                    let lat = i["latitude"]
                    let long = i["longitude"]
                    var dist = ""
                    if i["latitude"] as! String == "0" || i["longitude"] as! String == "0" {
                        dist = "0.00"
                    } else {
                        
                        let origin = String(devLat) + "," + String(devLong)
                        let destination = String(i["latitude"]!) + "," + String(i["longitude"]!)
                        
                        if let distance = NSData(contentsOfURL: NSURL(string: getDistanceURL + origin + "&destinations=" + destination + geokey)!){
                            let jsonedData = JSON(data: distance)
                            if (jsonedData["rows"][0]["elements"][0]["status"] == "ZERO_RESULTS") {
                                dist = "0.00"
                                
                                let alertController = UIAlertController(title: "Device is returning faulty location information", message: "Location related functions are disabled", preferredStyle: .Alert)
                                let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                                alertController.addAction(defaultAction)
                                presentViewController(alertController, animated: true, completion: nil)
                            } else {
                            
                                let distMeters = Double(String(jsonedData["rows"][0]["elements"][0]["distance"]["value"]))
                                distDub = distMeters! * 0.00062137
                                distDub = round(distDub * 10)/10
                                dist = String(distDub) + " mi"
                            }
                            
                        }
                    }
                    let temp = ["bid": String(bizID), "loc": loc!, "biz": biz!, "dist": dist, "distDub": String(distDub), "lat": lat!, "long": long!]//, "cat": datcat!]
                    cellDictionary.append(temp)
                    
                }
            }
        }
        
        //create a sorted dictionary "orderedDict" which is sorted by distance from device
        orderedDict = cellDictionary.sort {
            if ($0["dist"] as! String == $1["dist"] as! String) {
                return String($0["name"]) < String($1["name"])
            } else {
                let doubleValue0 : Double = NSString(string: $0["distDub"]! as! String).doubleValue
                let doubleValue1 : Double = NSString(string: $1["distDub"]! as! String).doubleValue
                
                if doubleValue0 < doubleValue1 {
                    return true
                } else {
                    return false
                }
            }
        }
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderedDict.count
    }
    
    //populate table with businesses stored in orderedDict
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! BizViewCustCell
        
        let cellContent = orderedDict[indexPath.row]
        
        if indexPath.row < 30 {
            img = String(indexPath.row) + ".png"
        } else {
            img = "30.png"
        }
        cell.imageView?.image = UIImage(imageLiteral: img)
        cell.BizName.text = cellContent["biz"] as? String
        cell.City.text = cellContent["loc"] as? String
        if cellContent["dist"] as! String == "0.00" {
            cell.Dist.text = "virtual"
        } else {
            cell.Dist.text = cellContent["dist"] as? String
        }
        
        return cell
    }
    
    //make table rows selectable. Foward business name and id to detail view
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        fwdBiz = orderedDict[indexPath.row]["biz"]! as! String
        fwdID = orderedDict[indexPath.row]["bid"]! as! String
        self.performSegueWithIdentifier("BizToDet", sender: self)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func nsdataToJson(data: NSData) -> AnyObject? {
        do {
            return try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! [Int]
        }
        catch let myJsonError {
            print (myJsonError)
        }
        return nil
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "BizToDet"{
            
            //forward data to detailed Business View
            let svc = segue.destinationViewController as! RepBizDetView
            svc.biz = fwdBiz
            svc.cat = fwdCat
            svc.devLat = devLat
            svc.devLong = devLong
            svc.bizDict = bizDict
            svc.id = fwdID
            svc.vers = vers
        } else {
            
            //forward data to Repair Many Business Map
            let destinationNavigationController = segue.destinationViewController as! UINavigationController
            let targetController = destinationNavigationController.topViewController as! RepManyBizMapView
            targetController.cat = cat
            targetController.devLat = devLat
            targetController.devLong = devLong
            targetController.orderedDict = orderedDict
            targetController.radius = "Within 5 mi"
            targetController.bizDict = bizDict
            targetController.vers = vers

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