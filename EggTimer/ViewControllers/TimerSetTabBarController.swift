//
//  MainNavigationViewController.swift
//  EggTimer
//
//  Created by 嶺澤美帆 on 2024/04/21.
//

import UIKit

final class TimerSetTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupTimerTab()
    }
    
    private func setupTimerTab(){
        let timerSetViewController = TimerSetViewController()
        timerSetViewController.tabBarItem = UITabBarItem(title:"タイマー設定", image: UIImage(named: "timer.square"), tag:0)
        
        let timerCountViewController = TimerCountViewController()
        timerCountViewController.tabBarItem = UITabBarItem(title:"保存済", image: UIImage(named: "square.and.arrow.down"), tag:0)
        
        self.viewControllers = [timerSetViewController, timerCountViewController]
        
        tabBar.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width)
        
    }
    
}
