//
//  CustomTableViewCell.swift
//  RetailStore
//
//  Created by Sangeeth on 17/11/14.
//  Copyright (c) 2014 Sangeeth. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var percentageMatch: UILabel!
    @IBOutlet weak var storeAddress: UILabel!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var storeAddress2: UILabel!
    @IBOutlet weak var storeAddress1: UILabel!
    @IBOutlet weak var moreDetailsLabel:UIButton!
    @IBOutlet weak var available: UILabel!
    
    let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate;

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell(percentageMatch: String, storeAddress: String, storeAddress1: String, storeAddress2: String, storeName: String, distance: String)  {
        if(appDelegate.gobyselected ==  true)
        {
            if(appDelegate.storeItemSelected == true)
            {
                self.percentageMatch.hidden = false;
                self.moreDetailsLabel.hidden = false;
                self.available.hidden = false;
            }
            else
            {
                self.percentageMatch.hidden = true;
                self.moreDetailsLabel.hidden = true;
                self.available.hidden = true;
            }
           
            
        }
        else if(appDelegate.gobyselected ==  false)
        {
            self.percentageMatch.hidden = false;
            self.moreDetailsLabel.hidden = false;
            self.available.hidden = false;
            
        }
        self.percentageMatch.text = percentageMatch
        self.storeAddress.text = storeAddress
        self.storeAddress1.text = storeAddress1
        self.storeAddress2.text = storeAddress2
        self.storeName.text = storeName
        self.distance.text = distance
    }


}
