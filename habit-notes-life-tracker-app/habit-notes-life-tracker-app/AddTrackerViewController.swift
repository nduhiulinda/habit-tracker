//
//  AddTrackerViewController.swift
//  habit-notes-life-tracker-app
//
//  Created by Leo He on 12/8/20.
//  Copyright © 2020 Rylee Hickman. All rights reserved.
//

import UIKit

class AddTrackerViewController: UIViewController {
    var redView: UIView!
    var eventField: UITextField!
    var eventLabel: UILabel!
    var detailField: UITextField!
    var detailLabel: UILabel!
    var noteField: UITextField!
    var noteLabel: UILabel!
    var noteText: UITextView!
    var alertLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveTapped))
        setupView()
        setupConstraints()

        // Do any additional setup after loading the view.
    }
    func setupView() {
        
        eventLabel = UILabel()
        eventLabel.text = "What to track"
        eventLabel.textColor = .black
        eventLabel.textAlignment = .right
        eventLabel.font = UIFont.systemFont(ofSize: 25.0, weight: .bold)
        eventLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(eventLabel)
        
        eventField = UITextField()
        eventField.translatesAutoresizingMaskIntoConstraints = false
        eventField.text = "Name your tracker here"
        eventField.borderStyle = .roundedRect
        eventField.backgroundColor = .systemGray5
        eventField.textAlignment = .left
        eventField.clearsOnBeginEditing = true
        view.addSubview(eventField)
        
        detailLabel = UILabel()
        detailLabel.text = "Add a detail"
        //detailLabel.frame = CGRect(x: 20, y: 20, width: 100, height: 30)
        detailLabel.shadowColor = .systemYellow
        detailLabel.textColor = .systemBlue
        detailLabel.textAlignment = .left
        detailLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailLabel)
        
        detailField = UITextField()
        detailField.translatesAutoresizingMaskIntoConstraints = false
        detailField.text = " "
        detailField.borderStyle = .roundedRect
        detailField.backgroundColor = .systemGray5
        detailField.textAlignment = .left
        detailField.clearsOnBeginEditing = true
        view.addSubview(detailField)
        
        noteLabel = UILabel()
        noteLabel.text = "Add a note"
        noteLabel.textColor = .black
        noteLabel.textAlignment = .right
        noteLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        noteLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(noteLabel)
        
        noteField = UITextField()
        noteField.translatesAutoresizingMaskIntoConstraints = false
        noteField.text = " "
        noteField.borderStyle = .roundedRect
        noteField.backgroundColor = .systemGray5
        noteField.textAlignment = .left
        noteField.clearsOnBeginEditing = true
        view.addSubview(noteField)
        
        alertLabel = UILabel()
        alertLabel.text = "Tracker Details Cannot Be Empty!"
        alertLabel.textColor = .systemRed
        alertLabel.textAlignment = .center
        alertLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        alertLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            eventLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            eventLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        ])
        
        NSLayoutConstraint.activate([
            eventField.topAnchor.constraint(equalTo: eventLabel.bottomAnchor, constant: 20),
            eventField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            eventField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            eventField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
        NSLayoutConstraint.activate([
            detailLabel.leadingAnchor.constraint(equalTo: eventLabel.leadingAnchor),
            detailLabel.topAnchor.constraint(equalTo: eventField.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            detailField.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 15),
            detailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            detailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            detailField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
        NSLayoutConstraint.activate([
            noteLabel.leadingAnchor.constraint(equalTo: detailField.leadingAnchor),
            noteLabel.topAnchor.constraint(equalTo: detailField.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            noteField.topAnchor.constraint(equalTo: noteLabel.bottomAnchor, constant: 15),
            noteField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            noteField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            noteField.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    @objc func saveTapped() {
        // save tracker details
          }


}
