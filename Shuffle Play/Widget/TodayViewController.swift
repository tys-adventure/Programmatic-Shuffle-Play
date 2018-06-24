//
//  TodayViewController.swift
//  Widget
//
//  Created by Thom Pheijffer on 24/06/2018.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding, UITableViewDataSource, UITableViewDelegate {
	
	//let userDefaults = UserDefaults.standard
	var genres: [String] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
		if let defaults = UserDefaults(suiteName: "group.com.thom.shufflePlayPlus") {
			if defaults.value(forKey: "genresWatch") != nil {
				let genres = defaults.value(forKey: "genresWatch") as! [String]
				self.genres = genres
			} else {
				genres = ["Hip Hop", "Rap", "Rock"]
			}
		}
		
    }
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return genres.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		cell.textLabel?.text = genres[indexPath.row]
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
	}
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
