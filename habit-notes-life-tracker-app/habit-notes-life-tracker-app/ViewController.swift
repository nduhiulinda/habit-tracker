//
//  ViewController.swift
//  habit-notes-life-tracker-app
//
//  Created by Rylee Hickman on 12/2/20.
//  Copyright © 2020 Rylee Hickman. All rights reserved.
//

import UIKit
import DropDown

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    var trackersTableView = UITableView()
    let cellHeight: CGFloat = 60
    let trackerReuseIdentifier = "TrackerReuseIdentifier"
    var trackers: [Tracker] = []
    var addTrackerBar: UIButton!
    var addTracker: UIImageView!
    var statsButton: UIButton!
    var profileButton: UIButton!
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
        addTrackerBar.backgroundColor = UIColor(red: 0.87, green: 0.83, blue: 0.82, alpha: 1.00)
        addTrackerBar.addTarget(self, action: #selector(addTrackerViewController), for: .touchUpInside)
        addTrackerBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addTrackerBar)
        
        // test the addTracker button first -- Leo
        addTracker = UIImageView()
        addTracker.image = UIImage(named: "Union")
        addTracker.contentMode = .scaleAspectFit
        addTracker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addTracker)
        
        statsButton = UIButton()
        statsButton.setImage(UIImage(named: "icon_stats"), for: .normal)
        statsButton.contentMode = .scaleAspectFit
        statsButton.addTarget(self, action: #selector(statsView), for: .touchUpInside)
        statsButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statsButton)
        
        profileButton = UIButton()
        profileButton.setImage(UIImage(named: "profile"), for: .normal)
        profileButton.contentMode = .scaleAspectFit
        profileButton.addTarget(self, action: #selector(profileView), for: .touchUpInside)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileButton)

        
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
        
        NSLayoutConstraint.activate([
            statsButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            statsButton.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            statsButton.heightAnchor.constraint(equalToConstant: 27),
            statsButton.widthAnchor.constraint(equalToConstant: 27)
        ])
        
        NSLayoutConstraint.activate([
            profileButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            profileButton.centerXAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            profileButton.heightAnchor.constraint(equalToConstant: 27),
            profileButton.widthAnchor.constraint(equalToConstant: 27)
        ])
        
    }
    
    @objc func addTrackerViewController() {
        let vc = AddTrackerViewController()
        present(vc, animated: true, completion: nil)
    }
    @objc func statsView() {
        let vc = TrackerDetailsViewController()
        present(vc, animated: true, completion: nil)
    }
    @objc func profileView() {
        let vc = ProfileViewController()
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
        cell.delegate = self
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let tracker = trackers[indexPath.row]
        //let cell = tableView.cellForRow(at: indexPath) as! PlaylistTableViewCell
        //let vc = AddRecordViewController()
        //vc. = indexPath.row
        //cell.configure(for: vc.song)//
        //present(vc, animated: true, completion: nil)
        
    }
    
    
}
extension ViewController: LogDelegate {
    func didTapButton() {
        let vc = AddRecordViewController()
//        vc.preferredContentSize = CGSize(width: 100, height: 200)
//        let controller = vc.popoverPresentationController
//        if controller != nil {
//            controller?.delegate = self
//            controller?.sourceView = self.view
//            controller?.sourceRect = CGRect(x:self.view.bounds.midX, y:self.view.bounds.midY,width: 315,height: 230)
//        }
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
}
