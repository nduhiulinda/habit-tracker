 //  TrackerTableViewCell.swift
 //  habit-notes-life-tracker-app
 //
 //  Created by Rylee Hickman on 12/14/20.
 //  Copyright © 2020 Rylee Hickman. All rights reserved.
 //

 import UIKit
 protocol LogDelegate {
     func didTapButton()
 }
 class TrackerTableViewCell: UITableViewCell {
     
     var delegate: LogDelegate?

     var trackerCardView: UIView!
     var trackerName: UILabel!
     var logButton: UIButton!
    
    let lightGrayColor = UIColor(red: 0.77, green: 0.77, blue: 0.77, alpha: 1.00)
    let darkGrayColor = UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1.00)
    let lightBrownColor = UIColor(red: 0.87, green: 0.83, blue: 0.82, alpha: 1.00)
    let darkBrownColor = UIColor(red: 0.29, green: 0.19, blue: 0.16, alpha: 1.00)

     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         
         selectionStyle = .none
         
         trackerCardView = UIView()
         trackerCardView.backgroundColor = .white
         trackerCardView.layer.cornerRadius = 18
         trackerCardView.layer.borderColor = lightBrownColor.cgColor
         trackerCardView.layer.borderWidth = 1
         trackerCardView.translatesAutoresizingMaskIntoConstraints = false
         contentView.addSubview(trackerCardView)
         
         trackerName = UILabel()
         trackerName.translatesAutoresizingMaskIntoConstraints = false
         contentView.addSubview(trackerName)
         
         logButton = UIButton()
         logButton.setTitle("Log", for: .normal)
         logButton.backgroundColor = darkBrownColor
         logButton.setTitleColor(.white, for: .normal)
         logButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
         logButton.layer.cornerRadius = 18
         logButton.translatesAutoresizingMaskIntoConstraints = false
         contentView.addSubview(logButton)
         
         setupConstraints()
     }
     
     func setupConstraints() {
         NSLayoutConstraint.activate([
             trackerCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
             trackerCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
             trackerCardView.heightAnchor.constraint(equalToConstant: 50),
             trackerCardView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
         ])
         
         NSLayoutConstraint.activate([
             trackerName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
             trackerName.centerYAnchor.constraint(equalTo: trackerCardView.centerYAnchor)
         ])
         
         NSLayoutConstraint.activate([
             logButton.trailingAnchor.constraint(equalTo: trackerCardView.trailingAnchor),
             logButton.heightAnchor.constraint(equalToConstant: 50),
             logButton.widthAnchor.constraint(equalToConstant: 100),
             logButton.centerYAnchor.constraint(equalTo: trackerCardView.centerYAnchor)
         ])
     }
     
     func configure(for tracker: Tracker) {
         trackerName.text = tracker.name
         //
         
     }
     
     @objc func didTapButton() {
         delegate?.didTapButton()

        }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
 }
