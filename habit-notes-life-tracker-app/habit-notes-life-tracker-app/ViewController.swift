//
//  ViewController.swift
//  habit-notes-life-tracker-app
//
//  Created by Rylee Hickman on 12/2/20.
//  Copyright © 2020 Rylee Hickman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var trackersTableView = UITableView()
    let cellHeight: CGFloat = 50
    let trackerReuseIdentifier = "TrackerReuseIdentifier"
    var exampleTrackers: [OneTrackerCell]!
//    var trackers: [Tracker] = []
    var addTracker: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Trackers"
        
        let water = OneTrackerCell(trackerName: "Drinking Water")
        let weights = OneTrackerCell(trackerName: "Lifting Weights")
        let sleep = OneTrackerCell(trackerName: "Hours of Sleep")
        exampleTrackers = [water, weights, sleep]
   
        trackersTableView.delegate = self
        trackersTableView.dataSource = self
        trackersTableView.translatesAutoresizingMaskIntoConstraints = false
        trackersTableView.register(TrackerTableViewCell.self, forCellReuseIdentifier: trackerReuseIdentifier)
        view.addSubview(trackersTableView)
        
        // test the addTracker button first -- Leo
        addTracker = UIButton()
        addTracker.translatesAutoresizingMaskIntoConstraints = false
        addTracker.setTitle("Add Tracker", for: .normal)
        addTracker.setTitleColor(.systemBlue, for: .normal)
        
        addTracker.addTarget(self, action: #selector(addTrackerViewController), for: .touchUpInside)
        view.addSubview(addTracker)

        
//        getAllTrackers()
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            addTracker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            addTracker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addTracker.heightAnchor.constraint(equalToConstant: 100),
            addTracker.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            trackersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trackersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            trackersTableView.topAnchor.constraint(equalTo: addTracker.bottomAnchor, constant: 30),
            trackersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    @objc func addTrackerViewController() {
        let vc = AddTrackerViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
//    func getAllTrackers() {
//        NetworkManager.getAllTrackers { trackers in
//            self.trackers = trackers
//            self.trackersTableView.reloadData()
//        }
//    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleTrackers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = trackersTableView.dequeueReusableCell(withIdentifier: trackerReuseIdentifier, for: indexPath) as! TrackerTableViewCell
        let tracker = exampleTrackers[indexPath.row]
        cell.configure(for: tracker)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

