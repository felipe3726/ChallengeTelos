//
//  ViewController.swift
//  Challenge
//
//  Created by Felipe Martinez on 23/03/22.
//

import UIKit
import Foundation



class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let sections = [
    "Movies",
    "Series",
    "Search",
    "Profile"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.row == 0{
            self.performSegue(withIdentifier: "TopViewSegue", sender: self)
        }else if indexPath.row == 1{
            self.performSegue(withIdentifier: "SeriesSegue", sender: self)
        }else if indexPath.row == 2{
            self.performSegue(withIdentifier: "SearchSegue", sender: self)
        }else if indexPath.row == 3{
            self.performSegue(withIdentifier: "UserSegue", sender: self)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.labelCell.text = sections[indexPath.row]
        cell.imageCell.image = UIImage(named: sections[indexPath.row])
        
        return cell
    }
    
    
}

