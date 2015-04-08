//
//  Goals_TableViewController.swift
//  quitSmoking
//


import UIKit

class Goals_TableViewController: UITableViewController, UITableViewDataSource {


    @IBOutlet var Table: UITableView!
    
    let colours = Colours()
    func refresh() {
        view.backgroundColor = UIColor.clearColor()
        var backgroundLayer = colours.gl
        backgroundLayer.frame = view.frame
        backgroundLayer.frame.inset(dx: 0, dy: -50)
        view.layer.insertSublayer(backgroundLayer, atIndex: 0)
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        refresh();
        var goals = Goals();
        add_stats();
        //self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0);
        self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 50.0, 0.0);

        
        

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
        
        
        var rows = 0;
        
        if(Goals.checkOpen(section) == true){
           rows = Goals.getTotalGoals(section)
            
        }
        else{
            rows = 0
        }
        
        
        
        return rows
    }

    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as Standard
        
        
        
        var curr_stat = Goals.getGoal(indexPath.section, r: indexPath.row)

        cell.d?.text = "\(curr_stat.title)".uppercaseString
        cell.p?.text = "\(curr_stat.percent)% "
        
        var img = UIImage(named:curr_stat.image);
        cell.stand_image?.image = img;
       

        cell.d?.sizeToFit()
        
        //cell.d?.adjustsFontSizeToFitWidth = true
        
       // cell.d?.textColor = UIColor.grayColor()
        cell.p?.textColor = UIColor.whiteColor()
        

        return cell
    }
    
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("GoalHeader") as HeaderCells
        
        
        if(section == 0){
            cell.sectionLabel?.text = "Current Goals"
            
        }
        
        else if(section == 1){
            cell.sectionLabel?.text = "Completed Goals"
            
        }
        
        if(Goals.checkOpen(section) == true){
            cell.closeButton?.setTitle("-", forState: UIControlState.Normal)}
        else{
            cell.closeButton?.setTitle("+", forState: UIControlState.Normal)
        }

        
        return cell
        
        
    }
    
    
    @IBAction func buttonPressed_2(sender: AnyObject) {
            println("here")
        

    
        Table.reloadData()
        
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
    
}
