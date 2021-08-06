//
//  BooksTableViewCell.swift
//  BooksTableViewCell
//
//  Created by YIM LLC on 06/08/21.
//

import UIKit

class BooksTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbNail: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookPublisher: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        thumbNail.layer.cornerRadius = 10
    }
    
    func configure(bookTitle: String?, bookPublisher: String?) {
        self.bookTitle.text = bookTitle ?? ""
        self.bookPublisher.text = bookPublisher ?? ""
    }
}
