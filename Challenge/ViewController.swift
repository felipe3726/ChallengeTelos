//
//  ViewController.swift
//  Challenge
//
//  Created by Felipe Martinez on 23/03/22.
//

import UIKit

import Foundation


class ViewController: UIViewController {

    let myClass = Movie()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myClass.getData()
    }
}
