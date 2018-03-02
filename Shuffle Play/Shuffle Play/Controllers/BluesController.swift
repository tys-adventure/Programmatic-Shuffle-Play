//
//  BluesController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 3/1/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class BluesController: UIViewController {
	
	var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
	
	
	//Genre Shuffle Play textView
	let genreTextView: UITextView = {
		let textView = UITextView()
		textView.font = UIFont(name:"Avenir Next", size: 25.0)
		textView.font = UIFont.boldSystemFont(ofSize: 18)
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.isUserInteractionEnabled = false
		textView.text = "Genres"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//Profile UIButton
	//Fix Button Image Please
	let mainButtonTapped: UIButton = {
		let button = UIButton()
		button.setTitle("Home", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "music.png") {
			button.setImage(homeImage, for: .normal)
		}
		// Shadow and Radius for Circle Button
		button.layer.shadowColor = UIColor.black.cgColor
		button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		button.layer.masksToBounds = false
		button.layer.shadowRadius = 3.0
		button.layer.shadowOpacity = 1.0
		
		button.addTarget(self, action: #selector(mainButtonTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	//Chicago Blues Button
	let ChicagoButton: UIButton = {
		let btn = createSPButton()
		btn.setTitle("Chicago Blues", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Classic Blues Button
	let ClassicButton: UIButton = {
		let btn = createSPButton()
		btn.setTitle("Classic Blues", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Contemporary Blues Button
	let ContemporaryBluesButton: UIButton = {
		let btn = createSPButton()
		btn.setTitle("Contemporary Blues", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Country Blues Button
	let CountryBluesButton: UIButton = {//(frame: CGRect(x: 55, y: 295, width: 260, height: 45))
		let btn = createSPButton()
		btn.setTitle("Country Blues", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Delta Blues Button
	let DeltaButton: UIButton = {//(frame: CGRect(x: 55, y: 360, width: 260, height: 45))
		let btn = createSPButton()
		btn.setTitle("Delta Blues", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Electric Blues Button
	let ElectricBluesButton: UIButton = {//(frame: CGRect(x: 55, y: 360, width: 260, height: 45))
		let btn = createSPButton()
		btn.setTitle("Electric Blues", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Acoustic Blues Button
	let AcousticBluesButton: UIButton = {
		let btn = createSPButton()
		btn.setTitle("Acoutic Blues", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Gradient
	let gradient = CAGradientLayer()
	var gradientSet = [[CGColor]]()
	var currentGradient: Int = 0
	
	//Shades of blue
	let gradientOne = UIColor(red: 129/255, green: 219/255, blue: 181/255, alpha: 1).cgColor
	let gradientTwo = UIColor(red: 129/255, green: 219/255, blue: 181/255, alpha: 1).cgColor
	let gradientThree = UIColor(red: 129/255, green: 219/255, blue: 181/255, alpha: 1).cgColor
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//Gradient
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
		
		
		//Setup Layout
		
		view.addSubview(genreTextView)
		view.addSubview(mainButtonTapped)
		view.addSubview(ChicagoButton)
		view.addSubview(ClassicButton)
		view.addSubview(ContemporaryBluesButton)
		view.addSubview(CountryBluesButton)
		view.addSubview(DeltaButton)
		view.addSubview(ElectricBluesButton)
		view.addSubview(AcousticBluesButton)
		
		setupLayout()
		
	}
	
	private func setupLayout() {
		
		genreTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
		genreTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		genreTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		genreTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
		genreTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
		
		mainButtonTapped.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
		mainButtonTapped.widthAnchor.constraint(equalToConstant: 35).isActive = true
		mainButtonTapped.heightAnchor.constraint(equalToConstant: 35).isActive = true
		mainButtonTapped.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
		
		ChicagoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		ChicagoButton.topAnchor.constraint(equalTo: genreTextView.bottomAnchor, constant: -525).isActive = true
		ChicagoButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		ChicagoButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		ClassicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		ClassicButton.topAnchor.constraint(equalTo: genreTextView.bottomAnchor, constant: -525).isActive = true
		ClassicButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		ClassicButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		ContemporaryBluesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		ContemporaryBluesButton.topAnchor.constraint(equalTo: ClassicButton.bottomAnchor, constant: 15).isActive = true
		ContemporaryBluesButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		ContemporaryBluesButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		CountryBluesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		CountryBluesButton.topAnchor.constraint(equalTo: ChicagoButton.bottomAnchor, constant: 15).isActive = true
		CountryBluesButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		CountryBluesButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		DeltaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		DeltaButton.topAnchor.constraint(equalTo: CountryBluesButton.bottomAnchor, constant: 15).isActive = true
		DeltaButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		DeltaButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		ElectricBluesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		ElectricBluesButton.topAnchor.constraint(equalTo: ContemporaryBluesButton.bottomAnchor, constant: 15).isActive = true
		ElectricBluesButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		ElectricBluesButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		AcousticBluesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		AcousticBluesButton.topAnchor.constraint(equalTo: DeltaButton.bottomAnchor, constant: 15).isActive = true
		AcousticBluesButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		AcousticBluesButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
	}
	
	//ALL BUTTONS
	static func createSPButton() -> UIButton {
		let button = UIButton()
		button.tintColor=UIColor .gray
		button.setTitleColor(.black, for: .normal)
		button.layer.cornerRadius = 5
		button.layer.borderWidth = 1
		button.layer.borderColor = UIColor.black.cgColor
		return button
	}
	
	//Main Button Tapped
	@objc func mainButtonTapped(_ sender: UIButton) {
		
		self.presentingViewController?.dismiss(animated: true, completion: nil)
		
		let vc = MenuController()
		self.present(vc, animated: true, completion: nil)
		
	}
	
	
	//Any of the genre buttons tapped = this action
	
	@objc func genreButtonTapped(_ sender: UIButton!) {
		
		MPMediaLibrary.requestAuthorization { (status) in
			if status == .authorized{
				self.playGenre(genre: sender.currentTitle!)
			}
		}
		sender.pulsate()
		
	}
	
	func playGenre(genre: String){
		
		musicPlayer.stop()
		let query = MPMediaQuery()
		let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
		
		query.addFilterPredicate(predicate)
		
		musicPlayer.setQueue(with: query)
		musicPlayer.shuffleMode = .songs
		musicPlayer.play()
		
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
		gradientChangeAnimation.duration = 15.00
		gradientChangeAnimation.toValue = gradientSet[currentGradient]
		gradientChangeAnimation.fillMode = kCAFillModeForwards
		gradientChangeAnimation.isRemovedOnCompletion = false
		gradient.add(gradientChangeAnimation, forKey: "colorChange")
	}
	
}
