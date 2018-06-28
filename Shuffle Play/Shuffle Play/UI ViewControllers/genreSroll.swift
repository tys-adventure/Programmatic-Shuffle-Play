//
//  genreSroll.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 3/2/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
////

import Foundation
import UIKit
import MediaPlayer

//class genreScroll: UIViewController {
//	
//	let mainButtonTapped: UIButton = {
//		let button = UIButton.controllerButton()
//		button.setTitle("Home", for: .normal)
//		button.setTitleColor(.white, for: .normal)
//		if let homeImage  = UIImage(named: "music-white.png") {
//			button.setImage(homeImage, for: .normal)
//		}
//		button.addTarget(self, action: #selector(mainButtonTapped(_:)), for:.touchUpInside)
//		button.translatesAutoresizingMaskIntoConstraints = false
//		return button
//	}()
//	
//	let emojiImageView: UIImageView = {
//		let imageView = UIImageView(image: #imageLiteral(resourceName: "emoji2"))
//		imageView.clipsToBounds = true
//		imageView.translatesAutoresizingMaskIntoConstraints = false
//		return imageView
//	}()
//	
//	//Genre Shuffle Play textView
//	let genreTextView: UITextView = {
//		let textView = ProfileController.createTextView()
//		textView.font = UIFont(name:"Avenir Next", size: 25.0)
//		textView.text = "Select Your Main Genre"
//		textView.translatesAutoresizingMaskIntoConstraints = false
//		return textView
//	}()
//	
//	//Blues Button
//	let BluesButton: UIButton = {
//		let btn = UIButton.createButton()
//		btn.setTitle("Blues", for: .normal)
//		btn.addTarget(self, action: #selector(BluesButton(_:)), for:.touchUpInside)
//		btn.translatesAutoresizingMaskIntoConstraints = false
//		return btn
//	}()
//	
//	//Pop Button
//	let PopButton: UIButton = {
//		let btn = UIButton.createButton()
//		btn.setTitle("Pop", for: .normal)
//		btn.layer.borderWidth = 2
//		btn.addTarget(self, action: #selector(PopButton(_:)), for:.touchUpInside)
//		btn.translatesAutoresizingMaskIntoConstraints = false
//		return btn
//	}()
//	
//	//Country Button
//	let CountryButton: UIButton = {
//		let btn = UIButton.createButton()
//		btn.setTitle("Country", for: .normal)
//		btn.addTarget(self, action: #selector(CountryButton(_:)), for:.touchUpInside)
//		btn.translatesAutoresizingMaskIntoConstraints = false
//		return btn
//	}()
//	
//	//Electronic Button
//	let ElectronicButton: UIButton = {
//		let btn = UIButton.createButton()
//		btn.setTitle("Electronic", for: .normal)
//		btn.addTarget(self, action: #selector(ElectronicButton(_:)), for:.touchUpInside)
//		btn.translatesAutoresizingMaskIntoConstraints = false
//		return btn
//	}()
//	
//	//Singer/Songwriter Button
//	let SingerButton: UIButton = {
//		let btn = UIButton.createButton()
//		btn.setTitle("Singer/Songwriter", for: .normal)
//		btn.addTarget(self, action: #selector(SingerButton(_:)), for:.touchUpInside)
//		btn.translatesAutoresizingMaskIntoConstraints = false
//		return btn
//	}()
//	
//	//R&B/Soul Button
//	let RBSoulButton: UIButton = {
//		let btn = UIButton.createButton()
//		btn.setTitle("R&B/Soul", for: .normal)
//		btn.addTarget(self, action: #selector(RBSoulButton(_:)), for:.touchUpInside)
//		btn.translatesAutoresizingMaskIntoConstraints = false
//		return btn
//	}()
//	
//	//Dance
//	let DanceButton: UIButton = {
//		let btn = UIButton.createButton()
//		btn.setTitle("Dance", for: .normal)
//		btn.addTarget(self, action: #selector(DanceButton(_:)), for:.touchUpInside)
//		btn.translatesAutoresizingMaskIntoConstraints = false
//		return btn
//	}()
//	
//	//HipHop/Rap Button
//	let HipHopRapButton: UIButton = {
//		let btn = UIButton.createButton()
//		btn.setTitle("Hip-Hop/Rap", for: .normal)
//		btn.addTarget(self, action: #selector(HipHopRapButton(_:)), for:.touchUpInside)
//		btn.translatesAutoresizingMaskIntoConstraints = false
//		return btn
//	}()
//	
//	//Alternative Button
//	let AlternativeButton: UIButton = {
//		let btn = UIButton.createButton()
//		btn.setTitle("Alternative", for: .normal)
//		btn.addTarget(self, action: #selector(AlternativeButton(_:)), for:.touchUpInside)
//		btn.translatesAutoresizingMaskIntoConstraints = false
//		return btn
//	}()
//	
//	//Rock Button
//	let RockButton: UIButton = {
//		let btn = UIButton.createButton()
//		btn.setTitle("Rock", for: .normal)
//		btn.addTarget(self, action: #selector(RockButton(_:)), for:.touchUpInside)
//		btn.translatesAutoresizingMaskIntoConstraints = false
//		return btn
//	}()
//	
//	//Christian/Gospel
//	let ChristianButton: UIButton = {
//		let btn = UIButton.createButton()
//		btn.setTitle("Christian/Gospel", for: .normal)
//		btn.addTarget(self, action: #selector(ChristianButton(_:)), for:.touchUpInside)
//		btn.translatesAutoresizingMaskIntoConstraints = false
//		return btn
//	}()
//	
//	override func viewDidLoad() {
//		super.viewDidLoad()
//		
//		let screensize: CGRect = UIScreen.main.bounds
//		let screenWidth = screensize.width
//		let screenHeight = screensize.height
//		var scrollView: UIScrollView!
//		scrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: screenWidth, height: screenHeight))
//		
//		view.backgroundColor = UIColor.orange
//		scrollView.backgroundColor = UIColor .orange
//		
//		view.addSubview(genreTextView)
//		view.addSubview(mainButtonTapped)
//		setupLayout()
//		
//		scrollView.addSubview(BluesButton)
//		scrollView.addSubview(CountryButton)
//		scrollView.addSubview(PopButton)
//		scrollView.addSubview(ElectronicButton)
//		scrollView.addSubview(SingerButton)
//		scrollView.addSubview(RBSoulButton)
//		scrollView.addSubview(DanceButton)
//		scrollView.addSubview(HipHopRapButton)
//		scrollView.addSubview(AlternativeButton)
//		scrollView.addSubview(RockButton)
//		scrollView.addSubview(ChristianButton)
//		scrollView.addSubview(emojiImageView)
//		
//		//MARK: AutoLayout Constraints
//		
//		NSLayoutConstraint(item: BluesButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//		NSLayoutConstraint(item: BluesButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
//		NSLayoutConstraint(item: BluesButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 75).isActive = true
//		NSLayoutConstraint(item: BluesButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
//
//		NSLayoutConstraint(item: CountryButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//		NSLayoutConstraint(item: CountryButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
//		NSLayoutConstraint(item: CountryButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 225).isActive = true
//		NSLayoutConstraint(item: CountryButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
//
//		NSLayoutConstraint(item: PopButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//		NSLayoutConstraint(item: PopButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
//		NSLayoutConstraint(item: PopButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 375).isActive = true
//		NSLayoutConstraint(item: PopButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
//		
//		NSLayoutConstraint(item: ElectronicButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//		NSLayoutConstraint(item: ElectronicButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
//		NSLayoutConstraint(item: ElectronicButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 525).isActive = true
//		NSLayoutConstraint(item: ElectronicButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
//
//		NSLayoutConstraint(item: SingerButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//		NSLayoutConstraint(item: SingerButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
//		NSLayoutConstraint(item: SingerButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 675).isActive = true
//		NSLayoutConstraint(item: SingerButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
//		
//		NSLayoutConstraint(item: RBSoulButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//		NSLayoutConstraint(item: RBSoulButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
//		NSLayoutConstraint(item: RBSoulButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 825).isActive = true
//		NSLayoutConstraint(item: RBSoulButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
//		
//		NSLayoutConstraint(item: DanceButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//		NSLayoutConstraint(item: DanceButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
//		NSLayoutConstraint(item: DanceButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 975).isActive = true
//		NSLayoutConstraint(item: DanceButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
//		
//		NSLayoutConstraint(item: HipHopRapButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//		NSLayoutConstraint(item: HipHopRapButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
//		NSLayoutConstraint(item: HipHopRapButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1125).isActive = true
//		NSLayoutConstraint(item: HipHopRapButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
//		
//		NSLayoutConstraint(item: AlternativeButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//		NSLayoutConstraint(item: AlternativeButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
//		NSLayoutConstraint(item: AlternativeButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1275).isActive = true
//		NSLayoutConstraint(item: AlternativeButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
//		
//		NSLayoutConstraint(item: RockButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//		NSLayoutConstraint(item: RockButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
//		NSLayoutConstraint(item: RockButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1425).isActive = true
//		NSLayoutConstraint(item: RockButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
//		
//		NSLayoutConstraint(item: ChristianButton, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//		NSLayoutConstraint(item: ChristianButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 260).isActive = true
//		NSLayoutConstraint(item: ChristianButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1575).isActive = true
//		NSLayoutConstraint(item: ChristianButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
//		
//		NSLayoutConstraint(item: emojiImageView, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//		NSLayoutConstraint(item: emojiImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100).isActive = true
//		NSLayoutConstraint(item: emojiImageView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 1750).isActive = true
//		NSLayoutConstraint(item: emojiImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100).isActive = true
//		
//		scrollView.contentSize = CGSize(width: screenWidth, height: 2000)
//		view.addSubview(scrollView)
//		
//		//ViewDidLoadEnd
//	}
//	
//	private func setupLayout() {
//		
//		genreTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 35).isActive = true
//		genreTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//		genreTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//		genreTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//		genreTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//
//		mainButtonTapped.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
//		mainButtonTapped.widthAnchor.constraint(equalToConstant: 35).isActive = true
//		mainButtonTapped.heightAnchor.constraint(equalToConstant: 35).isActive = true
//		mainButtonTapped.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
//		
//	}
//	
//	@objc func BluesButton(_ sender: UIButton) {
//		
//		let vc = BluesController()
//		self.present(vc, animated: true, completion: nil)
//		
//	}
//	
//	@objc func CountryButton(_ sender: UIButton) {
//		let vc = CountryController()
//		self.present(vc, animated: true, completion: nil)
//	
//	}
//
//	@objc func PopButton(_ sender: UIButton) {
//	
//		let vc = PopController()
//		self.present(vc, animated: true, completion: nil)
//	
//	}
//	
//	@objc func ElectronicButton(_ sender: UIButton) {
//		
//		let vc = ElectronicController()
//		self.present(vc, animated: true, completion: nil)
//		
//	}
//	
//	@objc func SingerButton(_ sender: UIButton) {
//		
//		let vc = SingerController()
//		self.present(vc, animated: true, completion: nil)
//		
//	}
//	
//	@objc func RBSoulButton(_ sender: UIButton) {
//		
//		let vc = RBSoulController()
//		self.present(vc, animated: true, completion: nil)
//		
//	}
//	
//	@objc func DanceButton(_ sender: UIButton) {
//		
//		let vc = DanceController()
//		self.present(vc, animated: true, completion: nil)
//		
//	}
//	
//	@objc func HipHopRapButton(_ sender: UIButton){
//		
//		let vc = HipHopRapController()
//		self.present(vc, animated: true, completion: nil)
//		
//	}
//	
//	@objc func AlternativeButton(_ sender: UIButton){
//		
//		let vc = AlternativeController()
//		self.present(vc, animated: true, completion: nil)
//	}
//	
//	@objc func RockButton(_ sender: UIButton){
//		
//		let vc = RockController()
//		self.present(vc, animated: true, completion: nil)
//	}
//	
//	@objc func ChristianButton(_ sender: UIButton){
//		
//		let vc = ChristianController()
//		self.present(vc, animated: true, completion: nil)
//	}
//	
//	@objc func mainButtonTapped(_ sender: UIButton){
//		
//		self.presentingViewController?.dismiss(animated: true, completion: nil)
//		
//		let vc = PlayController()
//		self.present(vc, animated: true, completion: nil)
//		
//	}
//}
