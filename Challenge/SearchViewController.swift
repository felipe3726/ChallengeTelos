//
//  SearchViewController.swift
//  Challenge
//
//  Created by Felipe Martinez on 28/03/22.
//

import UIKit
import Foundation

class SearchViewController: UIViewController{
    
    let movie = Movie()
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var searchText: UITextField!
    @IBAction func search(_ sender: UIButton){
        let movieQuery = searchText.text as! String
        let result = movie.Search(movieQuery)
        titleLabel.text = result.0
        descLabel.text = result.1
        let data = try? Data(contentsOf: result.2)
        image.image = UIImage(data: data!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
