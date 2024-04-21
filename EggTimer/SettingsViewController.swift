//
//  SettingsViewController.swift
//  EggTimer
//
//  Created by 嶺澤美帆 on 2024/04/21.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    let centerLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.font = UIFont.boldSystemFont(ofSize: 70.0)
        label.textColor = UIColor.white
        return label
    }()
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .orange
        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerLabel)
        NSLayoutConstraint.activate([
            centerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
