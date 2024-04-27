//
//  TimerSetTabPageViewController.swift
//  EggTimer
//
//  Created by 嶺澤美帆 on 2024/04/21.
//

import UIKit

final class TimerSetTabPageViewController: UIPageViewController {
    
    private var pageViewController: UIPageViewController!
    private var controllers: [UIViewController] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setPageViewController()
    }
    
    private func setPageViewController(){
        let timerSetViewController = TimerSetViewController()
        timerSetViewController.view.backgroundColor = .blue
        
        let timerCountViewController = TimerCountViewController()
        timerCountViewController.view.backgroundColor = .yellow
        
        self.controllers = [timerSetViewController, timerCountViewController]
        
        setViewControllers([self.controllers[0]], direction: .forward, animated: false, completion: nil)
        
        self.dataSource = self
    }
}
    
    extension TimerSetTabPageViewController: UIPageViewControllerDataSource {
        func pageViewController (_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            if let index = self.controllers.firstIndex(of: viewController),
               index < self.controllers.count - 1 {
                return self.controllers[index + 1]
            } else {
                return nil
            }
        }
        
        func pageViewController (_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            if let index = self.controllers.firstIndex(of: viewController),
               index > 0 {
                return self.controllers[index - 1]
            } else {
                return nil
            }
        }
    }
    
