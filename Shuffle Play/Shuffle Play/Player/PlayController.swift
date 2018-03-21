//
//  PlayController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 1/12/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation

//Yo How You doing?

class PlayController: UIViewController {
	
	// MARK: -- Properties
	let musicPlayer = MPMusicPlayerController.applicationMusicPlayer
	let myMediaQuery = MPMediaQuery.songs()
	
	let gradient = CAGradientLayer()
	var gradientSet = [[CGColor]]()
	var currentGradient: Int = 0
	
	let gradientOne = UIColor.rgb(red: 26, green: 152, blue: 175).cgColor
	let gradientTwo = UIColor.rgb(red: 26, green: 152, blue: 170).cgColor
	let gradientThree = UIColor.rgb(red: 26, green: 152, blue: 165).cgColor
	
	//Album Image View
	var albumImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.layer.shadowColor = UIColor.black.cgColor
		imageView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		imageView.layer.masksToBounds = false
		imageView.layer.shadowRadius = 3.0
		imageView.layer.shadowOpacity = 1.0
		return imageView
	}()
	
	//Song Label
	var nowPlayingLabel : UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.backgroundColor = UIColor.clear
		label.isUserInteractionEnabled = false
		label.textColor = UIColor.white
		return label
	}()
	
	//Artist Label
	var artistLabel : UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.backgroundColor = UIColor.clear
		label.isUserInteractionEnabled = false
		label.textColor = UIColor.white
		return label
	}()
	
	//Logo Image View
	var logoImageView: UIImageView = {
		let imageView = UIImageView(image: #imageLiteral(resourceName: "SPEmoji"))
		imageView.layer.shadowColor = UIColor.black.cgColor
		imageView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		imageView.layer.masksToBounds = false
		imageView.layer.shadowRadius = 1.5
		imageView.layer.shadowOpacity = 0.5
		return imageView
	}()
	
	//ProfileButton
	let settingsButton: UIButton = {
		let button = UIButton.controllerButton()
		button.setTitle("Profile", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "chart1-white.png") {
			button.setImage(homeImage, for: .normal)
			button.tintColor = UIColor.black
		}
		button.addTarget(self, action: #selector(settingsButtonTapped), for:.touchUpInside)
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
		button.addTarget(self, action: #selector(menuButtonTapped), for:.touchUpInside)
		return button
	}()
	
	//Play
	let playButton: UIButton = {
		let button = UIButton.musicButton()
		if let homeImage  = UIImage(named: "play-white.png") {
			button.setImage(homeImage, for: .normal)
			button.tintColor = UIColor.black
		}
		button.addTarget(self, action: #selector(playButtonTapped), for:.touchUpInside)
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
		button.addTarget(self, action: #selector(pauseButtonTapped), for:.touchUpInside)
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
		button.addTarget(self, action: #selector(previousButtonTapped), for:.touchUpInside)
		return button
	}()
	
	//Next
	let nextButton: UIButton = {
		let button = UIButton.musicButton()
		if let homeImage  = UIImage(named: "next-white.png") {
			button.setImage(homeImage, for: .normal)
			button.tintColor = UIColor.black
		}
		button.addTarget(self, action: #selector(nextButtonTapped), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	// MARK: -- viewDidLoad()
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setUpGradient()
		animateGradient()
		setNowPlayingInfo()
		setupLayout()
	}
	
	// MARK: -- View Setup
	fileprivate func setUpGradient() {
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
	}
	
	fileprivate func setupAlbumInfo() {
		DispatchQueue.main.async {
			self.albumImageView.image = self.musicPlayer.nowPlayingItem?.artwork?.image(at: self.albumImageView.bounds.size)
			self.nowPlayingLabel.text = self.musicPlayer.nowPlayingItem?.title
			self.artistLabel.text = self.musicPlayer.nowPlayingItem?.artist
		}
	}
	
	private func setupLayout() {
		
		view.addSubview(logoImageView)
		logoImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 125, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 220, height: 250)
		logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		view.addSubview(albumImageView)
		albumImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 125, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 255, height: 255)
		albumImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		view.addSubview(nowPlayingLabel)
		nowPlayingLabel.anchor(top: albumImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 275, height: 30)
		nowPlayingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		view.addSubview(artistLabel)
		artistLabel.anchor(top: nowPlayingLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 225, height: 30)
		artistLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		view.addSubview(settingsButton)
		settingsButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 60, paddingLeft: 35, paddingBottom: 0, paddingRight: 0, width: 35, height: 35)
		
		view.addSubview(menuButton)
		menuButton.anchor(top: view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 60, paddingLeft: 0, paddingBottom: 0, paddingRight: 35, width: 35, height: 35)
		
		view.addSubview(playButton)
		playButton.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 150).isActive = true
		playButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
		playButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
		playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 40).isActive = true
		
		view.addSubview(pauseButton)
		pauseButton.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 150).isActive = true
		pauseButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
		pauseButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
		pauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -40).isActive = true
		
		view.addSubview(previousButton)
		previousButton.anchor(top: artistLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 75, paddingLeft: 35, paddingBottom: 0, paddingRight: 0, width: 55, height: 55)
		
		view.addSubview(nextButton)
		nextButton.anchor(top: artistLabel.bottomAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 75, paddingLeft: 0, paddingBottom: 0, paddingRight: 35, width: 55, height: 55)
	}
	
	// MARK: -- Menu and Settings functions
	@objc func menuButtonTapped() {
		menuButton.flash()
		
		self.presentingViewController?.dismiss(animated: true, completion: nil)
		
		let vc = GenreController()
		self.present(vc, animated: true, completion: nil)
	}
	
	@objc func settingsButtonTapped() {
		let vc = SettingsController()
		self.present(vc, animated: true, completion: nil)
		settingsButton.flash()
	}
	
	// MARK: -- Button functions
	@objc func playButtonTapped() {
		setupAlbumInfo()
		musicPlayer.shuffleMode = .songs
		musicPlayer.play()
		playButton.pulsate()
	}

	@objc func pauseButtonTapped() {
		setupAlbumInfo()
		musicPlayer.pause()
		pauseButton.pulsate()
	}
	
	@objc func previousButtonTapped() {
		setupAlbumInfo()
		musicPlayer.skipToPreviousItem()
		previousButton.pulsate()
	}
	
	@objc func nextButtonTapped() {
		setupAlbumInfo()
		musicPlayer.skipToNextItem()
		nextButton.pulsate()
	}
	
	//Shake to skip
	override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
		setupAlbumInfo()
		musicPlayer.skipToNextItem()
	}
	
	public func playGenre(genre: String){
		musicPlayer.stop()
		
		let query = MPMediaQuery()
		let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
		
		query.addFilterPredicate(predicate)
		
		musicPlayer.setQueue(with: query)
		musicPlayer.shuffleMode = .songs
		musicPlayer.play()
		setNowPlayingInfo()
		setupAlbumInfo()
	}
	
	//MARK: setNowPlayingInfo()
	public func setNowPlayingInfo() {
		if musicPlayer.playbackState == .playing {
			setupAlbumInfo()
			albumImageView.isHidden = false
			nowPlayingLabel.isHidden = false
			artistLabel.isHidden = false
			logoImageView.isHidden = true
		}
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



