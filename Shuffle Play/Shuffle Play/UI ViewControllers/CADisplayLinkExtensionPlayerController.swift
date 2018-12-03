//
//  CADisplayLinkExtensionPlayerController.swift
//  Shuffle Play
//
//  Created by Thom Pheijffer on 06/07/2018.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit

extension PlayerController {
	
	func beginCounting() {
		startDate = Date()
		//displayLink?.invalidate()
		displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
		displayLink?.add(to: .main, forMode: RunLoop.Mode.default)
	}
	
	@objc func handleUpdate() {
		
		if startDate == nil {
			startDate = Date()
			textValue = startValue
		} else {
			let now = Date()
			let totalDiff = now.timeIntervalSince(startDate)
			if totalDiff > duration {
				textValue = endValue
				displayLink?.invalidate()
				displayLink = nil
			} else {
				let percentage = totalDiff / duration
				let percentageCharacters = Double(startValue.count) + Double(percentage) * Double(endValue.count - startValue.count)
				let numberOfCount = Double(Double(endValue.count) * percentageCharacters / 100.0)
				
                let arrayEndValue = Array(endValue)
                for (index, value) in arrayEndValue.enumerated() {
                    if Double(index) < numberOfCount {
                        textValue += String(value)
                    }
                }
                
                
                
			}
		}
		
		genreTextView.text = textValue
		
		
	}
	
}
