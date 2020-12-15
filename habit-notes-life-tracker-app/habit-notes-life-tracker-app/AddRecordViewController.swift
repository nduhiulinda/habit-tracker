//
//  AddRecordViewController.swift
//  habit-notes-life-tracker-app
//
//  Created by Rylee Hickman on 12/7/20.
//  Copyright © 2020 Rylee Hickman. All rights reserved.
//

import UIKit


class AddRecordViewController: UIViewController {

//   weak var delegate: SaveNewNameDelegate?\
    var viewTitle: UILabel!
   var tracker: Tracker!
    var record: Record!
   var redView: UIView!
    var exitButton: UIButton!
   var nameField: UITextField!
   var nameLabel: UILabel!
   var typeField: UITextField!
   var typeLabel: UILabel!
   var valueField: UITextField!
   var valueLabel: UILabel!
   var alertLabel: UILabel!
   var songIndex: Int!
    var saveTrackerButton: UIButton!
    var detailLabel: UILabel!
    
   let lightGrayColor = UIColor(red: 0.77, green: 0.77, blue: 0.77, alpha: 1.00)
   let darkGrayColor = UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1.00)
   let lightBrownColor = UIColor(red: 0.87, green: 0.83, blue: 0.82, alpha: 1.00)
   let darkBrownColor = UIColor(red: 0.29, green: 0.19, blue: 0.16, alpha: 1.00)
   
   let fontSize = UIFont.systemFont(ofSize: 13, weight: .medium)
   // initialization of delegate
//   init(delegate: SaveNewNameDelegate?, record: Record) {
//       super.init(nibName: nil, bundle: nil)
//
//       self.delegate = delegate
//       self.record = record
//   }
   
