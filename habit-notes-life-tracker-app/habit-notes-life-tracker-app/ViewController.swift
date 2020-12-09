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
    var addTracker: UIButton!
    
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
        
        // test the addTracker button first -- Leo
        addTracker = UIButton()
        addTracker.translatesAutoresizingMaskIntoConstraints = false
        addTracker.setTitle("Add Tracker", for: .normal)
        addTracker.setTitleColor(.systemBlue, for: .normal)
        
        addTracker.addTarget(self, action: #selector(addTrackerViewController), for: .touchUpInside)
        view.addSubview(addTracker)

        
        getAllTrackers()
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            addTracker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            addTracker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addTracker.heightAnchor.constraint(equalToConstant: 300),
            addTracker.widthAnchor.constraint(equalToConstant: 300)
        ])
        
    }
    
    @objc func addTrackerViewController() {
        let vc = AddTrackerViewController()
        navigationController?.pushViewController(vc, animated: true)
        
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

