//
//  StatisticsViewController.swift
//  QuestionOfTheDay
//
//  Created by Muthyala,Nikhil on 11/7/17.
//

import UIKit

class StatisticsViewController: UIViewController {

    let statisticsObject:Statistician = Statistician()
    var opinionArray:[Opinion] = []
    
    @IBOutlet weak var QuestionLBL: UILabel!
    @IBOutlet weak var AnswerALBL: UILabel!
    @IBOutlet weak var AnswerBLBL: UILabel!
    @IBOutlet weak var AnswerCLBL: UILabel!
    @IBOutlet weak var AnswerAPercent: UILabel!
    @IBOutlet weak var AnswerBPercent: UILabel!
    @IBOutlet weak var AnswerCPercent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var answer:[Double] = statisticsObject.findPercentage()
        
        //getting percentages
        AnswerAPercent.text = String(format: "%.2f%%",answer[0])
        AnswerBPercent.text = String(format: "%.2f%%",answer[1])
        AnswerCPercent.text = String(format: "%.2f%%",answer[2])
        
        //updating labels with questions and answer percentages
        QuestionLBL?.text = statisticsObject.fetchQuestionOfTheDay().question
        AnswerALBL?.text = statisticsObject.fetchQuestionOfTheDay().answer0
        AnswerBLBL?.text = statisticsObject.fetchQuestionOfTheDay().answer1
        AnswerCLBL?.text = statisticsObject.fetchQuestionOfTheDay().answer2
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        var answer:[Double] = statisticsObject.findPercentage()
        AnswerAPercent.text = String(format: "%.2f%%",answer[0])
        AnswerBPercent.text = String(format: "%.2f%%",answer[1])
        AnswerCPercent.text = String(format: "%.2f%%",answer[2])
        QuestionLBL?.text = statisticsObject.fetchQuestionOfTheDay().question
        AnswerALBL?.text = statisticsObject.fetchQuestionOfTheDay().answer0
        AnswerBLBL?.text = statisticsObject.fetchQuestionOfTheDay().answer1
        AnswerCLBL?.text = statisticsObject.fetchQuestionOfTheDay().answer2
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
