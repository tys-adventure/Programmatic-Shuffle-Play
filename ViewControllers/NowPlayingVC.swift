//
//  NowPlayingViewController.swift
//  Shuffle Plus Play
//
//  Created by Thom Pheijffer on 28/10/2018.
//  Copyright © 2018 Thom Pheijffer. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation

class NowPlayingViewController: UIViewController {
    
    enum CardState {
        case expanded
        case collapsed
    }
    
    var genresCardViewController: GenresCardViewController!
    //var visualEffectView:UIVisualEffectView!
    
    var cellHeight: CGFloat! = 40
    var cardHeight: CGFloat = 100 + 40 * 6 + 7 * 30
    
    let cardHandleAreaHeight:CGFloat = 52
    
    var cardVisible = false
    var nextState:CardState {
        return cardVisible ? .collapsed : .expanded
    }
    
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted:CGFloat = 0
    
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    let myMediaQuery = MPMediaQuery.songs()
    let nowPlaying = MPNowPlayingInfoCenter.default().nowPlayingInfo
    
    //Album Image View
    var albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        imageView.layer.masksToBounds = false
        imageView.layer.shadowRadius = 3.0
        imageView.layer.shadowOpacity = 1.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //Song Label
    var nowPlayingLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        label.isUserInteractionEnabled = false
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Artist Label
    var artistLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        label.isUserInteractionEnabled = false
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //Logo Image View
    var logoImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "SPEmoji"))
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        imageView.layer.masksToBounds = false
        imageView.layer.shadowRadius = 3.0
        imageView.layer.shadowOpacity = 1.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    //Previous
    let previousButton: UIButton = {
        let button = UIButton.musicButton()
        
        if let homeImage  = UIImage(named: "previous-white") {
            button.setImage(homeImage, for: .normal)
            button.tintColor = UIColor.black
        }
        button.addTarget(self, action: #selector(previousButtonTapped(_:)), for:.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let playPauseButton: PlayView = {
        let playView = PlayView()
        //playView.fractionComplete = 1
        playView.iconSize = 25
        playView.lineWidth = 3
        playView.translatesAutoresizingMaskIntoConstraints = false
        
        playView.layer.shadowColor = UIColor.black.cgColor
        playView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        playView.layer.masksToBounds = false
        playView.layer.shadowRadius = 3.0
        playView.layer.shadowOpacity = 1.0
        
        return playView
    }()
    
    //Next
    let nextButton: UIButton = {
        let button = UIButton.musicButton()
        if let homeImage  = UIImage(named: "next-white") {
            button.setImage(homeImage, for: .normal)
            button.tintColor = UIColor.black
        }
        button.addTarget(self, action: #selector(nextButtonTapped(_:)), for:.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellHeight = self.view.frame.width * 0.375 / 3
        
        let spacingRoomBetweenCells = 7 * 30
        cardHeight = 100 + cellHeight * 6 + CGFloat(spacingRoomBetweenCells)
        // * 6 because 11 /2 = 6
        // * 7 because 6 + 1 extra room undernaeat
        //30 = spacing between cells
        
        setupViews()
        setupCard()
        createObservers()
        
        self.genresCardViewController.view.layer.cornerRadius = 12
        self.genresCardViewController.view.clipsToBounds = true
        
        self.view.backgroundColor = .red
        self.view.backgroundColor = UIColor(r: 70, g: 136, b: 241, a: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if musicPlayer.playbackState == .playing {
            albumImageView.image = musicPlayer.nowPlayingItem?.artwork?.image(at: albumImageView.bounds.size)
            nowPlayingLabel.text = musicPlayer.nowPlayingItem?.title
            artistLabel.text = musicPlayer.nowPlayingItem?.artist
            
            albumImageView.isHidden = false
            nowPlayingLabel.isHidden = false
            artistLabel.isHidden = false
            logoImageView.isHidden = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        playPauseButton.fractionComplete = 1
        playPauseButton.button.isUserInteractionEnabled = false
        playPauseButton.playHandler = { [weak self] in
            self?.playButtonTapped()
        }
        playPauseButton.stopHandler = { [weak self] in
            self?.pauseButtonTapped()
        }
        
    }
    
    func setupViews() {
        self.view.addSubview(albumImageView)
        self.view.addSubview(nowPlayingLabel)
        self.view.addSubview(artistLabel)
        self.view.addSubview(logoImageView)
        self.view.addSubview(previousButton)
        self.view.addSubview(playPauseButton)
        self.view.addSubview(nextButton)
        
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 125).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 225).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 225).isActive = true
        
        albumImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        albumImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 125).isActive = true
        albumImageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        nowPlayingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nowPlayingLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 75).isActive = true
        nowPlayingLabel.widthAnchor.constraint(equalToConstant: 275).isActive = true
        nowPlayingLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        artistLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        artistLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 55).isActive = true
        artistLabel.widthAnchor.constraint(equalToConstant: 225).isActive = true
        artistLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        playPauseButton.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 150).isActive = true
        playPauseButton.widthAnchor.constraint(equalToConstant: 57).isActive = true
        playPauseButton.heightAnchor.constraint(equalToConstant: 57).isActive = true
        playPauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        previousButton.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 150).isActive = true
        previousButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
        previousButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        previousButton.leftAnchor.constraint(equalTo: playPauseButton.leftAnchor, constant: -80).isActive = true
        
        nextButton.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 150).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        nextButton.rightAnchor.constraint(equalTo: playPauseButton.rightAnchor, constant: 80).isActive = true
    }
    
}

