//
//  TimerSetViewController.swift
//  EggTimer
//
//  Created by 嶺澤美帆 on 2024/04/22.
//

import UIKit

class TimerSetViewController: UIViewController {
    
    private var eggImageView: UIImageView!
    private var boiledDegreeLabel = UILabel()
    private var countDownLabel = UILabel()
    private var time: TimeInterval = 3
    private var eggImageStackView: UIStackView!
    private var boiledDegreeSegmentedControl: UISegmentedControl!
    private var eggSizeSegmentedControl: UISegmentedControl!
    private var eggTemperatureSegmentedControl: UISegmentedControl!
    private var timeToAddEggSegmentedControl: UISegmentedControl!
    private var boiledDegreeStackView: UIStackView!
    let timerFormatter = {
        var timerFormatter = DateComponentsFormatter()
        timerFormatter.unitsStyle = .positional
        timerFormatter.allowedUnits = [.minute, .second]
        timerFormatter.zeroFormattingBehavior = .pad
        return timerFormatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUpEggImageStackView()
        
        setUpTimmerSettingStackView(labelText: "半熟度合い", SegconSelectName: ["とろとろ", "半熟", "固め"], selectedSegmentIndex: 0)
        
        setUpTimmerSettingStackView(labelText: "卵の大きさ", SegconSelectName: ["S","M","L"], selectedSegmentIndex: 0)
        
        setUpTimmerSettingStackView(labelText: "卵の温度", SegconSelectName: ["常温に戻している", "冷蔵庫から出してすぐ"], selectedSegmentIndex: 0)
        
        setUpTimmerSettingStackView(labelText: "卵を入れるタイミング", SegconSelectName: ["水から", "お湯から"], selectedSegmentIndex: 0)
        
        setUpStartTimerButton()
    }
    
    private func setUpEggImageStackView() {
        eggImageStackView = UIStackView()
        eggImageStackView.backgroundColor = .white
        eggImageStackView.axis = .vertical
        eggImageStackView.distribution = .equalSpacing
        eggImageStackView.alignment = .center
        eggImageStackView.spacing = 15
        
        eggImageView = UIImageView(image: UIImage(named: "torotoroEgg"))
        eggImageView.translatesAutoresizingMaskIntoConstraints = false

        boiledDegreeLabel.text = "とろとろ"
        boiledDegreeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        countDownLabel.text = timerFormatter().string(from: time)
        countDownLabel.font = UIFont.systemFont(ofSize: 50)
        countDownLabel.translatesAutoresizingMaskIntoConstraints = false
        
        eggImageStackView.addArrangedSubview(eggImageView)
        eggImageStackView.addArrangedSubview(boiledDegreeLabel)
        eggImageStackView.addArrangedSubview(countDownLabel)
        
        self.view.addSubview(eggImageStackView)
        
        eggImageStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eggImageStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant:0),
            eggImageStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            eggImageStackView.widthAnchor.constraint(equalToConstant: 350),
            eggImageStackView.heightAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    //Label+SegmentedControlのStackViewを生成
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
        
        //labelTextごとにインスタンス化するSegmentedControlを分別
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
        
        //boiledDegreeStackViewをSubviewとして追加する前に、現時点でのsubViewsの配列をexistingSubviewsとしておく
        let existingSubviews = self.view.subviews
                                                 
        self.view.addSubview(boiledDegreeStackView)
                                                 
        boiledDegreeStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            boiledDegreeStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            boiledDegreeStackView.widthAnchor.constraint(equalToConstant: 350),
            boiledDegreeStackView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        //existingSubviewsの配列最後のViewの下20ptにboiledDegreeStackViewを配置していく
        if let lastSubview = existingSubviews.last {
            NSLayoutConstraint.activate([boiledDegreeStackView.topAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant:10)])
        }
    }
    
    //タイマー開始ボタンの作成
    private func setUpStartTimerButton() {
        var configuration = UIButton.Configuration.tinted()
        configuration.title = "タイマースタート"
        configuration.baseForegroundColor = .black
        configuration.image = UIImage(systemName: "timer")
        configuration.imagePlacement = .leading
        configuration.background.backgroundColor = .orange
        let startTimerButton = UIButton(configuration: configuration)
        
        let existingSubviews = self.view.subviews
        
        self.view.addSubview(startTimerButton)
        startTimerButton.translatesAutoresizingMaskIntoConstraints = false
        startTimerButton.addTarget(self, action: #selector(timerCountDown), for: .touchUpInside)
        
        if let lastSubview = existingSubviews.last {
            NSLayoutConstraint.activate([
                startTimerButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                startTimerButton.topAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant:20)])
        }
    }
    
    //選択した半熟度合いに応じて、卵のimageと半熟度合いを示すtextの変更
    @objc func labelAndImageChanged(_ segcon: UISegmentedControl) {
        boiledDegreeLabel.text = segcon.titleForSegment(at: segcon.selectedSegmentIndex)
        
        switch segcon.selectedSegmentIndex {
        case 0:
            eggImageView.image = UIImage(named: "torotoroEgg")
            
        case 1:
            eggImageView.image = UIImage(named: "softboiledEgg")
            
        case 2:
            eggImageView.image = UIImage(named: "katayudeEgg")
            
        default:
            break
        }
    }
    
    //選択した各セグメントに応じて、タイマー表示を分岐
    @objc func timerChanged(_ segcon: UISegmentedControl) {
        let selectedBoiledDegree = boiledDegreeSegmentedControl.selectedSegmentIndex
        let selectedEggSize = eggSizeSegmentedControl.selectedSegmentIndex
        let selectedEggTemperature = eggTemperatureSegmentedControl.selectedSegmentIndex
        let selectedTimeToAddEgg = timeToAddEggSegmentedControl.selectedSegmentIndex
        let selectedSegmentTitles = (selectedBoiledDegree, selectedEggSize)
        
        if selectedTimeToAddEgg == 0 {
            switch selectedSegmentTitles {
            case (0, 0):
                time = 7 * 60 + 40
            
            case (1, 0):
                time = 9 * 60 + 40
                
            case (2, 0):
                time = 12 * 60 + 40
            
            case (0, 1):
                time = 8 * 60
            
            case (0, 2):
                time = 8 * 60 + 20
                
            case (1, 1):
                time = 10 * 60
                
            case (1, 2):
                time = 10 * 60 + 20
                
            case(2, 1):
                time = 13 * 60
                
            case(2, 2):
                time = 13 * 60 + 20
                
            default:
                break
            }
        } else {
            switch selectedSegmentTitles {
            case (0, 0):
                time = 5 * 60 + 10
            
            case (1, 0):
                time = 7 * 60 + 10
                
            case (2, 0):
                time = 8 * 60 + 40
            
            case (0, 1):
                time = 5 * 60 + 30
            
            case (0, 2):
                time = 5 * 60 + 50
                
            case (1, 1):
                time = 7 * 60 + 30
                
            case (1, 2):
                time = 7 * 60 + 50
                
            case(2, 1):
                time = 9 * 60
                
            case(2, 2):
                time = 9 * 60 + 20
                
            default:
                break
            }
        }
        
        //冷蔵庫から出してすぐの卵の場合、秒数+60
        if selectedEggTemperature == 1 {
            time += 60
        }
        
        //timeをString変換
        countDownLabel.text = timerFormatter().string(from: time)
    }
    
    @objc func timerCountDown() {
        let countDownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ timer in
            self.time -= 1
            self.countDownLabel.text = self.timerFormatter().string(from: self.time)
            
            if self.time == 0 {
                timer.invalidate()
            }
        }
        RunLoop.current.add(countDownTimer, forMode: .common)
    }
}
