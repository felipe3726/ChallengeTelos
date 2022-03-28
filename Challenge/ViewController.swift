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
    "Cart",
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
        self.performSegue(withIdentifier: "TopViewSegue", sender: self)
        print("Hello")
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

