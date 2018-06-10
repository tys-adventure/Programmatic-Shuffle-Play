//
//  ProfileController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 1/12/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
////

import UIKit
import MediaPlayer

class ProfileController: UIViewController {

	var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
	var nowPlayingInfo = MPNowPlayingInfoCenter.self

	//MARK: TextViews
	let reviewTextView: UITextView = {
		let textView = createTextView()
		textView.font = UIFont(name:"Avenir Next", size: 18.0)
		textView.text = "If you like Shuffle Play Plus, or you have ways I can improve Shuffle Play Plus, please leave a review on the app store and I'll make sure to try and add it to the feature list!"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	let profileTextView: UITextView = {
		let textView = UITextView()
		textView.font = UIFont(name:"Avenir Next", size: 25.0)
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.isUserInteractionEnabled = false
		textView.textColor = UIColor.white
		textView.text = "Your Profile"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//MARK: Buttons
	let profileButtonTapped: UIButton = {
		let button = UIButton()
		button.setTitle("Home", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "music-white.png") {
			button.setImage(homeImage, for: .normal)
		}
		// Shadow and Radius for Circle Button
		button.layer.shadowColor = UIColor.black.cgColor
		button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		button.layer.masksToBounds = false
		button.layer.shadowRadius = 3.0
		button.layer.shadowOpacity = 1.0
		
		button.addTarget(self, action: #selector(profileButtonTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	let aboutSPButtonTapped: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("About Shuffle Play", for: .normal)
		btn.addTarget(self, action: #selector(aboutSPButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let ReviewButtonTapped: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Review SPP on the App Store!", for: .normal)
		btn.addTarget(self, action: #selector(ReviewButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()

	let AboutButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("About The Developer", for: .normal)
		btn.addTarget(self, action: #selector(AboutButton(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		view.backgroundColor = UIColor(red: 235/255, green: 88/255, blue: 80/255, alpha: 1)
		
		//MARK: .addSubView
		view.addSubview(profileButtonTapped)
		view.addSubview(profileTextView)
		view.addSubview(aboutSPButtonTapped)
		view.addSubview(AboutButton)
		view.addSubview(ReviewButtonTapped)
		view.addSubview(reviewTextView)
		
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
		AboutButton.topAnchor.constraint(equalTo: aboutSPButtonTapped.bottomAnchor, constant: 50  ).isActive = true
		AboutButton.widthAnchor.constraint(equalToConstant: 260).isActive = true
		AboutButton.heightAnchor.constraint(equalToConstant: 45).isActive = true

		ReviewButtonTapped.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		ReviewButtonTapped.topAnchor.constraint(equalTo: AboutButton.bottomAnchor, constant: 200).isActive = true
		ReviewButtonTapped.widthAnchor.constraint(equalToConstant: 260).isActive = true
		ReviewButtonTapped.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		aboutSPButtonTapped.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		aboutSPButtonTapped.topAnchor.constraint(equalTo: profileTextView.bottomAnchor, constant: -450 ).isActive = true
		aboutSPButtonTapped.widthAnchor.constraint(equalToConstant: 260).isActive = true
		aboutSPButtonTapped.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		reviewTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		reviewTextView.topAnchor.constraint(equalTo: AboutButton.bottomAnchor, constant: 50).isActive = true
		reviewTextView.widthAnchor.constraint(equalToConstant: 400).isActive = true
		reviewTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
		reviewTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
		reviewTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
		
		//End viewDidLoad
	}
	
	//MARK: TextView Functions
	static func createTextView() -> UITextView{
		let textView = UITextView()
		textView.textColor = .white
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.isUserInteractionEnabled = false
		
		return textView
	}
	
	//MARK: Button Functions
	static func createProfileButton() -> UIButton {
		let button = UIButton()
		button.tintColor=UIColor .gray
		button.backgroundColor = UIColor.white
		button.alpha = 0.4
		button.setTitleColor(.black, for: .normal)
		button.layer.cornerRadius = 5
		button.layer.borderWidth = 2
		button.layer.borderColor = UIColor.white.cgColor
		// Shadow and Radius for Circle Button
		button.layer.shadowColor = UIColor.black.cgColor
		button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		button.layer.masksToBounds = false
		button.layer.shadowRadius = 4.0
		button.layer.shadowOpacity = 0.5
		
		return button
	}
	
	@objc func profileButtonTapped(_ sender: UIButton) {
		
		self.presentingViewController?.dismiss(animated: true, completion: nil)
		
		let vc = PlayController()
		self.present(vc, animated: true, completion: nil)
		
	}
	
	@objc func aboutSPButtonTapped(_ sender: UIButton) {
		
		let vc = aboutSPController()
		self.present(vc, animated: true, completion: nil)
		sender.pulsate()
		
	}
	
	@objc func AboutButton(_ sender: UIButton) {
		
		let vc = aboutController()
		self.present(vc, animated: true, completion: nil)
		sender.pulsate()
		
	}
	
	@objc func ReviewButtonTapped(_ sender: UIButton) {
		
		openUrl(urlStr: "https://itunes.apple.com/us/app/shuffle-play-plus/id1340720169?mt=8")
	}
	
	func openUrl(urlStr:String!) {
		
		if let url = NSURL(string:urlStr) {
			UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
		}
		
	}
	
}






