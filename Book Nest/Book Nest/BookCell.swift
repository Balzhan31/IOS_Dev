//
//  BookCell.swift
//  Book Nest
//
//  Created by Балжан Бозбашава on 25.10.2024.
//

import UIKit

class BookCell: UITableViewCell {
    
    @IBOutlet weak var UIImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with book: Book) {
        UIImage.image = book.imageee
        titleLabel.text = book.title
        descLabel.text = book.desc
    }
}
