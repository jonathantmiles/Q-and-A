//
//  AnswerViewController.swift
//  Q-and-A
//
//  Created by Jonathan T. Miles on 7/30/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func submitAnswer(_ sender: Any) {
        guard let answerer = answererField.text,
            let answer = answerTextView.text,
            let question = question else { return }
        if answerer != "" && answer != "" {
            questionController?.updateQuestion(toAnswer: question, with: answer, from: answerer)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func updateViews() {
        askerLabel.text = question?.asker
        questionLabel.text = question?.question
        answererField.text = question?.answerer
        answerTextView.text = question?.answer
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Properties
    
    var questionController: QuestionController?
    var question: Question?
    
    @IBOutlet weak var askerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answererField: UITextField!
    @IBOutlet weak var answerTextView: UITextView!
    
    
}
