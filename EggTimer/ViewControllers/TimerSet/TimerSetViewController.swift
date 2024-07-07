//
//  TimerSetViewController.swift
//  EggTimer
//
//  Created by 嶺澤美帆 on 2024/04/22.
//

import UIKit

class TimerSetViewController: UIViewController {
    
    private var eggImageView: UIImageView!
    private var boiledDegreeLabel: UILabel!
    private var eggImageStackView: UIStackView!
    private var boiledDegreeSegmentedControl: UISegmentedControl!
    private var eggSizeSegmentedControl: UISegmentedControl!
    private var eggTemperatureSegmentedControl: UISegmentedControl!
    private var timeToAddEggSegmentedControl: UISegmentedControl!
    private var boiledDegreeStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpEggImageStackView()
        
        setUpTimmerSettingStackView(labelText: "半熟度合い", SegconSelectName: ["温泉卵", "とろとろ", "半熟", "固め"], selectedSegmentIndex: 0)
        
        setUpTimmerSettingStackView(labelText: "卵の大きさ", SegconSelectName: ["S","M","L","XL"], selectedSegmentIndex: 0)
        
        setUpTimmerSettingStackView(labelText: "卵の温度", SegconSelectName: ["常温に戻している", "冷蔵庫から出してすぐ"], selectedSegmentIndex: 0)
        
