//
//  VoteViewController.swift
//  QuestionOfTheDay
//
//  Created by Muthyala,Nikhil on 11/7/17.
//

import UIKit

class VoteViewController: UIViewController {

    var questionOfTheDay:QuestionOfTheDay!
    let statisticsObject:Statistician = Statistician()
    
    @IBOutlet weak var QuestionLBL: UILabel!
    @IBOutlet weak var AnswerALBL: UILabel!
    @IBOutlet weak var AnswerBLBL: UILabel!
    @IBOutlet weak var AnswerCLBL: UILabel!
    
    @IBAction func OptionAButton(_ sender: Any) {
        let option:Opinion = Opinion(answer: 0)
        statisticsObject.saveOpinion(Opinion: option)
    }
    
    @IBAction func OptionBButton(_ sender: Any) {
        let option:Opinion = Opinion(answer: 1)
        statisticsObject.saveOpinion(Opinion: option)
    }
    
    @IBAction func OptionCButton(_ sender: Any) {
        let option:Opinion = Opinion(answer: 2)
        statisticsObject.saveOpinion(Opinion: option)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //fetching the question of the day from stat class
        QuestionLBL?.text = statisticsObject.fetchQuestionOfTheDay().question
        AnswerALBL?.text = statisticsObject.fetchQuestionOfTheDay().answer0
        AnswerBLBL?.text = statisticsObject.fetchQuestionOfTheDay().answer1
        AnswerCLBL?.text = statisticsObject.fetchQuestionOfTheDay().answer2
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        //updated the data when we switch screens
        questionOfTheDay = statisticsObject.fetchQuestionOfTheDay()
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
