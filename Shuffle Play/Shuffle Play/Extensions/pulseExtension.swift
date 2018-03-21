//
//  pulseExtension.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 2/10/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit

extension aboutSPController: CAAnimationDelegate {
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
		if flag {
			gradient.colors = gradientSet[currentGradient]
			animateGradient()
		}
	}
}
