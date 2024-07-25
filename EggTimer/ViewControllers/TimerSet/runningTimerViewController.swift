//
//  runningTimerViewController.swift
//  EggTimer
//
//  Created by 嶺澤美帆 on 2024/07/23.
//

import UIKit

class runningTimerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let boilingEggsView = UIView()
        boilingEggsView.backgroundColor = UIColor(red: 113/255, green: 135/255, blue: 235/255, alpha: 1.0)
        boilingEggsView.layer.cornerRadius = 18
        boilingEggsView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(boilingEggsView)
        
        NSLayoutConstraint.activate([
            boilingEggsView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            boilingEggsView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            boilingEggsView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            boilingEggsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10)
        ])
    }
}
