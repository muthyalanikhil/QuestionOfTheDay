//
//  StatisticsViewController.swift
//  QuestionOfTheDay
//
//  Created by Muthyala,Nikhil on 11/7/17.
//

import UIKit

class StatisticsViewController: UIViewController {

    let stat:Statistician = Statistician()
    
    @IBOutlet weak var QuestionLBL: UILabel!
    @IBOutlet weak var AnswerALBL: UILabel!
    @IBOutlet weak var AnswerBLBL: UILabel!
    @IBOutlet weak var AnswerCLBL: UILabel!
    @IBOutlet weak var AnswerAPercent: UILabel!
    @IBOutlet weak var AnswerBPercent: UILabel!
    @IBOutlet weak var AnswerCPercent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var answer:[Double] = stat.findPercentage()
        AnswerAPercent.text = String(format: "%.2f%%",answer[0])
        AnswerBPercent.text = String(format: "%.2f%%",answer[1])
        AnswerCPercent.text = String(format: "%.2f%%",answer[2])
        QuestionLBL?.text = stat.fetchQuestionOfTheDay().question
        AnswerALBL?.text = stat.fetchQuestionOfTheDay().answer0
        AnswerBLBL?.text = stat.fetchQuestionOfTheDay().answer1
        AnswerCLBL?.text = stat.fetchQuestionOfTheDay().answer2
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
