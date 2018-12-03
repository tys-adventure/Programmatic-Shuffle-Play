//
//  InterfaceController.swift
//  WatchAppShufflePlayPlus Extension
//
//  Created by Thom Pheijffer on 15/06/2018.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {
	
	@IBOutlet weak var tableView: WKInterfaceTable!
	var genres: [String] = []
	
	override func awake(withContext context: Any?) {
		super.awake(withContext: context)
		
		if let defaults = UserDefaults(suiteName: "group.com.thom.shufflePlayPlus") {
			if defaults.value(forKey: "genresWatch") != nil {
				let genres = defaults.value(forKey: "genresWatch") as! [String]
				self.genres = genres
			} else {
				genres = []
			}
		}
		
		
		// Configure interface objects here.
		checkOfWCSessionIsSupported()
		updateTable()
	}
	
	override func willActivate() {
		// This method is called when watch view controller is about to be visible to user
		super.willActivate()
	}
	
	override func didDeactivate() {
		// This method is called when watch view controller is no longer visible
		super.didDeactivate()
	}
	
	func updateTable() {
		tableView.setNumberOfRows(genres.count, withRowType: "Cell")
		
		for (index,genre) in genres.enumerated() {
			guard let row = tableView.rowController(at: index) as? GenreRow else { return }
			row.textLabel.setText(genre)
		}
		
	}
	
	func checkOfWCSessionIsSupported() {
		let session = WCSession.default
		session.delegate = self
		session.activate()
	}
	
	func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
		
	}
	
	override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
		let genre = genres[rowIndex]
		sendDataToPhone(genre: genre)
		
		return nil
	}
	
	func sendDataToPhone(genre: String) {
		let session = WCSession.default
		if session.isReachable {
			var data: [String : String] = ["":""]
			switch genre {
			case "Hip Hop": data = ["genre":"Hip-Hop"]
			case "Elektrisch": data = ["genre":"Electronic"]
			case "Koreanse Pop": data = ["genre":"K-Pop"]
			default: data = ["genre":genre]
			}
			session.sendMessage(data, replyHandler: nil)
		}
	}
	
	func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
		if let genres = userInfo["genres"] as? [String] {
			self.genres = genres
			if let defaults = UserDefaults(suiteName: "group.com.thom.shufflePlayPlus") {
				defaults.set(genres, forKey: "genresWatch")
				updateTable()
			}
		}
	}
	
}
