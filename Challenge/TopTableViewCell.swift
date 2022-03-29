//
//  TopTableViewCell.swift
//  Challenge
//
//  Created by Felipe Martinez on 27/03/22.
//

import UIKit

protocol clickDelegate {
    func didPressButton(myData: String)
}

class TopTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var rankCell: UILabel!
    @IBOutlet weak var ratingCell: UILabel!
    @IBOutlet var RentBttn: UIButton!
    @IBOutlet var FavBttn: UIButton!
    var delegate: clickDelegate?
    var cellIndex: IndexPath?
    var indexPath: IndexPath!
    
    @IBAction func addMovie(_ sender: Any) {
        let data = self.titleCell.text
        self.delegate?.didPressButton(myData: data!)
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
