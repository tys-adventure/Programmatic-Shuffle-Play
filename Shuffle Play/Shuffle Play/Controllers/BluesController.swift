//
//  BluesController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 3/1/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class BluesController: UIViewController {
	
	var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
	
	//MARK: textView
	let genreTextView: UITextView = {
		let textView = UITextView()
		textView.font = UIFont(name:"Avenir Next", size: 25.0)
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.isUserInteractionEnabled = false
		textView.textColor = UIColor.white
		textView.text = "Blues"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//MARK: Buttons
	let mainButtonTapped: UIButton = {
		let button = UIButton.controllerButton()
		button.setTitle("Home", for: .normal)
		if let homeImage  = UIImage(named: "music.png") {
			button.setImage(homeImage, for: .normal)
		}
		button.addTarget(self, action: #selector(mainButtonTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	let ChicagoButton: UIButton = {
		let btn = ProfileController.createProfileButton()
		btn.setTitle("Chicago Blues", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let ClassicButton: UIButton = {
		let btn = ProfileController.createProfileButton()
		btn.setTitle("Classic Blues", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let ContemporaryBluesButton: UIButton = {
		let btn = ProfileController.createProfileButton()
		btn.setTitle("Contemporary Blues", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let CountryBluesButton: UIButton = {
		let btn = ProfileController.createProfileButton()
		btn.setTitle("Country Blues", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let DeltaButton: UIButton = {
		let btn = ProfileController.createProfileButton()
		btn.setTitle("Delta Blues", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let ElectricBluesButton: UIButton = {
		let btn = ProfileController.createProfileButton()
		btn.setTitle("Electric Blues", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let AcousticBluesButton: UIButton = {
		let btn = ProfileController.createProfileButton()
		btn.setTitle("Acoutic Blues", for: .normal)
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
		view.addSubview(ChicagoButton)
		view.addSubview(ClassicButton)
		view.addSubview(ContemporaryBluesButton)
		view.addSubview(CountryBluesButton)
		view.addSubview(DeltaButton)
		view.addSubview(ElectricBluesButton)
		view.addSubview(AcousticBluesButton)
		
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
		
		ChicagoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		ChicagoButton.topAnchor.constraint(equalTo: ContemporaryBluesButton.bottomAnchor, constant: 15).isActive = true
		ChicagoButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		ChicagoButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		ClassicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		ClassicButton.topAnchor.constraint(equalTo: ContemporaryBluesButton.bottomAnchor, constant: 15).isActive = true
		ClassicButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		ClassicButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		ContemporaryBluesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		ContemporaryBluesButton.topAnchor.constraint(equalTo: genreTextView.bottomAnchor, constant: -500).isActive = true
		ContemporaryBluesButton.widthAnchor.constraint(equalToConstant: 290).isActive = true
		ContemporaryBluesButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		CountryBluesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		CountryBluesButton.topAnchor.constraint(equalTo: ChicagoButton.bottomAnchor, constant: 15).isActive = true
		CountryBluesButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		CountryBluesButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		DeltaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		DeltaButton.topAnchor.constraint(equalTo: CountryBluesButton.bottomAnchor, constant: 15).isActive = true
		DeltaButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		DeltaButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		ElectricBluesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		ElectricBluesButton.topAnchor.constraint(equalTo: ClassicButton.bottomAnchor, constant: 15).isActive = true
		ElectricBluesButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		ElectricBluesButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		AcousticBluesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		AcousticBluesButton.topAnchor.constraint(equalTo: ElectricBluesButton.bottomAnchor, constant: 15).isActive = true
		AcousticBluesButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		AcousticBluesButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
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
