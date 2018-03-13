//
//  CountryController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 3/1/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class CountryController: UIViewController {
	
	var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
	
	
	//Genre Shuffle Play textView
	let genreTextView: UITextView = {
		let textView = UITextView()
		textView.font = UIFont(name:"Avenir Next", size: 25.0)
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.isUserInteractionEnabled = false
		textView.textColor = UIColor.white
		textView.text = "Country"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//Profile UIButton
	//Fix Button Image Please
	let mainButtonTapped: UIButton = {
		let button = UIButton.controllerButton()
		button.setTitle("Home", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "music-white.png") {
			button.setImage(homeImage, for: .normal)
		}
		button.addTarget(self, action: #selector(mainButtonTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	//Alternative Country Button
	let AlternativeCountryButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Alternative Country", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Americana Button
	let AmericanaButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Americana", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Bluegrass Button
	let BluegrassButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Bluegrass", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Contemporary Bluegrass Button
	let ContemporaryBlueButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Contemporary Bluegrass", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Contemporary Countrt Button
	let ContemporaryCountryButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Contemporary Country", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Country Gospel Button
	let CountryGospelButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Country Gospel", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Honk Tonk Button
	let HonkyTonkButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Honky Tonk", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Outlaw Country Button
	let OutlawButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Outlaw Country", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
		
	//Honk Tonk Button
	let TradCountryButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Traditional Country", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Urban Country Button
	let UrbanCountryButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Urban Country", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let screensize: CGRect = UIScreen.main.bounds
		let screenWidth = screensize.width
		let screenHeight = screensize.height
		var scrollView: UIScrollView!
		scrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: screenWidth, height: screenHeight))
		
		view.backgroundColor = UIColor.orange
		scrollView.backgroundColor = UIColor .orange
		
		view.addSubview(genreTextView)
		view.addSubview(mainButtonTapped)
		setupLayout()
		
		scrollView.addSubview(AlternativeCountryButton)
		scrollView.addSubview(AmericanaButton)
		scrollView.addSubview(BluegrassButton)
		scrollView.addSubview(ContemporaryBlueButton)
		scrollView.addSubview(ContemporaryCountryButton)
		scrollView.addSubview(CountryGospelButton)
		scrollView.addSubview(HonkyTonkButton)
		scrollView.addSubview(OutlawButton)
		scrollView.addSubview(TradCountryButton)
		scrollView.addSubview(UrbanCountryButton)
		
		
		//MARK: AutoLayout Constraints
		
		NSLayoutConstraint(item: AlternativeCountryButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: AlternativeCountryButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: AlternativeCountryButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 75).isActive = true
		NSLayoutConstraint(item: AlternativeCountryButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: AmericanaButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: AmericanaButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: AmericanaButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 225).isActive = true
		NSLayoutConstraint(item: AmericanaButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: BluegrassButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: BluegrassButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: BluegrassButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 375).isActive = true
		NSLayoutConstraint(item: BluegrassButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: ContemporaryBlueButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: ContemporaryBlueButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: ContemporaryBlueButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 525).isActive = true
		NSLayoutConstraint(item: ContemporaryBlueButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: ContemporaryCountryButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: ContemporaryCountryButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: ContemporaryCountryButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 675).isActive = true
		NSLayoutConstraint(item: ContemporaryCountryButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: CountryGospelButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: CountryGospelButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: CountryGospelButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 825).isActive = true
		NSLayoutConstraint(item: CountryGospelButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: HonkyTonkButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: HonkyTonkButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: HonkyTonkButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 975).isActive = true
		NSLayoutConstraint(item: HonkyTonkButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: OutlawButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: OutlawButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: OutlawButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1125).isActive = true
		NSLayoutConstraint(item: OutlawButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: TradCountryButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: TradCountryButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: TradCountryButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1275).isActive = true
		NSLayoutConstraint(item: TradCountryButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: UrbanCountryButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: UrbanCountryButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: UrbanCountryButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1425).isActive = true
		NSLayoutConstraint(item: UrbanCountryButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true

		scrollView.contentSize = CGSize(width: screenWidth, height: 1700)
		view.addSubview(scrollView)
	}
	
	private func setupLayout() {
		
		genreTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 35).isActive = true
		genreTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		genreTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		genreTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
		genreTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
		
		mainButtonTapped.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
		mainButtonTapped.widthAnchor.constraint(equalToConstant: 35).isActive = true
		mainButtonTapped.heightAnchor.constraint(equalToConstant: 35).isActive = true
		mainButtonTapped.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
		
	}

	//Main Button Tapped
	@objc func mainButtonTapped(_ sender: UIButton) {
		
		self.presentingViewController?.dismiss(animated: true, completion: nil)
		
		let vc = MenuController()
		self.present(vc, animated: true, completion: nil)
		
	}
	
	//Any of the genre buttons tapped = this action
	@objc func genreButtonTapped(_ sender: UIButton!) {
		
		MPMediaLibrary.requestAuthorization { (status) in
			if status == .authorized{
				self.playGenre(genre: sender.currentTitle!)
			}
		}
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
