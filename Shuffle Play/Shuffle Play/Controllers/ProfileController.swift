//
//  ProfileController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 1/12/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import UIKit
import MediaPlayer

class ProfileController: UIViewController {

	var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
	var nowPlayingInfo = MPNowPlayingInfoCenter.self

	
	//Profile UIButton
	let profileButtonTapped: UIButton = {
		let button = UIButton()
		button.setTitle("Home", for: .normal)
		button.setTitleColor(.black, for: .normal)
			if let homeImage  = UIImage(named: "home-icon.png") {
					button.setImage(homeImage, for: .normal)
				}
		button.addTarget(self, action: #selector(profileButtonTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	//Profile Shuffle Play textView
	let profileTextView: UITextView = {
		let textView = UITextView()
		textView.font = UIFont(name:"Avenir Next", size: 25.0)
		textView.font = UIFont.boldSystemFont(ofSize: 18)
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.isUserInteractionEnabled = false
		textView.text = "Your Profile"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//About Shuffle Play Button
	let aboutSPButtonTapped: UIButton = {
		let btn = MenuController.createSPButton()
		btn.setTitle("About Shuffle Play", for: .normal)
		btn.addTarget(self, action: #selector(aboutSPButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Selections Button
	let GenreSelectionButtonTapped: UIButton = {
		let btn = MenuController.createSPButton()
		btn.setTitle("Your Genre Selections", for: .normal)
		btn.addTarget(self, action: #selector(GenreSelectionButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Selections Button
	/*
	let GenreSelectionButtonTapped: UIButton = {
		let button = UIButton()
		button.tintColor=UIColor .gray
		button.setTitleColor(.black, for: .normal)
		button.layer.cornerRadius = 5
		button.layer.borderWidth = 1
		button.layer.borderColor = UIColor.black.cgColor
		button.setTitle("Genre Selections", for: .normal)
		button.addTarget(self, action: #selector(GenreSelectionButtonTapped(_:)), for:.touchUpInside)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	*/
	
	//About Developer Button
	let AboutButton: UIButton = {
		let btn = MenuController.createSPButton()
		btn.setTitle("About The Developer", for: .normal)
		btn.addTarget(self, action: #selector(AboutButton(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
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
		
		view.addSubview(profileButtonTapped)
		view.addSubview(profileTextView)
		view.addSubview(aboutSPButtonTapped)
		view.addSubview(AboutButton)
		view.addSubview(GenreSelectionButtonTapped)
		
		setupLayout()
		
        // Do any additional setup after loading the view.
    }
	
	
	private func setupLayout() {
	
		profileButtonTapped.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
		profileButtonTapped.widthAnchor.constraint(equalToConstant: 35).isActive = true
		profileButtonTapped.heightAnchor.constraint(equalToConstant: 35).isActive = true
		profileButtonTapped.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
		
		profileTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
		profileTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		profileTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		profileTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
		profileTextView.heightAnchor.constraint(equalToConstant: 30).isActive = true
		
		AboutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		AboutButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
		AboutButton.widthAnchor.constraint(equalToConstant: 260).isActive = true
		AboutButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		GenreSelectionButtonTapped.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		GenreSelectionButtonTapped.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
		GenreSelectionButtonTapped.widthAnchor.constraint(equalToConstant: 260).isActive = true
		GenreSelectionButtonTapped.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		aboutSPButtonTapped.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		aboutSPButtonTapped.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
		aboutSPButtonTapped.widthAnchor.constraint(equalToConstant: 260).isActive = true
		aboutSPButtonTapped.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
	}

	//Button functions
	
	@objc func profileButtonTapped(_ sender: UIButton) {
		
		//Segue between ViewControllers
		let vc = MainUIController() //view controller
		self.present(vc, animated: true, completion: nil)
		
	}
	

	
	@objc func aboutSPButtonTapped(_ sender: UIButton) {
		
		//Segue between ViewControllers
		let vc = aboutSPController() //view controller
		self.present(vc, animated: true, completion: nil)
		sender.pulsate()
		
	}
	

	
	@objc func GenreSelectionButtonTapped(_ sender: UIButton) {
		
		//Segue between ViewControllers
		let vc = selectionsController() //view controller
		self.present(vc, animated: true, completion: nil)
		sender.pulsate()
		
	}
	
	
	@objc func AboutButton(_ sender: UIButton) {
		
		//Segue between ViewControllers
		let vc = aboutController() //view controller
		self.present(vc, animated: true, completion: nil)
		sender.pulsate()
		
	}
	
	var InstagramButton : UIButton!
	
	@objc func InstagramButton(_ sender: UIButton) {
		
		openUrl(urlStr: "https://www.instagram.com/thetylerjp")
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




    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



