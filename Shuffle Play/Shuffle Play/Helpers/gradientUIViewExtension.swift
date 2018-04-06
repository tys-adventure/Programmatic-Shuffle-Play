//
//  gradientUIViewExtension.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 2/10/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit



//UIGradient Color
//Goes Above View Did Load
/*

let gradient = CAGradientLayer()
var gradientSet = [[CGColor]]()
var currentGradient: Int = 0

let gradientOne = UIColor(red: 48/255, green: 62/255, blue: 103/255, alpha: 1).cgColor
let gradientTwo = UIColor(red: 244/255, green: 88/255, blue: 53/255, alpha: 1).cgColor
let gradientThree = UIColor(red: 196/255, green: 70/255, blue: 107/255, alpha: 1).cgColor
*/

	
	//UIGradient
	//Goes In View Did Load
	/*
	gradientSet.append([gradientOne, gradientTwo])
	gradientSet.append([gradientTwo, gradientThree])
	gradientSet.append([gradientThree, gradientOne])
	
	
	gradient.frame = self.view.bounds
	gradient.colors = gradientSet[currentGradient]
	gradient.startPoint = CGPoint(x:0, y:0)
	gradient.endPoint = CGPoint(x:1, y:1)
	gradient.drawsAsynchronously = true
	self.view.layer.addSublayer(gradient)
	
	animateGradient()
	*/

//Goes under View did Load

/*
//UIGradient Func
override func viewDidAppear(_ animated: Bool) {
	super.viewDidAppear(animated)
	
}


//UIColor Gradient Func

func animateGradient() {
	if currentGradient < gradientSet.count - 1 {
		currentGradient += 1
	} else {
		currentGradient = 0
	}
	
	let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
	gradientChangeAnimation.duration = 7.00
	gradientChangeAnimation.toValue = gradientSet[currentGradient]
	gradientChangeAnimation.fillMode = kCAFillModeForwards
	gradientChangeAnimation.isRemovedOnCompletion = false
	gradient.add(gradientChangeAnimation, forKey: "colorChange")
}
*/


extension UIView {
	
	func setGradientBackgroundColor(colorOne: UIColor, colorTwo: UIColor) {
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame = bounds
		gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
		//gradientLayer.locations = [0.0, 1.0]
		gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
		
		layer.insertSublayer(gradientLayer, at: 0)
		
	}
}
