//
//  TopTableViewCell.swift
//  Challenge
//
//  Created by Felipe Martinez on 27/03/22.
//

import UIKit

protocol rentDelegate {
    func didPressRentButton(myData: String)
}

protocol favDelegate {
    func didPressFavButton(myData: String)
}

class TopTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var rankCell: UILabel!
    @IBOutlet weak var ratingCell: UILabel!
    @IBOutlet var RentBttn: UIButton!
    @IBOutlet var FavBttn: UIButton!
    var rentDelegate: rentDelegate?
    var favDelegate : favDelegate?
    
    @IBAction func addMovie(_ sender: Any) {
        let data = self.titleCell.text
        self.favDelegate?.didPressFavButton(myData: data!)
        }
    
    @IBAction func rentMovie(_ sender: Any){
        let data = self.titleCell.text
        self.rentDelegate?.didPressRentButton(myData: data!)
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