//   required init?(coder: NSCoder) {
//       fatalError("init(coder:) has not been implemented")
//   }

   

   override func viewDidLoad() {
       super.viewDidLoad()

       view.backgroundColor = .white
       
       navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveTapped))
       setupView()
       setupConstraints()

   }
   
   func setupView() {
    
    viewTitle = UILabel()
    viewTitle.text = "Log"
    viewTitle.textColor = darkGrayColor
    viewTitle.font = UIFont.systemFont(ofSize: 40, weight: .bold)
    viewTitle.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(viewTitle)

       exitButton = UIButton()
       exitButton.setImage(UIImage(named: "Exit"), for: .normal)
       exitButton.contentMode = .scaleAspectFit
       exitButton.addTarget(self, action: #selector(exitView), for: .touchUpInside)
       exitButton.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(exitButton)
    
        detailLabel = UILabel()
        detailLabel.text = "Details?"
        detailLabel.textColor = darkBrownColor
        detailLabel.textAlignment = .right
        detailLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailLabel)
    
       nameLabel = UILabel()
       nameLabel.text = "Record name"
       nameLabel.textColor = darkBrownColor
       nameLabel.textAlignment = .right
       nameLabel.font = fontSize
       nameLabel.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(nameLabel)

       
       nameField = UITextField()
       nameField.placeholder =  "ex. running"
       nameField.font = fontSize
       nameField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
       nameField.leftViewMode = UITextField.ViewMode.always
       nameField.layer.cornerRadius = 18
       nameField.layer.borderColor = lightGrayColor.cgColor
       nameField.layer.borderWidth = 1
       nameField.clearsOnBeginEditing = true
       nameField.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(nameField)
       
       typeLabel = UILabel()
       typeLabel.text = "Record type"
       typeLabel.textColor = darkBrownColor
       typeLabel.textAlignment = .right
       typeLabel.font = fontSize
       typeLabel.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(typeLabel)
       
       typeField = UITextField()
       typeField.placeholder =  "ex. workout"
       typeField.font = fontSize
       typeField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
       typeField.leftViewMode = UITextField.ViewMode.always
       typeField.layer.cornerRadius = 18
       typeField.layer.borderColor = lightGrayColor.cgColor
       typeField.layer.borderWidth = 1
       typeField.clearsOnBeginEditing = true
       typeField.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(typeField)
       
       valueLabel = UILabel()
       valueLabel.text = "Record value"
       valueLabel.textColor = darkBrownColor
       valueLabel.textAlignment = .right
       valueLabel.font = fontSize
       valueLabel.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(valueLabel)
       
       valueField = UITextField()
       valueField.placeholder =  "ex. 30 mins"
       valueField.font = fontSize
       valueField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
       valueField.leftViewMode = UITextField.ViewMode.always
       valueField.layer.cornerRadius = 18
       valueField.layer.borderColor = lightGrayColor.cgColor
       valueField.layer.borderWidth = 1
       valueField.clearsOnBeginEditing = true
       valueField.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(valueField)
       
       saveTrackerButton = UIButton()
       saveTrackerButton.setTitle("Save New Record", for: .normal)
       saveTrackerButton.setTitleColor(.white, for: .normal)
       saveTrackerButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
       saveTrackerButton.backgroundColor = darkBrownColor
       saveTrackerButton.layer.cornerRadius = 30
       saveTrackerButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
       saveTrackerButton.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(saveTrackerButton)
    
       alertLabel = UILabel()
       alertLabel.text = "Song Details Cannot Be Empty!"
       alertLabel.textColor = .systemRed
       alertLabel.textAlignment = .center
       alertLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
       alertLabel.translatesAutoresizingMaskIntoConstraints = false
   }
   func setupConstraints() {
        
      NSLayoutConstraint.activate([
        exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
          exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
          exitButton.heightAnchor.constraint(equalToConstant: 40),
          exitButton.widthAnchor.constraint(equalToConstant: 40)
      ])
    
    NSLayoutConstraint.activate([
        viewTitle.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 10),
        viewTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
    ])
    
    NSLayoutConstraint.activate([
        detailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        detailLabel.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 50 )
    ])

       NSLayoutConstraint.activate([
           nameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 240),
           nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 160),
           nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
           nameField.heightAnchor.constraint(equalToConstant: 40)
       ])
       
       NSLayoutConstraint.activate([
           nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
           nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 252 )
       ])
       
       NSLayoutConstraint.activate([
           typeField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
           typeField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 160),
           typeField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
           typeField.heightAnchor.constraint(equalToConstant: 40)
       ])
       
       NSLayoutConstraint.activate([
           typeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
           typeLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 30 )
       ])
       
       NSLayoutConstraint.activate([
           valueField.topAnchor.constraint(equalTo: typeField.bottomAnchor, constant: 20),
           valueField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 160),
           valueField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
           valueField.heightAnchor.constraint(equalToConstant: 40)
       ])
       
       
       NSLayoutConstraint.activate([
           valueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
           valueLabel.topAnchor.constraint(equalTo: typeField.bottomAnchor, constant: 30)
       ])
    
    NSLayoutConstraint.activate([
        saveTrackerButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
        saveTrackerButton.heightAnchor.constraint(equalToConstant: 60),
        saveTrackerButton.widthAnchor.constraint(equalToConstant: 280),
        saveTrackerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
   }
    
    @objc func exitView() {
        dismiss(animated: true, completion: nil)
    }
   
   @objc func saveTapped() {
//       let nametext = nameField.text
//       let artisttext = typeField.text
//       let albumtext = valueField.text
//       let newsong = DiningHall(name: nametext ?? song.name, covername: song.covername, artist: artisttext ?? song.artist, album: albumtext ?? song.album)
//       if nametext != "", artisttext != "", albumtext != "" {
//              delegate?.saveNewName(newSong: newsong)
//       self.navigationController?.popViewController(animated: true)
//   } else {
//       view.addSubview(alertLabel)
//       NSLayoutConstraint.activate([
//           alertLabel.topAnchor.constraint(equalTo: valueField.bottomAnchor, constant: 50),
//           alertLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
//
//   }
         }


    

}


