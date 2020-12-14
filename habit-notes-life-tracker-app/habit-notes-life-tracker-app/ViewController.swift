//
//  ViewController.swift
//  habit-notes-life-tracker-app
//
//  Created by Rylee Hickman on 12/2/20.
//  Copyright © 2020 Rylee Hickman. All rights reserved.
//

import UIKit
import DropDown

class ViewController: UIViewController {

    var trackersTableView = UITableView()
    let cellHeight: CGFloat = 60
    let trackerReuseIdentifier = "TrackerReuseIdentifier"
    var trackers: [Tracker] = []
    var addTrackerBar: UIButton!
    var addTracker: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Trackers"
   
        trackersTableView.delegate = self
        trackersTableView.dataSource = self
        trackersTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        trackersTableView.translatesAutoresizingMaskIntoConstraints = false
        trackersTableView.register(TrackerTableViewCell.self, forCellReuseIdentifier: trackerReuseIdentifier)
        view.addSubview(trackersTableView)
        
        addTrackerBar = UIButton()
        addTrackerBar.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.00)
        addTrackerBar.addTarget(self, action: #selector(addTrackerViewController), for: .touchUpInside)
        addTrackerBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addTrackerBar)
        
        // test the addTracker button first -- Leo
        addTracker = UIImageView()
        addTracker.image = UIImage(named: "Union")
        addTracker.contentMode = .scaleAspectFit
        addTracker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addTracker)

        
        getAllTrackers()
        setupConstraints()
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            addTrackerBar.heightAnchor.constraint(equalToConstant: 60),
            addTrackerBar.widthAnchor.constraint(equalTo: view.widthAnchor),
            addTrackerBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addTracker.centerYAnchor.constraint(equalTo: addTrackerBar.centerYAnchor),
            addTracker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addTracker.heightAnchor.constraint(equalToConstant: 20),
            addTracker.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            trackersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            trackersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            trackersTableView.topAnchor.constraint(equalTo: addTracker.bottomAnchor, constant: 60),
            trackersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    @objc func addTrackerViewController() {
        let vc = AddTrackerViewController()
        present(vc, animated: true, completion: nil)
        
    }
    
    func getAllTrackers() {
        NetworkManager.getAllTrackers { trackers in
            self.trackers = trackers
            self.trackersTableView.reloadData()
        }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = trackersTableView.dequeueReusableCell(withIdentifier: trackerReuseIdentifier, for: indexPath) as! TrackerTableViewCell
        let tracker = trackers[indexPath.row]
        cell.configure(for: tracker)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

