//
//  genreSroll.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 3/2/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class genreScroll: UIViewController {
	
	let labelOne: UILabel = {
		let label = UILabel()
		label.text = "Scroll Top"
		label.backgroundColor = .red
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let labelTwo: UILabel = {
		let label = UILabel()
		label.text = "Scroll Bottom"
		label.backgroundColor = .green
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	//Blues Button
	let BluesButton: UIButton = {
		let btn = MenuController.createSPButton()
		btn.setTitle("Blues", for: .normal)
		btn.layer.borderWidth = 2
		btn.backgroundColor = UIColor.white
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.white.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(BluesButton(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Pop Button
	let PopButton: UIButton = {
		let btn = MenuController.createSPButton()
		btn.setTitle("Pop", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(PopButton(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Country Button
	let CountryButton: UIButton = {
		let btn = MenuController.createSPButton()
		btn.setTitle("Country", for: .normal)
		//btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(CountryButton(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let screensize: CGRect = UIScreen.main.bounds
		let screenWidth = screensize.width
		let screenHeight = screensize.height
		var scrollView: UIScrollView!
		scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
		
		scrollView.backgroundColor = UIColor .orange
		
		scrollView.addSubview(labelTwo)
		scrollView.addSubview(BluesButton)
		scrollView.addSubview(PopButton)
		scrollView.addSubview(CountryButton)
		
		NSLayoutConstraint(item: labelTwo, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
		NSLayoutConstraint(item: labelTwo, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
		NSLayoutConstraint(item: labelTwo, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 10).isActive = true
		NSLayoutConstraint(item: labelTwo, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
		
		
		//Blues Button
		NSLayoutConstraint(item: BluesButton, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leadingMargin, multiplier: 1, constant: 40).isActive = true
		NSLayoutConstraint(item: BluesButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		NSLayoutConstraint(item: BluesButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 100).isActive = true
		NSLayoutConstraint(item: BluesButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		//Pop Button
		NSLayoutConstraint(item: PopButton, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leadingMargin, multiplier: 1, constant: 40).isActive = true
		NSLayoutConstraint(item: PopButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		NSLayoutConstraint(item: PopButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 250).isActive = true
		NSLayoutConstraint(item: PopButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		//Country Button
		NSLayoutConstraint(item: CountryButton, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leadingMargin, multiplier: 1, constant: 40).isActive = true
		NSLayoutConstraint(item: CountryButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		NSLayoutConstraint(item: CountryButton, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 350).isActive = true
		NSLayoutConstraint(item: CountryButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 130).isActive = true
		
		scrollView.contentSize = CGSize(width: screenWidth, height: 2000)
		view.addSubview(scrollView)
		
		
		
		//ViewDidLoadEnd
	}

	
	@objc func BluesButton(_ sender: UIButton) {
		
		//self.presentingViewController?.dismiss(animated: true, completion: nil)
		
		let vc = BluesController()
		self.present(vc, animated: true, completion: nil)
		
	}


	@objc func CountryButton(_ sender: UIButton) {
	
		//self.presentingViewController?.dismiss(animated: true, completion: nil)
	
		let vc = CountryController()
		self.present(vc, animated: true, completion: nil)
	
	}

	@objc func PopButton(_ sender: UIButton) {
	
		//self.presentingViewController?.dismiss(animated: true, completion: nil)
	
		let vc = PopController()
		self.present(vc, animated: true, completion: nil)
	
	}



	
	
	
	
	
}
