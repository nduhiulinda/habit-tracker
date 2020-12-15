//
//  AddTrackerViewController.swift
//  habit-notes-life-tracker-app
//
//  Created by Leo He on 12/8/20.
//  Copyright © 2020 Rylee Hickman. All rights reserved.
//

import UIKit
import DropDown

class AddTrackerViewController: UIViewController {
    var exitButton: UIButton!
    var viewTitle: UILabel!
    var trackerInputLabel: UILabel!
    var trackerInput: UITextField!
    var goalTitle: UILabel!
    var yesGoal: UIButton!
    var noGoal: UIButton!
    var goalQuantity: UITextField!
//    var goalFrequency:
//    var addDetailButton: UIButton!
    var detailInputLabel1: UILabel!
    var detailInput1: UITextField!
    var detailInput1TypeView: UIButton!
    var detailInput1Type: DropDown!
    var detailInput2: UITextField!
    var detailInput2TypeView: UIButton!
    var detailInput2Type: DropDown!
    var detailInput3: UITextField!
    var detailInput3TypeView: UIButton!
    var detailInput3Type: DropDown!
    var saveTrackerButton: UIButton!

//    var alertLabel: UILabel!
    
    let lightGrayColor = UIColor(red: 0.77, green: 0.77, blue: 0.77, alpha: 1.00)
    let darkGrayColor = UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1.00)
    let lightBrownColor = UIColor(red: 0.87, green: 0.83, blue: 0.82, alpha: 1.00)
    let darkBrownColor = UIColor(red: 0.29, green: 0.19, blue: 0.16, alpha: 1.00)
    
    let fontSize = UIFont.systemFont(ofSize: 13, weight: .medium)
    
