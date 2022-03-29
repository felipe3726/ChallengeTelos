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
    @IBOutlet var FavTableView: UITableView!
    @IBOutlet var CartTableView: UITableView!
    
    let movies = Movie()
    let user = User()
    var array : Array<Movie.TopMovies> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TopTableView.delegate = self
        TopTableView.dataSource = self
        FavTableView.delegate = self
        FavTableView.dataSource = self
        CartTableView.delegate = self
        CartTableView.dataSource = self
        array = movies.getData()
    }
}


extension TopViewController: UITableViewDelegate, UITableViewDataSource, favDelegate, rentDelegate, Mydelegate{
    
    func didPressMovieFavButton(myData: String) {
        self.user.deleteFav(myData)
        FavTableView.reloadData()
    }
    
    func didPressFavButton(myData: String) {
        self.user.addFav(myData)
        FavTableView.reloadData()
    }
    
    func didPressRentButton(myData: String) {
        self.user.addRent(myData)
        CartTableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hello")
        FavTableView.reloadData()
        CartTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == TopTableView{
            return array.count
        }else if tableView == FavTableView{
            return user.Favorite.count
        }else if tableView == CartTableView{
            return user.Rented.count
        }
        return Int()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == TopTableView{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopCell", for: indexPath) as! TopTableViewCell
        let url = URL(string: array[indexPath.row].Image)!
        let data = try? Data(contentsOf: url)
        
        cell.imageCell.image = UIImage(data: data!)
        cell.rankCell.text = array[indexPath.row].Rank
        cell.ratingCell.text = array[indexPath.row].IMDbRating
        cell.titleCell.text = array[indexPath.row].Title
        cell.rentDelegate = self
        cell.favDelegate = self
        
        return cell
        }else if tableView == FavTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavTable", for: indexPath) as! FavoriteTableViewCell
            
            cell.titleCell.text = user.Favorite[indexPath.row]
            cell.delegate = self
            
            return cell
        }else if tableView == CartTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCart", for: indexPath) as! MovieCartTableViewCell
            
            cell.label.text = user.Rented[indexPath.row]
            
            return cell
        }
        
        return UITableViewCell()
    }
    
}
