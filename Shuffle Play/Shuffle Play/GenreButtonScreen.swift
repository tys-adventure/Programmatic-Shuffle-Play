//
//  GenreButtonScreen.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 12/18/17.
//  Copyright © 2017 Tyler Phillips. All rights reserved.
//

import UIKit
import MediaPlayer


class GenreButtonScreen: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    var nowPlayingInfo = MPNowPlayingInfoCenter.self

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func lolButton(_ sender: Any) {
        
    }
    
    @IBAction func genreButtonTapped(_ sender: UIButton) {
        
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized{
                self.playGenre(genre: sender.currentTitle!)
            }
        }
        
        sender.pulsate()
        
    }
    
    @IBAction func PlayButtonTapped(_ sender: UIButton) {
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
        sender.pulsate()
    }
    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        
        musicPlayer.pause()
        sender.pulsate()
    }
    
    @IBAction func previousButtonTapped(_ sender: UIButton) {
        
        musicPlayer.skipToPreviousItem()
        sender.pulsate()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
       
        musicPlayer.skipToNextItem()
        sender.pulsate()
    }
    
    func playGenre(genre: String){
        
        musicPlayer.stop()
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
        
        
    }
    
    
    //Updated constraints to be even from 0.2.0 to 0.2.1!
    //0.2.1 hasn't been uploaded to Testflight yet.

    
}
