//
//  NowPlayingViewController.swift
//  Shuffle Plus Play
//
//  Created by Thom Pheijffer on 28/10/2018.
//  Copyright © 2018 Thom Pheijffer. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController {
    
    enum CardState {
        case expanded
        case collapsed
    }
    
    //var cardViewController:CardViewController!
    var genresCardViewController: GenresCardViewController!
    var visualEffectView:UIVisualEffectView!
    
   // #warning("MAke depending on number of genres and screen")
    //let cardHeight:CGFloat = 600
    
    
    var cellHeight: CGFloat!
    var cardHeight: CGFloat = 100 + 40 * 6 + 7 * 30
    //40 = collection view cell heigt
    // * 6 because 11 /2 = 6
    // * 7 because 6 + 1 extra room undernaeat
    //30 = spacing between cells
    
    
    let cardHandleAreaHeight:CGFloat = 52
    
    var cardVisible = false
    var nextState:CardState {
        return cardVisible ? .collapsed : .expanded
    }
    
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellHeight = self.view.frame.width * 0.375 / 3
        cardHeight = 100 + cellHeight * 6 + 7 * 30
        //40 = collection view cell heigt
        // * 6 because 11 /2 = 6
        // * 7 because 6 + 1 extra room undernaeat
        //30 = spacing between cells
        
        setupCard()
        
        self.view.backgroundColor = .red
    }
    
    func setupCard() {
        visualEffectView = UIVisualEffectView()
        visualEffectView.frame = self.view.frame
        self.view.addSubview(visualEffectView)
        
        //        cardViewController = CardViewController(nibName:"CardViewController", bundle:nil)
        //        self.addChild(cardViewController)
        //        cardViewController.view.frame = CGRect(x: 0, y: self.view.frame.height - cardHandleAreaHeight, width: self.view.bounds.width, height: cardHeight)
        //        self.view.addSubview(cardViewController.view)
        //
        //        cardViewController.view.clipsToBounds = true
        
        genresCardViewController = GenresCardViewController(nibName: "GenresCardViewController", bundle: nil)
        self.addChild(genresCardViewController)
        genresCardViewController.view.frame = CGRect(x: 0, y: self.view.frame.height - cardHandleAreaHeight, width: self.view.bounds.width, height: cardHeight)
        self.view.addSubview(genresCardViewController.view)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NowPlayingViewController.handleCardTap(recognzier:)))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(NowPlayingViewController.handleCardPan(recognizer:)))
        
        //        cardViewController.handleArea.addGestureRecognizer(tapGestureRecognizer)
        //        cardViewController.handleArea.addGestureRecognizer(panGestureRecognizer)
        
        genresCardViewController.handleArea.addGestureRecognizer(tapGestureRecognizer)
        genresCardViewController.handleArea.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    @objc
    func handleCardTap(recognzier:UITapGestureRecognizer) {
        switch recognzier.state {
        case .ended:
            animateTransitionIfNeeded(state: nextState, duration: 0.9)
        default:
            break
        }
    }
    
    @objc
    func handleCardPan (recognizer:UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            startInteractiveTransition(state: nextState, duration: 0.9)
        case .changed:
            //let translation = recognizer.translation(in: self.cardViewController.handleArea)
            let translation = recognizer.translation(in: self.genresCardViewController.handleArea)
            var fractionComplete = translation.y / cardHeight
            fractionComplete = cardVisible ? fractionComplete : -fractionComplete
            updateInteractiveTransition(fractionCompleted: fractionComplete)
        case .ended:
            continueInteractiveTransition()
        default:
            break
        }
        
    }
    
    func animateTransitionIfNeeded (state:CardState, duration:TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    //self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardHeight
                    self.genresCardViewController.view.frame.origin.y = self.view.frame.height - self.cardHeight
                case .collapsed:
                    //self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeight
                    self.genresCardViewController.view.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeight
                }
            }
            
            frameAnimator.addCompletion { _ in
                self.cardVisible = !self.cardVisible
                self.runningAnimations.removeAll()
            }
            
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
            
            
            let cornerRadiusAnimator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
                switch state {
                case .expanded:
                    //self.cardViewController.view.layer.cornerRadius = 12
                    self.genresCardViewController.view.layer.cornerRadius = 12
                    self.genresCardViewController.view.clipsToBounds = true
                case .collapsed:
                    //self.cardViewController.view.layer.cornerRadius = 0
                    self.genresCardViewController.view.layer.cornerRadius = 12
                    self.genresCardViewController.view.clipsToBounds = true
                }
            }
            
            cornerRadiusAnimator.startAnimation()
            runningAnimations.append(cornerRadiusAnimator)
            
            let blurAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.visualEffectView.effect = UIBlurEffect(style: .dark)
                case .collapsed:
                    self.visualEffectView.effect = nil
                }
            }
            
            blurAnimator.startAnimation()
            runningAnimations.append(blurAnimator)
            
        }
    }
    
    func startInteractiveTransition(state:CardState, duration:TimeInterval) {
        if runningAnimations.isEmpty {
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        for animator in runningAnimations {
            animator.pauseAnimation()
            animationProgressWhenInterrupted = animator.fractionComplete
        }
    }
    
    func updateInteractiveTransition(fractionCompleted:CGFloat) {
        for animator in runningAnimations {
            animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
    }
    
    func continueInteractiveTransition (){
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
    }
    
}

