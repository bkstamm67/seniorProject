//
//  SubBizViewCustCell.swift
//  Reuse - Repair
//
//  Travis Boaz, boazt@oregonstate.edu
//  Brian Stamm, stammbr@oregonstate.edu
//  Andrew Kasnevich, kasnevia@oregonstate.edu
//  CS 419 Winter 2016 - Group 2
//

import UIKit

//used to populate the custom SubBiz TableView
class SubBizViewCustCell: UITableViewCell {

    
    @IBOutlet weak var BizName: UILabel!
    
    @IBOutlet weak var City: UILabel!
    @IBOutlet weak var Dist: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
