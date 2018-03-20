//
//  Track.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 3/19/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import Foundation
import UIKit

//*****************************************************************
// Track struct
//*****************************************************************

struct Track {
	var title: String
	var artist: String
	var artworkImage: UIImage?
	var artworkLoaded = false
	
	init(title: String, artist: String) {
		self.title = title
		self.artist = artist
	}
}
