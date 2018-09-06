//
//  CustomImageViewFramework.swift
//  CustomUIElements
//
//  Created by Thom Pheijffer on 23/07/2018.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation

class TPImageView: UIImageView {
	
	init(shadowRadius: CGFloat, shadowOpacity: Float, image: UIImage?) {
		super.init(frame: .zero)
		if image != nil {
			self.image = image
		}
		isUserInteractionEnabled = true
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		layer.masksToBounds = false
		layer.shadowRadius = shadowRadius
		layer.shadowOpacity = shadowOpacity
		translatesAutoresizingMaskIntoConstraints = false
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
