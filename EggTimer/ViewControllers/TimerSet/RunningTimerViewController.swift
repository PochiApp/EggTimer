//
//  runningTimerViewController.swift
//  EggTimer
//
//  Created by 嶺澤美帆 on 2024/07/23.
//

import UIKit

class RunningTimerViewController: UIViewController {
    
    let boilingEggImageView = UIImageView()
    var eggFrameImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //タイマーカウントダウン時のアニメーションを行う背景となるViewを作成
        let boilingEggBackView = UIView()
        boilingEggBackView.backgroundColor = UIColor(red: 113/255, green: 135/255, blue: 235/255, alpha: 1.0)
        boilingEggBackView.layer.cornerRadius = 18
        boilingEggBackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(boilingEggBackView)
        
        NSLayoutConstraint.activate([
            boilingEggBackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            boilingEggBackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            boilingEggBackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            boilingEggBackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10)
        ])
        
        //アニメーションのコマとなる画像を1枚ずつ配列に格納
        while let eggFrame = UIImage(named:"Frame\(eggFrameImages.count+1)") {
            eggFrameImages.append(eggFrame)
        }
        
        //ImageViewの配置
        boilingEggImageView.image = UIImage(named:"Frame1")
        boilingEggImageView.contentMode = .scaleAspectFit
        boilingEggImageView.translatesAutoresizingMaskIntoConstraints = false
        
        boilingEggBackView.addSubview(boilingEggImageView)
        
        NSLayoutConstraint.activate([
            boilingEggImageView.topAnchor.constraint(equalTo: boilingEggBackView.topAnchor, constant: 30),
            boilingEggImageView.centerXAnchor.constraint(equalTo: boilingEggBackView.centerXAnchor),
            boilingEggImageView.widthAnchor.constraint(equalToConstant: 250),
            boilingEggImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    //タイマー開始ボタンを押下時に開始するアニメーションのメソッド
    func startBoilingEggAnimation() {
        boilingEggImageView.animationImages = eggFrameImages
        boilingEggImageView.animationDuration = 2.0
        boilingEggImageView.startAnimating()
    }
}
