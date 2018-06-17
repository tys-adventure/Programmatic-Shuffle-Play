//
//  InterfaceController.swift
//  WatchAppShufflePlayPlus Extension
//
//  Created by Thom Pheijffer on 15/06/2018.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
	
    @IBOutlet weak var tableView: WKInterfaceTable!
    var genres = ["Pop", "Rock"]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
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
	
	override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
		
		#warning("send a alert to the phone, and the phone will start playing music")
		
		return nil
	}

}
