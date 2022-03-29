//
//  TopViewController.swift
//  Challenge
//
//  Created by Felipe Martinez on 27/03/22.
//

import UIKit
import Foundation

class TopViewController: UIViewController {
    
    @IBOutlet var TopTableView: UITableView!
    @IBOutlet var FavBttn: UIButton!
    
    let movies = Movie()
    let user = User()
    var array : Array<Movie.TopMovies> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TopTableView.delegate = self
        TopTableView.dataSource = self
        array = movies.getData()
    }
}


extension TopViewController: UITableViewDelegate, UITableViewDataSource, clickDelegate{
    
    func didPressButton(myData: String) {
        self.user.addFav(myData)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hello")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopCell", for: indexPath) as! TopTableViewCell
        let url = URL(string: array[indexPath.row].Image)!
        let data = try? Data(contentsOf: url)
        
        cell.imageCell.image = UIImage(data: data!)
        cell.rankCell.text = array[indexPath.row].Rank
        cell.ratingCell.text = array[indexPath.row].IMDbRating
        cell.titleCell.text = array[indexPath.row].Title
        cell.delegate = self
        
        return cell
    }
    
}
