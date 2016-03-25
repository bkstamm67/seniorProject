//
//  ReuseBizDetView.swift
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

class ReuseBizDetView: UITableViewController {
    
    @IBOutlet weak var BizName: UILabel!
    @IBOutlet weak var Address: UILabel!
    @IBOutlet weak var DirectionButtonLabel: UIButton!
    @IBOutlet weak var PhoneNumberLabel: UIButton!
    @IBOutlet weak var WebsiteLabel: UIButton!
    @IBOutlet weak var NotesText: UITextView!
    
    var biz = ""
    var id = ""
    var sub = ""
    var add = ""
    var phone = ""
    var web = ""
    var lat = ""
    var long = ""
    var strippedPhone = ""
    var notes = ""
    var devLat = 0.00
    var devLong = 0.00
    var vers = 0.00
    var bizDict : [[String: AnyObject]] = []
    
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
       
        //find referred business and populate the business directory
        for i in bizDict {
            if i["business_id"] as! String == id {
                phone = i["telephone"] as! String
                
                add = i["address"] as! String
                let str = add.stringByReplacingOccurrencesOfString(".", withString: "")
                var arr = str.componentsSeparatedByString(" ")
                if arr[0].uppercaseString == "PO" && arr[1].uppercaseString == "BOX" {
                    add = "PO Box " + arr[2]
                }
                
                web = i["website"] as! String
                notes = i["notes"] as! String
                lat = i["latitude"] as! String
                long = i["longitude"] as! String
            }
        }
        
        BizName.text = biz
        Address.text = add
        NotesText.text = notes
        NotesText.userInteractionEnabled = false
        
        
        let stringArray = phone.componentsSeparatedByCharactersInSet(
            NSCharacterSet.decimalDigitCharacterSet().invertedSet)
        strippedPhone = stringArray.joinWithSeparator("")
        
        
        //check for valid phone, url, and location coordinates if not present disable button actions
        if phone == "" || strippedPhone == "" {
            PhoneNumberLabel.setTitle("No Phone Number available", forState: .Normal)
            PhoneNumberLabel.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        } else {
            PhoneNumberLabel.setTitle(phone, forState: .Normal)
        }
        if web == "" {
            WebsiteLabel.setTitle("No Web Address available", forState: .Normal)
            WebsiteLabel.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        }
        if lat == "0" || long == "0" {
            DirectionButtonLabel.setTitle("Directions not available", forState: .Normal)
            DirectionButtonLabel.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        }
        
    }
    
    //refer user to Google Maps app for directions
    @IBAction func DirectionButtonAction(sender: UIButton) {
        let url = "comgooglemaps://?saddr=&daddr=" + lat + "," + long + "&directionsmode=driving"
        
        if  UIApplication.sharedApplication().openURL(NSURL(string: url)!) != false {
            
        } else {
            let alertController = UIAlertController(title: "Google Maps App not found", message: "", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    //refer user to pre-dialed phone app
    @IBAction func PhoneNumberAction(sender: UIButton) {
        if strippedPhone != "" {
            if let url = NSURL(string: "tel://\(strippedPhone)") {
                UIApplication.sharedApplication().openURL(url)
            }
        }
    }
    
    //refer user to Safari for url display
    @IBAction func WebsiteAction(sender: UIButton) {
        if UIApplication.sharedApplication().openURL(NSURL(string: web)!){
            
        } else {
            let alertController = UIAlertController(title: "Invalid Web Address", message: "", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
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