//
//  FavTableViewCell.swift
//  Challenge
//
//  Created by Felipe Martinez on 29/03/22.
//

import UIKit

class FavTableViewCell: UITableViewCell {
    
    @IBOutlet weak var favMovie : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
