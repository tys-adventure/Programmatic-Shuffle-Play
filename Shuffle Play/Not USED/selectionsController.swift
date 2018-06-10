//
//  selectionsController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 1/28/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit

class selectionsController: UIViewController {
	
	//Profile Shuffle Play textView
	let genreTextView: UITextView = {
		let textView = ProfileController.createTextView()
		textView.font = UIFont(name:"Avenir Next", size: 25.0)
		textView.text = "Your Genre Selections"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//Profile Shuffle Play textView
	let selectionsTextView: UITextView = {
		let textView = ProfileController.createTextView()
		textView.font = UIFont(name:"Avenir Next", size: 25.0)
		textView.text = "Genre Selections is coming soon, in a future update! Thank you for understanding."
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//Profile UIButton
	let profileButton: UIButton = {
		let button = UIButton.controllerButton()
		if let homeImage  = UIImage(named: "chart1-white.png") {
			button.setImage(homeImage, for: .normal)
		}
		button.addTarget(self, action: #selector(profileButton(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	//MARK: UIGradient Color
	let gradient = CAGradientLayer()
	var gradientSet = [[CGColor]]()
	var currentGradient: Int = 0
	
	let gradientOne = UIColor(red: 255/255, green: 214/255, blue: 139/255, alpha: 1).cgColor
	let gradientTwo = UIColor(red: 255/255, green: 214/255, blue: 139/255, alpha: 1).cgColor
	let gradientThree = UIColor(red: 255/255, green: 214/255, blue: 139/255, alpha: 1).cgColor
	
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
		
		//MARK: addSubView
		view.addSubview(genreTextView)
		view.addSubview(selectionsTextView)
		view.addSubview(profileButton)
		
		setupLayout()
		
		// Do any additional setup after loading the view.
}
	
	private func setupLayout() {
		
		profileButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
		profileButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
		profileButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
		profileButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
		
		genreTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
		genreTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		genreTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		genreTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
		genreTextView.heightAnchor.constraint(equalToConstant: 30).isActive = true
		
		selectionsTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		selectionsTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		selectionsTextView.widthAnchor.constraint(equalToConstant: 400).isActive = true
		selectionsTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
		selectionsTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		selectionsTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
		
	}

	//Profile Button Func
	@objc func profileButton(_ sender: UIButton) {
		
		self.presentingViewController?.dismiss(animated: true, completion: nil)
		
		let vc = ProfileController()
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
		gradientChangeAnimation.fillMode = CAMediaTimingFillMode.forwards
		//gradientChangeAnimation.fillMode = kCAFillModeForwards
		gradientChangeAnimation.isRemovedOnCompletion = false
		gradient.add(gradientChangeAnimation, forKey: "colorChange")
	}
	
}


