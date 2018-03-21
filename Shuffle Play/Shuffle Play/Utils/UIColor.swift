//
//  UIColor.swift
//  Shuffle Play
//
//  Created by Patrick Bellot on 3/20/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import UIKit

extension UIColor {
	
	static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
		return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
	}

	static func brightOrange() -> UIColor {
		return UIColor.rgb(red: 255, green: 69, blue: 0)
	}
	
	static func red() -> UIColor {
		return UIColor.rgb(red: 255, green: 115, blue: 115)
	}
	
	static func orange() -> UIColor {
		return UIColor.rgb(red: 255, green: 175, blue: 72)
	}
	
	static func blue() -> UIColor {
		return UIColor.rgb(red: 74, green: 144, blue: 228)
	}
	
	static func green() -> UIColor {
		return UIColor.rgb(red: 91, green: 197, blue: 159)
	}
	
	static func white() -> UIColor {
		return UIColor.rgb(red: 255, green: 255, blue: 255)
	}
}
