//
//  TimerSetTabPageViewController.swift
//  EggTimer
//
//  Created by 嶺澤美帆 on 2024/04/21.
//

import UIKit

final class TimerSetTabPageViewController: UIViewController {
    
    private var pageViewController: UIPageViewController!
    private var controllers: [UIViewController] = []
    private var segmentTextContent: [String] = ["タイマー設定", "デフォルト"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setPageViewController()
        
        setSegmentController()
    }
    
    private func setPageViewController(){
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        let timerSetViewController = TimerSetViewController()
        
        let timerCountViewController = TimerCountViewController()
        
        self.controllers = [timerSetViewController, timerCountViewController]
        
        pageViewController.setViewControllers([self.controllers[0]], direction: .forward, animated: false, completion: nil)
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        addChild(pageViewController)
        self.view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    
    private func setSegmentController() {
        let segmentedController = UISegmentedControl(items: segmentTextContent)
        segmentedController.selectedSegmentIndex = 0
        segmentedController.autoresizingMask = .flexibleWidth
        segmentedController.frame = CGRect(x: 0, y: 0, width: 400, height: 30)
        segmentedController.addTarget(self, action: #selector(timerSetViewMoved), for: .valueChanged)
        self.navigationItem.titleView = segmentedController
        
    }
    
    @objc func timerSetViewMoved() {
        
    }
}
    
    extension TimerSetTabPageViewController:  UIPageViewControllerDataSource,UIPageViewControllerDelegate {
        func pageViewController (_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            if let index = self.controllers.firstIndex(of: viewController),
                index > 0 {
                return self.controllers[index - 1]
            } else {
                return nil
            }
        }
        
        func pageViewController (_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            if let index = self.controllers.firstIndex(of: viewController),
               index < self.controllers.count - 1 {
                return self.controllers[index + 1]
            } else {
                return nil
            }
        }
        
       
    }
    
