//
//  ViewController.swift
//  RetailStore
//
//  Created by Sangeeth on 17/11/14.
//  Copyright (c) 2014 Sangeeth. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIActionSheetDelegate {
   let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func StoreLayout(sender: AnyObject) {
        if(appDelegate.storeSelected == true)
        {
            self.performSegueWithIdentifier("floor", sender: nil);
        }
        else
        {
        
        }
        
    }
    @IBAction func newPlanClicked(sender: AnyObject) {
        appDelegate.gobyselected = false;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func gobyStoreClicked(sender: AnyObject) {
        appDelegate.gobyselected = true;
        performSegueWithIdentifier("store", sender: nil);
        
    }

    @IBAction func loadStoreClicked(sender: AnyObject) {
        if(appDelegate.saveName1 != "" && appDelegate.saveName2 == "no")
        {
            var action:UIActionSheet = UIActionSheet(title: "Select Saved", delegate: self, cancelButtonTitle: "cancel", destructiveButtonTitle: nil, otherButtonTitles:appDelegate.saveName1 );
            action.showInView(self.view);
            
        }
        else if(appDelegate.saveName1 != "" && appDelegate.saveName1 != "no")
        {
            
            var action:UIActionSheet = UIActionSheet(title: "Select Saved", delegate: self, cancelButtonTitle: "cancel", destructiveButtonTitle: nil, otherButtonTitles:appDelegate.saveName1 ,appDelegate.saveName2);
            action.showInView(self.view);

        }
        else
        {
            var loadErrorAlertView = UIAlertView(title: "No Plans!", message: "Please create a plan.", delegate: self, cancelButtonTitle: "OK")
                loadErrorAlertView.show();
        }
        
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int)
    {
        if(buttonIndex == 1)
        {
            appDelegate.selected = "1";
            performSegueWithIdentifier("PlanDetails", sender: nil);
            
        }
        else if(buttonIndex == 2)
        {
            appDelegate.selected = "2";
            performSegueWithIdentifier("PlanDetails", sender: nil)
            
        }
    }
    


}

