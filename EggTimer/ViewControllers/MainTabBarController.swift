//
//  MainTabBarController.swift
//  EggTimer
//
//  Created by 嶺澤美帆 on 2024/04/21.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTab()
        
    }
    
    private func setupTab() {
        
        let timerSetViewController = TimerSetTabPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        timerSetViewController.tabBarItem = UITabBarItem(title: "Timer", image: UIImage(systemName: "timer"), tag: 0)
        
        let settingsViewController = SettingsViewController()
        settingsViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), tag: 0)
        
        viewControllers = [timerSetViewController, settingsViewController]
    
    }

}

