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
		textView.font = UIFont.boldSystemFont(ofSize: 18)
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.isUserInteractionEnabled = false
		textView.text = "Genres"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//Profile UIButton
	//Fix Button Image Please
	let mainButtonTapped: UIButton = {
		let button = UIButton()
		button.setTitle("Home", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "music.png") {
			button.setImage(homeImage, for: .normal)
		}
		// Shadow and Radius for Circle Button
		button.layer.shadowColor = UIColor.black.cgColor
		button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		button.layer.masksToBounds = false
		button.layer.shadowRadius = 3.0
		button.layer.shadowOpacity = 1.0
		
		button.addTarget(self, action: #selector(mainButtonTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	//Alternative Country Button
	let AlternativeCountryButton: UIButton = {
		let btn = createSPButton()
		btn.setTitle("Alternative Country", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Americana Button
	let AmericanaButton: UIButton = {
		let btn = createSPButton()
		btn.setTitle("Americana", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Bluegrass Button
	let BluegrassButton: UIButton = {
		let btn = createSPButton()
		btn.setTitle("Bluegrass", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Contemporary Bluegrass Button
	let ContemporaryBlueButton: UIButton = {//(frame: CGRect(x: 55, y: 295, width: 260, height: 45))
		let btn = createSPButton()
		btn.setTitle("Contemporary Bluegrass", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Contemporary Countrt Button
	let ContemporaryCountryButton: UIButton = {//(frame: CGRect(x: 55, y: 360, width: 260, height: 45))
		let btn = createSPButton()
		btn.setTitle("Contemporary Country", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Country Gospel Button
	let CountryGospelButton: UIButton = {//(frame: CGRect(x: 55, y: 360, width: 260, height: 45))
		let btn = createSPButton()
		btn.setTitle("Country Gospel", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Honk Tonk Button
	let HonkyTonkButton: UIButton = {
		let btn = createSPButton()
		btn.setTitle("Honky Tonk", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Outlaw Country Button
	let OutlawButton: UIButton = {
		let btn = createSPButton()
		btn.setTitle("Outlaw Country", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Traditional Bluegrass Button
	let TradBluegrassButton: UIButton = {
		let btn = createSPButton()
		btn.setTitle("Traditional Bluegrass", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Honk Tonk Button
	let TradCountryButton: UIButton = {
		let btn = createSPButton()
		btn.setTitle("Honky Tonk", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Urban Country Button
	let UrbanCountryButton: UIButton = {
		let btn = createSPButton()
		btn.setTitle("Urban Country", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
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
		
		
		//Setup Layout
		
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
		view.addSubview(TradBluegrassButton)
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
		
		AlternativeCountryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		AlternativeCountryButton.topAnchor.constraint(equalTo: genreTextView.bottomAnchor, constant: -525).isActive = true
		AlternativeCountryButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		AlternativeCountryButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		AmericanaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		AmericanaButton.topAnchor.constraint(equalTo: genreTextView.bottomAnchor, constant: -525).isActive = true
		AmericanaButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		AmericanaButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		BluegrassButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		BluegrassButton.topAnchor.constraint(equalTo: AmericanaButton.bottomAnchor, constant: 15).isActive = true
		BluegrassButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		BluegrassButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		ContemporaryBlueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		ContemporaryBlueButton.topAnchor.constraint(equalTo: AlternativeCountryButton.bottomAnchor, constant: 15).isActive = true
		ContemporaryBlueButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		ContemporaryBlueButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		ContemporaryCountryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		ContemporaryCountryButton.topAnchor.constraint(equalTo: ContemporaryBlueButton.bottomAnchor, constant: 15).isActive = true
		ContemporaryCountryButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		ContemporaryCountryButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		CountryGospelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		CountryGospelButton.topAnchor.constraint(equalTo: BluegrassButton.bottomAnchor, constant: 15).isActive = true
		CountryGospelButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		CountryGospelButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		HonkyTonkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		HonkyTonkButton.topAnchor.constraint(equalTo: CountryGospelButton.bottomAnchor, constant: 15).isActive = true
		HonkyTonkButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		HonkyTonkButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		OutlawButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		OutlawButton.topAnchor.constraint(equalTo: ContemporaryCountryButton.bottomAnchor, constant: 15).isActive = true
		OutlawButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		OutlawButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		TradBluegrassButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		TradBluegrassButton.topAnchor.constraint(equalTo: HonkyTonkButton.bottomAnchor, constant: 15).isActive = true
		TradBluegrassButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		TradBluegrassButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		TradCountryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		TradCountryButton.topAnchor.constraint(equalTo: OutlawButton.bottomAnchor, constant: 15).isActive = true
		TradCountryButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		TradCountryButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		UrbanCountryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		UrbanCountryButton.topAnchor.constraint(equalTo: TradBluegrassButton.bottomAnchor, constant: 15).isActive = true
		UrbanCountryButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		UrbanCountryButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
	}
	
	//ALL BUTTONS
	static func createSPButton() -> UIButton {
		let button = UIButton()
		button.tintColor=UIColor .gray
		button.setTitleColor(.black, for: .normal)
		button.layer.cornerRadius = 5
		button.layer.borderWidth = 1
		button.layer.borderColor = UIColor.black.cgColor
		return button
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
