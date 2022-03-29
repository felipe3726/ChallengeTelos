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
    @IBOutlet var favSerieTableView : UITableView!
    @IBOutlet var rentSerieTableView : UITableView!

let series = Serie()
let user = User()
var array : Array<Serie.TopSeries> = []

override func viewDidLoad() {
    super.viewDidLoad()
    SerieTableView.delegate = self
    SerieTableView.dataSource = self
    favSerieTableView.delegate = self
    favSerieTableView.dataSource = self
    rentSerieTableView.delegate = self
    rentSerieTableView.dataSource = self
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
    tableView.reloadData()
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableView == SerieTableView{
        return array.count
    }else if tableView == favSerieTableView{
        return user.Favorite.count
    }else if tableView == rentSerieTableView{
        return user.Rented.count
    }
    return Int()
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if tableView == SerieTableView{
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
    }else if tableView == favSerieTableView{
        let cell = tableView.dequeueReusableCell(withIdentifier: "SerieFavCell", for: indexPath) as! SerieFavTableViewCell
        
        cell.titleCell.text = user.Favorite[indexPath.row]
        
        return cell
        
    }else if tableView == rentSerieTableView{
        let cell = tableView.dequeueReusableCell(withIdentifier: "RentSerieCell", for: indexPath) as! SerieRentTableViewCell
        
        cell.label?.text = user.Rented[indexPath.row]
        return cell
    }
    
    return UITableViewCell()
}
}
