//
//  HipHopRapController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 3/13/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class HipHopRapController: UIViewController {
	
	var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
	
	let mainButtonTapped: UIButton = {
		let button = UIButton.controllerButton()
		button.setTitle("Home", for: .normal)
		button.setTitleColor(.white, for: .normal)
		if let homeImage  = UIImage(named: "music-white.png") {
			button.setImage(homeImage, for: .normal)
		}
		button.addTarget(self, action: #selector(mainButtonTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	//Genre Shuffle Play textView
	let genreTextView: UITextView = {
		let textView = SettingsController.createTextView()
		textView.font = UIFont(name:"Avenir Next", size: 25.0)
		textView.text = "Hip-Hop/Rap"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	let AlternativeRapButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Alternative Rap", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let DirtySouthButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Dirty South", for: .normal)
		btn.layer.borderWidth = 2
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let EastCoastRapButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("East Coast Rap", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let GangstaRapButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Gangsta Rap", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let HardcoreRapButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Hardcore Rap", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let HipHopButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Hip-Hop", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let LatinRapButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Latin Rap", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let OldSchoolRapButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Old School Rap", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let RapButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Rap", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let UndergroundRapButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("Underground Rap", for: .normal)
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let WestCoastRapButton: UIButton = {
		let btn = UIButton.createButton()
		btn.setTitle("West Coast Rap", for: .normal)
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
		
		scrollView.addSubview(AlternativeRapButton)
		scrollView.addSubview(DirtySouthButton)
		scrollView.addSubview(EastCoastRapButton)
		scrollView.addSubview(GangstaRapButton)
		scrollView.addSubview(HardcoreRapButton)
		scrollView.addSubview(HipHopButton)
		scrollView.addSubview(LatinRapButton)
		scrollView.addSubview(OldSchoolRapButton)
		scrollView.addSubview(RapButton)
		scrollView.addSubview(UndergroundRapButton)
		scrollView.addSubview(WestCoastRapButton)
		
		//MARK: AutoLayout Constraints
		
		NSLayoutConstraint(item: AlternativeRapButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: AlternativeRapButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: AlternativeRapButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 75).isActive = true
		NSLayoutConstraint(item: AlternativeRapButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: DirtySouthButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: DirtySouthButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: DirtySouthButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 225).isActive = true
		NSLayoutConstraint(item: DirtySouthButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: EastCoastRapButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: EastCoastRapButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: EastCoastRapButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 375).isActive = true
		NSLayoutConstraint(item: EastCoastRapButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: GangstaRapButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: GangstaRapButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: GangstaRapButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 525).isActive = true
		NSLayoutConstraint(item: GangstaRapButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: HardcoreRapButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: HardcoreRapButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: HardcoreRapButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 675).isActive = true
		NSLayoutConstraint(item: HardcoreRapButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: HipHopButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: HipHopButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: HipHopButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 825).isActive = true
		NSLayoutConstraint(item: HipHopButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: LatinRapButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: LatinRapButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: LatinRapButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 975).isActive = true
		NSLayoutConstraint(item: LatinRapButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: HipHopButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: HipHopButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: HipHopButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1125).isActive = true
		NSLayoutConstraint(item: HipHopButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: OldSchoolRapButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: OldSchoolRapButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: OldSchoolRapButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1275).isActive = true
		NSLayoutConstraint(item: OldSchoolRapButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: RapButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: RapButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: RapButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1425).isActive = true
		NSLayoutConstraint(item: RapButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: UndergroundRapButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: UndergroundRapButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: UndergroundRapButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1575).isActive = true
		NSLayoutConstraint(item: UndergroundRapButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		NSLayoutConstraint(item: WestCoastRapButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
		NSLayoutConstraint(item: WestCoastRapButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
		NSLayoutConstraint(item: WestCoastRapButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1725).isActive = true
		NSLayoutConstraint(item: WestCoastRapButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		scrollView.contentSize = CGSize(width: screenWidth, height: 2000)
		view.addSubview(scrollView)
		
		//ViewDidLoadEnd
	}
	
	private func setupLayout() {
		
		genreTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 35).isActive = true
		genreTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		genreTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		genreTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
		genreTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
		
		mainButtonTapped.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
		mainButtonTapped.widthAnchor.constraint(equalToConstant: 35).isActive = true
		mainButtonTapped.heightAnchor.constraint(equalToConstant: 35).isActive = true
		mainButtonTapped.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
		
	}
	
	
	@objc func mainButtonTapped(_ sender: UIButton){
		
		self.presentingViewController?.dismiss(animated: true, completion: nil)
		
		let vc = PlayController()
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
