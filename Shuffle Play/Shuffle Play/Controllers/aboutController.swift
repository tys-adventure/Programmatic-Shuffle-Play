//
//  aboutController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 1/27/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit

class aboutController: UIViewController {

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
		profileButton.frame = CGRect(x: 50, y: 50, width: 25, height: 25)
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
		
		//Paragraph Label
		/*
		let paragraphLabel = UILabel(frame: CGRect(x: 190, y: 400, width: 200, height: 21))
		paragraphLabel.center = CGPoint(x: 190, y: 50)
		paragraphLabel.textAlignment = .center
		//paragraphLabel.lineBreakMode = .byWordWrapping
		//paragraphLabel.numberOfLines = 4
		paragraphLabel.text = "Shuffle Play was created by Tyler Phillips, with the goal of making it easier to shuffle your music library by genre."
		self.view.addSubview(paragraphLabel)
		*/
		
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

	extension aboutController: CAAnimationDelegate {
		func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
			if flag {
				gradient.colors = gradientSet[currentGradient]
				animateGradient()
			}
		}

	
	
	
	
	
	
	
	
	
}
