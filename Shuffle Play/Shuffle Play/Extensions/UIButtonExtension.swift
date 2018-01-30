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
	
	func pulsate(){
		
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


/*
class SPButton : UIButton {
	func pulsate() {
			
		let pulse = CASpringAnimation(keyPath: "transform.scale")
		pulse.duration = 0.6
		pulse.fromValue = 0.95
		pulse.toValue = 1.0
		pulse.autoreverses = true
		pulse.repeatCount = 1
		pulse.initialVelocity = 0.5
		pulse.damping = 1.0
			
		layer.add(pulse, forKey: nil)
			
	} */
		
}
    
    
    
    
    

