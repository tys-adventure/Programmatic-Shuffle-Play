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
	
	let tylerImageButton: UIButton = {
		let button = UIButton.controllerButton()
		button.setTitle("Tyler", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "tyler2.jpg") {
			button.setImage(homeImage, for: .normal)
			button.tintColor = UIColor.black
			button.imageView?.contentMode = .scaleAspectFill
		}
		button.layer.cornerRadius = 50
		button.layer.masksToBounds = true
		button.addTarget(self, action: #selector(tylerTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	let tylerLabel: UILabel = {
		let label = UILabel()
		label.textColor = .white
		label.textAlignment = .center
		label.text = NSLocalizedString("aboutControllertylerLabel", comment: "")
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let thomImageButton: UIButton = {
		let button = UIButton.controllerButton()
		button.setTitle("Thom", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "thom1.jpg") {
			button.setImage(homeImage, for: .normal)
			button.tintColor = UIColor.black
			button.imageView?.contentMode = .scaleAspectFill
		}
		button.layer.cornerRadius = 50
		button.layer.masksToBounds = true
		button.addTarget(self, action: #selector(thomTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	let thomLabel: UILabel = {
		let label = UILabel()
		label.textColor = .white
		label.textAlignment = .center
		label.text = NSLocalizedString("aboutControllerthomLabel", comment: "")
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	
	
		override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = UIColor(red: 192/255, green: 144/255, blue: 232/255, alpha: 1)
		view.layer.cornerRadius = 10
		view.layer.borderWidth = 1.0
		view.layer.borderColor = UIColor.clear.cgColor
		view.layer.masksToBounds = true
		
		//setupLayout
		
		view.addSubview(tylerImageButton)
		view.addSubview(thomImageButton)
		view.addSubview(profileButton)
		view.addSubview(tylerLabel)
		view.addSubview(thomLabel)

		setupLayout()

		// Do any additional setup after loading the view.
	}
	
	@objc func tylerTapped(_ sender: UIButton) {
		
		let alertController : UIAlertController = UIAlertController(title: "Social Media", message: "Checkout Tylers Social Media", preferredStyle: .actionSheet)
		let instagramAction : UIAlertAction = UIAlertAction(title: "Instagram", style: .default, handler: {(cameraAction) in
			print("Instagram Selected...")
			self.openUrl(urlStr: "https://instagram.com/TheTylerJP")
		})
		let twitterAction : UIAlertAction = UIAlertAction(title: "Twitter", style: .default, handler: {(libraryAction) in
			print("Twitter Selected...")
			self.openUrl(urlStr: "https://twitter.com/TheTylerJP")
		})
		let websiteAction : UIAlertAction = UIAlertAction(title: "Website", style: .default, handler: {(libraryAction) in
			print("Twitter Selected...")
			self.openUrl(urlStr: "https://thetylerjp.onuniverse.com")
		})
		let cancelAction : UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel , handler: {(cancelActn) in
			print("Cancel action was pressed")
		})
		alertController.addAction(instagramAction)
		alertController.addAction(twitterAction)
		alertController.addAction(websiteAction)
		alertController.addAction(cancelAction)
		alertController.popoverPresentationController?.sourceView = self.view
		alertController.popoverPresentationController?.sourceRect = self.view.frame
		
		self.present(alertController, animated: true, completion: nil)
	}
	
	@objc func thomTapped(_ sender: UIButton) {
		
		let alertController : UIAlertController = UIAlertController(title: "Social Media", message: "Checkout Thoms Social Media", preferredStyle: .actionSheet)
		let instagramAction : UIAlertAction = UIAlertAction(title: "Instagram", style: .default, handler: {(cameraAction) in
			print("Instagram Selected...")
			self.openUrl(urlStr: "https://www.instagram.com/thom_29_/")
		})
		let twitterAction : UIAlertAction = UIAlertAction(title: "Twitter", style: .default, handler: {(libraryAction) in
			print("Twitter Selected...")
			self.openUrl(urlStr: "https://twitter.com/Thom_dev072")
		})
		let cancelAction : UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel , handler: {(cancelActn) in
			print("Cancel action was pressed")
		})
		alertController.addAction(instagramAction)
		alertController.addAction(twitterAction)
		alertController.addAction(cancelAction)
		alertController.popoverPresentationController?.sourceView = self.view
		alertController.popoverPresentationController?.sourceRect = self.view.frame
		
		self.present(alertController, animated: true, completion: nil)
	}
	
	private func setupLayout() {
		
		profileButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
		profileButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
		profileButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
		profileButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
		
		tylerImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		tylerImageButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
		tylerImageButton.widthAnchor.constraint(equalToConstant: 110).isActive = true
		tylerImageButton.heightAnchor.constraint(equalToConstant: 110).isActive = true
		
		tylerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		tylerLabel.topAnchor.constraint(equalTo: tylerImageButton.bottomAnchor, constant: 10).isActive = true
		tylerLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
		tylerLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
		
		thomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		thomLabel.topAnchor.constraint(equalTo: thomImageButton.bottomAnchor, constant: 10).isActive = true
		thomLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
		thomLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
		
		thomImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		thomImageButton.topAnchor.constraint(equalTo: tylerImageButton.bottomAnchor, constant: 75).isActive = true
		thomImageButton.widthAnchor.constraint(equalToConstant: 110).isActive = true
		thomImageButton.heightAnchor.constraint(equalToConstant: 110).isActive = true
	}
	
		func openUrl(urlStr:String!) {
			
			if let url = NSURL(string:urlStr) {
				UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
			}
			
		}

	
	//SP Logo Func
	
	var logoView : UIImageView!
	
	@objc func menuTapped(_ sender: UIButton) {
		let vc = DeveloperMenuViewController()
		self.present(vc, animated: true, completion: nil)
	}
	
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

