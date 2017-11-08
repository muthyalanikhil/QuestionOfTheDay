//
//  Statistician.swift
//  QuestionOfTheDay
//
//  Created by Muthyala,Nikhil on 11/7/17.
//

import Foundation

class Statistician: NSObject {
    
    let APPLICATION_ID = "D75BAB9C-1DF9-FDF2-FFEA-2FF56F0A7A00"
    let API_KEY = "6F94E815-603F-7566-FF04-E943BC308200"
    let SERVER_URL = "https://api.backendless.com"
    let backendless = Backendless.sharedInstance()!
    var dataStoreQuestionOfTheDay: IDataStore!
    var dataStoreOpinion: IDataStore!
    
    func findPercentage() -> [Double] {
        let opinionArray:[Opinion] = GetAllOpinions()
        var answer0:Double = 0.0
        var answer1:Double = 0.0
        var answer2:Double = 0.0
        var opinionPercentage:[Double] = []
        for item in opinionArray{
            if item.answer == 0{
                answer0 = answer0 + 1
            }
            if item.answer == 1{
                answer1 = answer1 + 1
            }
            if item.answer == 2{
                answer2 = answer2 + 1
            }
        }
        opinionPercentage.append(Double(answer0/Double(opinionArray.count))*100.0)
        opinionPercentage.append(Double(answer1/Double(opinionArray.count))*100.0)
        opinionPercentage.append(Double(answer2/Double(opinionArray.count))*100.0)
        return opinionPercentage
    }

    func  fetchQuestionOfTheDay() ->QuestionOfTheDay {
        dataStoreQuestionOfTheDay = backendless.data.of(QuestionOfTheDay.ofClass())
        let questionFromDB = dataStoreQuestionOfTheDay.find(byId: "08798A8B-78B7-259E-FF6F-B2426908B000") as! QuestionOfTheDay
        return questionFromDB
    }
    
    func saveOpinion(Opinion: Opinion) {
        dataStoreOpinion = backendless.data.of(Opinion.ofClass())
        _ = dataStoreOpinion?.save(Opinion) as! Opinion
    }
    
    func GetAllOpinions() ->[Opinion]{
        dataStoreOpinion = backendless.data.of(Opinion.ofClass())
        let totalOpinionCount = dataStoreOpinion?.getObjectCount() as! Int
        let pageSize = 10
        let queryBuilder = DataQueryBuilder()
        var opinionsPulled = 0
        var opinionArray:[Opinion] = []
        queryBuilder!.setPageSize(Int32(pageSize)).setOffset(0)
        
        while opinionsPulled < totalOpinionCount {
            let Opinion = self.dataStoreOpinion?.find(queryBuilder) as! [Opinion]
            opinionArray += Opinion
            opinionsPulled += Opinion.count
            queryBuilder!.prepareNextPage()
        }
        return opinionArray
    }
    
    override init(){
        backendless.hostURL = SERVER_URL
        backendless.initApp(APPLICATION_ID, apiKey: API_KEY)
    }
}
