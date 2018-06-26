//
//  CustomLabelClass.swift
//  Shuffle Play
//
//  Created by Thom Pheijffer on 25/06/2018.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

	init() {
		super.init(frame: .zero)
		self.textAlignment = .center
		self.backgroundColor = UIColor.clear
		self.isUserInteractionEnabled = false
		self.textColor = UIColor(red: 37/255, green: 227/255, blue: 232/255, alpha: 1)
		self.translatesAutoresizingMaskIntoConstraints = false
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
