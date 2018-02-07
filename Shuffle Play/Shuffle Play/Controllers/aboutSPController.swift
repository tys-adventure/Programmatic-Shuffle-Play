//
//  aboutSPController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 2/4/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit

class aboutSPController: UIViewController {
	
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
		// X = Top to Bottom
		// Y = Left to Right
		
		let profileButton = UIButton(type: UIButtonType.system) as UIButton
		profileButton.frame = CGRect(x: 50, y: 50, width: 35, height: 35)
		profileButton.tintColor=UIColor .black
		profileButton.setTitle("Home", for: .normal)
		if let image  = UIImage(named: "profile-icon.png") {
			profileButton.setImage(image, for: .normal)
		}
		profileButton.addTarget(self, action: #selector(profileButton(_:)), for:.touchUpInside)
		self.view.addSubview(profileButton)
		
		//SP Logo Image
		
		let imageName = "SPEmoji.png"
		let image = UIImage(named: imageName)
		let logoView = UIImageView(image: image!)
		
		logoView.frame = CGRect(x: 160, y: 100, width: 50, height: 50)
		view.addSubview(logoView)
		
		
		//About Label
		
		let aboutLabel = UILabel(frame: CGRect(x: 190, y: 450, width: 200, height: 21))
		aboutLabel.center = CGPoint(x: 190, y: 50)
		aboutLabel.textAlignment = .center
		aboutLabel.text = "About Shuffle Play"
		self.view.addSubview(aboutLabel)
		
		//Feedback Button
		/*
		let feedbackButton = UIButton(frame: CGRect(x: 55, y: 555, width: 260, height: 45))
		feedbackButton.tintColor=UIColor .gray
		feedbackButton.layer.cornerRadius = 5
		feedbackButton.layer.borderWidth = 1
		feedbackButton.layer.borderColor = UIColor.black.cgColor
		feedbackButton.setTitle("Give me feedback!", for: .normal)
		feedbackButton.addTarget(self, action: #selector(feedbackButton(_:)), for:.touchUpInside)
		self.view.addSubview(feedbackButton)
		*/
		
		//About Paragraph/Label
	
		let aboutSPLabel = UILabel(frame: CGRect(x: 265, y: 300, width: 400, height: 200))
		aboutSPLabel.center = CGPoint(x: 265, y: 300)
		aboutSPLabel.textAlignment = .center
		aboutSPLabel.numberOfLines = 0
		aboutSPLabel.lineBreakMode = .byWordWrapping
		aboutSPLabel.textColor = UIColor.black
		aboutSPLabel.font = UIFont(name:"Avenir Next", size: 25.0)
		aboutSPLabel.text = "Shuffle Play shuffles your locally stored library from Apple Music, or your iPhone's storage. Allowing you to choose a genre and listen!"
		aboutSPLabel.frame.size.width = 250
		aboutSPLabel.sizeToFit()
		self.view.addSubview(aboutSPLabel)
		
		
		// Do any additional setup after loading the view.
	}
	
	//SP Logo Func
	
	var logoView : UIImageView!
	
	//Profile Button Func
	
	var profileButton : UIButton!
	
	@objc func profileButton(_ sender: UIButton) {
		
		//Segue between ViewControllers
		let vc = ProfileController() //view controller
		self.present(vc, animated: true, completion: nil)
		
	}
	
	
	//Feedback Button Func
	
	var feedbackButton : UIButton!
	
	@objc func feedbackButton(_ sender: UIButton) {
		
		openUrl(urlStr: "thetylerjp@icloud.com")
	}
	
	func openUrl(urlStr:String!) {
		
		if let url = NSURL(string:urlStr) {
			UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
		}
		
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

extension aboutSPController: CAAnimationDelegate {
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
		if flag {
			gradient.colors = gradientSet[currentGradient]
			animateGradient()
		}
	}
	
	
	
	
	
	
	
	
	
	
}
