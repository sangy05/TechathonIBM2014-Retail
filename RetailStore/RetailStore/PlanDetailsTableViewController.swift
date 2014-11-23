//
//  PlanDetailsTableViewController.swift
//  RetailStore
//
//  Created by Sangeeth on 18/11/14.
//  Copyright (c) 2014 Sangeeth. All rights reserved.
//

import UIKit
import CoreData

class PlanDetailsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate,NSFetchedResultsControllerDelegate {

    var tableData : Array<String> = Array()
    
    @IBOutlet weak var planName: UITextField!
    @IBOutlet weak var checkAvailabilityButton: UIButton!
    @IBOutlet weak var savePlanButton: UIButton!
     let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
    let  managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    @IBOutlet weak var itemsTableView: UITableView!
    @IBOutlet weak var addItemsTextField: UITextField!
     
    
    
    @IBAction func addItemsButton(sender: AnyObject) {
        checkAvailabilityButton.hidden = false
        savePlanButton.hidden = false
        tableData.append(addItemsTextField.text)
        addItemsTextField.text = "";
        itemsTableView.reloadData()
    }
    
    
    @IBAction func savePlanButton(sender: AnyObject)
    {
        if(appDelegate.saveCount == 0)
        {
            appDelegate.saveName1 = planName.text;
            appDelegate.itemArray1 = tableData;
            appDelegate.saveCount++;
        }
        else
        {
             appDelegate.itemArray2 = tableData;
            appDelegate.saveName2 = planName.text;
        }
        
        
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    
    @IBAction func checkAvailabilityButton(sender: AnyObject) {
        
        var url = NSURL(string: "http://techathonsangeethibmapi.mybluemix.net/StoreQuery");
        var data:NSData = NSData(contentsOfURL: url);
        appDelegate.serverAvailabilityString = NSString(data: data, encoding: NSASCIIStringEncoding);
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(appDelegate.saveName1 == "")
        {
            savePlanButton.hidden = true;
            checkAvailabilityButton.hidden = true;
        }
       
        if(appDelegate.selected == "1")
        {
            tableData.removeAll(keepCapacity: true);
            tableData = appDelegate.itemArray1;
            self.planName.text = appDelegate.saveName1;
            self.itemsTableView.reloadData();
        }
        else if(appDelegate.selected == "2")
        {
            tableData.removeAll(keepCapacity: true);
            tableData = appDelegate.itemArray2;
            self.planName.text = appDelegate.saveName2;
            self.itemsTableView.reloadData();
        }
        else
        {
             tableData.removeAll(keepCapacity: true);
             self.itemsTableView.reloadData();
        }

        
    }
    override func  viewWillAppear(animated: Bool) {
        
        if(appDelegate.selected == "0")
        {
          tableData.removeAll(keepCapacity: true);
        self.itemsTableView.reloadData();
    
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel?.text = (tableData[indexPath.row] as String)
        return cell
    }
    
     func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
     {
        return true
    }
    // Override to support editing the table view.
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        println(tableData)
        if editingStyle == .Delete {
            // Delete the row from the data source
            println(indexPath.row)
            tableData.removeAtIndex(indexPath.row)
            println(tableData)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

        }
    else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
         tableView.reloadData()
    }
    

}
