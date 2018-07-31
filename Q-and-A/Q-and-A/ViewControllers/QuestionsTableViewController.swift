//
//  QuestionsTableViewController.swift
//  Q-and-A
//
//  Created by Jonathan T. Miles on 7/30/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

class QuestionsTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionController.questions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath)
        guard let qCell = cell as? QuestionTableViewCell else { return cell }
        
        qCell.question = questionController.questions[indexPath.row]

        return qCell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let question = questionController.questions[indexPath.row]
            questionController.deleteQuestion(question: question)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    


    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AskQuestionSegue" {
            guard let detailVC = segue.destination as? AskQuestionViewController else { return }
            detailVC.questionController = questionController
            
        } else if segue.identifier == "AnswerQuestionSegue" {
            guard let detailVC = segue.destination as? AnswerViewController else { return }
            detailVC.questionController = questionController
            guard let index = tableView.indexPathForSelectedRow else { return }
            detailVC.question = questionController.questions[index.row]
            
        }
    }
    
    
    // MARK: - Properties
    
    let questionController = QuestionController()

}
