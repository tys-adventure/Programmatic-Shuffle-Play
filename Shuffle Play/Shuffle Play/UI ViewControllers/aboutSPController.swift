//
//  aboutSPController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 2/4/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
////

import Foundation
import UIKit

class aboutSPController: UIViewController, UINavigationBarDelegate {
	

	let kVersion        = "CFBundleShortVersionString"
	let kBuildNumber    = "CFBundleVersion"
	
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
		//textView.text = "About Shuffle Play"
		textView.text = NSLocalizedString("aboutSPControllerAboutLabelTextView", comment: "")
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//About Shuffle Play textView
	let aboutTextView: UITextView = {
		let textView = UITextView()
		textView.font = UIFont(name:"Avenir Next", size: 16.0)
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.isUserInteractionEnabled = false
		textView.textColor = UIColor.white
		//textView.text = "Have you ever wanted to listen to a specific genre? Shuffle Play let's you do just that! Using your locally stored library from Apple Music, or your iPhone's storage, Shuffle Play shuffles the music on your phone by genre. Allowing you to choose a genre and listen!"
		textView.text = NSLocalizedString("aboutSPControllerAboutTextView", comment: "")
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//HowTo Text View
	let howToTextView: UITextView = {
		let textView = UITextView()
		textView.font = UIFont(name:"Avenir Next", size: 16.0)
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.isUserInteractionEnabled = false
		textView.textColor = UIColor.white
		//textView.text = "Select a genre from the menu screen on the right. Once a genre is selected, music from your locally stored library, or your Apple Music library will play! **Note: If you do not have a specific genre within your library, music will not play.**"
		textView.text = NSLocalizedString("aboutSPControllerHowToTextView", comment: "")
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
		//textView.text = "How To Use Shuffle Play Plus:"
		textView.text = NSLocalizedString("aboutSPControllerHowToLabelTextView", comment: "")
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	lazy var versionLabel: CustomLabel = {
		let lbl = CustomLabel()
		lbl.text = getVersion()
		lbl.translatesAutoresizingMaskIntoConstraints = false
		lbl.textColor = UIColor.white
		return lbl
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = UIColor(red: 137/255, green: 217/255, blue: 255/255, alpha: 1)
		view.layer.cornerRadius = 10
		view.layer.borderWidth = 1.0
		view.layer.borderColor = UIColor.clear.cgColor
		view.layer.masksToBounds = true
		
		//setupLayout
		view.addSubview(aboutLabelTextView)
		view.addSubview(shuffleImageView)
		view.addSubview(aboutTextView)
		view.addSubview(howToTextView)
		view.addSubview(howToLabelTextView)
		view.addSubview(versionLabel)
		
		setupLayout()
		setupNavBarButtons()
		
		navigationItem.title = "About Shuffle Play"
		
	
		// Do any additional setup after loading the view.
	}
	
	private func setupLayout() {
		
		shuffleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		shuffleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
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
		
		versionLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		versionLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
		versionLabel.bottomAnchor.constraint(equalTo: howToTextView.bottomAnchor, constant: 20).isActive = true
		//versionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		//versionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
	}

	//Profile Button Func
	@objc func profileButton(_ sender: UIButton) {
		
		self.presentingViewController?.dismiss(animated: true, completion: nil)
		
		let vc = ProfileController()
		self.present(vc, animated: true, completion: nil)
		
	}
	
	func getVersion() -> String {
		let dictionary  = Bundle.main.infoDictionary!
		let version     = dictionary[kVersion] as! String
		let build       = dictionary[kBuildNumber] as! String
		
		return "Version: \(version) Build: (\(build))"
	}
	
	public func setupNavBarButtons() {
		
		//Menu Button == Left Navigation Bar Button Item
		let menuButton = UIButton(type: .custom)
		menuButton.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
		menuButton.setImage(UIImage(named: "chart1.png"), for: .normal)
		menuButton.addTarget(self, action: #selector(profileButton(_:)), for: UIControl.Event.touchUpInside)
		
		let menuBarButtonItem = UIBarButtonItem(customView: menuButton)
		let currWidth = menuBarButtonItem.customView?.widthAnchor.constraint(equalToConstant: 30);currWidth?.isActive = true
		let currHeight = menuBarButtonItem.customView?.heightAnchor.constraint(equalToConstant: 30);currHeight?.isActive = true
		self.navigationItem.leftBarButtonItem = menuBarButtonItem
		
		self.navigationController?.navigationBar.layer.shadowOpacity = 0.2
		self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
		self.navigationController?.navigationBar.layer.shadowRadius = 2
		
	}
	
}


	
	
	
	
	
	
	
	
	

