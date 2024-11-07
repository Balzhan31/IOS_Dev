//
//  PrimaryTableViewCell.swift
//  Carat-land
//
//  Created by Балжан Бозбашава on 06.11.2024.
//

import UIKit

class PrimaryTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var coverImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ model: Cartoon) {
        titleLabel.text = model.title
        coverImage.image = model.image
    }

}
