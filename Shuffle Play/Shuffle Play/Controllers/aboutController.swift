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
		profileButton.frame = CGRect(x: 50, y: 50, width: 35, height: 35)
		profileButton.tintColor=UIColor .black
		profileButton.setTitle("Home", for: .normal)
			if let image  = UIImage(named: "profile-icon.png") {
				profileButton.setImage(image, for: .normal)
			}
		profileButton.addTarget(self, action: #selector(profileButton(_:)), for:.touchUpInside)
		self.view.addSubview(profileButton)
		
		//SP Logo Image
		
		let imageName = "tyler2.png"
		let image = UIImage(named: imageName)
		let logoView = UIImageView(image: image!)
		logoView.layer.cornerRadius = 5
		logoView.clipsToBounds = true
		
		logoView.frame = CGRect(x: 135, y: 100, width: 110, height: 110)
		view.addSubview(logoView)
		
		
		//About Label
		
		let aboutLabel = UILabel(frame: CGRect(x: 190, y: 450, width: 200, height: 21))
		aboutLabel.center = CGPoint(x: 190, y: 50)
		aboutLabel.textAlignment = .center
		aboutLabel.text = "About The Developer"
		self.view.addSubview(aboutLabel)
		
		//Social Buttons
		
		let InstagramButton = UIButton(frame: CGRect(x: 50, y: 575, width: 45, height: 45))
		InstagramButton.tintColor=UIColor .black
		InstagramButton.setTitle("Instagram", for: .normal)
			if let image  = UIImage(named: "insta-logo-2.png") {
				InstagramButton.setImage(image, for: .normal)
			}
		InstagramButton.addTarget(self, action: #selector(InstagramButton(_:)), for:.touchUpInside)
		self.view.addSubview(InstagramButton)
		
		let TwitterButton = UIButton(frame: CGRect(x: 165, y: 575, width: 45, height: 45))
		TwitterButton.tintColor=UIColor .black
		TwitterButton.setTitle("Twitter", for: .normal)
			if let image  = UIImage(named: "twitter-logo-3.png") {
				TwitterButton.setImage(image, for: .normal)
			}
		TwitterButton.addTarget(self, action: #selector(TwitterButton(_:)), for:.touchUpInside)
		self.view.addSubview(TwitterButton)
		
		let webButton = UIButton(frame: CGRect(x: 275, y: 575, width: 45, height: 45))
		webButton.tintColor=UIColor .black
		webButton.setTitle("GitHub", for: .normal)
			if let image  = UIImage(named: "globeicon2.png") {
				webButton.setImage(image, for: .normal)
			}
		webButton.addTarget(self, action: #selector(webButton(_:)), for:.touchUpInside)
		self.view.addSubview(webButton)
		
		//About Paragraph/Label
		
		let aboutSPLabel = UILabel(frame: CGRect(x: 265, y: 340, width: 400, height: 200))
		aboutSPLabel.center = CGPoint(x: 265, y: 340)
		aboutSPLabel.textAlignment = .center
		aboutSPLabel.numberOfLines = 0
		aboutSPLabel.lineBreakMode = .byWordWrapping
		aboutSPLabel.textColor = UIColor.black
		aboutSPLabel.font = UIFont(name:"Avenir Next", size: 19.0)
		aboutSPLabel.text = "I'm Tyler, a 24 yearold iOS Developer from Cleveland, Ohio. Shuffle Play is my first iOS app, created with 2 goals. First is to create a platfrom where you can choose what genre you want to listen to. Second is to learn as much as I can while building Shuffle Play!"
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
	
	
	//Instagram Button Func
	
	var InstagramButton : UIButton!
	
	@objc func InstagramButton(_ sender: UIButton) {
		
		openUrl(urlStr: "https://www.instagram.com/thetylerjp")
	}
	
	func openUrl(urlStr:String!) {
		
		if let url = NSURL(string:urlStr) {
			UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
		}
		
	}
	
	//Twitter Button Func
	
	var TwitterButton : UIButton!
	
	@objc func TwitterButton(_ sender: UIButton) {
		
		openUrl2(urlStr: "https://www.twitter.com/thetylerjp")
	}
	
	func openUrl2(urlStr:String!) {
		
		if let url = NSURL(string:urlStr) {
			UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
		}
		
	}
	
	//Git Button Func
	
	var webButton : UIButton!
	
	@objc func webButton(_ sender: UIButton) {
		
		openUrl3(urlStr: "https://www.tylerjphillips.xyz")
	}
	
	func openUrl3(urlStr:String!) {
		
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

	extension aboutController: CAAnimationDelegate {
		func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
			if flag {
				gradient.colors = gradientSet[currentGradient]
				animateGradient()
			}
		}

	
	
	
	
	
	
	
	
	
}
