
//  Date: Jan 28, 2015
//  Author: Travis Kellar
//

import UIKit


struct Goals{
    //static var max_goals = [0,0,0]; dont need, just use count
    static var open = [true,true]
    
    static var links: [String] = []
    static var completed_goals = [Stat]()
    static var current_goals = [Stat]()
    static var hidden_goals = [Stat]()
    static var interests = [String]()
    static var current:Int = 0
    static var imageLinks = ["Progress_0_2.png", "Progress_5.png","Progress_10.png", "Progress_15.png",
    "Progress_20.png","Progress_25.png", "Progress_30.png","Progress_35.png","Progress_40.png", "Progress_45.png","Progress_50.png","Progress_55.png","Progress_60.png","Progress_65.png", "Progress_70.png", "Progress_75.png", "Progress_80.png","Progress_85.png", "Progress_90.png",
    "Progress_95.png","Progress_100.png"]
    
    
    //init function
    //called when the class is initialized. It creates all of the cards and adds them to the deck

    
    //returns the current card in the deck
/*    static func card()->Stat{
        
        return Stat[current]
    }*/
    

    static func addLink(u:String){
        
        links.append(u)
        
    }
    static func getLink()->String{
        var link = ""
        println("NO LINK");
        if(links.count > 0){
            println("LINK")
            var i = Int(arc4random_uniform(UInt32(links.count)))
            link = links[i]
            links.removeAtIndex(i)
        }
        return link
    }
    static func addInterest(s:String){
        interests.append(s)
    }
    
    static func removeInterest(s:String){
        var i = 0;
        
        while(s != interests[i]){
            i++
        }
        interests.removeAtIndex(i)
    }
    
    static func checkInterest(s: String)->Bool{
        
        for(var i = 0; i < interests.count;i++){
            if(interests[i] == s){
                return true
                
            }
            
        }
        return false
        
    }
    
    
   static func newGoal(t:String, p:Int, s: Int){
        
        var p_round = 10 * Int(round(Double(p) / 5.0));
    var new_stat: Stat
    
    
        if(p_round >= 100){
            p_round = 100
            new_stat = Stat(title:"\(t)", percent:p_round, image:"Progress_\(p_round).png");
        }
        else{
        
            new_stat = Stat(title:"\(t)", percent:p, image:"Progress_\(p_round).png");
        }
    
        if(s == 0){
            Goals.current_goals.append(new_stat)
            
        }
        if(s == 1){
            Goals.completed_goals.append(new_stat)
        }
        if(s == 2){
            Goals.hidden_goals.append(new_stat)
        }
        
        
    }
    
    init(){
        
        if(Goals.current_goals.count == 0 && Goals.completed_goals.count == 0){
     
       
            //20 minutes
            //Your blood pressure, pulse rate, and body temperature will drop to normal
            //http://www.huffingtonpost.co.uk/2014/10/06/stoptober-stop-smoking-affects-body_n_3960096.html
           
            Goals.newGoal("Blood Pressure", p: 0, s: 0)
            Goals.newGoal("Pulse Rate", p: 0, s: 0)
            Goals.newGoal("Body Temperature", p: 0, s: 0)
            
            //8 hours
            //Smoker's Breath Dissapears, carbon monoxide level in your blood drops, oxygen level rises to normal
            //same source
            Goals.newGoal("Smoker's Breath", p: 0, s: 0)
            Goals.newGoal("Carbon Monoxide", p: 0, s: 0)
            Goals.newGoal("Oxygen Levels", p: 0, s: 0)
            
            //24 hours
            //Within 24 hours you chance of heart attack decreases
            
            Goals.newGoal("Chance of Heart Attack", p: 0, s: 0)
            
            
            //48 hours
            // Within 48 hours your nerve endings start to regroup, ability to tase and smell improves
            Goals.newGoal("Nerve Endings", p: 0, s: 0)
            Goals.newGoal("Improved Taste", p: 0, s: 0)
            Goals.newGoal("Improved Smell", p: 0, s: 0)
            
            //3 days
            //Within 3 days breathing is easier. Can run without wheezing
            Goals.newGoal("Improved Breathing", p: 0, s: 0)
            
            //2 months
            //Your circulation improves, lung capacity increses up to 30%
            Goals.newGoal("Improved Circulation", p: 0, s: 0)
            Goals.newGoal("Lung Capacity", p: 0, s: 0)
            
            Goals.newGoal("Improved Circulation", p: 0, s: 0)
            Goals.newGoal("Lung Capacity", p: 0, s: 0)
            
            //1 year
            //i.imgur.com/pZmcx.gif
            Goals.newGoal("50% Less Chance of Heart Attack", p: 0, s: 0)
            
            //5 years
            Goals.newGoal("Stroke Risk of Non-Smoker", p: 0, s: 0)
            
            
            //10 years
            Goals.newGoal("Lung Cancer Risk of Non-Smoker", p: 0, s: 0)
            
            //15 years
            Goals.newGoal("Heart Attack Risk of Non-Smoker", p: 0, s: 0)
            //Goals.newGoal("money stuff", p: 0, s: 0)
            //Goals.newGoal("money stuff", p: 0, s: 0)
        }
        
    }
    
    
    static func changeOpen(i: Int){
        
        if(open[i] == true){
            open[i] = false
        }
        else{
            open[i] = true
        }
        
    }
    static func checkOpen(i : Int)->Bool{
        
        return open[i]
    }
    
