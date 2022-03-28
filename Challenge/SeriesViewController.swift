//
//  SeriesViewController.swift
//  Challenge
//
//  Created by Felipe Martinez on 28/03/22.
//

import UIKit
import Foundation

class SeriesViewController: UIViewController {

    @IBOutlet var SerieTableView : UITableView!

let user = User()
let series = Serie()
var array : Array<Serie.TopSeries> = []

override func viewDidLoad() {
    super.viewDidLoad()
    
    SerieTableView.delegate = self
    SerieTableView.dataSource = self
    
    array = series.getData()
}
}

extension SeriesViewController: UITableViewDelegate, UITableViewDataSource{
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("Hello")
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "SeriesCell", for: indexPath) as! SeriesTableViewCell

    
    cell.rankCell.text = array[indexPath.row].Rank
    cell.ratingCell.text = array[indexPath.row].IMDbRating
    cell.titleCell.text = array[indexPath.row].Title
    
    
    return cell
}
}