//  Information about Drop Down module learned from: https://www.swiftdevcenter.com/drop-down-list-ios-swift-5/
    let dropDownData = ["Text", "Number", "Note"]


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupView()
        setupConstraints()

        // Do any additional setup after loading the view.
    }
    func setupView() {
        
        exitButton = UIButton()
        exitButton.setImage(UIImage(named: "Exit"), for: .normal)
        exitButton.contentMode = .scaleAspectFit
        exitButton.addTarget(self, action: #selector(exitView), for: .touchUpInside)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exitButton)
        
        viewTitle = UILabel()
        viewTitle.text = "Add Tracker"
        viewTitle.textColor = darkGrayColor
        viewTitle.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewTitle)
        
        trackerInputLabel = UILabel()
        trackerInputLabel.text = "Name of Tracker"
        trackerInputLabel.textColor = darkGrayColor
        trackerInputLabel.font = fontSize
        trackerInputLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(trackerInputLabel)
        
        trackerInput = UITextField()
        trackerInput.placeholder = "ex. Working Out"
        trackerInput.font = fontSize
        trackerInput.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        trackerInput.leftViewMode = UITextField.ViewMode.always
        trackerInput.layer.cornerRadius = 18
        trackerInput.layer.borderColor = lightGrayColor.cgColor
        trackerInput.layer.borderWidth = 1
        trackerInput.clearsOnBeginEditing = true
        trackerInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(trackerInput)
        
        goalTitle = UILabel()
        goalTitle.text = "Set Goal for this Tracker?"
        goalTitle.textColor = darkGrayColor
        goalTitle.font = fontSize
        goalTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goalTitle)
        
        yesGoal = UIButton()
        yesGoal.setTitle("Yes", for: .normal)
        yesGoal.setTitleColor(darkGrayColor, for: .normal)
        yesGoal.titleLabel?.font = fontSize
        yesGoal.layer.cornerRadius = 18
        yesGoal.layer.borderColor = lightGrayColor.cgColor
        yesGoal.layer.borderWidth = 1
        yesGoal.addTarget(self, action: #selector(selectYes), for: .touchUpInside)
        yesGoal.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yesGoal)
        
        noGoal = UIButton()
        noGoal.setTitle("No", for: .normal)
        noGoal.setTitleColor(darkGrayColor, for: .normal)
        noGoal.titleLabel?.font = fontSize
        noGoal.layer.cornerRadius = 18
        noGoal.layer.borderColor = lightGrayColor.cgColor
        noGoal.layer.borderWidth = 1
        noGoal.addTarget(self, action: #selector(selectNo), for: .touchUpInside)
        noGoal.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(noGoal)
        
        goalQuantity = UITextField()
        goalQuantity.placeholder = "Goal #"
        goalQuantity.font = fontSize
        goalQuantity.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        goalQuantity.leftViewMode = UITextField.ViewMode.always
        goalQuantity.layer.cornerRadius = 18
        goalQuantity.layer.borderColor = lightGrayColor.cgColor
        goalQuantity.layer.borderWidth = 1
        goalQuantity.clearsOnBeginEditing = true
        goalQuantity.isHidden = true
        goalQuantity.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(goalQuantity)
        
        detailInputLabel1 = UILabel()
        detailInputLabel1.text = "Add Detail(s) to Track"
        detailInputLabel1.textColor = darkGrayColor
        detailInputLabel1.font = fontSize
        detailInputLabel1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailInputLabel1)
        
        detailInput1 = UITextField()
        detailInput1.placeholder = "Detail 1 Name (ex. Workout Type)"
        detailInput1.font = fontSize
        detailInput1.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        detailInput1.leftViewMode = UITextField.ViewMode.always
        detailInput1.layer.cornerRadius = 18
        detailInput1.layer.borderColor = lightGrayColor.cgColor
        detailInput1.layer.borderWidth = 1
        detailInput1.clearsOnBeginEditing = true
        detailInput1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailInput1)
        
        detailInput1TypeView = UIButton()
        detailInput1TypeView.setTitle("Select Detail Type:", for: .normal)
        detailInput1TypeView.setTitleColor(darkGrayColor, for: .normal)
        detailInput1TypeView.titleLabel?.font = fontSize
        detailInput1TypeView.layer.borderColor = lightGrayColor.cgColor
        detailInput1TypeView.layer.borderWidth = 1
        detailInput1TypeView.layer.cornerRadius = 18
        detailInput1TypeView.addTarget(self, action: #selector(dropdown1Appears), for: .touchUpInside)
        detailInput1TypeView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailInput1TypeView)
        
        detailInput1Type = DropDown()
        
        detailInput2 = UITextField()
        detailInput2.placeholder = "Detail 2 Name (ex. Duration)"
        detailInput2.font = fontSize
        detailInput2.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        detailInput2.leftViewMode = UITextField.ViewMode.always
        detailInput2.layer.cornerRadius = 18
        detailInput2.layer.borderColor = lightGrayColor.cgColor
        detailInput2.layer.borderWidth = 1
        detailInput2.clearsOnBeginEditing = true
        detailInput2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailInput2)
        
        detailInput2TypeView = UIButton()
        detailInput2TypeView.setTitle("Select Detail Type:", for: .normal)
        detailInput2TypeView.setTitleColor(darkGrayColor, for: .normal)
        detailInput2TypeView.titleLabel?.font = fontSize
        detailInput2TypeView.layer.borderColor = lightGrayColor.cgColor
        detailInput2TypeView.layer.borderWidth = 1
        detailInput2TypeView.layer.cornerRadius = 18
        detailInput2TypeView.addTarget(self, action: #selector(dropdown2Appears), for: .touchUpInside)
        detailInput2TypeView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailInput2TypeView)
        
        detailInput2Type = DropDown()
        
        detailInput3 = UITextField()
        detailInput3.placeholder = "Detail 3 Name (ex. Calories Burned)"
        detailInput3.font = fontSize
        detailInput3.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        detailInput3.leftViewMode = UITextField.ViewMode.always
        detailInput3.layer.cornerRadius = 18
        detailInput3.layer.borderColor = lightGrayColor.cgColor
        detailInput3.layer.borderWidth = 1
        detailInput3.clearsOnBeginEditing = true
        detailInput3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailInput3)
        
        detailInput3TypeView = UIButton()
        detailInput3TypeView.setTitle("Select Detail Type:", for: .normal)
        detailInput3TypeView.setTitleColor(darkGrayColor, for: .normal)
        detailInput3TypeView.titleLabel?.font = fontSize
        detailInput3TypeView.layer.borderColor = lightGrayColor.cgColor
        detailInput3TypeView.layer.borderWidth = 1
        detailInput3TypeView.layer.cornerRadius = 18
        detailInput3TypeView.addTarget(self, action: #selector(dropdown3Appears), for: .touchUpInside)
        detailInput3TypeView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailInput3TypeView)
               
        detailInput3Type = DropDown()
        
        saveTrackerButton = UIButton()
        saveTrackerButton.setTitle("Save New Tracker", for: .normal)
        saveTrackerButton.setTitleColor(.white, for: .normal)
        saveTrackerButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        saveTrackerButton.backgroundColor = darkBrownColor
        saveTrackerButton.layer.cornerRadius = 30
        saveTrackerButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        saveTrackerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveTrackerButton)
        
