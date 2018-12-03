//
//  AutoLayoutContraints.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 4/5/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit

//*****************************************
//    MARK:  UIView
//*****************************************
//Constraints Extension
extension UIView {
	func addConstraintWithFormat(format: String, view: UIView...) {
		var viewsDictionary = [String: UIView]()
		for (index, view) in view.enumerated(){
			let key = "v\(index)"
			view.translatesAutoresizingMaskIntoConstraints = false
			viewsDictionary[key] = view
		}
		
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
		
	}
}
