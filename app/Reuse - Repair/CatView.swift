//
//  CatView.swift
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

class CatView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var mode = ""
    var cellDictionary : [[String: String]] = []
    var bizDict : [[String: AnyObject]] = []
    var fwdCat = ""
    var fwdSub = ""
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
        
        title = mode + " Categories"        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        if mode == "Reuse" {
            //access reuse category list via API call
            if let cats = NSData(contentsOfURL: NSURL(string: Config.url + "reuse.php")!){
                cellDictionary = nsdataToJson(cats) as! [[String: String]]
            }
        } else {
            //access repair category list via API call
            if let cats = NSData(contentsOfURL: NSURL(string: Config.url + "repair.php")!){
                cellDictionary = nsdataToJson(cats) as! [[String: String]]
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellDictionary.count
    }
    
    //populate table with categories stored in cellDictionary loading appropriate icon
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        let cellContent = cellDictionary[indexPath.row]
        if cellContent["item"]! == "Appliances - Small" {
            cell.imageView?.image = UIImage(imageLiteral: "small_appliances.jpg")
        } else if cellContent["item"]! == "Office Equipment" {
            cell.imageView?.image = UIImage(imageLiteral: "office_equipment.jpg")
        } else if cellContent["item"]! == "Food" {
            cell.imageView?.image = UIImage(imageLiteral: "food.jpg")
        } else if cellContent["item"]! == "Books" {
            cell.imageView?.image = UIImage(imageLiteral: "books.jpg")
        } else if cellContent["item"]! == "Computers" || cellContent["item"]! == "Computers, small appliances" {
            cell.imageView?.image = UIImage(imageLiteral: "computer.jpg")
        } else if cellContent["item"]! == "Sandals" {
            cell.imageView?.image = UIImage(imageLiteral: "sandals.jpg")
        } else if cellContent["item"]! == "Household" {
            cell.imageView?.image = UIImage(imageLiteral: "household.jpg")
        } else if cellContent["item"]! == "Bedding/Bath" {
            cell.imageView?.image = UIImage(imageLiteral: "bed_bath.jpg")
        } else if cellContent["item"]! == "Children's Goods" {
            cell.imageView?.image = UIImage(imageLiteral: "childrens_goods.jpg")
        } else if cellContent["item"]! == "Appliances - Large" {
            cell.imageView?.image = UIImage(imageLiteral: "large_appliances.jpg")
        } else if cellContent["item"]! == "Building/Home Improvement" {
            cell.imageView?.image = UIImage(imageLiteral: "home_improvement.jpg")
        } else if cellContent["item"]! == "Wearable Items" || cellContent["item"]! == "Clothes"{
            cell.imageView?.image = UIImage(imageLiteral: "clothes.jpg")
        } else if cellContent["item"]! == "Sporting Equipment/Camping" {
            cell.imageView?.image = UIImage(imageLiteral: "outdoor_gear.jpg")
        } else if cellContent["item"]! == "Useable Electronics" || cellContent["item"]! == "Cell Phones"{
            cell.imageView?.image = UIImage(imageLiteral: "phones.jpg")
        } else if cellContent["item"]! == "Garden" || cellContent["item"]! == "Lawn Equipment" || cellContent["item"]! == "Reel Mowers" {
            cell.imageView?.image = UIImage(imageLiteral: "lawn.jpg")
        } else if cellContent["item"]! == "Medical Supplies" {
            cell.imageView?.image = UIImage(imageLiteral: "medical_supply.jpg")
        } else if cellContent["item"]! == "Packing Materials" {
            cell.imageView?.image = UIImage(imageLiteral: "packing_materials.jpg")
        } else if cellContent["item"]! == "Furniture" {
            cell.imageView?.image = UIImage(imageLiteral: "furniture.jpg")
        } else if cellContent["item"]! == "Screen Repair" {
            cell.imageView?.image = UIImage(imageLiteral: "screen.jpg")
        } else if cellContent["item"]! == "Shoes" {
            cell.imageView?.image = UIImage(imageLiteral: "shoes.jpg")
        } else if cellContent["item"]! == "Shoes, Boots" {
            cell.imageView?.image = UIImage(imageLiteral: "boots.jpg")
        } else if cellContent["item"]! == "Upholstery, Furniture" {
            cell.imageView?.image = UIImage(imageLiteral: "upholstery.jpg")
        } else {
            cell.imageView?.image = UIImage(imageLiteral: "reuse.jpg")
        }
        
        cell.textLabel!.text = cellContent["item"]
        return cell
    }
    
    //make table rows selectable. Foward category name and id
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        fwdCat = cellDictionary[indexPath.row]["item"]!
        if mode == "Reuse" {
            fwdID = cellDictionary[indexPath.row]["reuseID"]!
            fwdSub = cellDictionary[indexPath.row]["item"]!
            self.performSegueWithIdentifier("CatToSub", sender: self)
        } else {
            fwdID = cellDictionary[indexPath.row]["repairID"]!
            self.performSegueWithIdentifier("CatToBiz", sender: self)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    func nsdataToJson(data: NSData) -> AnyObject? {
        do {
            return try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! [[String:String]]
        }
        catch let myJsonError {
            print (myJsonError)
        }
        return nil
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CatToSub" {
            //forward data to Reuse subcategory list
            let svc = segue.destinationViewController as! SubView
            svc.cat = fwdCat
            svc.sub = fwdSub
            svc.id = fwdID
            svc.devLat = devLat
            svc.devLong = devLong
            svc.bizDict = bizDict
            svc.vers = vers
        }
        if segue.identifier == "CatToBiz"{
            //forward data to Repair Business List
            let svc = segue.destinationViewController as! BizView
            svc.cat = fwdCat
            svc.id = fwdID
            svc.devLat = devLat
            svc.devLong = devLong
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