        setUpTimmerSettingStackView(labelText: "卵を入れるタイミング", SegconSelectName: ["水から", "お湯から"], selectedSegmentIndex: 0)
    }
    
    private func setUpEggImageStackView() {
        eggImageStackView = UIStackView()
        eggImageStackView.backgroundColor = .white
        eggImageStackView.axis = .vertical
        eggImageStackView.distribution = .fill
        eggImageStackView.alignment = .center
        eggImageStackView.spacing = 15
        
        eggImageView = UIImageView(image: UIImage(named: "onsenEgg"))
        eggImageView.translatesAutoresizingMaskIntoConstraints = false
        
        boiledDegreeLabel = UILabel()
        boiledDegreeLabel.text = "温泉卵"
        boiledDegreeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        eggImageStackView.addArrangedSubview(eggImageView)
        eggImageStackView.addArrangedSubview(boiledDegreeLabel)
        self.view.addSubview(eggImageStackView)
        
        eggImageStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eggImageStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant:0),
            eggImageStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            eggImageStackView.widthAnchor.constraint(equalToConstant: 350),
            eggImageStackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setUpTimmerSettingStackView(labelText: String, SegconSelectName: [String], selectedSegmentIndex: Int) {
        boiledDegreeStackView = UIStackView()
        boiledDegreeStackView.backgroundColor = .white
        boiledDegreeStackView.axis = .vertical
        boiledDegreeStackView.distribution = .fill
        boiledDegreeStackView.alignment = .top
        boiledDegreeStackView.spacing = 5
        
        let eggLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .white
            label.text = labelText
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        switch labelText {
        case "半熟度合い":
            boiledDegreeSegmentedControl = UISegmentedControl(items: SegconSelectName)
            boiledDegreeSegmentedControl.selectedSegmentIndex = selectedSegmentIndex
            boiledDegreeSegmentedControl.backgroundColor = .white
            boiledDegreeSegmentedControl.selectedSegmentTintColor = .orange
            boiledDegreeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
            boiledDegreeStackView.addArrangedSubview(eggLabel)
            boiledDegreeStackView.addArrangedSubview(boiledDegreeSegmentedControl)
            boiledDegreeSegmentedControl.addTarget(self, action: #selector(labelAndImageChanged), for: .valueChanged)
            boiledDegreeSegmentedControl.addTarget(self, action: #selector(timerChanged), for: .valueChanged)
            
            NSLayoutConstraint.activate([
                boiledDegreeSegmentedControl.heightAnchor.constraint(equalToConstant: 40),
                boiledDegreeSegmentedControl.widthAnchor.constraint(equalToConstant: 350)])
            
        case "卵の大きさ":
            eggSizeSegmentedControl = UISegmentedControl(items: SegconSelectName)
            eggSizeSegmentedControl.selectedSegmentIndex = selectedSegmentIndex
            eggSizeSegmentedControl.backgroundColor = .white
            eggSizeSegmentedControl.selectedSegmentTintColor = .orange
            eggSizeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
            boiledDegreeStackView.addArrangedSubview(eggLabel)
            boiledDegreeStackView.addArrangedSubview(eggSizeSegmentedControl)
            eggSizeSegmentedControl.addTarget(self, action: #selector(timerChanged), for: .valueChanged)
            
            NSLayoutConstraint.activate([
                eggSizeSegmentedControl.heightAnchor.constraint(equalToConstant: 40),
                eggSizeSegmentedControl.widthAnchor.constraint(equalToConstant: 350)])
            
        case "卵の温度":
            eggTemperatureSegmentedControl = UISegmentedControl(items: SegconSelectName)
            eggTemperatureSegmentedControl.selectedSegmentIndex = selectedSegmentIndex
            eggTemperatureSegmentedControl.backgroundColor = .white
            eggTemperatureSegmentedControl.selectedSegmentTintColor = .orange
            eggTemperatureSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
            boiledDegreeStackView.addArrangedSubview(eggLabel)
            boiledDegreeStackView.addArrangedSubview(eggTemperatureSegmentedControl)
            eggTemperatureSegmentedControl.addTarget(self, action: #selector(timerChanged), for: .valueChanged)
                                                     
            NSLayoutConstraint.activate([
                eggTemperatureSegmentedControl.heightAnchor.constraint(equalToConstant: 40),
                eggTemperatureSegmentedControl.widthAnchor.constraint(equalToConstant: 350)])
        
        case "卵を入れるタイミング":
            timeToAddEggSegmentedControl = UISegmentedControl(items: SegconSelectName)
            timeToAddEggSegmentedControl.selectedSegmentIndex = selectedSegmentIndex
            timeToAddEggSegmentedControl.backgroundColor = .white
            timeToAddEggSegmentedControl.selectedSegmentTintColor = .orange
            timeToAddEggSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
            boiledDegreeStackView.addArrangedSubview(eggLabel)
            boiledDegreeStackView.addArrangedSubview(timeToAddEggSegmentedControl)
            timeToAddEggSegmentedControl.addTarget(self, action: #selector(timerChanged), for: .valueChanged)
                                                     
            NSLayoutConstraint.activate([
                timeToAddEggSegmentedControl.heightAnchor.constraint(equalToConstant: 40),
                timeToAddEggSegmentedControl.widthAnchor.constraint(equalToConstant: 350)])
            
        default:
            break
        }
        
        let existingSubviews = self.view.subviews
                                                 
        self.view.addSubview(boiledDegreeStackView)
                                                 
        boiledDegreeStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            boiledDegreeStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            boiledDegreeStackView.widthAnchor.constraint(equalToConstant: 350),
            boiledDegreeStackView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        if let lastSubview = existingSubviews.last {
            NSLayoutConstraint.activate([boiledDegreeStackView.topAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant:20)])
            
        }
    }
    
    @objc func labelAndImageChanged(_ segcon: UISegmentedControl) {
        boiledDegreeLabel.text = segcon.titleForSegment(at: segcon.selectedSegmentIndex)
        
        switch segcon.selectedSegmentIndex {
        case 0:
            eggImageView.image = UIImage(named: "onsenEgg")
        
        case 1:
            eggImageView.image = UIImage(named: "torotoroEgg")
            
        case 2:
            eggImageView.image = UIImage(named: "softboiledEgg")
            
        case 3:
            eggImageView.image = UIImage(named: "katayudeEgg")
            
        default:
            break
        }
    }
    
    @objc func timerChanged(_ segcon: UISegmentedControl) {
        let selectedSegmentTitles = (boiledDegreeSegmentedControl.selectedSegmentIndex, eggSizeSegmentedControl.selectedSegmentIndex, eggTemperatureSegmentedControl.selectedSegmentIndex, timeToAddEggSegmentedControl.selectedSegmentIndex)
        
        switch selectedSegmentTitles {
        case (0, 0, 0, 0):
            
        }
    }
    
}
