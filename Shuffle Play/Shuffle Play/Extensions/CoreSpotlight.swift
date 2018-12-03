//
//  CoreSpotlight.swift
//  Shuffle Play
//
//  Created by Thom Pheijffer on 08/06/2018.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import CoreSpotlight
import MobileCoreServices

class SpotlightSupport {
	
	#warning("Add better descriptions")
	#warning("Descriptions doesn't match")	
	static let genres = PlayerController.buttonTitles
	
	static let descriptions = ["Shuffle Blues", "Shuffle Country", "Shuffle Pop", "Shuffle Electronic", "Shuffle Singer", "Shuffle RB Soul", "Shuffle Dance", "Shuffle Hip Hop Rap", "Shuffle Alternative", "Shuffle Christian"]
	
	func integrateCoreSpotlight() {
		
		for genre in 0..<SpotlightSupport.genres.count {
			let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
			attributeSet.title = SpotlightSupport.genres[genre]
			attributeSet.contentDescription = SpotlightSupport.descriptions[genre]
			
			let item = CSSearchableItem(uniqueIdentifier: SpotlightSupport.genres[genre], domainIdentifier: "com.tyler.shuffleplayplus", attributeSet: attributeSet)
			CSSearchableIndex.default().indexSearchableItems([item]) { error in
				if let error = error {
					print("Indexing error: \(error.localizedDescription)")
				} else {
					print("Search item successfully indexed!")
				}
			}
		}
		print("Spotlight done")
	}
	
	
}



