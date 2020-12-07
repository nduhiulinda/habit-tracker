//
//  ViewController.swift
//  habit-notes-life-tracker-app
//
//  Created by Rylee Hickman on 12/2/20.
//  Copyright © 2020 Rylee Hickman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let trackersTableView = UITableView()
    let trackerReuseIdentifier = "TrackerReuseIdentifier"
    var trackers: [Tracker] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Trackers"
   
//        still need to figure out if we're using table view or collection view
//        trackersTableView.delegate = self
//        trackersTableView.dataSource = self
//        trackersTableView.translatesAutoresizingMaskIntoConstraints = false
//        trackersTableView.register(TrackerTableViewCell.self, forCellReuseIdentifier: trackerReuseIdentifier)
//        view.addSubview(trackersTableView)
        
        getAllTrackers()
        setupConstraints()
    }
    
    func setupConstraints() {
        
    }
    
    func getAllTrackers() {
        NetworkManager.getAllTrackers { trackers in
            self.trackers = trackers
//            self.trackersTableView.reloadData()
        }
    }

}

//extension ViewController: UITableViewDelegate {
//
//}

