//
//  PlayerController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 4/11/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer
import AVFoundation

class PlayerController: UIViewController {
	
	var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
	let myMediaQuery = MPMediaQuery.songs()
	let nowPlaying = MPNowPlayingInfoCenter.default().nowPlayingInfo
	
	//Album Image View
	var albumImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.layer.shadowColor = UIColor.black.cgColor
		imageView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		imageView.layer.masksToBounds = false
		imageView.layer.shadowRadius = 3.0
		imageView.layer.shadowOpacity = 1.0
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()

	var downArrowImageView: UIImageView = {
		let imageView = UIImageView(image: #imageLiteral(resourceName: "downArrow"))
		imageView.layer.shadowColor = UIColor.black.cgColor
		imageView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		imageView.layer.masksToBounds = false
		imageView.layer.shadowRadius = 3.0
		imageView.layer.shadowOpacity = 1.0
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	//Song Label
	var nowPlayingLabel : UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.backgroundColor = UIColor.clear
		label.isUserInteractionEnabled = false
		label.textColor = UIColor.white
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	//Artist Label
	var artistLabel : UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.backgroundColor = UIColor.clear
		label.isUserInteractionEnabled = false
		label.textColor = UIColor.white
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	//Genre Shuffle Play textView
	let genreTextView: UITextView = {
		let textView = ProfileController.createTextView()
		textView.font = UIFont(name:"Avenir Next", size: 35.0)
		textView.text = "Genres"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()

	let spTextView: UITextView = {
		let textView = ProfileController.createTextView()
		textView.font = UIFont(name:"Avenir Next", size: 25.0)
		textView.text = "Shuffle Play Plus"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
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
	
	let HHButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Hip-Hop", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()

	let PopButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Pop", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let RockButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Rock", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let ElectronicButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Electronic", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let KPOPButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("K-Pop", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let CountryButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Country", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let RBSoulButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("R&B/Soul", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let SingerButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Singer/Songwriter", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let RapButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Rap", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Logo Image View
	var logoImageView: UIImageView = {
		let imageView = UIImageView(image: #imageLiteral(resourceName: "SPEmoji"))
		imageView.layer.shadowColor = UIColor.black.cgColor
		imageView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		imageView.layer.masksToBounds = false
		imageView.layer.shadowRadius = 3.0
		imageView.layer.shadowOpacity = 1.0
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	let helloTextView: UITextView = {
		let textView = ProfileController.createTextView()
		textView.font = UIFont(name:"Avenir Next", size: 18.0)
		textView.text = "You're Awesome! "
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let screensize: CGRect = UIScreen.main.bounds
		let screenWidth = screensize.width
		let screenHeight = screensize.height
		var scrollView: UIScrollView!
		scrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: screenWidth, height: screenHeight))
		
		//Views Colors
		view.backgroundColor = UIColor(red: 26/255, green: 152/255, blue: 177/255, alpha: 1)
		scrollView.backgroundColor = UIColor(red: 26/255, green: 152/255, blue: 177/255, alpha: 1)
		
		
		//setupLayout()
		view.addSubview(spTextView)
		view.addSubview(profileButton)
		
		setupLayout()
		
		
		//scrollView
		scrollView.addSubview(logoImageView)
		scrollView.addSubview(albumImageView)
		scrollView.addSubview(artistLabel)
		scrollView.addSubview(nowPlayingLabel)
		scrollView.addSubview(previousButton)
		scrollView.addSubview(pauseButton)
		scrollView.addSubview(playButton)
		scrollView.addSubview(nextButton)
		scrollView.addSubview(HHButton)
		scrollView.addSubview(PopButton)
		scrollView.addSubview(RockButton)
		scrollView.addSubview(ElectronicButton)
		scrollView.addSubview(KPOPButton)
		scrollView.addSubview(CountryButton)
		scrollView.addSubview(RBSoulButton)
		scrollView.addSubview(SingerButton)
		scrollView.addSubview(RapButton)
		scrollView.addSubview(genreTextView)
		scrollView.addSubview(downArrowImageView)
		scrollView.addSubview(helloTextView)
		
		NSLayoutConstraint(item: helloTextView, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: helloTextView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
		NSLayoutConstraint(item: helloTextView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
		NSLayoutConstraint(item: helloTextView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: -50).isActive = true
		
		NSLayoutConstraint(item: logoImageView, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: logoImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 175).isActive = true
		NSLayoutConstraint(item: logoImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 175).isActive = true
		NSLayoutConstraint(item: logoImageView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 15).isActive = true
		
		NSLayoutConstraint(item: albumImageView, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: albumImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 225).isActive = true
		NSLayoutConstraint(item: albumImageView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 15).isActive = true
		NSLayoutConstraint(item: albumImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 225).isActive = true
		
		NSLayoutConstraint(item: downArrowImageView, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: downArrowImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
		NSLayoutConstraint(item: downArrowImageView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 450).isActive = true
		NSLayoutConstraint(item: downArrowImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
		
		NSLayoutConstraint(item: artistLabel, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: artistLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 225).isActive = true
		NSLayoutConstraint(item: artistLabel, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 250).isActive = true
		NSLayoutConstraint(item: artistLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
		
		NSLayoutConstraint(item: nowPlayingLabel, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: nowPlayingLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 225).isActive = true
		NSLayoutConstraint(item: nowPlayingLabel, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 275).isActive = true
		NSLayoutConstraint(item: nowPlayingLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
		
		NSLayoutConstraint(item: previousButton, attribute: .left, relatedBy: .equal, toItem: pauseButton, attribute: .leftMargin, multiplier: 1, constant: -80).isActive = true
		NSLayoutConstraint(item: previousButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 55).isActive = true
		NSLayoutConstraint(item: previousButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 55).isActive = true
		NSLayoutConstraint(item: previousButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 350).isActive = true
		
		NSLayoutConstraint(item: pauseButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: -35).isActive = true
		NSLayoutConstraint(item: pauseButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 55).isActive = true
		NSLayoutConstraint(item: pauseButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 55).isActive = true
		NSLayoutConstraint(item: pauseButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 350).isActive = true
		
		NSLayoutConstraint(item: playButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 35).isActive = true
		NSLayoutConstraint(item: playButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 55).isActive = true
		NSLayoutConstraint(item: playButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 55).isActive = true
		NSLayoutConstraint(item: playButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 350).isActive = true
		
		NSLayoutConstraint(item: nextButton, attribute: .right, relatedBy: .equal, toItem: playButton, attribute: .rightMargin, multiplier: 1, constant: 80).isActive = true
		NSLayoutConstraint(item: nextButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 55).isActive = true
		NSLayoutConstraint(item: nextButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 55).isActive = true
		NSLayoutConstraint(item: nextButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 350).isActive = true
		
		NSLayoutConstraint(item: genreTextView, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: genreTextView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
		NSLayoutConstraint(item: genreTextView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 70).isActive = true
		NSLayoutConstraint(item: genreTextView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 525).isActive = true
		
		NSLayoutConstraint(item: HHButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: HHButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: HHButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 600).isActive = true
		NSLayoutConstraint(item: HHButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: PopButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: PopButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: PopButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 750).isActive = true
		NSLayoutConstraint(item: PopButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: RockButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: RockButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: RockButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 900).isActive = true
		NSLayoutConstraint(item: RockButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: ElectronicButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: ElectronicButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: ElectronicButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1150).isActive = true
		NSLayoutConstraint(item: ElectronicButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: KPOPButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: KPOPButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: KPOPButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1300).isActive = true
		NSLayoutConstraint(item: KPOPButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: CountryButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: CountryButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: CountryButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1450).isActive = true
		NSLayoutConstraint(item: CountryButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: RBSoulButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: RBSoulButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: RBSoulButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1600).isActive = true
		NSLayoutConstraint(item: RBSoulButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: SingerButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: SingerButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: SingerButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1900).isActive = true
		NSLayoutConstraint(item: SingerButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: RapButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: RapButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: RapButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1750).isActive = true
		NSLayoutConstraint(item: RapButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		scrollView.contentSize = CGSize(width: screenWidth, height: 2175)
		view.addSubview(scrollView)
		
	}
	
	private func setupLayout() {
		
		spTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 35).isActive = true
		spTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		spTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
		spTextView.heightAnchor.constraint(equalToConstant: 70).isActive = true
		
		profileButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
		profileButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
		profileButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
		profileButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
		
	}
	
	@objc func profileButton(_ sender: UIButton) {
		
		let vc = ProfileController()
		self.present(vc, animated: true, completion: nil)
		
		sender.flash()
		
	}
	
	//User Button controls--Play, Pause, Stop, Skip
	var playButtonTapped : UIButton!
	
	@objc func playButtonTapped(_ sender: UIButton) {
		
		setNowPlayingInfo()
		musicPlayer.shuffleMode = .songs
		musicPlayer.play()
		sender.pulsate()
		
	}
	
	var pauseButtonTapped : UIButton!
	
	@objc func pauseButtonTapped(_ sender: UIButton) {
	
		setNowPlayingInfo()
		musicPlayer.pause()
		sender.pulsate()
	}
	
	var previousButtonTapped : UIButton!
	
	@objc func previousButtonTapped(_ sender: UIButton) {
		
		setNowPlayingInfo()
		musicPlayer.skipToPreviousItem()
		sender.pulsate()
	}
	
	var nextButtonTapped : UIButton!
	
	@objc func nextButtonTapped(_ sender: UIButton) {
		
		setNowPlayingInfo()
		musicPlayer.skipToNextItem()
		sender.pulsate()
	}
	
	//Shake to skip
	override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
		
		setNowPlayingInfo()
		musicPlayer.skipToNextItem()
		
	}
	
	//MARK: setNowPlayingInfo()
	@objc func setNowPlayingInfo() {
		
		if musicPlayer.playbackState == .playing {
			albumImageView.image = musicPlayer.nowPlayingItem?.artwork?.image(at: albumImageView.bounds.size)
			nowPlayingLabel.text = musicPlayer.nowPlayingItem?.title
			artistLabel.text = musicPlayer.nowPlayingItem?.artist
			
			albumImageView.isHidden = false
			nowPlayingLabel.isHidden = false
			artistLabel.isHidden = false
			logoImageView.isHidden = true
		}
	}
	 
	//Any of the genre buttons tapped = this action
	
	@objc func genreButtonTapped(_ sender: UIButton!) {
		
		MPMediaLibrary.requestAuthorization { (status) in
			if status == .authorized{
				self.playGenre(genre: sender.currentTitle!)
			}
		}
		
		albumImageView.image = musicPlayer.nowPlayingItem?.artwork?.image(at: albumImageView.bounds.size)
		nowPlayingLabel.text = musicPlayer.nowPlayingItem?.title
		artistLabel.text = musicPlayer.nowPlayingItem?.artist
	
		
		setNowPlayingInfo()
		sender.pulsate()
		
	}
	
	func playGenre(genre: String){
		
		musicPlayer.stop()
		let query = MPMediaQuery()
		let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
		
		query.addFilterPredicate(predicate)
		
		musicPlayer.setQueue(with: query)
		musicPlayer.shuffleMode = .songs
		musicPlayer.play()
		
	}
	
	
}