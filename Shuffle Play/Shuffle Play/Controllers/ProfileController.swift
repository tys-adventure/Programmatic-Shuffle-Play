//
//  ProfileController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 1/12/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import UIKit
import MediaPlayer

class ProfileController: UIViewController {

	var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
	var nowPlayingInfo = MPNowPlayingInfoCenter.self

	//UIGradient Color
	let gradient = CAGradientLayer()
	var gradientSet = [[CGColor]]()
	var currentGradient: Int = 0
	
	let gradientOne = UIColor(red: 48/255, green: 62/255, blue: 103/255, alpha: 1).cgColor
	let gradientTwo = UIColor(red: 244/255, green: 88/255, blue: 53/255, alpha: 1).cgColor
	let gradientThree = UIColor(red: 196/255, green: 70/255, blue: 107/255, alpha: 1).cgColor

	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		//UIGradient
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
		
		//Profile Label
		
		let profileLabel = UILabel(frame: CGRect(x: 190, y: 450, width: 200, height: 21))
		profileLabel.center = CGPoint(x: 190, y: 50)
		profileLabel.textAlignment = .center
		profileLabel.text = "Profile"
		self.view.addSubview(profileLabel)

		//Menu Button
		
		let profileButtonTapped = UIButton(type: UIButtonType.system) as UIButton
		profileButtonTapped.frame = CGRect(x: 50, y: 50, width: 35, height: 35)
		profileButtonTapped.tintColor=UIColor .black
		profileButtonTapped.setTitle("Home", for: .normal)
		if let image  = UIImage(named: "home-icon.png") {
		profileButtonTapped.setImage(image, for: .normal)
		}
		profileButtonTapped.addTarget(self, action: #selector(profileButtonTapped(_:)), for:.touchUpInside)
		self.view.addSubview(profileButtonTapped)
		
        //Buttons
		// X = Top to Bottom
		// Y = Left to Right
        
        let ServicesButtonTapped = UIButton(frame: CGRect(x: 65, y: 200, width: 240, height: 50))
		ServicesButtonTapped.tintColor=UIColor .black
		ServicesButtonTapped.setTitle("Your Streaming Services", for: .normal)
		ServicesButtonTapped.addTarget(self, action: #selector(ServicesButtonTapped(_:)), for:.touchUpInside)
		self.view.addSubview(ServicesButtonTapped)
        
        let GenreSelectionButtonTapped = UIButton(frame: CGRect(x: 65, y: 300, width: 240, height: 50))
		GenreSelectionButtonTapped.tintColor=UIColor .black
		GenreSelectionButtonTapped.setTitle("Your Genre Selectons", for: .normal)
		GenreSelectionButtonTapped.addTarget(self, action: #selector(GenreSelectionButtonTapped(_:)), for:.touchUpInside)
		self.view.addSubview(GenreSelectionButtonTapped)
        
        let AboutButton = UIButton(frame: CGRect(x: 65, y: 400, width:240, height: 50))
		AboutButton.tintColor=UIColor .black
		AboutButton.setTitle("About Shuffle Play", for: .normal)
		AboutButton.addTarget(self, action: #selector(AboutButton(_:)), for:.touchUpInside)
		self.view.addSubview(AboutButton)
        
        let InstagramButton = UIButton(frame: CGRect(x: 30, y: 575, width: 55, height: 50))
		InstagramButton.tintColor=UIColor .black
		InstagramButton.setTitle("Home", for: .normal)
		if let image  = UIImage(named: "instagram-logo.png") {
		InstagramButton.setImage(image, for: .normal)
		}
		InstagramButton.addTarget(self, action: #selector(InstagramButton(_:)), for:.touchUpInside)
		self.view.addSubview(InstagramButton)
        
        let TwitterButton = UIButton(frame: CGRect(x: 35, y: 35, width: 25, height: 25))
        TwitterButton.backgroundColor = .blue
        TwitterButton.setTitle("Twitter", for: .normal)
        
        let GitButton = UIButton(frame: CGRect(x: 25, y: 25, width: 25, height: 25))
        GitButton.backgroundColor = .blue
        GitButton.setTitle("GitHub", for: .normal)
        
        let image = UIImage(named: "play button") as UIImage?
        let Gitbutton   = UIButton(type: UIButtonType.custom) as UIButton
        Gitbutton.frame =  CGRect(x: 100, y: 100, width: 100, height: 100)
        Gitbutton.setImage(image, for: .normal)
        Gitbutton.addTarget(self, action: Selector(("btnTouched:")), for:.touchUpInside)
        self.view.addSubview(Gitbutton)
        
        
        // Do any additional setup after loading the view.
    }

	//Button functions
	
	var profileButtonTapped : UIButton!
	
	@objc func profileButtonTapped(_ sender: UIButton) {
		
		//Segue between ViewControllers
		let vc = MainUIController() //view controller
		self.present(vc, animated: true, completion: nil)
		
	}
	
	var ServicesButtonTapped : UIButton!
	
	@objc func ServicesButtonTapped(_ sender: UIButton) {
		
		
	}
	
	var GenreSelectionButtonTapped : UIButton!
	
	@objc func GenreSelectionButtonTapped(_ sender: UIButton) {
		
		
	}
	
	var AboutButton : UIButton!
	
	@objc func AboutButton(_ sender: UIButton) {
		
		//Segue between ViewControllers
		let vc = aboutController() //view controller
		self.present(vc, animated: true, completion: nil)
		
	}
	
	var InstagramButton : UIButton!
	
	@objc func InstagramButton(_ sender: UIButton) {
		
	}
	
	
	
	//UIGradient Func
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
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

	extension MenuController: CAAnimationDelegate {
		func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
			if flag {
				gradient.colors = gradientSet[currentGradient]
				animateGradient()
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

}
