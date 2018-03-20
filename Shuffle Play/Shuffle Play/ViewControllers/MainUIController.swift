//
//  MainUIController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 1/12/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation

//Yo How You doing?

class MainUIController: UIViewController {
	
	let musicPlayer = MPMusicPlayerController.applicationMusicPlayer
//	let nowPlaying = MPNowPlayingInfoCenter.default().nowPlayingInfo
	
	let url = URL(string: stringURL)
	let asset = AVURLAsset(url: url!)
	let item = AVPlayerItem(asset: asset)
	let player = AVPlayer(playerItem: item)
	
	isPlaying = true
	player.play()
	do {
		try AVAudioSession.sharedInstance().setActive(true)
	} catch {
	
	}
	self.setNowPlayingInfo()
	
	
	//Album Image View
	var albumImageView: UIImageView = {
		let imageView = UIImageView(image: #imageLiteral(resourceName: "ShufflePlayIconNew"))
		imageView.layer.shadowColor = UIColor.black.cgColor
		imageView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		imageView.layer.masksToBounds = false
		imageView.layer.shadowRadius = 3.0
		imageView.layer.shadowOpacity = 1.0
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}() 
	
	//ProfileButton
	let profileButton: UIButton = {
		let button = UIButton.controllerButton()
		button.setTitle("Profile", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "chart1-white.png") {
			button.setImage(homeImage, for: .normal)
			button.tintColor = UIColor.black
		}
		button.addTarget(self, action: #selector(profileButton(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	//Menu
	let menuButton: UIButton = {
		let button = UIButton.controllerButton()
		button.setTitle("Menu", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "headphones-white.png") {
			button.setImage(homeImage, for: .normal)
			button.tintColor = UIColor.black
		}
		button.addTarget(self, action: #selector(menuButton(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	//Play
	let playButton: UIButton = {
		let button = UIButton.musicButton()
			if let homeImage  = UIImage(named: "play-white.png") {
				button.setImage(homeImage, for: .normal)
				button.tintColor = UIColor.black
			}
		button.addTarget(self, action: #selector(playButtonTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	//Pause
	let pauseButton: UIButton = {
		let button = UIButton.musicButton()
			if let homeImage  = UIImage(named: "pause-white3.png") {
				button.setImage(homeImage, for: .normal)
				button.tintColor = UIColor.black
			}
		button.addTarget(self, action: #selector(pauseButtonTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	//Previous
	let previousButton: UIButton = {
		let button = UIButton.musicButton()

		if let homeImage  = UIImage(named: "previous-white.png") {
			button.setImage(homeImage, for: .normal)
			button.tintColor = UIColor.black
		}
		button.addTarget(self, action: #selector(previousButtonTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	//Next
	let nextButton: UIButton = {
		let button = UIButton.musicButton()
		if let homeImage  = UIImage(named: "next-white.png") {
			button.setImage(homeImage, for: .normal)
			button.tintColor = UIColor.black
		}
		button.addTarget(self, action: #selector(nextButtonTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	let gradient = CAGradientLayer()
	var gradientSet = [[CGColor]]()
	var currentGradient: Int = 0
	
	let gradientOne = UIColor(red: 26/255, green: 152/255, blue: 177/255, alpha: 1).cgColor
	let gradientTwo = UIColor(red: 26/255, green: 152/255, blue: 177/255, alpha: 1).cgColor
	let gradientThree = UIColor(red: 26/255, green: 152/255, blue: 177/255, alpha: 1).cgColor

	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		//Gradient
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
		
		setNowPlayingInfo()
		
		//MARK: addSubView
		view.addSubview(albumImageView)
		view.addSubview(profileButton)
		view.addSubview(menuButton)
		view.addSubview(playButton)
		view.addSubview(pauseButton)
		view.addSubview(previousButton)
		view.addSubview(nextButton)
		
		setupLayout()
		
        // Do any additional setup after loading the view.
    }
	
	private func setupLayout() {
		
		albumImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		albumImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 125).isActive = true
		albumImageView.widthAnchor.constraint(equalToConstant: 225).isActive = true
		albumImageView.heightAnchor.constraint(equalToConstant: 225).isActive = true
	
		profileButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
		profileButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
		profileButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
		profileButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
		
		menuButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
		menuButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
		menuButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
		menuButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35).isActive = true
		
		playButton.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 150).isActive = true
		playButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
		playButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
		playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 40).isActive = true
		
		pauseButton.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 150).isActive = true
		pauseButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
		pauseButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
		pauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -40).isActive = true
		
		previousButton.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 150).isActive = true
		previousButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
		previousButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
		previousButton.leftAnchor.constraint(equalTo: pauseButton.leftAnchor, constant: -75).isActive = true
	
		nextButton.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 150).isActive = true
		nextButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
		nextButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
		nextButton.rightAnchor.constraint(equalTo: playButton.rightAnchor, constant: 80).isActive = true

	}

	//Menu/Profile Button
	
	@objc func menuButton(_ sender: UIButton) {
		
		sender.flash()
		
		self.presentingViewController?.dismiss(animated: true, completion: nil)
		
		let vc = genreScroll()
		self.present(vc, animated: true, completion: nil)
		
	}
	
	@objc func profileButton(_ sender: UIButton) {
		
		let vc = ProfileController()
		self.present(vc, animated: true, completion: nil)
		
		sender.flash()
		
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

	//Shake to skip
	override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
		
		musicPlayer.skipToNextItem()
		
	}
	
	//MARK: setNowPlayingInfo()
	func setNowPlayingInfo() {
		
		let nowPlayingInfoCenter = MPNowPlayingInfoCenter.default()
		var nowPlayingInfo = nowPlayingInfoCenter.nowPlayingInfo ?? [String: Any]()
		
		let Title = PlayerController.stationTitle
		let artworkData = Data()
		let image = UIImage(data: artworkData) ?? UIImage()
		let artwork = MPMediaItemArtwork(boundsSize: image.size, requestHandler: { (_) -> UIImage in
			return image })
		
	
	nowPlayingInfo[MPMediaItemPropertyTitle] = title
	nowPlayingInfo[MPMediaItemPropertyArtwork] = artwork
	
	nowPlayingInfoCenter.nowPlayingInfo = nowPlayingInfo
	}

	
	//UIColor Gradient Func
	func animateGradient() {
		if currentGradient < gradientSet.count - 1 {
			currentGradient += 1
		} else {
			currentGradient = 0
		}
		
		let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
		gradientChangeAnimation.duration = 15.00
		gradientChangeAnimation.toValue = gradientSet[currentGradient]
		gradientChangeAnimation.fillMode = kCAFillModeForwards
		gradientChangeAnimation.isRemovedOnCompletion = false
		gradient.add(gradientChangeAnimation, forKey: "colorChange")
	}

}

	

