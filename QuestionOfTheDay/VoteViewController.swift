//
//  VoteViewController.swift
//  QuestionOfTheDay
//
//  Created by Muthyala,Nikhil on 11/7/17.
//

import UIKit

class VoteViewController: UIViewController {

    var QuestionOfTheDay:QuestionOfTheDay!
    let stat:Statistician = Statistician()
    
    @IBOutlet weak var QuestionLBL: UILabel!
    @IBOutlet weak var AnswerALBL: UILabel!
    @IBOutlet weak var AnswerBLBL: UILabel!
    @IBOutlet weak var AnswerCLBL: UILabel!
    
    @IBAction func OptionAButton(_ sender: Any) {
        let option:Opinion = Opinion(answer: 0)
        stat.saveOpinion(Opinion: option)
    }
    
    @IBAction func OptionBButton(_ sender: Any) {
        let option:Opinion = Opinion(answer: 1)
        stat.saveOpinion(Opinion: option)
    }
    
    @IBAction func OptionCButton(_ sender: Any) {
        let option:Opinion = Opinion(answer: 2)
        stat.saveOpinion(Opinion: option)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionLBL?.text = stat.fetchQuestionOfTheDay().question
        AnswerALBL?.text = stat.fetchQuestionOfTheDay().answer0
        AnswerBLBL?.text = stat.fetchQuestionOfTheDay().answer1
        AnswerCLBL?.text = stat.fetchQuestionOfTheDay().answer2
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        QuestionOfTheDay = stat.fetchQuestionOfTheDay()
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
