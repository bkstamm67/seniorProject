//
//  AboutView.swift
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


class AboutView: UIViewController {
    
    
    @IBOutlet weak var aboutTextView: UITextView!
    
    var vers = 0.00
    var about = ""//"The Corvallis Sustainability Coalition is a network of organizations and individuals in Corvallis/Benton County, Oregon working together to create a more sustainable community.\n\nThe Coalition includes businesses, non-profits, faith communities, educational institutions, and government entities that are committed to creating a community that values environmental quality, social equity, and economic vitality. Our primary purpose is to foster communication and collaboration so that we can accelerate progress toward a sustainable future.\n\nThe Coalition was launched in 2007 by local coordinators of the Natural Step who saw the need to bring together those in our community working on different aspects of sustainability. We are now an independent 501(c)(3) non-profit organization. Our work has built on the efforts and accomplishments of the City of Corvallis and other community groups.\n\nParticipation in the Corvallis Sustainability Coalition is open to local organizations and individuals who support its vision, mission, goals, and guiding objectives. There is no fee for participation."
    
    
    
    
    
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
        
        //make button for referral to Coalition website on Safari
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Coalition Website", style: .Plain, target: self, action: "toWeb:")
        
        let updatedAbout = about.stringByReplacingOccurrencesOfString("*", withString: "•", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        //display current about blurb
        title = "About"
        aboutTextView.text = updatedAbout
        
    }
    func toWeb (sender: UIButton!) {
        if UIApplication.sharedApplication().openURL(NSURL(string: "http://sustainablecorvallis.org/")!){
            
        } else {
            let alertController = UIAlertController(title: "Invalid Web Address", message: "", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
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
