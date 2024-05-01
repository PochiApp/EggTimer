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
    private var segmentedControl: UISegmentedControl!
    private var segmentTextContent: [String] = ["タイマー設定", "デフォルト"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setPageViewController()
        
        setSegmentControl()
        
        self.navigationController?.navigationBar.isTranslucent = true
        edgesForExtendedLayout = .bottom
    }
    
    private func setPageViewController(){
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
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
    
    private func setSegmentControl() {
        segmentedControl = UISegmentedControl(items: segmentTextContent)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.autoresizingMask = .flexibleWidth
        segmentedControl.frame = CGRect(x: 0, y: 0, width: 400, height: 30)
        segmentedControl.addTarget(self, action: #selector(timerSetViewMoved), for: .valueChanged)
        self.navigationItem.titleView = segmentedControl
        
    }
    
    @objc func timerSetViewMoved(segcon: UISegmentedControl) {
        
        switch segcon.selectedSegmentIndex {
        case 0:
            pageViewController.setViewControllers([self.controllers[segcon.selectedSegmentIndex]], direction: .reverse, animated: false)
        case 1:
            pageViewController.setViewControllers([self.controllers[segcon.selectedSegmentIndex]], direction: .forward, animated: false)
        default:
            print("default")
            
        }
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
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed {
                if let currentViewController = pageViewController.viewControllers?.first {
                    if let index = controllers.firstIndex(of: currentViewController) {
                        segmentedControl.selectedSegmentIndex = index
                    }
                }
            }
        }
        
       
    }
    
