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

let series = Serie()
let user = User()
    var UserView = UserViewController().c
var array : Array<Serie.TopSeries> = []

override func viewDidLoad() {
    super.viewDidLoad()
    SerieTableView.delegate = self
    SerieTableView.dataSource = self
    array = series.getData()
}
}

extension SeriesViewController: UITableViewDelegate, UITableViewDataSource, favDelegate, rentDelegate{
    func didPressFavButton(myData: String) {
        self.user.addFav(myData)
    }
    
    func didPressRentButton(myData: String) {
        self.user.addRent(myData)
    }
    
    
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("Hello")
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "SeriesCell", for: indexPath) as! SeriesTableViewCell
    let url = URL(string: array[indexPath.row].Image)!
    let data = try? Data(contentsOf: url)
    
    cell.imageCell.image = UIImage(data: data!)
    cell.rankCell.text = array[indexPath.row].Rank
    cell.ratingCell.text = array[indexPath.row].IMDbRating
    cell.titleCell.text = array[indexPath.row].Title
    cell.rentDelegate = self
    cell.favDelegate = self
    
    return cell
}
}
