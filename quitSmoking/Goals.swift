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
    
    
    //init function
    //called when the class is initialized. It creates all of the cards and adds them to the deck
    init(){
        
        
    }
    
    //returns the current card in the deck
/*    static func card()->Stat{
        
        return Stat[current]
    }*/
    
    
    
    static func newGoal(t:String, p:Int, i:String, s: Int){

        let new_stat = Stat(title:"\(t)", percent:p, image:"\(i)");
        
        if(s == 0){
            Goals.completed_goals.append(new_stat)
            
        }
        if(s == 1){
            Goals.current_goals.append(new_stat)
        }
        if(s == 2){
            Goals.hidden_goals.append(new_stat)
        }
        max_goals[s]++
        
    }
    
    
    
    static func getGoal(s:Int,r: Int)->Stat{
        
        if(s == 0){
            return Goals.completed_goals[r]
        }
        else if(s == 1){
            return Goals.current_goals[r]
        }
        else{
            return Goals.hidden_goals[r]
        }
        
        
    }
    static func getTotalGoals(s: Int)->Int{
        
        return max_goals[s];
        
        
        
    }

}
