//
//  CustomTextView.swift
//  Shuffle Play
//
//  Created by Thom Pheijffer on 25/06/2018.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import UIKit

class CustomTextView: UITextView {

	init(text: String, size: CGFloat) {
		super.init(frame: .zero, textContainer: nil)
		//self.textColor = .white
		self.textAlignment = .center
		self.backgroundColor = UIColor.clear
		self.isUserInteractionEnabled = false
		//self = ProfileController.createTextView()
		self.font = UIFont(name:"Avenir Next", size: size)
		self.textColor = UIColor(red: 37/255, green: 227/255, blue: 232/255, alpha: 1)
		//textView.text = "Genres"
		self.text = text
		self.translatesAutoresizingMaskIntoConstraints = false
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
