//
//  SpotifyLoginScreen.swift
//  Shuffle Play
//
//  Created by Thom Pheijffer on 24/06/2018.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import UIKit

class SpotifyLoginScreen: UIViewController, SPTAudioStreamingPlaybackDelegate, SPTAudioStreamingDelegate {
	
	var auth = SPTAuth.defaultInstance()!
	var session: SPTSession!
	
	var player: SPTAudioStreamingController?
	var loginURL: URL?
	
	var loginButton: UIButton = {
		var button = UIButton()
		button.setTitle("Login", for: .normal)
		button.addTarget(self, action: #selector(loginButtonPressed(_:)), for: .touchUpInside)
		return button
	}()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
		NotificationCenter.default.addObserver(self, selector: #selector(SpotifyLoginScreen.updateAfterFirstLogin), name: Notification.Name.spotifyLoginSuccessfulNotificationKey, object: nil)
	}
	
	@objc func updateAfterFirstLogin () {
		let userDefaults = UserDefaults.standard
		if let sessionObj:AnyObject = userDefaults.object(forKey: "SpotifySession") as AnyObject? {
			let sessionDataObj = sessionObj as! Data
			let firstTimeSession = NSKeyedUnarchiver.unarchiveObject(with: sessionDataObj) as! SPTSession
			self.session = firstTimeSession
			initializePlayer(authSession: session)
		}
	}
	
	func initializePlayer(authSession:SPTSession){
		if self.player == nil {
			self.player = SPTAudioStreamingController.sharedInstance()
			self.player!.playbackDelegate = self
			self.player!.delegate = self
			try! player!.start(withClientId: auth.clientID)
			self.player!.login(withAccessToken: authSession.accessToken)
			
		}
	}
	
	func audioStreamingDidLogin(_ audioStreaming: SPTAudioStreamingController!) {
		// after a user authenticates a session, the SPTAudioStreamingController is then initialized and this method called
		print("logged in")
		self.player?.playSpotifyURI("spotify:track:58s6EuEYJdlb0kO7awm3Vp", startingWith: 0, startingWithPosition: 0, callback: { (error) in
			if (error != nil) {
				print("playing!")
			}
		})
	}
	
	func setup() {
		SPTAuth.defaultInstance()?.clientID = ""
		#warning("Our own client id here")
		SPTAuth.defaultInstance()?.redirectURL  = URL(string: "")
		#warning("Our own redirectURL here")
		SPTAuth.defaultInstance()?.requestedScopes = [SPTAuthStreamingScope, SPTAuthUserLibraryReadScope]
		#warning("Select the functions we need")
		loginURL = SPTAuth.defaultInstance()?.spotifyWebAuthenticationURL()
	}
	
	@objc func loginButtonPressed(_ sender: Any) {
		if UIApplication.shared.canOpenURL(loginURL!) {
			if auth.canHandle(auth.redirectURL) {
				#warning("build error handling")
			}
		}
	}
	
	
}

