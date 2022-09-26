//
//  ReplaiesTableViewCell.swift
//  AlamofireTaskMessages
//
//  Created by Esraa Khaled   on 13/09/2022.
//

import UIKit

class ReplaiesTableViewCell: UITableViewCell {
    static let reuseIdentifier = "ReplaiesTableViewCell"
    @IBOutlet weak var userImg: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var message_date: UILabel!
    @IBOutlet weak var messageBody: UITextView!
    @IBOutlet weak var view: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
