//
//  aboutController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 1/27/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
////
import Foundation
import UIKit

class aboutController: UIViewController {
	
	//MARK: Buttons
	let profileButton: UIButton = {
		let button = UIButton.controllerButton()
		button.setTitle("Profile", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "chart1-white.png") {
			button.setImage(homeImage, for: .normal)
			button.tintColor = UIColor.black
		}
		button.addTarget(self, action: #selector(profileButton(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

	let instaButton: UIButton = {
		let button = UIButton()
		button.setTitle("Instagram", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "insta-logo-2.png") {
			button.setImage(homeImage, for: .normal)
			button.tintColor = UIColor.black
		}
		button.addTarget(self, action: #selector(instaButton(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	let twitterButton: UIButton = {
		let button = UIButton()
		button.setTitle("Twitter", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "twitter-logo-3.png") {
			button.setImage(homeImage, for: .normal)
			button.tintColor = UIColor.black
		}
		button.addTarget(self, action: #selector(twitterButton(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	let webButton: UIButton = {
		let button = UIButton()
		button.setTitle("My Website", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "globeicon2.png") {
			button.setImage(homeImage, for: .normal)
			button.tintColor = UIColor.black
		}
		button.addTarget(self, action: #selector(webButton(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

	
	//Tyler Image View
	let tylerImageView: UIImageView = {
		let imageView = UIImageView(image: #imageLiteral(resourceName: "tyler2"))
		imageView.layer.cornerRadius = 5
		imageView.clipsToBounds = true
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	//About Developer textView
	let aboutTextView: UITextView = {
		let textView = UITextView()
		textView.font = UIFont(name:"Avenir Next", size: 25.0)
		textView.font = UIFont.boldSystemFont(ofSize: 18)
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.isUserInteractionEnabled = false
		textView.textColor = UIColor.white
		textView.text = "About The Developer"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//About Tyler textView
	let aboutTylerTextView: UITextView = {
		let textView = UITextView()
		textView.font = UIFont(name:"Avenir Next", size: 18.0)
		//textView.font = UIFont.boldSystemFont(ofSize: 18)
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.textColor = UIColor.white
		textView.isUserInteractionEnabled = false
		textView.text = "I'm Tyler, a 24 yearold iOS Developer from Cleveland, Ohio. Shuffle Play is my first iOS app, created with 2 goals. First is to create a platfrom where you can choose what genre you want to listen to. Second is to learn as much as I can while building Shuffle Play!"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	
		override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = UIColor(red: 192/255, green: 144/255, blue: 232/255, alpha: 1)
		
		//setupLayout
		
		view.addSubview(aboutTylerTextView)
		view.addSubview(aboutTextView)
		view.addSubview(profileButton)
		view.addSubview(tylerImageView)
		view.addSubview(instaButton)
		view.addSubview(twitterButton)
		view.addSubview(webButton)
		
		setupLayout()

		// Do any additional setup after loading the view.
	}
	
	private func setupLayout() {
		
		aboutTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
		aboutTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		aboutTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		aboutTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
		aboutTextView.heightAnchor.constraint(equalToConstant: 30).isActive = true
		
		profileButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
		profileButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
		profileButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
		profileButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
		
		instaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		instaButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 575).isActive = true
		instaButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
		instaButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		twitterButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		twitterButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 575).isActive = true
		twitterButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
		twitterButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		twitterButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 75).isActive = true
		
		webButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		webButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 575).isActive = true
		webButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
		webButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		webButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80).isActive = true
		
		tylerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		tylerImageView.topAnchor.constraint(equalTo: aboutTextView.bottomAnchor, constant: -500 ).isActive = true
		tylerImageView.widthAnchor.constraint(equalToConstant: 110).isActive = true
		tylerImageView.heightAnchor.constraint(equalToConstant: 110).isActive = true
		
		aboutTylerTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		aboutTylerTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		aboutTylerTextView.widthAnchor.constraint(equalToConstant: 400).isActive = true
		aboutTylerTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
		aboutTylerTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
		aboutTylerTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
	}
	
	//SP Logo Func
	
	var logoView : UIImageView!
	
	//Profile Button Func
	@objc func profileButton(_ sender: UIButton) {
		
		self.presentingViewController?.dismiss(animated: true, completion: nil)
		
		let vc = ProfileController()
		self.present(vc, animated: true, completion: nil)
		
	}
	
	//Instagram Button Func
	@objc func instaButton(_ sender: UIButton) {
		
		openUrl(urlStr: "https://www.instagram.com/thetylerjp")
	}
	
	func openUrl(urlStr:String!) {
		
		if let url = NSURL(string:urlStr) {
			UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
		}
		
	}
	
	//Twitter Button Func
	@objc func twitterButton(_ sender: UIButton) {
		
		openUrl2(urlStr: "https://www.twitter.com/thetylerjp")
	}
	
	func openUrl2(urlStr:String!) {
		
		if let url = NSURL(string:urlStr) {
			UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
		}
		
	}
	
	//Web Button Func
	@objc func webButton(_ sender: UIButton) {
		
		openUrl3(urlStr: "https://www.tylerjphillips.xyz")
	}
	
	func openUrl3(urlStr:String!) {
		
		if let url = NSURL(string:urlStr) {
			UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
		}
		
	}
	
}

