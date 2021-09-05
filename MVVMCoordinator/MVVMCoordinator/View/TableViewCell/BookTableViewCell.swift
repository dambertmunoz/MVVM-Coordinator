//
//  BookTableViewCell.swift
//  MVVMCoordinator
//
//  Created by Dambert M. on 4/09/21.
//

import Foundation
import UIKit
import Kingfisher

public class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var isbnLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(book: Book) {
        self.titleLabel.text = book.title
        self.descriptionLabel.text = book.desc
        self.isbnLabel.text = book.isbn
        self.authorLabel.text = book.author
        
        guard let imageurl = book.img else { return }
        let url = URL(string: imageurl)
        self.bookImage?.kf.setImage(with: url)
        
    }
    
    
}
