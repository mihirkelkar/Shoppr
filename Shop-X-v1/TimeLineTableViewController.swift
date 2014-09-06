//
//  TimeLineTableViewController.swift
//  Shop-X-v1
//
//  Created by Mihir Kelkar on 9/6/14.
//  Copyright (c) 2014 Mihir Kelkar. All rights reserved.
//

import UIKit

class TimeLineTableViewController: UITableViewController {
    var timelinedata: NSMutableArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    // STEP 2. Afer you have butil the entire thing in the story board and then added it onto the Two new coca touch classes you created, go ahead and write this to help you with definifg the custom table view cell. 
    init(coder aDecoder: NSCoder!) {
      super.init(coder: aDecoder)
    }
    
    override func viewDidAppear(animated: Bool) {
      self.loaddata()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //The following function fetches all the data from the parse code.
    func loaddata(){
        //Removing all objects.
        timelinedata.removeAllObjects()
        var findtimelinedata:PFQuery = PFQuery(className: "deal")
        findtimelinedata.findObjectsInBackgroundWithBlock{
            (objects: [AnyObject]!, error:NSError!) -> Void in
            if !error{
                //Making sure that you are forcing the Array type to unwrap is pivotal.
                for object:PFObject! in objects as [PFObject!]{
                  self.timelinedata.addObject(object)
                }
            }
            //Now sorting in reverse order to bring the latest on top
            let array:NSArray = self.timelinedata.reverseObjectEnumerator().allObjects
            self.timelinedata = array as NSMutableArray
            self.tableView.reloadData()
        }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return timelinedata.count
    }

    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: dealTableViewCell = tableView!.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath!) as dealTableViewCell
        println(indexPath.row)
        var deal:PFObject = (self.timelinedata.objectAtIndex(indexPath!.row)) as PFObject
         //Configure the cell...
        cell.storeName.text = deal.objectForKey("storename") as String
        cell.timeStamp.text = deal.objectForKey("zip") as String
        cell.desc.text = deal.objectForKey("desc") as String
        //println(indexPath.row)
        var temp = ""
        for ii in ["cloth", "food", "elec", "grocery", "health", "other"]{
            if deal.objectForKey(ii) as String == "true"{
                temp += ii
                temp += " "
            }
        }
        cell.tagName.text = temp
        return cell
        
    }
    

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
