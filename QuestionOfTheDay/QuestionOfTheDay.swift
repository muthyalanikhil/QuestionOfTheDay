//
//  QuestionOfTheDay.swift
//  QuestionOfTheDay
//
//  Created by Muthyala,Nikhil on 11/7/17.
//

import Foundation

@objcMembers class QuestionOfTheDay: NSObject {
    
    var question:String?
    var answer0:String?
    var answer1:String?
    var answer2:String?
    
    var objectId:String?
    var created:NSDate?
    var updated:NSDate?
    
    convenience override init(){
        self.init(question: "When did you sleep last night?", answer0: "1am",answer1: "11pm", answer2: "did not sleep")
    }
    
    init(question:String, answer0:String, answer1: String, answer2: String){
        self.question = question
        self.answer0 = answer0
        self.answer1 = answer1
        self.answer2 = answer2
    }
}
