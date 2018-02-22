//
//  MainUIController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 1/12/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import UIKit
import MediaPlayer

//Yo How You doing?

class MainUIController: UIViewController {
	
	var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
	
	//Album Image View
	let albumImageView: UIImageView = {
		let imageView = UIImageView(image: #imageLiteral(resourceName: "SPEmoji"))
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	//ProfileButton
	let profileButton: UIButton = {
		let button = UIButton()
		button.setTitle("Profile", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "chart1.png") {
			button.setImage(homeImage, for: .normal)
			button.tintColor = UIColor.black
		}
		// Shadow and Radius for Circle Button
		button.layer.shadowColor = UIColor.black.cgColor
		button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		button.layer.masksToBounds = false
		button.layer.shadowRadius = 3.0
		button.layer.shadowOpacity = 0.5
		
		button.addTarget(self, action: #selector(profileButton(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	//Menu
	let menuButton: UIButton = {
		let button = UIButton()
		button.setTitle("Menu", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "headphones.png") {
			button.setImage(homeImage, for: .normal)
			button.tintColor = UIColor.black
		}
		// Shadow and Radius for Circle Button
		button.layer.shadowColor = UIColor.black.cgColor
		button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		button.layer.masksToBounds = false
		button.layer.shadowRadius = 3.0
		button.layer.shadowOpacity = 0.5
		
		button.addTarget(self, action: #selector(menuButton(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	//Play
	let playButton: UIButton = {
		let button = UIButton()
		button.setTitle("", for: .normal)
		button.setTitleColor(.black, for: .normal)
			if let homeImage  = UIImage(named: "play.png") {
				button.setImage(homeImage, for: .normal)
				button.tintColor = UIColor.black
			}
		// Shadow and Radius for Circle Button
		button.layer.shadowColor = UIColor.black.cgColor
		button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		button.layer.masksToBounds = false
		button.layer.shadowRadius = 3.0
		button.layer.shadowOpacity = 0.5
		
		button.addTarget(self, action: #selector(playButtonTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	//Pause
	let pauseButton: UIButton = {
		let button = UIButton()
		button.setTitle("", for: .normal)
		button.setTitleColor(.black, for: .normal)
			if let homeImage  = UIImage(named: "pause.png") {
				button.setImage(homeImage, for: .normal)
				button.tintColor = UIColor.black
			}
		// Shadow and Radius for Circle Button
		button.layer.shadowColor = UIColor.black.cgColor
		button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		button.layer.masksToBounds = false
		button.layer.shadowRadius = 3.0
		button.layer.shadowOpacity = 0.5
		
		button.addTarget(self, action: #selector(pauseButtonTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	//Previous
	let previousButton: UIButton = {
		let button = UIButton()
		button.setTitle("", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "previous.png") {
			button.setImage(homeImage, for: .normal)
			button.tintColor = UIColor.black
		}
		// Shadow and Radius for Circle Button
		button.layer.shadowColor = UIColor.black.cgColor
		button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		button.layer.masksToBounds = false
		button.layer.shadowRadius = 3.0
		button.layer.shadowOpacity = 0.5
		
		button.addTarget(self, action: #selector(previousButtonTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	//Next
	let nextButton: UIButton = {
		let button = UIButton()
		button.setTitle("", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "next.png") {
			button.setImage(homeImage, for: .normal)
			button.tintColor = UIColor.black
		}
		// Shadow and Radius for Circle Button
		button.layer.shadowColor = UIColor.black.cgColor
		button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		button.layer.masksToBounds = false
		button.layer.shadowRadius = 3.0
		button.layer.shadowOpacity = 0.5
		
		button.addTarget(self, action: #selector(nextButtonTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	

	
	let gradient = CAGradientLayer()
	var gradientSet = [[CGColor]]()
	var currentGradient: Int = 0
	
	let gradientOne = UIColor(red: 48/255, green: 62/255, blue: 103/255, alpha: 1).cgColor
	let gradientTwo = UIColor(red: 244/255, green: 88/255, blue: 53/255, alpha: 1).cgColor
	let gradientThree = UIColor(red: 196/255, green: 70/255, blue: 107/255, alpha: 1).cgColor

    override func viewDidLoad() {
        super.viewDidLoad()
		
		//Gradient
		gradientSet.append([gradientOne, gradientTwo])
		gradientSet.append([gradientTwo, gradientThree])
		gradientSet.append([gradientThree, gradientOne])
		
		
		gradient.frame = self.view.bounds
		gradient.colors = gradientSet[currentGradient]
		gradient.startPoint = CGPoint(x:0, y:0)
		gradient.endPoint = CGPoint(x:1, y:1)
		gradient.drawsAsynchronously = true
		self.view.layer.addSublayer(gradient)
		
		animateGradient()
	
		
		//Setup Layout
		view.addSubview(albumImageView)
		view.addSubview(profileButton)
		view.addSubview(menuButton)
		view.addSubview(playButton)
		view.addSubview(pauseButton)
		view.addSubview(previousButton)
		view.addSubview(nextButton)
		
		setupLayout()
	
        // Do any additional setup after loading the view.
    }
	
	private func setupLayout() {
		
		albumImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		albumImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 125).isActive = true
		albumImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
		albumImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
		
		profileButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
		profileButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
		profileButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
		profileButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
		
		menuButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
		menuButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
		menuButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
		menuButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -35).isActive = true
		
		playButton.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 150).isActive = true
		playButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
		playButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
		playButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
		
		pauseButton.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 150).isActive = true
		pauseButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
		pauseButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
		pauseButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
		
		previousButton.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 255).isActive = true
		previousButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
		previousButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
		previousButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
	
		nextButton.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 255).isActive = true
		nextButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
		nextButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
		nextButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true

	}

	//Menu/Profile Button
	
	@objc func menuButton(_ sender: UIButton) {
		
		let vc = MenuController() //your view controller
		self.present(vc, animated: true, completion: nil)

	}
	

	@objc func profileButton(_ sender: UIButton) {
		
		//Segue between ViewControllers
		let vc = ProfileController() //your view controller
		self.present(vc, animated: true, completion: nil)
		
	}

	
    //User Button controls--Play, Pause, Stop, Skip

	var playButtonTapped : UIButton!
    
	@objc func playButtonTapped(_ sender: UIButton) {
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
        sender.pulsate()
	
    }
    
	var pauseButtonTapped : UIButton!
    
    @objc func pauseButtonTapped(_ sender: UIButton) {
        
        musicPlayer.pause()
        sender.pulsate()
    }
    
	var previousButtonTapped : UIButton!
    
    @objc func previousButtonTapped(_ sender: UIButton) {
        
        musicPlayer.skipToPreviousItem()
        sender.pulsate()
    }
    
	var nextButtonTapped : UIButton!
    
	@objc func nextButtonTapped(_ sender: UIButton) {
        
        musicPlayer.skipToNextItem()
        sender.pulsate()
    }
	
	//UIColor Gradient Func
	
	func animateGradient() {
		if currentGradient < gradientSet.count - 1 {
			currentGradient += 1
		} else {
			currentGradient = 0
		}
		
		let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
		gradientChangeAnimation.duration = 7.00
		gradientChangeAnimation.toValue = gradientSet[currentGradient]
		gradientChangeAnimation.fillMode = kCAFillModeForwards
		gradientChangeAnimation.isRemovedOnCompletion = false
		gradient.add(gradientChangeAnimation, forKey: "colorChange")
	}
	
	
	
}



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	

