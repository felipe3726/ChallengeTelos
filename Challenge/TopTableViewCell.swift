//
//  TopTableViewCell.swift
//  Challenge
//
//  Created by Felipe Martinez on 27/03/22.
//

import UIKit

class TopTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var rankCell: UILabel!
    @IBOutlet weak var ratingCell: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
