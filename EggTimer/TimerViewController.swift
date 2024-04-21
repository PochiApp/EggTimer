//
//  TimerViewController.swift
//  EggTimer
//
//  Created by 嶺澤美帆 on 2024/04/21.
//

import UIKit

final class TimerViewController: UIViewController {
    
    let centerLabel: UILabel = {
        let label = UILabel()
        label.text = "Timer"
        label.font = UIFont.boldSystemFont(ofSize: 70.0)
        label.textColor = UIColor.white
        return label
    }()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .blue
        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerLabel)
        NSLayoutConstraint.activate([
            centerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
