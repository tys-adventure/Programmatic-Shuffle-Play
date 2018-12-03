//
//  PageViewController.swift
//  Shuffle Plus Play
//
//  Created by Thom Pheijffer on 28/10/2018.
//  Copyright © 2018 Thom Pheijffer. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    
    var pageControlBottomConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        
        let initialPage = 0
        //let initialPage = 1
        
        
        //let page1 = BlueViewController()
        let page1 = AboutViewController()
        let page2 = NowPlayingViewController()
        let page3 = AboutDevelopersViewController()
        
        // add the individual viewControllers to the pageViewController
        self.pages.append(page1)
        self.pages.append(page2)
        self.pages.append(page3)
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        
        // pageControl
        self.pageControl.frame = CGRect()
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.pageControl.numberOfPages = self.pages.count
        self.pageControl.currentPage = initialPage
        
        self.pageControl.isHidden = false
        
        self.view.addSubview(self.pageControl)
        
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        //self.pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -5).isActive = true
        self.pageControl.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20).isActive = true
        self.pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        pageControlBottomConstraint = NSLayoutConstraint(item: self.view, attribute: .bottom, relatedBy: .equal, toItem: pageControl, attribute: .bottom, multiplier: 1, constant: 20)
        pageControlBottomConstraint.isActive = true
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        //let initialPage = 1
        
        //        //let page1 = BlueViewController()
        //        let page1 = AboutViewController()
        //        let page2 = NowPlayingViewController()
        //        let page3 = AboutDevelopersViewController()
        //
        //        // add the individual viewControllers to the pageViewController
        //        self.pages.append(page1)
        //        self.pages.append(page2)
        //        self.pages.append(page3)
        
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0, initialSpringVelocity: 0.5, options: [], animations: {
            
            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.2, execute: {
                self.setViewControllers([self.pages[1]], direction: .forward, animated: true, completion: nil)
            })
            
            
        }, completion: nil)
        
    }
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = self.pages.index(of: viewController) else { return nil }
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else { return nil }
        
        guard self.pages.count > previousIndex else { return nil }
        
        return self.pages[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = self.pages.index(of: viewController) else { return nil }
        
        let nextIndex = vcIndex + 1
        
        guard self.pages.count != nextIndex else { return nil }
        
        guard self.pages.count > nextIndex else { return nil }
        
        return self.pages[nextIndex]
        
    }
    
    //    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
    //        if let viewControllers = pageViewController.viewControllers {
    //            if let VCIndex = self.pages.index(of: viewControllers[0]) {
    //
    //                if VCIndex == 1 {
    //                    print("Noooooooo")
    //                    pageControl.isEnabled = true
    //                    pageControl.isHidden = false
    //                } else {
    //                    print("Yesssss")
    //                    pageControl.isEnabled = false
    //                    pageControl.isHidden = true
    //                }
    //
    //            }
    //        }
    //    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        // set the pageControl.currentPage to the index of the current viewController in pages
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let viewControllerIndex = self.pages.index(of: viewControllers[0]) else { return }
        
        self.pageControl.currentPage = viewControllerIndex
        
        if viewControllerIndex != 1 {
            UIView.animate(withDuration: 0.2, animations: {
                self.pageControl.isEnabled = true
                self.pageControl.isHidden = false
            })
        } else {
            UIView.animate(withDuration: 0.6, animations: {
                self.pageControl.isEnabled = false
                self.pageControl.isHidden = true
            })
        }
        
//        if viewControllerIndex != 1 {
//            print("Noooooooo")
//
//            pageControl.isEnabled = true
//            pageControl.isHidden = false
//        } else {
//            print("Yesssss")
//            pageControl.isEnabled = false
//            pageControl.isHidden = true
//        }
        
        
        
    }
}
