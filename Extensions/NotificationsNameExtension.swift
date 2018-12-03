//
//  NotificationsNameExtension.swift
//  Reusable Popups
//
//  Created by Thom Pheijffer on 01-06-18.
//  Copyright © 2018 Thom Pheijffer. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let albumArtNotifacationKey = Notification.Name("xyz.tyler.isplaying")
	static let artistNotifacationKey = Notification.Name("xyz.tyler.isplaying")
	static let trackTitleNotifactionKey = Notification.Name("xyz.tyler.isplaying")
    static let genreNotificationKey = Notification.Name("xyz.tyler.genreFromSpotlightSelected")
    static let genreButtonTapped = Notification.Name("xyz.tyler.genreButtonTapped")
}

