//
//  FlashCards.swift
//  flashcards
//
//  Created by iD Student on 7/18/17.
//  Copyright © 2017 iD Blair. All rights reserved.
//

import Foundation
import GameKit

class Flashcard {
    var question : String
    
    var options : [String]
    var correctAnswer : String
    
    init (_ question1 : String, _ options1 : [String] ) {
        self.question = question1
        self.options = options1
        
        self.correctAnswer = options [1]
        
        //shuffles the list of options/answers//
        self.options = shuffle (list: options1)
        
    }
}


class CardCollection {
    
    //single instance of the card collection. card collectio represemnts the same cards that were using over and over again. If i want to access it i will use CardCollection.instance and if i add an extention like .currentIndex then i can access that too//
    public static var instance : CardCollection = CardCollection ()
    
    public private (set) var cards : [Flashcard]     //this means anyone can access but only I can set the cards.. same with next few lines//
    
    public private (set) var currentIndex : Int
    var score = 0
    
    
    public var currentCard : Flashcard {
        get { return cards [ currentIndex ] }  // this means that class CardCollection can return a flashcard from the array of "cards" (see below) based on the current index which determines which card to return. A current index of 0 will give you the first card and 4 would be the last
    }
    
    private init () {
        //look up at the class flashcard. Notice before i had it like Flashcard (question1:"__________"), options: ["___" "___"] but now because i added the underscore it assumes the question1 and options1 part of the flashcard and i don't have to type that. I will leave one old fashioned one with those extra writings as a comment for rederence.//
        
        cards = [ //array of cards//
            Flashcard("What day is it today?", ["Monday", "Tuesday", "4.764"]),
            Flashcard ("How are you", ["good", "bad"]),
            Flashcard ("What's the capital of the Washington State?", ["Olympia", "Tacoma", "seattle", "Spokane"]),
            Flashcard ("Where is iD Tech's headquarters?",["Campbell, CA", "Alberque, NM", "Beijing, CN" ]),
            Flashcard ("How old ar eyou", ["16", "15", "14", "13"]),
            Flashcard ("Are you alive or dead?", ["Alive", "Dead"]),
            Flashcard ("How many fingers amI holding up?", ["1", "2", "3", "4", "5"]),
            Flashcard ("Have you eaten today?", ["yes", "NO"]),
            Flashcard ("Water or milk?", ["Milk", "Water"]),
            Flashcard ("Whats better?:", ["Canada", "America", "Pakistan"])
            
           // Flashcard (question1: "How old ar ey", options1: ["16", "15", "14", "13"])//
        ]
    
        currentIndex = 0;
        
        cards = shuffle (list : cards)
        //this shuffles the cards//
    }
        
    public func nextQuestion () {
        currentIndex += 1    //this increases the currentIndex by 1 so you can move forward //
        if (currentIndex >= cards.count) {
            currentIndex = 0
                score = 0
                //
            //
            //
            //
            //
            //
            //
            //
            //
            //
            //
                cards = shuffle (list:cards)
        }
            currentCard.options = shuffle( list: currentCard.options)

    }
    
    public func checkAnswer (_ selectedAnswer : Int) -> Bool {
        
        let isCorrect = currentCard.options [ selectedAnswer ] == currentCard.correctAnswer
        if isCorrect == true {
            score += 1
        }
        return isCorrect
    }
    
    

}

//now we are going to do the view controller. this is takes informaiton and displays it from the CardCollection class//

//below is shuffling code//
func shuffle <T> (list: [T]) -> [T] {
//T specifies a generic variable type for the function. This shuffle function will take a list of any <T> variable "T"ype and return that list shuffled
    return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: list) as! [T]
//Random source is a swiftrandom number generator kit. the arrayByShufflignObjects is used to shuffle arrays. It returns these obhects in a list because it doesn't know what the objects the=y were. As! means to treat the list as the variable Type of <T>//



}