//MARK: - Play / Pause / Prev / Next Buttons
extension NowPlayingViewController {
    
    @objc func playButtonTapped() {
        
        let name = Notification.Name.albumArtNotifacationKey
        NotificationCenter.default.post(name: name, object: nil)
        
        let artistName = Notification.Name.artistNotifacationKey
        NotificationCenter.default.post(name: artistName, object: nil)
        
        let trackName = Notification.Name.trackTitleNotifactionKey
        NotificationCenter.default.post(name: trackName, object: nil)
        
        setNowPlayingInfo()
        musicPlayer.shuffleMode = .songs
        createObservers()
        musicPlayer.play()
    }
    
    @objc func pauseButtonTapped() {
        let albumArt = Notification.Name.albumArtNotifacationKey
        NotificationCenter.default.post(name: albumArt, object: nil)
        
        let artistName = Notification.Name.artistNotifacationKey
        NotificationCenter.default.post(name: artistName, object: nil)
        
        let trackName = Notification.Name.trackTitleNotifactionKey
        NotificationCenter.default.post(name: trackName, object: nil)
        
        setNowPlayingInfo()
        musicPlayer.pause()
    }
    
    @objc func previousButtonTapped(_ sender: UIButton) {
        let name = Notification.Name.albumArtNotifacationKey
        NotificationCenter.default.post(name: name, object: nil)
        
        let artistName = Notification.Name.artistNotifacationKey
        NotificationCenter.default.post(name: artistName, object: nil)
        
        let trackName = Notification.Name.trackTitleNotifactionKey
        NotificationCenter.default.post(name: trackName, object: nil)
        
        setNowPlayingInfo()
        musicPlayer.skipToPreviousItem()
        sender.pulsate()
    }
    
    @objc func nextButtonTapped(_ sender: UIButton) {
        //Keys for Observers
        let name = Notification.Name.albumArtNotifacationKey
        NotificationCenter.default.post(name: name, object: nil)
        
        let artistName = Notification.Name.artistNotifacationKey
        NotificationCenter.default.post(name: artistName, object: nil)
        
        let trackName = Notification.Name.trackTitleNotifactionKey
        NotificationCenter.default.post(name: trackName, object: nil)
        
        setNowPlayingInfo()
        musicPlayer.skipToNextItem()
        sender.pulsate()
    }
    
    func setNowPlayingInfo() {
        
        if musicPlayer.playbackState == .playing {
            albumImageView.image = musicPlayer.nowPlayingItem?.artwork?.image(at: albumImageView.bounds.size)
            nowPlayingLabel.text = musicPlayer.nowPlayingItem?.title
            artistLabel.text = musicPlayer.nowPlayingItem?.artist
            
            albumImageView.isHidden = false
            nowPlayingLabel.isHidden = false
            artistLabel.isHidden = false
            logoImageView.isHidden = true
        }
        
    }
    
    @objc func updateAlbumArt(notifacation: NSNotification) {
        albumImageView.image = musicPlayer.nowPlayingItem?.artwork?.image(at: albumImageView.bounds.size)
    }
    
    @objc func updateArtist(notifacation: NSNotification) {
        artistLabel.text = musicPlayer.nowPlayingItem?.artist
    }
    
    @objc func updateTrackTitle(notifaction: NSNotification) {
        nowPlayingLabel.text = musicPlayer.nowPlayingItem?.title
    }
    
