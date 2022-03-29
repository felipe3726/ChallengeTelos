//
//  UserViewController.swift
//  Challenge
//
//  Created by Felipe Martinez on 29/03/22.
//

import Foundation
import UIKit

class UserViewController: UIViewController{
    @IBOutlet var favTableView: UITableView!
    @IBOutlet var cartTableView: UITableView!
    @IBOutlet var rentTableView: UITableView!
    let user = User()
    let c: Array<String>=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favTableView.delegate = self
        favTableView.dataSource = self
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        rentTableView.delegate = self
        rentTableView.dataSource = self
    }
}

extension UserViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == favTableView{
            //return user.Favorite.count
            return user.Favorite.count
        }else if tableView == rentTableView{
           return user.Rented.count
        }
        return Int()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == favTableView{
            let favcell = tableView.dequeueReusableCell(withIdentifier: "favTable", for: indexPath) as! FavTableViewCell
        favcell.favMovie.text = user.Favorite[indexPath.row]
            return favcell
        }
    else if tableView == rentTableView{
            let rentcell = tableView.dequeueReusableCell(withIdentifier: "rentTable", for: indexPath)
            return rentcell
        }
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hello")
    }
    
}
