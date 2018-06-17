//
//  ViewControllerExtension.swift
//  Shuffle Play
//
//  Created by Thom Pheijffer on 17/06/2018.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import UIKit

extension UIViewController {
	func showAlertErrorView(title: String, message: String, continueMessage: String) {
		let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: continueMessage, style: .default))
		present(ac, animated: true)
	}
}
