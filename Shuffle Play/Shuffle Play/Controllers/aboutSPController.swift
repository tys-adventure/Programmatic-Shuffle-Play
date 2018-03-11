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
	

	//Profile UIButton
	let profileButton: UIButton = {
		let button = UIButton()
		button.setTitle("Profile", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "chart1-white.png") {
			button.setImage(homeImage, for: .normal)
		}
		// Shadow and Radius for Circle Button
		button.layer.shadowColor = UIColor.black.cgColor
		button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		button.layer.masksToBounds = false
		button.layer.shadowRadius = 3.0
		button.layer.shadowOpacity = 0.5
		
		button.addTarget(self, action: #selector(profileButton(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	//Logo imageView
	let shuffleImageView: UIImageView = {
		let imageView = UIImageView(image: #imageLiteral(resourceName: "SPEmoji"))
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	//Profile Shuffle Play textView
	let aboutLabelTextView: UITextView = {
		let textView = UITextView()
		textView.font = UIFont(name:"Avenir Next", size: 25.0)
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.isUserInteractionEnabled = false
		textView.textColor = UIColor.white
		textView.text = "About Shuffle Play"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//About Shuffle Play textView
	let aboutTextView: UITextView = {
		let textView = UITextView()
		textView.font = UIFont(name:"Avenir Next", size: 15.0)
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.isUserInteractionEnabled = false
		textView.textColor = UIColor.white
		textView.text = "Have you ever wanted to listen to a specific genre? Shuffle Play let's you do just that! Using your locally stored library from Apple Music, or your iPhone's storage, Shuffle Play shuffles the music on your phone by genre. Allowing you to choose a genre and listen!"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//HowTo Text View
	let howToTextView: UITextView = {
		let textView = UITextView()
		textView.font = UIFont(name:"Avenir Next", size: 15.0)
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.isUserInteractionEnabled = false
		textView.textColor = UIColor.white
		textView.text = "Select a genre from the menu screen on the right. Once a genre is selected, music from your locally stored library, or your Apple Music library will play! **Note: If you do not have a specific genre within your library, music will not play.**"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//HowTo Label
	let howToLabelTextView: UITextView = {
		let textView = UITextView()
		textView.font = UIFont(name:"Avenir Next", size: 25.0)
		textView.font = UIFont.boldSystemFont(ofSize: 18)
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.isUserInteractionEnabled = false
		textView.textColor = UIColor.white
		textView.text = "How To Use Shuffle Play Plus:"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//UIGradient Color
	let gradient = CAGradientLayer()
	var gradientSet = [[CGColor]]()
	var currentGradient: Int = 0
	
	let gradientOne = UIColor(red: 137/255, green: 217/255, blue: 255/255, alpha: 1).cgColor
	let gradientTwo = UIColor(red: 137/255, green: 217/255, blue: 255/255, alpha: 1).cgColor
	let gradientThree = UIColor(red: 137/255, green: 217/255, blue: 255/255, alpha: 1).cgColor
	
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
		
		
		//setupLayout
		
		view.addSubview(profileButton)
		view.addSubview(aboutLabelTextView)
		view.addSubview(shuffleImageView)
		view.addSubview(aboutTextView)
		view.addSubview(howToTextView)
		view.addSubview(howToLabelTextView)
		
		setupLayout()

	
		// Do any additional setup after loading the view.
	}
	
	private func setupLayout() {
		
		aboutLabelTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
		aboutLabelTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		aboutLabelTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		aboutLabelTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
		aboutLabelTextView.heightAnchor.constraint(equalToConstant: 30).isActive = true
		
		profileButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
		profileButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
		profileButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
		profileButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
		
		shuffleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		shuffleImageView.topAnchor.constraint(equalTo: aboutLabelTextView.bottomAnchor, constant: -465).isActive = true
		shuffleImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
		shuffleImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
		
		aboutTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		aboutTextView.topAnchor.constraint(equalTo: shuffleImageView.bottomAnchor, constant: 25).isActive = true
		aboutTextView.widthAnchor.constraint(equalToConstant: 400).isActive = true
		aboutTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
		aboutTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
		aboutTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
		
		howToTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		howToTextView.topAnchor.constraint(equalTo: howToLabelTextView.bottomAnchor, constant: 15).isActive = true
		howToTextView.widthAnchor.constraint(equalToConstant: 400).isActive = true
		howToTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
		howToTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
		howToTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
		
		howToLabelTextView.topAnchor.constraint(equalTo: aboutTextView.bottomAnchor, constant: -50).isActive = true
		howToLabelTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		howToLabelTextView.widthAnchor.constraint(equalToConstant: 350).isActive = true
		howToLabelTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
		
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
		gradientChangeAnimation.fillMode = kCAFillModeForwards
		gradientChangeAnimation.isRemovedOnCompletion = false
		gradient.add(gradientChangeAnimation, forKey: "colorChange")
	}
	
}


	
	
	
	
	
	
	
	
	

