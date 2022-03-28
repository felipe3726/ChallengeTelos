//
//  TableViewCell.swift
//  Challenge
//
//  Created by Felipe Martinez on 27/03/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelCell: UILabel!
    @IBOutlet weak var imageCell: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
