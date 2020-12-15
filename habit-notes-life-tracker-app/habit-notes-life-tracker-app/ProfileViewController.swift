//
//  ProfileViewController.swift
//  habit-notes-life-tracker-app
//
//  Created by Leo He on 12/14/20.
//  Copyright © 2020 Rylee Hickman. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var exitButton: UIButton!
    var nameLabel: UILabel!
    var detailLabel: UILabel!
    var detailLabel2: UILabel!
    var detailLabel3: UILabel!
    var saveTrackerButton: UIButton!
    var completeButton1: UIButton!
    var completeButton2: UIButton!
    var profileImage: UIImageView!
    
    let lightGrayColor = UIColor(red: 0.77, green: 0.77, blue: 0.77, alpha: 1.00)
    let darkGrayColor = UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1.00)
    let lightBrownColor = UIColor(red: 0.87, green: 0.83, blue: 0.82, alpha: 1.00)
    let darkBrownColor = UIColor(red: 0.29, green: 0.19, blue: 0.16, alpha: 1.00)
    
    let fontSize = UIFont.systemFont(ofSize: 13, weight: .medium)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        
        setupView()
        setupConstraints()

        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        profileImage = UIImageView()
        //profileImage.contentMode = .scaleAspectFit
        profileImage.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        profileImage.image = UIImage(named: "ArianaGrande")
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImage)
        
        
        exitButton = UIButton()
        exitButton.setImage(UIImage(named: "Exit"), for: .normal)
        exitButton.contentMode = .scaleAspectFit
        exitButton.addTarget(self, action: #selector(exitView), for: .touchUpInside)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exitButton)
        
        nameLabel = UILabel()
        nameLabel.text = "Ariana Grande"
        nameLabel.textColor = darkGrayColor
        nameLabel.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        detailLabel = UILabel()
        detailLabel.text = "Time kept on track                                 250 days"
        detailLabel.textColor = darkBrownColor
        detailLabel.textAlignment = .center
        detailLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailLabel)
        
        detailLabel2 = UILabel()
        detailLabel2.text = "Longest daily streak                               20 days"
        detailLabel2.textColor = darkBrownColor
        detailLabel2.textAlignment = .center
        detailLabel2.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        detailLabel2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailLabel2)
        
        detailLabel3 = UILabel()
        detailLabel3.text = "Completed habits                                          2"
        detailLabel3.textColor = darkBrownColor
        detailLabel3.textAlignment = .center
        detailLabel3.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        detailLabel3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailLabel3)
        
        completeButton1 = UIButton()
        completeButton1.setTitle("Working Out", for: .normal)
        completeButton1.setTitleColor(.white, for: .normal)
        completeButton1.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        completeButton1.backgroundColor = lightGrayColor
        completeButton1.layer.cornerRadius = 15
        completeButton1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(completeButton1)
        
        completeButton2 = UIButton()
        completeButton2.setTitle("Weekly recycle", for: .normal)
        completeButton2.setTitleColor(.white, for: .normal)
        completeButton2.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        completeButton2.backgroundColor = lightGrayColor
        completeButton2.layer.cornerRadius = 15
        completeButton2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(completeButton2)
        
        saveTrackerButton = UIButton()
        saveTrackerButton.setTitle("Share your progress", for: .normal)
        saveTrackerButton.setTitleColor(.white, for: .normal)
        saveTrackerButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        saveTrackerButton.backgroundColor = darkBrownColor
        saveTrackerButton.layer.cornerRadius = 30
        saveTrackerButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        saveTrackerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveTrackerButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            exitButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            exitButton.heightAnchor.constraint(equalToConstant: 40),
            exitButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 20),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.heightAnchor.constraint(equalToConstant: 120),
            profileImage.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            detailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30 )
        ])
        NSLayoutConstraint.activate([
            detailLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            detailLabel2.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 30 )
        ])
        NSLayoutConstraint.activate([
            detailLabel3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            detailLabel3.topAnchor.constraint(equalTo: detailLabel2.bottomAnchor, constant: 30 )
        ])
        NSLayoutConstraint.activate([
                   completeButton1.topAnchor.constraint(equalTo: detailLabel3.bottomAnchor, constant: 20),
                   completeButton1.heightAnchor.constraint(equalToConstant: 40),
                   completeButton1.widthAnchor.constraint(equalToConstant: 300),
                   completeButton1.centerXAnchor.constraint(equalTo: view.centerXAnchor)
               ])
        NSLayoutConstraint.activate([
            completeButton2.topAnchor.constraint(equalTo: completeButton1.bottomAnchor, constant: 15),
            completeButton2.heightAnchor.constraint(equalToConstant: 40),
            completeButton2.widthAnchor.constraint(equalToConstant: 300),
            completeButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            saveTrackerButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            saveTrackerButton.heightAnchor.constraint(equalToConstant: 60),
            saveTrackerButton.widthAnchor.constraint(equalToConstant: 280),
            saveTrackerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func exitView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func saveTapped() {
             }
        // Do any additional setup after loading the view.
}
    

   


