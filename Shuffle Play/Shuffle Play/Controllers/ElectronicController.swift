//
//  ElectronicController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 3/2/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class ElectronicController: UIViewController {
	
	var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
	
	//Genre Shuffle Play textView
	let genreTextView: UITextView = {
		let textView = UITextView()
		textView.font = UIFont(name:"Avenir Next", size: 25.0)
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.isUserInteractionEnabled = false
		textView.textColor = UIColor.white
		textView.text = "Electronic"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//Profile UIButton
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
	
	//Ambient Button
	let AmbientButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Ambient", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Downtempo Button
	let DowntempoButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Downtempo", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Electronica Button
	let ElectronicaButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Electronica", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Industrial Button
	let IndustrialButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Industrial", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Delta Blues Button
	let DeltaButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Delta Blues", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Electric Blues Button
	let ElectricBluesButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Electric Blues", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Acoustic Blues Button
	let AcousticBluesButton: UIButton = {
		let btn = UIButton.createButton()
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
		view.addSubview(AmbientButton)
		view.addSubview(DowntempoButton)
		view.addSubview(ElectronicaButton)
		view.addSubview(IndustrialButton)
		
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
		
		AmbientButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		AmbientButton.topAnchor.constraint(equalTo: genreTextView.bottomAnchor, constant: -500).isActive = true
		AmbientButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		AmbientButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		DowntempoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		DowntempoButton.topAnchor.constraint(equalTo: genreTextView.bottomAnchor, constant: -500).isActive = true
		DowntempoButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		DowntempoButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		ElectronicaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		ElectronicaButton.topAnchor.constraint(equalTo: DowntempoButton.bottomAnchor, constant: 15).isActive = true
		ElectronicaButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		ElectronicaButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		IndustrialButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		IndustrialButton.topAnchor.constraint(equalTo: AmbientButton.bottomAnchor, constant: 15).isActive = true
		IndustrialButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		IndustrialButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
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
