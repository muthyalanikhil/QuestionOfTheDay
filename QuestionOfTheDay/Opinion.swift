//
//  Opinion.swift
//  QuestionOfTheDay
//
//  Created by Muthyala,Nikhil on 11/7/17.
//

import Foundation

@objcMembers class Opinion: NSObject {
    var answer: Int = 0
    var objectId: String?
    
    override init(){
        super.init()
    }

    init(answer:Int) {
        self.answer = answer
    }
}
