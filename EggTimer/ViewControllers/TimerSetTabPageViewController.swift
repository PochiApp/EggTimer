//
//  TimerSetTabPageViewController.swift
//  EggTimer
//
//  Created by 嶺澤美帆 on 2024/04/21.
//

import UIKit

final class TimerSetTabPageViewController: UIPageViewController {
    
    private var pageViewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setPageViewController()
    }
    
    private func setPageViewController(){
        let timerSetViewController = TimerSetViewController()
        timerSetViewController.view.backgroundColor = .blue
        
        let timerCountViewController = TimerCountViewController()
        timerCountViewController.view.backgroundColor = .yellow
        
        self.pageViewControllers = [timerSetViewController, timerCountViewController]
        
    }
    
}
