//
//  TaskCell.swift
//  PhotoHunt
//
//  Created by kelechi Nnorom on 3/17/23.
//

import UIKit

class TaskCell: UITableViewCell {

    
    @IBOutlet weak var completedImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(with task: Task) {
        titleLabel.text = task.title
        titleLabel.textColor = task.isComplete ? .secondaryLabel : .label
        completedImageView.image = UIImage(systemName: task.isComplete ? "checkmark.seal.fill" : "circle")?.withRenderingMode(.alwaysTemplate)
        completedImageView.tintColor = task.isComplete ? .systemGreen : .tertiaryLabel
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
