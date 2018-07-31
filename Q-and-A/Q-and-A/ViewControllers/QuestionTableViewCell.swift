//
//  QuestionTableViewCell.swift
//  Q-and-A
//
//  Created by Jonathan T. Miles on 7/30/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func updateViews() {
        guard let question = question else { return }
        questionLabel.text = question.question
        askedByLabel.text = question.asker
        thirdLabel.text = "Tap here to answer."
    }
    
    // MARK: - Properties
    
    var question: Question? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var askedByLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    
    
}
