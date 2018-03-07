//
//  streamingController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 1/28/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit

import UIKit

class streamingController: UIViewController {
	
	//UIGradient Color
	let gradient = CAGradientLayer()
	var gradientSet = [[CGColor]]()
	var currentGradient: Int = 0
	
	let gradientOne = UIColor(red: 48/255, green: 62/255, blue: 103/255, alpha: 1).cgColor
	let gradientTwo = UIColor(red: 244/255, green: 88/255, blue: 53/255, alpha: 1).cgColor
	let gradientThree = UIColor(red: 196/255, green: 70/255, blue: 107/255, alpha: 1).cgColor
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//UIGradient
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
		
		
		//Menu Button
		
		let profileButton = UIButton(type: UIButtonType.system) as UIButton
		profileButton.frame = CGRect(x: 50, y: 50, width: 35, height: 35)
		profileButton.tintColor=UIColor .black
		profileButton.setTitle("Profile", for: .normal)
		if let image  = UIImage(named: "chart1.png") {
			profileButton.setImage(image, for: .normal)
		}
		// Shadow and Radius for Circle Button
		profileButton.layer.shadowColor = UIColor.black.cgColor
		profileButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		profileButton.layer.masksToBounds = false
		profileButton.layer.shadowRadius = 3.0
		profileButton.layer.shadowOpacity = 0.5
		
		profileButton.addTarget(self, action: #selector(profileButton(_:)), for:.touchUpInside)
		self.view.addSubview(profileButton)
		
		//About Label
		
		let streamingLabel = UILabel(frame: CGRect(x: 190, y: 450, width: 200, height: 21))
		streamingLabel.center = CGPoint(x: 190, y: 50)
		streamingLabel.textAlignment = .center
		streamingLabel.text = "Streaming Services"
		self.view.addSubview(streamingLabel)
		
		let appleButton = UIButton(frame: CGRect(x: 50, y: 100, width: 192, height: 192))
		appleButton.tintColor=UIColor .black
		appleButton.setTitle("Apple Music", for: .normal)
		/*
		if let image  = UIImage(named: "apple-music-logo.png") {
			appleButton.setImage(image, for: .normal)
		} */
		appleButton.addTarget(self, action: #selector(appleButton(_:)), for:.touchUpInside)
		self.view.addSubview(appleButton)
		

		let spotifyButton = UIButton(frame: CGRect(x: 50, y: 450, width: 192, height: 170))
		spotifyButton.tintColor=UIColor .black
		spotifyButton.setTitle("Spotify", for: .normal)
		/*
		if let image  = UIImage(named: "spotify-logo-2.png") {
			spotifyButton.setImage(image, for: .normal)
		} */
		spotifyButton.addTarget(self, action: #selector(spotifyButton(_:)), for:.touchUpInside)
		self.view.addSubview(spotifyButton)
		
		
		// Do any additional setup after loading the view.
	}
	
	//Profile Button Func
	
	var profileButton : UIButton!
	
	@objc func profileButton(_ sender: UIButton) {
		
		//Segue between ViewControllers
		let vc = ProfileController() //view controller
		self.present(vc, animated: true, completion: nil)
		
	}
	
	//Apple Music Button
	var appleButton : UIButton!
	
	@objc func appleButton(_ sender: UIButton) {
		
		
	}
	
	//Spotify Music Button
	var spotifyButton : UIButton!
	
	@objc func spotifyButton(_ sender: UIButton) {
		
		
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
		gradientChangeAnimation.duration = 7.00
		gradientChangeAnimation.toValue = gradientSet[currentGradient]
		gradientChangeAnimation.fillMode = kCAFillModeForwards
		gradientChangeAnimation.isRemovedOnCompletion = false
		gradient.add(gradientChangeAnimation, forKey: "colorChange")
	}
	
}


	
	
	
	
	
	
	


