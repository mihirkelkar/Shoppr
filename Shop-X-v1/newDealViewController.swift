//
//  newDealViewController.swift
//  Shop-X-v1
//
//  Created by Mihir Kelkar on 9/6/14.
//  Copyright (c) 2014 Mihir Kelkar. All rights reserved.
//

import UIKit

class newDealViewController: UIViewController {

    @IBOutlet weak var storeName: UITextField!
    @IBOutlet weak var dealDesc: UITextView!
    @IBOutlet weak var zipCode: UITextField!
    
    
    @IBOutlet weak var foodSwitch: UISwitch!
    @IBOutlet weak var healthSwitch: UISwitch!
    @IBOutlet weak var clothSwitch: UISwitch!
    @IBOutlet weak var grocerySwitch: UISwitch!
    @IBOutlet weak var electronicSwitch: UISwitch!
    @IBOutlet weak var other: UISwitch!
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dealDesc.layer.borderColor = UIColor.blackColor().CGColor
        dealDesc.layer.borderWidth = 0.5
        dealDesc.layer.cornerRadius = 5
        storeName.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sendDeal(sender: AnyObject) {
        var storeNameAbsent = 0
        var zipcodeAbsent = 0
        if(storeName.text == "" || storeName.text == " "){
            storeName.text = "Enter a Store Name"
            storeName.textColor = UIColor.redColor()
            storeNameAbsent = 1
        }
        if(zipCode.text == "" || zipCode.text == " "){
            zipCode.text = "Enter a ZIP"
            zipCode.textColor = UIColor.redColor()
            zipcodeAbsent = 1
        }
        var true_val = 0
        for ii in [foodSwitch, healthSwitch, clothSwitch, grocerySwitch, electronicSwitch]{
            if(ii.on == true){
              true_val = 1
            }
        }
        if(true_val == 0){
          other.setOn(true, animated: false)
        }
        //Which is making sure that Zipcode is not absent and store name is not absent
        if(zipcodeAbsent == 0 && storeNameAbsent == 0){
            var deal: PFObject = PFObject(className: "deal")
            deal["storename"] = storeName.text
            deal["zip"] = zipCode.text
            deal["desc"] = dealDesc.text
            if(foodSwitch.on){
              deal["food"] = "true"
            }
            else{
              deal["food"] = "false"
            }
            if(clothSwitch.on){
              deal["cloth"] = "true"
            }
            else{
              deal["cloth"] = "false"
            }
            
            if(healthSwitch.on){
                deal["health"] = "true"
            }
            else{
                deal["health"] = "false"
            }
            if(grocerySwitch.on){
                deal["grocery"] = "true"
            }
            else{
                deal["grocery"] = "false"
            }
            if(electronicSwitch.on){
                deal["elec"] = "true"
            }
            else{
                deal["elec"] = "false"
            }
            if(other.on){
                deal["other"] = "true"
            }
            else{
                deal["other"] = "false"
            }
            deal.saveInBackground()
            //When you eventually go ahead and add a login system. Make sure that PFUser Column is added here to the Correct Value
            //Also we will then change the object initialized to something else. 
            self.navigationController.popToRootViewControllerAnimated(true)
        }
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
