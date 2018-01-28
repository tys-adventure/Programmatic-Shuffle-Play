//
//  MainUIController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 1/12/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import UIKit
import MediaPlayer

class MainUIController: UIViewController {

	var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
	var nowPlayingInfo = MPNowPlayingInfoCenter.self
	var playImage = UIImage.self
	
	//UIGradient Color
	let gradient = CAGradientLayer()
	var gradientSet = [[CGColor]]()
	var currentGradient: Int = 0
	
	let gradientOne = UIColor(red: 48/255, green: 62/255, blue: 103/255, alpha: 1).cgColor
	let gradientTwo = UIColor(red: 244/255, green: 88/255, blue: 53/255, alpha: 1).cgColor
	let gradientThree = UIColor(red: 196/255, green: 70/255, blue: 107/255, alpha: 1).cgColor


    override func viewDidLoad() {
        super.viewDidLoad()
		
		//UIGradient
		gradientSet.append([gradientOne, gradientTwo])
		gradientSet.append([gradientTwo, gradientThree])
		gradientSet.append([gradientThree, gradientOne])
		
		
		gradient.frame = self.view.bounds
		gradient.colors = gradientSet[currentGradient]
		gradient.startPoint = CGPoint(x:0, y:0)
		gradient.endPoint = CGPoint(x:1, y:1)
		gradient.drawsAsynchronously = true
		self.view.layer.addSublayer(gradient)
		
		animateGradient()

		
		//AutoLayout using UIViewAutoResizing
		/*
		let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 750, height: 1334))
		mainView.backgroundColor = UIColor.blue
		view.addSubview(mainView)
		
		mainView.translatesAutoresizingMaskIntoConstraints = true
		mainView.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
		mainView.autoresizingMask = [UIViewAutoresizing.flexibleLeftMargin, UIViewAutoresizing.flexibleRightMargin, UIViewAutoresizing.flexibleTopMargin, UIViewAutoresizing.flexibleBottomMargin]
		*/
		
		//Track Title Label
		
		let trackLabel = UILabel(frame: CGRect(x: 190, y: 400, width: 200, height: 21))
		trackLabel.center = CGPoint(x: 190, y: 400)
		trackLabel.textAlignment = .center
		trackLabel.text = "Track Name"
		self.view.addSubview(trackLabel)
		
		//Artist Name Label
		
		let artistLabel = UILabel(frame: CGRect(x: 190, y: 450, width: 200, height: 21))
		artistLabel.center = CGPoint(x: 190, y: 450)
		artistLabel.textAlignment = .center
		artistLabel.text = "------Artist Name------"
		self.view.addSubview(artistLabel)
		
		
		
		//UIImageView for Album Art
		
		let imageName = "SPEmoji.png"
		let image = UIImage(named: imageName)
		let albumView = UIImageView(image: image!)
		
		albumView.frame = CGRect(x: 90, y: 125, width: 200, height: 200)
		view.addSubview(albumView)
		
        //Buttons
		// X = left to right
		// Y = top to bottom
		
		let menuButtonTapped = UIButton(type: UIButtonType.system) as UIButton
		menuButtonTapped.frame = CGRect(x: 300, y: 50, width: 35, height: 35)
		menuButtonTapped.tintColor=UIColor .black
		menuButtonTapped.setTitle("Genre's", for: .normal)
		if let image  = UIImage(named: "menu-icon.png") {
		menuButtonTapped.setImage(image, for: .normal)
		}
		menuButtonTapped.addTarget(self, action: #selector(menuButtonTapped(_:)), for:.touchUpInside)
		self.view.addSubview(menuButtonTapped)
		
		let profileButtonTapped = UIButton(type: UIButtonType.system) as UIButton
		profileButtonTapped.frame = CGRect(x: 50, y: 50, width: 35, height: 35)
		profileButtonTapped.tintColor=UIColor .black
		profileButtonTapped.setTitle("Home", for: .normal)
		if let image  = UIImage(named: "profile-icon.png") {
		profileButtonTapped.setImage(image, for: .normal)
		}
		profileButtonTapped.addTarget(self, action: #selector(profileButtonTapped(_:)), for:.touchUpInside)
		self.view.addSubview(profileButtonTapped)
		
		let playButtonTapped = UIButton(type: UIButtonType.system) as UIButton
		playButtonTapped.frame = CGRect(x: 225, y: 500, width: 120, height: 50)
		playButtonTapped.tintColor=UIColor .black
		if let image  = UIImage(named: "play-control-button.png") {
			playButtonTapped.setImage(image, for: .normal)
		}
		playButtonTapped.addTarget(self, action: #selector(playButtonTapped(_:)), for:.touchUpInside)
		self.view.addSubview(playButtonTapped)

		
		let pauseButtonTapped = UIButton(type: UIButtonType.system) as UIButton
		pauseButtonTapped.frame = CGRect(x: 30, y: 500, width: 120, height: 50)
		pauseButtonTapped.tintColor=UIColor .black
		if let image  = UIImage(named: "pause.png") {
			pauseButtonTapped.setImage(image, for: .normal)
		}
		pauseButtonTapped.addTarget(self, action: #selector(pauseButtonTapped(_:)), for:.touchUpInside)
		self.view.addSubview(pauseButtonTapped)
		
		
		let previousButtonTapped = UIButton(type: UIButtonType.system) as UIButton
		previousButtonTapped.frame = CGRect(x: 30, y: 575, width: 120, height: 50)
		previousButtonTapped.tintColor=UIColor .black
		if let image  = UIImage(named: "previous.png") {
			previousButtonTapped.setImage(image, for: .normal)
		}
		previousButtonTapped.addTarget(self, action: #selector(previousButtonTapped(_:)), for:.touchUpInside)
		self.view.addSubview(previousButtonTapped)

		
		let nextButtonTapped = UIButton(type: UIButtonType.system) as UIButton
		nextButtonTapped.frame = CGRect(x: 225, y: 575, width: 120, height: 50)
		nextButtonTapped.tintColor=UIColor .black
		if let image  = UIImage(named: "next-track.png") {
			nextButtonTapped.setImage(image, for: .normal)
		}
		nextButtonTapped.addTarget(self, action: #selector(nextButtonTapped(_:)), for:.touchUpInside)
		self.view.addSubview(nextButtonTapped)
		
        // Do any additional setup after loading the view.
    }

	//Menu Button
	
	var menuButtonTapped : UIButton!
	
	@objc func menuButtonTapped(_ sender: UIButton) {
		
		let vc = MenuController() //your view controller
		self.present(vc, animated: true, completion: nil)

	}
	
	var profileButtonTapped : UIButton!
	
	@objc func profileButtonTapped(_ sender: UIButton) {
		
		//Segue between ViewControllers
		let vc = ProfileController() //your view controller
		self.present(vc, animated: true, completion: nil)
		
	}

	
    //User Button controls--Play, Pause, Stop, Skip

	var playButtonTapped : UIButton!
    
	@objc func playButtonTapped(_ sender: UIButton) {
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
        sender.pulsate()
	
    }
    
	var pauseButtonTapped : UIButton!
    
    @objc func pauseButtonTapped(_ sender: UIButton) {
        
        musicPlayer.pause()
        sender.pulsate()
    }
    
	var previousButtonTapped : UIButton!
    
    @objc func previousButtonTapped(_ sender: UIButton) {
        
        musicPlayer.skipToPreviousItem()
        sender.pulsate()
    }
    
	var nextButtonTapped : UIButton!
    
	@objc func nextButtonTapped(_ sender: UIButton) {
        
        musicPlayer.skipToNextItem()
        sender.pulsate()
    }
	
	// override func prepare(for segue: UIStoryboardSegue, sender: Any?) {}
	
	// Now Playing
	
	
	var albumView : UIImageView!

	
	
	//UIGradient Func
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
	}
	
	
	//UIColor Gradient Func
	
	func animateGradient() {
		if currentGradient < gradientSet.count - 1 {
			currentGradient += 1
		} else {
			currentGradient = 0
		}
		
		let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
		gradientChangeAnimation.duration = 7.00
		gradientChangeAnimation.toValue = gradientSet[currentGradient]
		gradientChangeAnimation.fillMode = kCAFillModeForwards
		gradientChangeAnimation.isRemovedOnCompletion = false
		gradient.add(gradientChangeAnimation, forKey: "colorChange")
	}
	
	}

	extension MainUIController: CAAnimationDelegate {
		func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
			if flag {
				gradient.colors = gradientSet[currentGradient]
				animateGradient()
			}
		}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	
}
