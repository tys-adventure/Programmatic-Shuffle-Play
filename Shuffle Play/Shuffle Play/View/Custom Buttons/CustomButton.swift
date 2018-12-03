//
//  CustomControllerButton.swift
//  Shuffle Play
//
//  Created by Thom Pheijffer on 26/06/2018.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
	
	//private var selector: Selector

	init(title: String = "", imageNamed: String) {
		super.init(frame: .zero)
		self.setTitleColor(.black, for: .normal)
		self.layer.shadowColor = UIColor.black.cgColor
		self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		self.layer.masksToBounds = false
		self.layer.shadowRadius = 3.0
		self.layer.shadowOpacity = 1.0
		self.setTitle(title, for: .normal)
		self.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: imageNamed) {
			self.setImage(homeImage, for: .normal)
			self.tintColor = UIColor.black
		}
	
		self.translatesAutoresizingMaskIntoConstraints = false
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	
}
