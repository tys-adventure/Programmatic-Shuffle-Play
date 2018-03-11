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
		if let homeImage  = UIImage(named: "music.png") {
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
	
	//Gradient
	let gradient = CAGradientLayer()
	var gradientSet = [[CGColor]]()
	var currentGradient: Int = 0
	
	//Shades of blue
	let gradientOne = UIColor(red: 129/255, green: 219/255, blue: 181/255, alpha: 1).cgColor
	let gradientTwo = UIColor(red: 129/255, green: 219/255, blue: 181/255, alpha: 1).cgColor
	let gradientThree = UIColor(red: 129/255, green: 219/255, blue: 181/255, alpha: 1).cgColor
	
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
		
		//MARK: addSubView
		view.addSubview(genreTextView)
		view.addSubview(mainButtonTapped)
		view.addSubview(AlternativeCountryButton)
		view.addSubview(AmericanaButton)
		view.addSubview(BluegrassButton)
		view.addSubview(ContemporaryBlueButton)
		view.addSubview(ContemporaryCountryButton)
		view.addSubview(CountryGospelButton)
		view.addSubview(HonkyTonkButton)
		view.addSubview(OutlawButton)
		view.addSubview(TradCountryButton)
		view.addSubview(UrbanCountryButton)
		
		setupLayout()
		
	}
	
	private func setupLayout() {
		
		genreTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
		genreTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		genreTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		genreTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
		genreTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
		
		mainButtonTapped.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
		mainButtonTapped.widthAnchor.constraint(equalToConstant: 35).isActive = true
		mainButtonTapped.heightAnchor.constraint(equalToConstant: 35).isActive = true
		mainButtonTapped.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
		
		AlternativeCountryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		AlternativeCountryButton.topAnchor.constraint(equalTo: genreTextView.bottomAnchor, constant: -515).isActive = true
		AlternativeCountryButton.widthAnchor.constraint(equalToConstant: 290).isActive = true
		AlternativeCountryButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		AmericanaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		AmericanaButton.topAnchor.constraint(equalTo: UrbanCountryButton.bottomAnchor, constant: 10).isActive = true
		AmericanaButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		AmericanaButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		BluegrassButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		BluegrassButton.topAnchor.constraint(equalTo: CountryGospelButton.bottomAnchor, constant: 10).isActive = true
		BluegrassButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		BluegrassButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		ContemporaryBlueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		ContemporaryBlueButton.topAnchor.constraint(equalTo: AlternativeCountryButton.bottomAnchor, constant: 10).isActive = true
		ContemporaryBlueButton.widthAnchor.constraint(equalToConstant: 290).isActive = true
		ContemporaryBlueButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		ContemporaryCountryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		ContemporaryCountryButton.topAnchor.constraint(equalTo: ContemporaryBlueButton.bottomAnchor, constant: 10).isActive = true
		ContemporaryCountryButton.widthAnchor.constraint(equalToConstant: 290).isActive = true
		ContemporaryCountryButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		CountryGospelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		CountryGospelButton.topAnchor.constraint(equalTo: TradCountryButton.bottomAnchor, constant: 10).isActive = true
		CountryGospelButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		CountryGospelButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		HonkyTonkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		HonkyTonkButton.topAnchor.constraint(equalTo: TradCountryButton.bottomAnchor, constant: 10).isActive = true
		HonkyTonkButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		HonkyTonkButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		OutlawButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		OutlawButton.topAnchor.constraint(equalTo: UrbanCountryButton.bottomAnchor, constant: 10).isActive = true
		OutlawButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		OutlawButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		TradCountryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		TradCountryButton.topAnchor.constraint(equalTo: ContemporaryCountryButton.bottomAnchor, constant: 10).isActive = true
		TradCountryButton.widthAnchor.constraint(equalToConstant: 290).isActive = true
		TradCountryButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		UrbanCountryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		UrbanCountryButton.topAnchor.constraint(equalTo: HonkyTonkButton.bottomAnchor, constant: 10).isActive = true
		UrbanCountryButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		UrbanCountryButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
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
		gradientChangeAnimation.duration = 15.00
		gradientChangeAnimation.toValue = gradientSet[currentGradient]
		gradientChangeAnimation.fillMode = kCAFillModeForwards
		gradientChangeAnimation.isRemovedOnCompletion = false
		gradient.add(gradientChangeAnimation, forKey: "colorChange")
	}
	
}
