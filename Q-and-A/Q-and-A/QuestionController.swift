//
//  QuestionController.swift
//  Q-and-A
//
//  Created by Jonathan T. Miles on 7/30/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import Foundation

class QuestionController {
    
    // Read array
    var questions: [Question] = []
    
    // Create function
    func createQuestion(about question: String, from asker: String) {
        let question = Question(question: question, asker: asker)
        questions.append(question)
    }
    
    // Update function to "answer" the question
    func updateQuestion(toAnswer question: Question, with answer: String, from answerer: String) {
        var question = question
        question.answer = answer
        question.answerer = answerer
    }
    
    // Delete function
    func deleteQuestion(question: Question) {
        guard let index = questions.index(of: question) else { return }
        questions.remove(at: index)
    }
}