//        alertLabel = UILabel()
//        alertLabel.text = "Tracker Details Cannot Be Empty!"
//        alertLabel.textColor = .systemRed
//        alertLabel.textAlignment = .center
//        alertLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
//        alertLabel.translatesAutoresizingMaskIntoConstraints = false
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
            viewTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            trackerInputLabel.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 30),
            trackerInputLabel.leadingAnchor.constraint(equalTo: viewTitle.leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            trackerInput.topAnchor.constraint(equalTo: trackerInputLabel.bottomAnchor, constant: 10),
            trackerInput.leadingAnchor.constraint(equalTo: trackerInputLabel.leadingAnchor),
            trackerInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            trackerInput.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            goalTitle.topAnchor.constraint(equalTo: trackerInput.bottomAnchor, constant: 30),
            goalTitle.leadingAnchor.constraint(equalTo: trackerInputLabel.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            yesGoal.topAnchor.constraint(equalTo: goalTitle.bottomAnchor, constant: 10),
            yesGoal.leadingAnchor.constraint(equalTo: goalTitle.leadingAnchor),
            yesGoal.widthAnchor.constraint(equalToConstant: 60),
            yesGoal.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        NSLayoutConstraint.activate([
            noGoal.topAnchor.constraint(equalTo: yesGoal.topAnchor),
            noGoal.leadingAnchor.constraint(equalTo: yesGoal.trailingAnchor, constant: 4),
            noGoal.widthAnchor.constraint(equalTo: yesGoal.widthAnchor),
            noGoal.heightAnchor.constraint(equalTo: yesGoal.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            goalQuantity.topAnchor.constraint(equalTo: yesGoal.topAnchor),
            goalQuantity.leadingAnchor.constraint(equalTo: noGoal.trailingAnchor, constant: 8),
            goalQuantity.widthAnchor.constraint(equalToConstant: 100),
            goalQuantity.heightAnchor.constraint(equalTo: yesGoal.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            detailInputLabel1.topAnchor.constraint(equalTo: yesGoal.bottomAnchor, constant: 30),
            detailInputLabel1.leadingAnchor.constraint(equalTo: trackerInputLabel.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            detailInput1.topAnchor.constraint(equalTo: detailInputLabel1.bottomAnchor, constant: 10),
            detailInput1.leadingAnchor.constraint(equalTo: trackerInputLabel.leadingAnchor),
            detailInput1.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -5),
            detailInput1.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            detailInput1TypeView.topAnchor.constraint(equalTo: detailInput1.topAnchor),
            detailInput1TypeView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 5),
            detailInput1TypeView.heightAnchor.constraint(equalToConstant: 40),
            detailInput1TypeView.trailingAnchor.constraint(equalTo: trackerInput.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            detailInput2.topAnchor.constraint(equalTo: detailInput1.bottomAnchor, constant: 7),
            detailInput2.leadingAnchor.constraint(equalTo: detailInput1.leadingAnchor),
            detailInput2.trailingAnchor.constraint(equalTo: detailInput1.trailingAnchor),
            detailInput2.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            detailInput2TypeView.topAnchor.constraint(equalTo: detailInput2.topAnchor),
            detailInput2TypeView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 5),
            detailInput2TypeView.heightAnchor.constraint(equalToConstant: 40),
            detailInput2TypeView.trailingAnchor.constraint(equalTo: trackerInput.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            detailInput3.topAnchor.constraint(equalTo: detailInput2.bottomAnchor, constant: 7),
            detailInput3.leadingAnchor.constraint(equalTo: detailInput1.leadingAnchor),
            detailInput3.trailingAnchor.constraint(equalTo: detailInput1.trailingAnchor),
            detailInput3.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            detailInput3TypeView.topAnchor.constraint(equalTo: detailInput3.topAnchor),
            detailInput3TypeView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 5),
            detailInput3TypeView.heightAnchor.constraint(equalToConstant: 40),
            detailInput3TypeView.trailingAnchor.constraint(equalTo: trackerInput.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            saveTrackerButton.topAnchor.constraint(equalTo: detailInput3.bottomAnchor, constant: 100),
            saveTrackerButton.heightAnchor.constraint(equalToConstant: 60),
            saveTrackerButton.widthAnchor.constraint(equalToConstant: 280),
            saveTrackerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func exitView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func selectYes() {
        
        yesGoal.backgroundColor = darkBrownColor
        yesGoal.layer.borderColor = darkBrownColor.cgColor
        yesGoal.setTitleColor(.white, for: .normal)
        
        noGoal.backgroundColor = .white
        noGoal.layer.borderColor = lightGrayColor.cgColor
        noGoal.setTitleColor(darkGrayColor, for: .normal)
        
        goalQuantity.isHidden = false
        
    }
    
    @objc func selectNo() {
        
        noGoal.backgroundColor = darkBrownColor
        noGoal.layer.borderColor = darkBrownColor.cgColor
        noGoal.setTitleColor(.white, for: .normal)
        
        yesGoal.backgroundColor = .white
        yesGoal.layer.borderColor = lightGrayColor.cgColor
        yesGoal.setTitleColor(darkGrayColor, for: .normal)
        
        goalQuantity.isHidden = true
    }
    
    @objc func dropdown1Appears() {
        detailInput1Type.dataSource = dropDownData
        detailInput1Type.anchorView = detailInput1TypeView
        detailInput1Type.bottomOffset = CGPoint(x:0, y:40)
        detailInput1Type.show()
        detailInput1Type.selectionAction = { [unowned self] (index: Int, item: String) in
            self.detailInput1TypeView.setTitle(item, for: .normal)
        }
    }
    
    @objc func dropdown2Appears() {
        detailInput2Type.dataSource = dropDownData
        detailInput2Type.anchorView = detailInput2TypeView
        detailInput2Type.bottomOffset = CGPoint(x:0, y:40)
        detailInput2Type.show()
        detailInput2Type.selectionAction = { [unowned self] (index: Int, item: String) in
            self.detailInput2TypeView.setTitle(item, for: .normal)
        }
    }
    
    @objc func dropdown3Appears() {
        detailInput3Type.dataSource = dropDownData
        detailInput3Type.anchorView = detailInput3TypeView
        detailInput3Type.bottomOffset = CGPoint(x:0, y:40)
        detailInput3Type.show()
        detailInput3Type.selectionAction = { [unowned self] (index: Int, item: String) in
            self.detailInput3TypeView.setTitle(item, for: .normal)
        }
    }
    
    @objc func saveTapped() {
        var templates = [Template]()
        if let template1Name = detailInput1.text, let template1Type = detailInput1TypeView.currentTitle {
            var detailOne = Template(templateName: template1Name, templateType: template1Type)
            templates.append(detailOne)
            }
        if let template2Name = detailInput2.text, let template2Type = detailInput2TypeView.currentTitle {
            var detailTwo = Template(templateName: template2Name, templateType: template2Type)
            templates.append(detailTwo)
            }
        if let template3Name = detailInput3.text, let template3Type = detailInput3TypeView.currentTitle {
            var detailThree = Template(templateName: template3Name, templateType: template3Type)
            templates.append(detailThree)
            }
            
        
        if let name = trackerInput.text {
            NetworkManager.addTracker(name: name, templates: templates) {
                self.dismiss(animated: true)
            }
        }
    }
}
