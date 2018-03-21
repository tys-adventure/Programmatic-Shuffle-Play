//
//  DanceController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 3/13/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class DanceController: UIViewController {
	
	var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
	
	//MARK: textView
	let genreTextView: UITextView = {
		let textView = UITextView()
		textView.font = UIFont(name:"Avenir Next", size: 25.0)
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.isUserInteractionEnabled = false
		textView.textColor = UIColor.white
		textView.text = "Dance"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//MARK: Buttons
	let mainButtonTapped: UIButton = {
		let button = UIButton.controllerButton()
		button.setTitle("Home", for: .normal)
		if let homeImage  = UIImage(named: "music-white.png") {
			button.setImage(homeImage, for: .normal)
		}
		button.addTarget(self, action: #selector(mainButtonTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	let BreakbeatButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Breakbeat", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let GarageButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Garage", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let HardcoreButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Hardcore", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let HouseButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("House", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let TechnoButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Techno", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let TranceButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Trance", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let ExerciseButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Exercise", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let screensize: CGRect = UIScreen.main.bounds
		let screenWidth = screensize.width
		let screenHeight = screensize.height
		var scrollView: UIScrollView!
		scrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: screenWidth, height: screenHeight))
		
		view.backgroundColor = UIColor.orange
		scrollView.backgroundColor = UIColor .orange
		
		view.addSubview(genreTextView)
		view.addSubview(mainButtonTapped)
		setupLayout()
		
		scrollView.addSubview(BreakbeatButton)
		scrollView.addSubview(GarageButton)
		scrollView.addSubview(HardcoreButton)
		scrollView.addSubview(HouseButton)
		scrollView.addSubview(TechnoButton)
		scrollView.addSubview(TranceButton)
		scrollView.addSubview(ExerciseButton)
		
		//MARK: AutoLayout Constraints
		
		NSLayoutConstraint(item: BreakbeatButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: BreakbeatButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: BreakbeatButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 75).isActive = true
		NSLayoutConstraint(item: BreakbeatButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: GarageButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: GarageButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: GarageButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 225).isActive = true
		NSLayoutConstraint(item: GarageButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: HardcoreButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: HardcoreButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: HardcoreButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 375).isActive = true
		NSLayoutConstraint(item: HardcoreButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: HouseButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: HouseButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: HouseButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 525).isActive = true
		NSLayoutConstraint(item: HouseButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: TechnoButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: TechnoButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: TechnoButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 675).isActive = true
		NSLayoutConstraint(item: TechnoButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: TranceButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: TranceButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: TranceButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 825).isActive = true
		NSLayoutConstraint(item: TranceButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: ExerciseButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: ExerciseButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: ExerciseButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 975).isActive = true
		NSLayoutConstraint(item: ExerciseButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		scrollView.contentSize = CGSize(width: screenWidth, height: 1250)
		view.addSubview(scrollView)
		
		//ViewDidLoadEnd
		
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
	}
	
	@objc func mainButtonTapped(_ sender: UIButton) {
		
		self.presentingViewController?.dismiss(animated: true, completion: nil)
		
		let vc = GenreController()
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
	
}
