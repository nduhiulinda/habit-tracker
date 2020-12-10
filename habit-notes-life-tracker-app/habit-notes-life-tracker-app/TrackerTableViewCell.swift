//
//  TrackerTableViewCell.swift
//  habit-notes-life-tracker-app
//
//  Created by Rylee Hickman on 12/9/20.
//  Copyright © 2020 Rylee Hickman. All rights reserved.
//

import UIKit

class TrackerTableViewCell: UITableViewCell {

    var trackerName: UILabel!
    var logButton: UIButton!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        trackerName = UILabel()
        trackerName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(trackerName)
        
        logButton = UIButton()
        logButton.setTitle("Log", for: .normal)
        logButton.backgroundColor = .gray
        logButton.setTitleColor(.white, for: .normal)
        logButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(logButton)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            trackerName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            trackerName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            logButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            logButton.heightAnchor.constraint(equalToConstant: 40),
            logButton.widthAnchor.constraint(equalToConstant: 60),
            logButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(for tracker: OneTrackerCell) {
        trackerName.text = tracker.trackerName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
