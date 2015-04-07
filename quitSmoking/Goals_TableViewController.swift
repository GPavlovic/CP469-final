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
        //self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0);
        self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0);

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func add_stats(){
        
        Goals.newGoal("Sense of smell", p: 100, s: 1)
        Goals.newGoal("Sense of taste", p: 100, s: 1)
        Goals.newGoal("Shortness of breath", p: 100, s: 1)
        Goals.newGoal("Another Thing", p: 100, s: 1)
        
        Goals.newGoal("Lung capacity", p: 96, s: 0)
        Goals.newGoal("Heart Attack", p: 72, s: 0)
        Goals.newGoal("health", p: 70, s: 0)
        Goals.newGoal("more things", p: 39, s: 0)
        Goals.newGoal("here", p: 3, s: 0)
        Goals.newGoal("cancer stuff", p: 2, s: 0)
        Goals.newGoal("money stuff", p: 7, s: 0)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
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
        

        cell.textLabel?.text = "\(curr_stat.percent)% \(curr_stat.title)"
        
        
        cell.textLabel?.textColor = UIColor.whiteColor()

        return cell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("GoalHeader") as UITableViewCell
        
        
        if(section == 0){
            cell.textLabel?.text = "Current Goals"
        }
        
        if(section == 1){
            cell.textLabel?.text = "Completed Goals"
        }

        
        return cell
        
        
    }
    
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 25
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //CODE TO BE RUN ON CELL TOUCH
        
        println("Hello")
        println(indexPath.section)
        println(indexPath.row)
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
