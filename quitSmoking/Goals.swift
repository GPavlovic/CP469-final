//
//  Title: Deck.swift
//  Date: Jan 28, 2015
//  Author: Travis Kellar
//

import UIKit


struct Goals{
    static var max_goals = [0,0,0];
    static var completed_goals = [Stat]()
    static var current_goals = [Stat]()
    static var hidden_goals = [Stat]()
    static var current:Int = 0
    static var imageLinks = ["Progress_0_2.png", "Progress_5.png","Progress_10.png", "Progress_15.png",
    "Progress_20.png","Progress_25.png", "Progress_30.png","Progress_35.png","Progress_40.png", "Progress_45.png","Progress_50.png","Progress_55.png","Progress_60.png","Progress_65.png", "Progress_70.png", "Progress_75.png", "Progress_80.png","Progress_85.png", "Progress_90.png",
    "Progress_95.png","Progress_100.png"]
    
    
    //init function
    //called when the class is initialized. It creates all of the cards and adds them to the deck
    init(){
        
        
    }
    
    //returns the current card in the deck
/*    static func card()->Stat{
        
        return Stat[current]
    }*/
    

    
    
    static func newGoal(t:String, p:Int, s: Int){
        
        var p_round = p/5;
        println("\(p) turns into \(p_round)");
        
        var i = imageLinks[p_round]
        
        
        let new_stat = Stat(title:"\(t)", percent:p, image:"\(i)");
        
        if(s == 0){
            Goals.current_goals.append(new_stat)
            
        }
        if(s == 1){
            Goals.completed_goals.append(new_stat)
        }
        if(s == 2){
            Goals.hidden_goals.append(new_stat)
        }
        max_goals[s]++
        
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
        
        return max_goals[s];
        
        
        
    }
    

}
