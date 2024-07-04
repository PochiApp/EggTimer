//
//  TimerSetViewController.swift
//  EggTimer
//
//  Created by 嶺澤美帆 on 2024/04/22.
//

import UIKit

class TimerSetViewController: UIViewController {
    
    private var eggImageView: UIImageView!
    private var eggImageStackView: UIStackView!
    private var boiledDegreeStackView: UIStackView!
    private var sizeStackView: UIStackView!
    private var eggSavedStackView: UIStackView!
    private var timerToAddEggsStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpEggImageStackView()
        
//        setUpBoiledDegreeStackView()
        
        setUpTimmerSettingStackView(labelText: "半熟度合い", SegconSelectName: ["温泉卵", "半半熟", "半熟", "半熟より固め", "固め"], selectedSegmentIndex: 0)
        
        setUpTimmerSettingStackView(labelText: "卵の大きさ", SegconSelectName: ["S","M","L","XL"], selectedSegmentIndex: 0)
    }
    
    private func setUpEggImageStackView() {
        eggImageStackView = UIStackView()
        eggImageStackView.backgroundColor = .white
        eggImageStackView.axis = .horizontal
        eggImageStackView.distribution = .fill
        eggImageStackView.alignment = .center
        eggImageStackView.spacing = 15
        
        eggImageView = UIImageView(image: UIImage(named: "egg"))
        eggImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let eggLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .white
            label.text = "半熟卵"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        eggImageStackView.addArrangedSubview(eggImageView)
        eggImageStackView.addArrangedSubview(eggLabel)
        self.view.addSubview(eggImageStackView)
        
        eggImageStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eggImageStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant:0),
            eggImageStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            eggImageStackView.widthAnchor.constraint(equalToConstant: 350),
            eggImageStackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setUpBoiledDegreeStackView() {
        boiledDegreeStackView = UIStackView()
        boiledDegreeStackView.backgroundColor = .white
        boiledDegreeStackView.axis = .vertical
        boiledDegreeStackView.distribution = .fill
        boiledDegreeStackView.alignment = .top
        boiledDegreeStackView.spacing = 5
        
        let boiledDegreeLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .white
            label.text = "半熟度合"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let degreeName = ["温泉卵", "半半熟", "半熟", "半熟より固め", "固め"]
        
        let boiledDegreeSegmentedControl = UISegmentedControl(items: degreeName)
        boiledDegreeSegmentedControl.selectedSegmentIndex = 2
        boiledDegreeSegmentedControl.backgroundColor = .white
        boiledDegreeSegmentedControl.selectedSegmentTintColor = .orange
        boiledDegreeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        boiledDegreeStackView.addArrangedSubview(boiledDegreeLabel)
        boiledDegreeStackView.addArrangedSubview(boiledDegreeSegmentedControl)
        self.view.addSubview(boiledDegreeStackView)
        
        boiledDegreeStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            boiledDegreeSegmentedControl.heightAnchor.constraint(equalToConstant: 30),
            
            boiledDegreeStackView.topAnchor.constraint(equalTo: eggImageStackView.bottomAnchor, constant:0),
            boiledDegreeStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            boiledDegreeStackView.widthAnchor.constraint(equalToConstant: 350),
            boiledDegreeStackView.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    private func setUpTimmerSettingStackView(labelText: String, SegconSelectName: [String], selectedSegmentIndex: Int) {
        boiledDegreeStackView = UIStackView()
        boiledDegreeStackView.backgroundColor = .white
        boiledDegreeStackView.axis = .vertical
        boiledDegreeStackView.distribution = .fill
        boiledDegreeStackView.alignment = .top
        boiledDegreeStackView.spacing = 5
        
        let boiledDegreeLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .white
            label.text = labelText
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let boiledDegreeSegmentedControl = UISegmentedControl(items: SegconSelectName)
        boiledDegreeSegmentedControl.selectedSegmentIndex = selectedSegmentIndex
        boiledDegreeSegmentedControl.backgroundColor = .white
        boiledDegreeSegmentedControl.selectedSegmentTintColor = .orange
        boiledDegreeSegmentedControl.autoresizingMask = .flexibleWidth
        boiledDegreeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        boiledDegreeStackView.addArrangedSubview(boiledDegreeLabel)
        boiledDegreeStackView.addArrangedSubview(boiledDegreeSegmentedControl)
        let existingSubviews = self.view.subviews
        
        self.view.addSubview(boiledDegreeStackView)
        
        boiledDegreeStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            boiledDegreeSegmentedControl.heightAnchor.constraint(equalToConstant: 40),
            boiledDegreeSegmentedControl.widthAnchor.constraint(equalToConstant: 350),
            
            boiledDegreeStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            boiledDegreeStackView.widthAnchor.constraint(equalToConstant: 350),
            boiledDegreeStackView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        if let lastSubview = existingSubviews.last {
            NSLayoutConstraint.activate([boiledDegreeStackView.topAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant:20)])
        }
    }
}