    func createObservers() {
        
        //Album
        NotificationCenter.default.addObserver(self, selector: #selector(updateAlbumArt(notifacation:)), name: Notification.Name.albumArtNotifacationKey, object: nil)
        
        //Artist
        NotificationCenter.default.addObserver(self, selector: #selector(updateArtist(notifacation:)), name: Notification.Name.artistNotifacationKey, object: nil)
        
        //Track
        NotificationCenter.default.addObserver(self, selector: #selector(updateTrackTitle(notifaction:)), name: Notification.Name.trackTitleNotifactionKey, object: nil)
        
        //GenreButtonTapped
        NotificationCenter.default.addObserver(self, selector: #selector(genreButtonTapped(_:)), name: Notification.Name.genreButtonTapped, object: nil)
        
    }
    
    @objc func genreButtonTapped(_ notification: Notification) {
        guard let genre = notification.userInfo?["genre"] as? String else { fatalError("Can't get the genre") }
        print("")
        print("")
        print("")
        print("")
        print("")
        print("")
        print(genre)
        print("")
        print("")
        print("")
        print("")
        print("")
        print("")
        DispatchQueue.global().async {
            MPMediaLibrary.requestAuthorization { (status) in
                if status == .authorized{
                    DispatchQueue.main.async {
                        self.playGenre(genre: genre)
                    }
                }
            }
        }
        
        setNowPlayingInfo()
        
    }
    
    func playGenre(genre: String) {
        
        DispatchQueue.global().async {
            MPMediaLibrary.requestAuthorization({ (status) in
                if status == .authorized {
                    self.musicPlayer.stop()
                    let query = MPMediaQuery()
                    let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
                    
                    query.addFilterPredicate(predicate)
                    
                    self.musicPlayer.setQueue(with: query)
                    self.musicPlayer.shuffleMode = .songs
                    self.musicPlayer.play()
                }
            })
        }
        
        DispatchQueue.main.async {
            self.setNowPlayingInfo()
        }
        
    }
    
}



//MARK: - Card Functions
extension NowPlayingViewController {
    
    func setupCard() {
        //visualEffectView = UIVisualEffectView()
        //visualEffectView.frame = self.view.frame
        //self.view.addSubview(visualEffectView)
        
        genresCardViewController = GenresCardViewController(nibName: "GenresCardViewController", bundle: nil)
        self.addChild(genresCardViewController)
        genresCardViewController.view.frame = CGRect(x: 0, y: self.view.frame.height - cardHandleAreaHeight, width: self.view.bounds.width, height: cardHeight)
        self.view.addSubview(genresCardViewController.view)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NowPlayingViewController.handleCardTap(recognzier:)))
        let panGestureRecognizerHandleArea = UIPanGestureRecognizer(target: self, action: #selector(NowPlayingViewController.handleCardPan(recognizer:)))
        let panGestureRecognizerContentView = UIPanGestureRecognizer(target: self, action: #selector(NowPlayingViewController.handleCardPan(recognizer:)))
        
        genresCardViewController.handleArea.addGestureRecognizer(tapGestureRecognizer)
        genresCardViewController.handleArea.addGestureRecognizer(panGestureRecognizerHandleArea)
        genresCardViewController.contentView.addGestureRecognizer(panGestureRecognizerContentView)
    }
    
    @objc
    func handleCardTap(recognzier:UITapGestureRecognizer) {
        switch recognzier.state {
        case .ended:
            animateTransitionIfNeeded(state: nextState, duration: 0.9)
            
        default:
            break
        }
    }
    
    @objc
    func handleCardPan (recognizer:UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .began:
            startInteractiveTransition(state: nextState, duration: 0.9)
        case .changed:
            let translation = recognizer.translation(in: self.genresCardViewController.handleArea)
            var fractionComplete = translation.y / cardHeight
            fractionComplete = cardVisible ? fractionComplete : -fractionComplete
            updateInteractiveTransition(fractionCompleted: fractionComplete)
        case .ended:
            continueInteractiveTransition()
        default:
            break
        }
        
    }
    
    func animateTransitionIfNeeded (state:CardState, duration:TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.genresCardViewController.view.frame.origin.y = self.view.frame.height - self.cardHeight
                    
                    
                case .collapsed:
                    self.genresCardViewController.view.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeight
                    
                    
                }
            }
            
            frameAnimator.addCompletion { _ in
                self.cardVisible = !self.cardVisible
                self.runningAnimations.removeAll()
            }
            
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
            
            let blurAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    print("")
                    //self.visualEffectView.effect = UIBlurEffect(style: .dark)
                case .collapsed:
                    //self.visualEffectView.effect = nil
                    print("")
                }
            }
            
            blurAnimator.startAnimation()
            runningAnimations.append(blurAnimator)
            
        }
    }
    
    func startInteractiveTransition(state:CardState, duration:TimeInterval) {
        if runningAnimations.isEmpty {
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        for animator in runningAnimations {
            animator.pauseAnimation()
            animationProgressWhenInterrupted = animator.fractionComplete
        }
    }
    
    func updateInteractiveTransition(fractionCompleted:CGFloat) {
        for animator in runningAnimations {
            animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
    }
    
    func continueInteractiveTransition (){
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
    }

}
