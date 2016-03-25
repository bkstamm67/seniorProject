//
//  SubView.swift
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

class SubView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var cellDictionary : [[String: AnyObject]] = []
    var bizDict : [[String: AnyObject]] = []
    var cat = ""
    var sub = ""
    var id = ""
    var fwdSub = ""
    var fwdCat = ""
    var fwdID = ""
    var devLat = 0.00
    var devLong = 0.00
    var vers = 0.00
    
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
        title = sub
        
        tableView.dataSource = self
        tableView.delegate = self
                
        //access reuse subcategory list via API call
        if let cats = NSData(contentsOfURL: NSURL(string: Config.url + "getSub.php?id=" + "\(id)")!){
            cellDictionary = nsdataToJson(cats) as! [[String: AnyObject]]
            
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellDictionary.count
    }
    
    //populate table with subcategories stored in cellDictionary
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        let cellContent = cellDictionary[indexPath.row]
        
        cell.textLabel!.text = cellContent["itemSub"] as? String
        return cell
    }
    
    //make table rows selectable. Foward subcategory name and id to business list view
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        fwdSub = cellDictionary[indexPath.row]["itemSub"] as! String
        fwdCat = cat
        fwdID = (cellDictionary[indexPath.row]["subcatID"]?.stringValue)!
        self.performSegueWithIdentifier("SubToBiz", sender: self)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
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
        //forward data to Reuse Business List
        if segue.identifier == "SubToBiz"{
            let svc = segue.destinationViewController as! SubBizView
            svc.sub = fwdSub
            svc.cat = fwdCat
            svc.devLat = devLat
            svc.devLong = devLong
            svc.bizDict = bizDict
            svc.id = fwdID
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