//
//  StoreTableViewController.swift
//  RetailStore
//
//  Created by Greeshma Arunkumar on 23/11/14.
//  Copyright (c) 2014 Sangeeth. All rights reserved.
//

import UIKit

class StoreTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    
var stores = [["85.2%", "Hennur Bagadhur Road","Hennur Cross","Bangalore","Reliance Retail Store","1.2 Km"],["70.8%","Phoenix Market City","Near ITPL","Bangalore","Big Bazaar","2.5 Km"],["67.5%","Outer Ring Road","Mahadevapura","Bangalore","More Megastore","3.8 Km"],["62.3%","Hennur Bagadhur Road","Hennur Cross","Bangalore","Walmart","4.1 Km"],["50.2%","Hennur Bagadhur Road","Hennur Cross","Bangalore","Spar Hypermarket","4.5 Km"]]
    
    var storeAvailibility : Array<String> = Array();
    let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.storesTable.delegate = self
//        self.storesTable.dataSource = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: (UITableView!)) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: (UITableView), numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return stores.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: CustomTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as CustomTableViewCell
        let store = stores[indexPath.row]
        cell.setCell(storeAvailibility[indexPath.row]+"%", storeAddress: store[1], storeAddress1: store[2] ,storeAddress2: store[3],storeName: store[4], distance: store[5])
        return cell
    }
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }

    /*
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
