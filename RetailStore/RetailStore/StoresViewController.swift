//
//  StoresViewController.swift
//  RetailStore
//
//  Created by Sangeeth on 19/11/14.
//  Copyright (c) 2014 Sangeeth. All rights reserved.
//

import UIKit

class StoresViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,UIActionSheetDelegate {
    
  let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
    var selectedIndex = 0;
        

    @IBOutlet weak var storesTable: UITableView!
    @IBAction func moreDetailsButton(sender: AnyObject) {
      
        
        
    }
    var storeAvailibility : Array<String> = Array();
    
    var store1 = ["Milk","Bread","Butter"]
    var store2 = ["Jam","Soap"]
    var store3 = ["Rice","Wheat"]
    var storeArray:NSDictionary = ["store1":["Milk","Bread","Butter"],"store2":["Jam","Soap"],"store3":["Rice","Wheat"]]
    
    func checkAvailability(tableData:NSArray)
    {
        var i = 0
        var count = [0,0,0]
        for item in tableData
        {
            var store:Array = store1
            for product in store
            {
                if(product == item as String)
                {
                    count[0] = count[0] + 1
                    break;
                }
            }
            store = store2
            for product in store
            {
                if(product == item as String)
                {
                    count[1] = count[1] + 1
                    break;
                }
            }
            store = store3
            for product in store
            {
                if(product == item as String)
                {
                    count[2] = count[2] + 1
                    break;
                }
            }
        }
        count[0] = (count[0]/tableData.count)
        println(count)
    }
    var stores = [["85.2%", "Hennur Bagadhur Road","Hennur Cross","Bangalore","Reliance Retail Store","1.2 Km"],["70.8%","Phoenix Market City","Near ITPL","Bangalore","Big Bazaar","2.5 Km"],["67.5%","Outer Ring Road","Mahadevapura","Bangalore","More Megastore","3.8 Km"],["62.3%","Hennur Bagadhur Road","Hennur Cross","Bangalore","Walmart","4.1 Km"],["50.2%","Hennur Bagadhur Road","Hennur Cross","Bangalore","Spar Hypermarket","4.5 Km"]]
    //test.setCell(" ", storeAddress: " ", storeName: " ", distance: " ")
    //stores.append("","","")
    func tableView(tableView:UITableView, numberOfRowsInSection section: Int) ->Int
    {
        if(appDelegate.storeItemSelected == true)
        {
            return 1;
        }
        else
        {
        return stores.count;
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: CustomTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as CustomTableViewCell
       
        if(appDelegate.gobyselected == true && appDelegate.storeItemSelected == false)
        {
             let store = stores[indexPath.row]
             cell.setCell(store[0], storeAddress: store[1], storeAddress1: store[2] ,storeAddress2: store[3],storeName: store[4], distance: store[5])
        }
        else if(appDelegate.gobyselected == true && appDelegate.storeItemSelected == true)
        {
            let store = stores[selectedIndex]
            cell.setCell(store[0], storeAddress: store[1], storeAddress1: store[2] ,storeAddress2: store[3],storeName: store[4], distance: store[5])
        }
        else if(appDelegate.gobyselected == false && appDelegate.storeItemSelected == false)
        {
            let store = stores[indexPath.row]
        cell.setCell(storeAvailibility[indexPath.row]+"%", storeAddress: store[1], storeAddress1: store[2] ,storeAddress2: store[3],storeName: store[4], distance: store[5])
        }
        return cell
    }
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       

        self.storesTable.delegate = self
        self.storesTable.dataSource = self
        // Do any additional setup after loading the view.
        checkAvailability(["Jam","Milk"])
     storeAvailibility  = appDelegate.serverAvailabilityString.componentsSeparatedByString("#");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        println("index :\(indexPath.row)")
    
        if(appDelegate.saveName1 != "" && appDelegate.saveName2 == "no" && appDelegate.storeItemSelected == false)
        {
            var action:UIActionSheet = UIActionSheet(title: "Select Saved", delegate: self, cancelButtonTitle: "cancel", destructiveButtonTitle: nil, otherButtonTitles:appDelegate.saveName1 );
            action.tag = 0;
            action.showInView(self.view);
            selectedIndex = (indexPath.row);
            
        }
        else if(appDelegate.saveName1 != "" && appDelegate.saveName2 != "no" && appDelegate.storeItemSelected == false)
        {
            var action:UIActionSheet = UIActionSheet(title: "Select Saved", delegate: self, cancelButtonTitle: "cancel", destructiveButtonTitle: nil, otherButtonTitles:appDelegate.saveName1 ,appDelegate.saveName2);
            action.tag = 1;
            action.showInView(self.view);
            selectedIndex = (indexPath.row);
            
        }
        else if(appDelegate.storeItemSelected == true || appDelegate.gobyselected == false)
        {
        var action:UIActionSheet = UIActionSheet(title: "Select Store confirmation", delegate: self, cancelButtonTitle: "cancel", destructiveButtonTitle: nil, otherButtonTitles:"confirm" );
            action.tag = 2;
            action.showInView(self.view);
        }
        
}

func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int)
{
    if(actionSheet.tag == 0 || actionSheet.tag == 1)
    {
         appDelegate.storeItemSelected = true;
        self.storesTable.reloadData();
       
        
        
    }
    else if(actionSheet.tag == 2)
    {
   
        var alert:UIAlertView = UIAlertView(title: "Confirmed", message: "Thanks for Choosig the store.Go to Home->FloorLayout to see the layout!!", delegate: self, cancelButtonTitle:nil,otherButtonTitles:"ok");
       
        appDelegate.storeSelected =  true;
        alert.show();
    
    }
}
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int)
    {
        self.performSegueWithIdentifier("Home", sender: nil);
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
