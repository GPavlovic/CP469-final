//
//  Goals_TableViewController.swift
//  quitSmoking
//


import UIKit

class Goals_TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var goals = Goals();
        add_stats();

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func add_stats(){
        
        Goals.newGoal("Sense of smell", p: 100, i: "Progress_0_2.png", s: 0)
        Goals.newGoal("Sense of taste", p: 100, i: "Progress_0_2.png", s: 0)
        Goals.newGoal("Shortness of breath", p: 100, i: "Progress_0_2.png", s: 0)
        Goals.newGoal("Another Thing", p: 100, i: "Progress_0_2.png", s: 0)
        
        Goals.newGoal("Lung capacity", p: 96, i: "Progress_0_2.png", s: 1)
        Goals.newGoal("Heart Attack", p: 72, i: "Progress_0_2.png", s: 1)
        Goals.newGoal("health", p: 70, i: "Progress_0_2.png", s: 1)
        Goals.newGoal("more things", p: 39, i: "Progress_0_2.png", s: 1)
        Goals.newGoal("here", p: 3, i: "Progress_0_2.png", s: 1)
        
        Goals.newGoal("cancer stuff", p: 2, i: "Progress_0_2.png", s: 2)
        Goals.newGoal("money stuff", p: 7, i: "Progress_0_2.png", s: 2)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        return Goals.getTotalGoals(section)
    }

    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
        
        var curr_stat = Goals.getGoal(indexPath.section, r: indexPath.row)
        
        var img = UIImage(named:curr_stat.image);
        cell.imageView?.image = img;
        

        cell.textLabel?.text = curr_stat.title
        
        cell.textLabel?.textColor = UIColor.whiteColor()

        return cell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("GoalHeader") as UITableViewCell
        
        if(section == 0){
            cell.textLabel?.text = "Completed Goals"
        }
        if(section == 1){
            cell.textLabel?.text = "Current Goals"
        }
        if(section == 2){
            cell.textLabel?.text = "Hidden Goals"
        }
        
        return cell
        
        
    }
    
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 25
        
    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
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
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
