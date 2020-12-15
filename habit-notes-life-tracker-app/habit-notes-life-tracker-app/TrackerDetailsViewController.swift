//
//  TrackerDetailsViewController.swift
//  habit-notes-life-tracker-app
//
//  Created by Rylee Hickman on 12/6/20.
//  Copyright © 2020 Rylee Hickman. All rights reserved.
//

import UIKit
import PNChart

class TrackerDetailsViewController: UIViewController {
    var exitButton: UIButton!
    var summaryLabel: UILabel!
    var detailLabel: UILabel!
    var saveTrackerButton: UIButton!
    
    let lightGrayColor = UIColor(red: 0.77, green: 0.77, blue: 0.77, alpha: 1.00)
    let darkGrayColor = UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1.00)
    let lightBrownColor = UIColor(red: 0.87, green: 0.83, blue: 0.82, alpha: 1.00)
    let darkBrownColor = UIColor(red: 0.29, green: 0.19, blue: 0.16, alpha: 1.00)
    
    let fontSize = UIFont.systemFont(ofSize: 13, weight: .medium)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let lineChart = self.setLineChart()
        let barChart = self.setBarChart()
        view.backgroundColor = .white
        self.view.addSubview(barChart)
        
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
        
        summaryLabel = UILabel()
        summaryLabel.text = "Summary"
        summaryLabel.textColor = darkGrayColor
        summaryLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(summaryLabel)
        
        detailLabel = UILabel()
        detailLabel.text = "Daily Progress"
        detailLabel.textColor = darkBrownColor
        detailLabel.textAlignment = .right
        detailLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailLabel)
        
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
            summaryLabel.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 10),
            summaryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            detailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            detailLabel.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor, constant: 50 )
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
    
    
    private func setLineChart() -> PNLineChart {
           let lineChart = PNLineChart(frame: CGRect(x: 0, y: 155, width: 320, height: 450))
           lineChart.yLabelFormat = "%1.1f"
           lineChart.showLabel = true
           lineChart.backgroundColor = UIColor.clear
           lineChart.xLabels = ["Sep 1", "Sep 2", "Sep 3", "Sep 4", "Sep 5", "Sep 6", "Sep 7"]
           lineChart.isShowCoordinateAxis = true
           lineChart.center = self.view.center
           
           let dataArr = [60.1, 160.1, 126.4, 232.2, 186.2, 127.2, 176.2]
           var dataEntries: [PNLineChartData] = []
           for i in 0..<dataArr.count {
            let dataEntry = PNLineChartData()
            //dataEntry.getData(UInt(dataArr[i]))
            dataEntries.append(dataEntry)
           }

           
           //lineChart.chartData = [data_]
           lineChart.stroke()
           return lineChart
       }
    
    private func setBarChart() -> PNBarChart {
        let barChart = PNBarChart(frame: CGRect(x: 0, y: 135, width: 320, height: 350))
        barChart.backgroundColor = UIColor.clear
        barChart.labelMarginTop = 3.0
        barChart.xLabels = ["Sep 1", "Sep 2", "Sep 3", "Sep 4", "Sep 5", "Sep 6", "Sep 7"]
        barChart.yValues = [1, 23, 12, 18, 30, 12, 21]
        barChart.chartMarginBottom = CGFloat(50)
        barChart.stroke()
        barChart.center = self.view.center
        return barChart
    }


}
