//
//  UIButtonExtension.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 12/30/17.
//  Copyright © 2017 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
	
	//MARK: UIButton Styles
	static func createButton() -> UIButton {
		let button = UIButton()
		button.tintColor=UIColor .gray
		button.backgroundColor = UIColor.white
		button.alpha = 0.4
		button.setTitleColor(.black, for: .normal)
		button.layer.cornerRadius = 5
		button.layer.borderWidth = 2
		button.layer.borderColor = UIColor.white.cgColor
		// Shadow and Radius for Circle Button
		button.layer.shadowColor = UIColor.black.cgColor
		button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		button.layer.masksToBounds = false
		button.layer.shadowRadius = 4.0
		button.layer.shadowOpacity = 0.5
		
		return button
	}
	
	//View Controller Enable/Dismiss buttons
	static func controllerButton() -> UIButton{
		let button = UIButton()
		button.setTitleColor(.black, for: .normal)
		button.layer.shadowColor = UIColor.black.cgColor
		button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		button.layer.masksToBounds = false
		button.layer.shadowRadius = 3.0
		button.layer.shadowOpacity = 1.0
		
		return button
	}
	
	// Play/Pause/Next/Previous Buttons
	static func musicButton() -> UIButton{
		let button = UIButton()
		button.setTitle("", for: .normal)
		button.setTitleColor(.black, for: .normal)
		
		// Shadow and Radius for Circle Button
		button.layer.shadowColor = UIColor.black.cgColor
		button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		button.layer.masksToBounds = false
		button.layer.shadowRadius = 3.0
		button.layer.shadowOpacity = 1.0
		
		return button
	}
	
	//MARK: Button Animations
	func pulsate(){
		
		//TODO: Maybe check if it is available on a device
		// So that it doesn't crash on an iPhone SE
		// But there isn't a functions for so I think it's ok now.
		let haptics = UISelectionFeedbackGenerator()
		haptics.selectionChanged()
		
		let pulse = CASpringAnimation(keyPath: "transform.scale")
		pulse.duration = 0.6
		pulse.fromValue = 0.95
		pulse.toValue = 1.0
		pulse.autoreverses = true
		pulse.repeatCount = 1
		pulse.initialVelocity = 0.5
		pulse.damping = 1.0
		
		layer.add(pulse, forKey: nil)
	}
	
	func flash() {
		
		let flash = CABasicAnimation(keyPath: "opacity")
		flash.duration = 1.0
		flash.fromValue = 1
		flash.toValue = 0.1
		flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
		flash.autoreverses = true
		flash.repeatCount = 1
		
		layer.add(flash, forKey: nil)
	}
		
}
    
    
    
    
    

