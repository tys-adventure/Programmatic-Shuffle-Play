//
//  GenreButton.swift
//  CustomUIElements
//
//  Created by Thom Pheijffer on 23/07/2018.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation

class CustomGenreButtonFramework: UIButton {
	
	init(title: String) {
		super.init(frame: .zero)
		self.tintColor = UIColor .gray
		self.backgroundColor = UIColor(red: 37/255, green: 227/255, blue: 232/255, alpha: 0.5)
		self.alpha = 0.5
		self.setTitleColor(.black, for: .normal)
		self.layer.cornerRadius = 5
		
		self.layer.shadowColor = UIColor.black.cgColor
		self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		self.layer.masksToBounds = false
		self.layer.shadowRadius = 4.0
		self.layer.shadowOpacity = 0.5
		self.setTitle(title, for: .normal)
		self.translatesAutoresizingMaskIntoConstraints = false
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
