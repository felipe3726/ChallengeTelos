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
    
    let movies = Movie()
    let series = Serie()
    var array : Array<Movie.TopMovies> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TopTableView.delegate = self
        TopTableView.dataSource = self
        
        array = movies.getData()

    }
}

extension TopViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hello")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopCell", for: indexPath) as! TopTableViewCell

        
        cell.rankCell.text = array[indexPath.row].Rank
        cell.ratingCell.text = array[indexPath.row].IMDbRating
        cell.titleCell.text = array[indexPath.row].Title
        
        
        return cell
    }
    
    
}
