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
import WatchConnectivity
//import CustomUIElements

class PlayerController: UIViewController, WCSessionDelegate, UINavigationBarDelegate {
	
	var textValue: String = ""
	var startDate: Date! = Date()
	var duration: Double = 3
	var startValue: String = ""
	var endValue: String = "Genres"
	
	var displayLink: CADisplayLink?
	
	//MARK:- proporties
	var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
	let myMediaQuery = MPMediaQuery.songs()
	let nowPlaying = MPNowPlayingInfoCenter.default().nowPlayingInfo
	
	var scrollView: UIScrollView!
	var screenWidth: CGFloat = 0.0
	var screenHeight: CGFloat = 0.0
	
	static var buttonTitles: [String] = []
	
	var musicProvider: MusicProvider = .notSet
	
	let userDefaults = UserDefaults.standard
	
	//MARK:- Setting up layout
	//Album Image View
	var albumImageView = CustomImageView(shadowRadius: 4.0, shadowOpacity: 5.0, image: nil)
	var downArrowImageView = CustomImageView(shadowRadius: 3.0, shadowOpacity: 1.0, image: #imageLiteral(resourceName: "downArrow"))
	//Song Label
	var nowPlayingLabel = CustomLabel()
	//Artist Label
	var artistLabel = CustomLabel()
	//Genre Shuffle Play textView
	
	//The text view i'll try to animate using CADisplayLink
	let genreTextView = CustomTextView(text: NSLocalizedString("playerControllerGenreTextView", comment: "The_genre_text_view_in_playerController"), size: 35.0)
	
	//Play
	let playButton = CustomButton(imageNamed: "play-white.png")
	//Pause
	let pauseButton = CustomButton(imageNamed: "pause-white3.png")
	//Previous
	let previousButton = CustomButton(imageNamed: "previous-white.png")
	//Next
	let nextButton = CustomButton(imageNamed: "next-white.png")
	//Genre Buttons
	let HHButton = CustomGenreButton(title: NSLocalizedString("playerControllerHHButton", comment: "TheHHButtonInPlayerController"))
	let PopButton = CustomGenreButton(title: NSLocalizedString("playerControllerPopButton", comment: "ThePopButtonInPlayerController"))
	let RockButton = CustomGenreButton(title: NSLocalizedString("playerControllerRockButton", comment: "TheRockButtonInPlayerController"))
	let ElectronicButton = CustomGenreButton(title: NSLocalizedString("playerControllerElectronicButton", comment: "theElectronicButtonInPlayerController"))
	let KPOPButton = CustomGenreButton(title: NSLocalizedString("playerControllerKPOPButton", comment: "TheKPOPButtonInPlayerController"))
	let CountryButton = CustomGenreButton(title: NSLocalizedString("playerControllerCountryButton", comment: "TheCountryButtonInPlayerController"))
	let RBSoulButton = CustomGenreButton(title: NSLocalizedString("playerControllerRBSoulButton", comment: "TheRBSOULButtonInPlayerController"))
	let SingerButton = CustomGenreButton(title: NSLocalizedString("playerControllerSingerButton", comment: "TheSingerButtonInPlayerController"))
	let RapButton = CustomGenreButton(title: NSLocalizedString("playerControllerRapButton", comment: "TheRapButtonInPlayerController"))
	//Logo Image View
	var logoImageView = CustomImageView(shadowRadius: 3.0, shadowOpacity: 1.0, image: #imageLiteral(resourceName: "SPEmoji"))
	//HelloTextView
	let helloTextView = CustomTextView(text: NSLocalizedString("playerControllerHelloTextView", comment: "TheHelloTextViewInPlayerController"), size: 18.0)
	
	var genresCollectionView: UICollectionView = {
		let flowLayout = UICollectionViewFlowLayout()
		let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
		return cv
	}()
	
	//MARK:- View Live Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		PlayerController.buttonTitles = [HHButton.currentTitle!, PopButton.currentTitle!, RockButton.currentTitle!, ElectronicButton.currentTitle!, KPOPButton.currentTitle!, CountryButton.currentTitle!, RBSoulButton.currentTitle!, SingerButton.currentTitle!, RapButton.currentTitle!]
		//PlayerController.buttonTitles = []
		
		let screensize: CGRect = UIScreen.main.bounds
		screenWidth = screensize.width
		screenHeight = screensize.height
		
		setupView()
		setupScrollView()
		setupConstraints()
		setupButtonTargets()
		
		//let spotlightVC = SpotlightSupport()
		if !userDefaults.bool(forKey: "spotlight") {
			SpotlightSupport().integrateCoreSpotlight()
			userDefaults.set(true, forKey: "spotlight")
		}
		
		checkOfWCSessionIsSupported()
		sendGenresArray()
		
		musicProvider = .AppleMusic
		
		if let defaults = UserDefaults(suiteName: "group.com.thom.shufflePlayPlus") {
			defaults.set(PlayerController.buttonTitles, forKey: "genresForExtension")
		}
		
		beginCounting()
		
		
		navigationItem.title = "Shuffle Play Plus"
		setupNavBarButtons()
		
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		NotificationCenter.default.addObserver(forName: Notification.Name.genreNotificationKey, object: nil, queue: OperationQueue.main) { (notification) in
			if let userInfo = notification.userInfo {
				self.viaCoreSportlight(genre: userInfo["genre"] as! String)
			}
		}
		
	}
	
	//MARK:- last bit of setup
	func setupScrollView() {
		scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
		scrollView.backgroundColor = UIColor(red: 255/255, green: 202/255, blue: 146/255, alpha: 1)
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
		scrollView.contentSize = CGSize(width: screenWidth, height: 2175)
		view.addSubview(scrollView)
	}
	
	func setupConstraints() {
		NSLayoutConstraint(item: helloTextView, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: helloTextView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
		NSLayoutConstraint(item: helloTextView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
		NSLayoutConstraint(item: helloTextView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 0).isActive = true
		
		NSLayoutConstraint(item: logoImageView, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: logoImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 175).isActive = true
		NSLayoutConstraint(item: logoImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 175).isActive = true
		NSLayoutConstraint(item: logoImageView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 25).isActive = true
		
		NSLayoutConstraint(item: albumImageView, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: albumImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 225).isActive = true
		NSLayoutConstraint(item: albumImageView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 25).isActive = true
		NSLayoutConstraint(item: albumImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 225).isActive = true
		
		NSLayoutConstraint(item: downArrowImageView, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: downArrowImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
		NSLayoutConstraint(item: downArrowImageView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 450).isActive = true
		NSLayoutConstraint(item: downArrowImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
		
		NSLayoutConstraint(item: artistLabel, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: artistLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 225).isActive = true
		NSLayoutConstraint(item: artistLabel, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 280).isActive = true
		NSLayoutConstraint(item: artistLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
		
		NSLayoutConstraint(item: nowPlayingLabel, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: nowPlayingLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 225).isActive = true
		NSLayoutConstraint(item: nowPlayingLabel, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 305).isActive = true
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
		
		//Genre Buttons
		
		NSLayoutConstraint(item: HHButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 80).isActive = true
		NSLayoutConstraint(item: HHButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150).isActive = true
		NSLayoutConstraint(item: HHButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 600).isActive = true
		NSLayoutConstraint(item: HHButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60).isActive = true
		
		NSLayoutConstraint(item: PopButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: -80).isActive = true
		NSLayoutConstraint(item: PopButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150).isActive = true
		NSLayoutConstraint(item: PopButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 600).isActive = true
		NSLayoutConstraint(item: PopButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60).isActive = true
		
		NSLayoutConstraint(item: RockButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 80).isActive = true
		NSLayoutConstraint(item: RockButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150).isActive = true
		NSLayoutConstraint(item: RockButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 700).isActive = true
		NSLayoutConstraint(item: RockButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60).isActive = true
		
		NSLayoutConstraint(item: ElectronicButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: -80).isActive = true
		NSLayoutConstraint(item: ElectronicButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150).isActive = true
		NSLayoutConstraint(item: ElectronicButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 700).isActive = true
		NSLayoutConstraint(item: ElectronicButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60).isActive = true
		
		NSLayoutConstraint(item: KPOPButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 80).isActive = true
		NSLayoutConstraint(item: KPOPButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150).isActive = true
		NSLayoutConstraint(item: KPOPButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 800).isActive = true
		NSLayoutConstraint(item: KPOPButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60).isActive = true
		
		NSLayoutConstraint(item: CountryButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: -80).isActive = true
		NSLayoutConstraint(item: CountryButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150).isActive = true
		NSLayoutConstraint(item: CountryButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 800).isActive = true
		NSLayoutConstraint(item: CountryButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60).isActive = true
		
		NSLayoutConstraint(item: RBSoulButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 80).isActive = true
		NSLayoutConstraint(item: RBSoulButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150).isActive = true
		NSLayoutConstraint(item: RBSoulButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 900).isActive = true
		NSLayoutConstraint(item: RBSoulButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60).isActive = true
		
		NSLayoutConstraint(item: SingerButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: -80).isActive = true
		NSLayoutConstraint(item: SingerButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150).isActive = true
		NSLayoutConstraint(item: SingerButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 900).isActive = true
		NSLayoutConstraint(item: SingerButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60).isActive = true
		
		NSLayoutConstraint(item: RapButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: -80).isActive = true
		NSLayoutConstraint(item: RapButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150).isActive = true
		NSLayoutConstraint(item: RapButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1000).isActive = true
		NSLayoutConstraint(item: RapButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60).isActive = true
		
	}
	
	func setupView() {
		view.backgroundColor = UIColor(red: 255/255, green: 202/255, blue: 146/255, alpha: 1)
	}
	
	func setupButtonTargets() {
		playButton.addTarget(self, action: #selector(playButtonTapped(_:)), for: .touchUpInside)
		pauseButton.addTarget(self, action: #selector(pauseButtonTapped(_:)), for:.touchUpInside)
		previousButton.addTarget(self, action: #selector(previousButtonTapped(_:)), for:.touchUpInside)
		nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for:.touchUpInside)
		
		HHButton.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		PopButton.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		RockButton.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		ElectronicButton.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		KPOPButton.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		CountryButton.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		RBSoulButton.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		SingerButton.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		RapButton.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
	}
	
	//MARK:- Gestures
//	private func setupGestures() {
//		let logoAlbumGesture = UITapGestureRecognizer(target: self, action: #selector(handleAlbumTapGesture(sender:)))
//		albumImageView.addGestureRecognizer(logoAlbumGesture)
//	}
	
//	@objc func handleAlbumTapGesture(sender: UITapGestureRecognizer) {
//		if sender.state == .ended {
//			if #available(iOS 11.3, *) {
//				let vc = ArkitAlbumPreviewViewController()
//				self.present(vc, animated: true, completion: nil)
//			} else {
//				#warning("Show error message because no ARKit possible")
//			}
//		}
//	}
	
	//MARK: - Go to the profile view
	@objc func profileButton(_ sender: UIButton) {
		
		let vc = ProfileController()
		self.present(vc, animated: true, completion: nil)
		
		sender.flash()
		
	}
	
	//MARK:- User Button controls--Play, Pause, Stop, Skip
	@objc func playButtonTapped(_ sender: UIButton) {
		
		setNowPlayingInfo()
		
		if musicPlayer.nowPlayingItem != nil {
			self.musicPlayer.shuffleMode = .songs
			self.musicPlayer.play()
			sender.pulsate()
			UIView.animate(withDuration: 0.5) {
				self.albumImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
			}
		} else {
			showAlertErrorView(title: NSLocalizedString("alertTitlePlayerController", comment: "TheAlertTitleInPlayerController"), message: NSLocalizedString("alertMessagePlayerController", comment: "TheAlertMessageInPlayerController"), continueMessage: NSLocalizedString("continueMessaePlayerController", comment: "TheContinueMessageInPlayerController"))
		}
		
	}
	
	@objc func pauseButtonTapped(_ sender: UIButton) {
		
		setNowPlayingInfo()
		musicPlayer.pause()
		sender.pulsate()
		UIView.animate(withDuration: 0.5) {
			self.albumImageView.transform = .identity
		}
	}
	
	@objc func previousButtonTapped(_ sender: UIButton) {
		
		setNowPlayingInfo()
		musicPlayer.skipToPreviousItem()
		sender.pulsate()
	}
	
	@objc func nextButtonTapped(_ sender: UIButton) {
		
		setNowPlayingInfo()
		musicPlayer.skipToNextItem()
		sender.pulsate()
	}
	
	//Shake to skip
	override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
		
		setNowPlayingInfo()
		musicPlayer.skipToNextItem()
		
	}
	
	//MARK:- setNowPlayingInfo()
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
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			self.albumImageView.image = self.musicPlayer.nowPlayingItem?.artwork?.image(at: self.albumImageView.bounds.size)
			self.nowPlayingLabel.text = self.musicPlayer.nowPlayingItem?.title
			self.artistLabel.text = self.musicPlayer.nowPlayingItem?.artist
		}
	}
	
	//MARK:- code to let the genre play
	//Any of the genre buttons tapped = this action
	
	@objc func genreButtonTapped(_ sender: UIButton!) {
		
		sender.pulsate()
		var title = ""
		switch sender.currentTitle! {
		case "Hip Hop": title = "Hip-Hop"
		case "Elektrisch": title = "Electronic"
		case "Koreanse Pop": title = "K-Pop"
		default: title = sender.currentTitle!
		}
		
		DispatchQueue.global().async {
			MPMediaLibrary.requestAuthorization { (status) in
				if status == .authorized{
					DispatchQueue.main.async {
						self.playGenre(genre: title)
					}
				}
			}
		}
		
		//sender.pulsate()
		
		setNowPlayingInfo()
		//sender.pulsate()
		UIView.animate(withDuration: 0.5) {
			self.albumImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
		}
		
		UIView.animate(withDuration: 0.4) {
			self.scrollView.bounds = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
		}
	}
	
	func viaCoreSportlight(genre: String) {
		MPMediaLibrary.requestAuthorization { (status) in
			if status == .authorized {
				self.playGenre(genre: genre)
			}
		}
		setNowPlayingInfo()
		UIView.animate(withDuration: 0.5) {
			self.albumImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
		}
	}
	
	func playGenre(genre: String) {
		
		musicPlayer.stop()
		let query = MPMediaQuery()
		let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
		
		query.addFilterPredicate(predicate)
		
		musicPlayer.setQueue(with: query)
		musicPlayer.shuffleMode = .songs
		musicPlayer.play()
		
	}
	
	//MARK:- Apple watch communication code
	func checkOfWCSessionIsSupported() {
		let session = WCSession.default
		session.delegate = self
		session.activate()
	}
	
	func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
		DispatchQueue.main.async {
			if activationState == .activated {
				if session.isWatchAppInstalled {
					print("Connection setup")
				}
			}
		}
	}
	
	func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
		if let genre = message["genre"] as? String {
			playGenre(genre: genre)
		}
	}
	
	func sendGenresArray() {
		let session = WCSession.default
		if session.activationState == .activated {
			let data = PlayerController.buttonTitles
			let userInfo = ["genres":data]
			session.transferUserInfo(userInfo)
		}
	}
	
	func sessionDidBecomeInactive(_ session: WCSession) {
		
	}
	
	func sessionDidDeactivate(_ session: WCSession) {
		WCSession.default.activate()
	}
	
	public func setupNavBarButtons() {
		
		//Menu Button == Left Navigation Bar Button Item
		let menuButton = UIButton(type: .custom)
		menuButton.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
		menuButton.setImage(UIImage(named: "chart1.png"), for: .normal)
		menuButton.addTarget(self, action: #selector(profileButton(_:)), for: UIControl.Event.touchUpInside)
		
		let menuBarButtonItem = UIBarButtonItem(customView: menuButton)
		let currWidth = menuBarButtonItem.customView?.widthAnchor.constraint(equalToConstant: 30);currWidth?.isActive = true
		let currHeight = menuBarButtonItem.customView?.heightAnchor.constraint(equalToConstant: 30);currHeight?.isActive = true
		self.navigationItem.leftBarButtonItem = menuBarButtonItem
		
		self.navigationController?.navigationBar.layer.shadowOpacity = 0.2
		self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
		self.navigationController?.navigationBar.layer.shadowRadius = 2
		
	}
	
	
	
	
}