    static func getGoal(s:Int,r: Int)->Stat{
        
        if(s == 0){
            return Goals.current_goals[r]
        }
        else if(s == 1){
            return Goals.completed_goals[r]
        }
        else{
            return Goals.hidden_goals[r]
        }
        
        
    }
    static func getTotalGoals(s: Int)->Int{
        var count = 0
        if(s == 0){
            count = current_goals.count
        }
        else if(s == 1){
            count = completed_goals.count
        }
        
        return count;
        
        
        
    }

    static func updateGoals(min:Int, hour: Int, day: Int, ppd: Int, saved: Double){
        
        var complete = [Int]()
        
        for (var i = 0; i < current_goals.count;i++){
            
            var p = 0.0;
            
            if((current_goals[i].title == "Blood Pressure") || (current_goals[i].title == "Pulse Rate")||(current_goals[i].title == "Body Temperature")){
                
                p = Double(min)/20.0
                
            }
            
            else if((current_goals[i].title == "Smoker's Breath") || (current_goals[i].title == "Carbon Monoxide")||(current_goals[i].title == "Oxygen Levels")){
                
                p = Double(min)/480.0

            }
            
            else if((current_goals[i].title == "Chance of Heart Attack")){
                
                p = Double(min)/1440.0
                
                
            }
            else if((current_goals[i].title == "Nerve Endings") || (current_goals[i].title == "Improved Taste")||(current_goals[i].title == "Improved Smell")){
                
                p = Double(min)/2880.0
                
            }
            else if((current_goals[i].title == "Improved Breathing")){
                
                p = Double(min)/4320.0
                
                
            }
            else if((current_goals[i].title == "Improved Circulation") || (current_goals[i].title == "Lung Capacity")){
                
                p = Double(day)/60.0
                
            }
            else if((current_goals[i].title == "50% Less Chance of Heart Attack")){
                
                p = Double(day)/365.0
                
                
            }
            else if((current_goals[i].title == "Stroke Risk of Non-Smoker")){
                
                p = Double(day)/1825.0
                
                
            }
            else if((current_goals[i].title == "Lung Cancer Risk of Non-Smoker")){
                
                p = Double(day)/3650.0
                
                
            }
            else if((current_goals[i].title == "Heart Attack Risk of Non-Smoker")){
                
                p = Double(day)/5475.0
                
                
            }
            
            
            
            
            
            
            
            println("Percent: \(Int(p*100))")
            current_goals[i].percent = Int(100*p)
            
            var p_round = 10 * Int(round((p*100) / 10.0));
            println("Round: \(p_round)")
            current_goals[i].image = "Progress_\(String(p_round)).png"
            
            if(Int(p*100) >= 100){
                
                complete.append(i)
                Goals.newGoal(current_goals[i].title, p: Int(p*100), s: 1)
            }
            
            
        }
        
        
        
        for(var i = 0; i < complete.count;i++){
            current_goals.removeAtIndex(complete[i]-i)
            
        }
        
        
        
    }
}
