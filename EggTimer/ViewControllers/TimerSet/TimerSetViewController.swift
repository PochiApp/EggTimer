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
    }
    
    private func setUpEggImageStackView() {
        eggImageStackView = UIStackView()
        eggImageStackView.backgroundColor = .blue
        eggImageStackView.axis = .horizontal
        eggImageStackView.distribution = .fillEqually
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
            eggImageStackView.heightAnchor.constraint(equalToConstant: 300),
            
                ])
    }
}
