//
//  FavoriteTableViewCell.swift
//  Challenge
//
//  Created by Felipe Martinez on 29/03/22.
//

import UIKit

protocol delegate {
    func didPressFavButton(myData: String)
}

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var addBttnCell: UIButton!
    var delegate: delegate?
    
    @IBAction func addMovie(_ sender: Any) {
        let data = self.titleCell.text
        self.delegate?.didPressFavButton(myData: data!)
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
