//
//  MoreDetailsViewController.swift
//  RetailStore
//
//  Created by Greeshma Arunkumar on 22/11/14.
//  Copyright (c) 2014 Sangeeth. All rights reserved.
//

import UIKit

class MoreDetailsViewController: UIViewController {

    
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeAddress: UILabel!
    @IBOutlet weak var storeAddress1: UILabel!
    @IBOutlet weak var storeAddress2: UILabel!
    @IBOutlet weak var distance: UILabel!

    @IBAction func backButtonClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func storeDisplay(){
        storeName.text = "Reliance Retail Store"
        storeAddress.text = "Hennur Bagadhur Road"
        storeAddress1.text = "Hennur Cross"
        storeAddress2.text = "Bangalore"
        distance.text = "1.2 Km from your location"
        
        
    }
    
    
    var stores = [["85.2%", "Hennur Bagadhur Road","Hennur Cross","Bangalore","Reliance Retail Store","1.2 Km"],["70.8%","Phoenix Market City","Near ITPL","Bangalore","Big Bazaar","2.5 Km"],["67.5%","Outer Ring Road","Mahadevapura","Bangalore","More Megastore","3.8 Km"],["62.3%","Hennur Bagadhur Road","Hennur Cross","Bangalore","Walmart","4.1 Km"],["50.2%","Hennur Bagadhur Road","Hennur Cross","Bangalore","Spar Hypermarket","4.5 Km"]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeDisplay()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
