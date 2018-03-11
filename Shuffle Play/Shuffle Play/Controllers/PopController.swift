//
//  PopController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 3/1/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class PopController: UIViewController {
	
	var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
	
	//Genre Shuffle Play textView
	let genreTextView: UITextView = {
		let textView = UITextView()
		textView.font = UIFont(name:"Avenir Next", size: 25.0)
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.isUserInteractionEnabled = false
		textView.textColor = UIColor.white
		textView.text = "Pop"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//Profile UIButton
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
	
	//Adult Contemporary Button
	let AdultContemporaryButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Adult Contemporary", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Britpop Button
	let BritpopButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Britpop", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Pop/Rock Button
	let PopRockButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Pop/Rock", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Soft Rock Button
	let SoftRockButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Soft Rock", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Teen Pop Button
	let TeenPopButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Teen Pop", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Pop Button
	let PopButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Pop", for: .normal)
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
		view.addSubview(AdultContemporaryButton)
		view.addSubview(BritpopButton)
		view.addSubview(PopRockButton)
		view.addSubview(SoftRockButton)
		view.addSubview(TeenPopButton)
		view.addSubview(PopButton)
		
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
		
		AdultContemporaryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		AdultContemporaryButton.topAnchor.constraint(equalTo: genreTextView.bottomAnchor, constant: -500).isActive = true
		AdultContemporaryButton.widthAnchor.constraint(equalToConstant: 290).isActive = true
		AdultContemporaryButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		BritpopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		BritpopButton.topAnchor.constraint(equalTo: AdultContemporaryButton.bottomAnchor, constant: 15).isActive = true
		BritpopButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		BritpopButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		PopRockButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		PopRockButton.topAnchor.constraint(equalTo: AdultContemporaryButton.bottomAnchor, constant: 15).isActive = true
		PopRockButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		PopRockButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		SoftRockButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		SoftRockButton.topAnchor.constraint(equalTo: PopRockButton.bottomAnchor, constant: 15).isActive = true
		SoftRockButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		SoftRockButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		TeenPopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		TeenPopButton.topAnchor.constraint(equalTo: SoftRockButton.bottomAnchor, constant: 15).isActive = true
		TeenPopButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		TeenPopButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
		PopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		PopButton.topAnchor.constraint(equalTo: BritpopButton.bottomAnchor, constant: 15).isActive = true
		PopButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		PopButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
		
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
