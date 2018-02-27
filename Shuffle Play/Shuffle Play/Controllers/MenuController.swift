//
//  MenuController.swift
//  Shuffle Play
//
//  Created by Tyler Phillips on 1/12/18.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import UIKit
import MediaPlayer

class MenuController: UIViewController {
	
	var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
	
	//Genre Shuffle Play textView
	let genreTextView: UITextView = {
		let textView = UITextView()
		textView.font = UIFont(name:"Avenir Next", size: 25.0)
		textView.font = UIFont.boldSystemFont(ofSize: 18)
		textView.textAlignment = .center
		textView.backgroundColor = UIColor.clear
		textView.isUserInteractionEnabled = false
		textView.text = "Genres"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//Profile UIButton
	//Fix Button Image Please
	let mainButtonTapped: UIButton = {
		let button = UIButton()
		button.setTitle("Home", for: .normal)
		button.setTitleColor(.black, for: .normal)
		if let homeImage  = UIImage(named: "music.png") {
			button.setImage(homeImage, for: .normal)
		}
		// Shadow and Radius for Circle Button
		button.layer.shadowColor = UIColor.black.cgColor
		button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		button.layer.masksToBounds = false
		button.layer.shadowRadius = 3.0
		button.layer.shadowOpacity = 1.0
		
		button.addTarget(self, action: #selector(mainButtonTapped(_:)), for:.touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	//RockButton
	/*
	let RockButton: UIButton = {
		let button = UIButton()
		button.tintColor=UIColor .gray
		button.setTitleColor(.black, for: .normal)
		button.layer.cornerRadius = 5
		button.layer.borderWidth = 1
		button.layer.borderColor = UIColor.black.cgColor
		button.setTitle("Rock", for: .normal)
		button.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
	
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	*/
	
	let RockButton: UIButton = {
		let btn = MenuController.createSPButton()
		btn.setTitle("Rock", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//PopButton
	let PopButton: UIButton = {
		let btn = MenuController.createSPButton()
		btn.setTitle("Pop", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//HipHopButton
	let HipHopButton: UIButton = {
		let btn = MenuController.createSPButton()
		btn.setTitle("Hip-Hop", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//AlternativeButton
	let AlternativeButton: UIButton = {//(frame: CGRect(x: 55, y: 295, width: 260, height: 45))
		let btn = MenuController.createSPButton()
		btn.setTitle("Alternative", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//RapButton
	let RapButton: UIButton = {//(frame: CGRect(x: 55, y: 360, width: 260, height: 45))
		let btn = MenuController.createSPButton()
		btn.setTitle("Rap", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//HipHipRapButton
	let RHButton: UIButton = {//(frame: CGRect(x: 55, y: 360, width: 260, height: 45))
		let btn = MenuController.createSPButton()
		btn.setTitle("Hip Hop/Rap", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//PopRockButton
	let PopRockButton: UIButton = {
		let btn = MenuController.createSPButton()
		btn.setTitle("Pop/Rock", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//HeavyButton
	let HeavyButton: UIButton = {
		let btn = MenuController.createSPButton()
		btn.setTitle("Heavy Metal", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(genreButtonTapped(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	
	//Gradient
	let gradient = CAGradientLayer()
	var gradientSet = [[CGColor]]()
	var currentGradient: Int = 0
	
	//Shades of blue
	let gradientOne = UIColor(red: 129/255, green: 219/255, blue: 181/255, alpha: 1).cgColor
	let gradientTwo = UIColor(red: 129/255, green: 219/255, blue: 181/255, alpha: 1).cgColor
	let gradientThree = UIColor(red: 129/255, green: 219/255, blue: 181/255, alpha: 1).cgColor

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
		
		view.addSubview(genreTextView)
		view.addSubview(mainButtonTapped)
		view.addSubview(RockButton)
		view.addSubview(PopButton)
		view.addSubview(HipHopButton)
		view.addSubview(AlternativeButton)
		view.addSubview(RapButton)
		view.addSubview(RHButton)
		view.addSubview(PopRockButton)
		view.addSubview(HeavyButton)
		
		setupLayout()
	
        // Do any additional setup after loading the view.
    }
	
	private func setupLayout() {
		
		genreTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
		//genreTextView.bottomAnchor.constraint(equalTo: RockButton.topAnchor, constant: -15).isActive = true
		genreTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		genreTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		genreTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
		genreTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
		
		mainButtonTapped.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
		mainButtonTapped.widthAnchor.constraint(equalToConstant: 35).isActive = true
		mainButtonTapped.heightAnchor.constraint(equalToConstant: 35).isActive = true
		mainButtonTapped.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
		
		RockButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		RockButton.topAnchor.constraint(equalTo: genreTextView.bottomAnchor, constant: -525).isActive = true
		RockButton.widthAnchor.constraint(equalToConstant: 260).isActive = true
		RockButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		PopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		PopButton.topAnchor.constraint(equalTo: RockButton.bottomAnchor, constant: 15).isActive = true
		PopButton.widthAnchor.constraint(equalToConstant: 260).isActive = true
		PopButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		HipHopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		HipHopButton.topAnchor.constraint(equalTo: PopButton.bottomAnchor, constant: 15).isActive = true
		HipHopButton.widthAnchor.constraint(equalToConstant: 260).isActive = true
		HipHopButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		AlternativeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		AlternativeButton.topAnchor.constraint(equalTo: HipHopButton.bottomAnchor, constant: 15).isActive = true
		AlternativeButton.widthAnchor.constraint(equalToConstant: 260).isActive = true
		AlternativeButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		RapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		RapButton.topAnchor.constraint(equalTo: AlternativeButton.bottomAnchor, constant: 15).isActive = true
		RapButton.widthAnchor.constraint(equalToConstant: 260).isActive = true
		RapButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		RHButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		RHButton.topAnchor.constraint(equalTo: RapButton.bottomAnchor, constant: 15).isActive = true
		RHButton.widthAnchor.constraint(equalToConstant: 260).isActive = true
		RHButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		PopRockButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		PopRockButton.topAnchor.constraint(equalTo: RHButton.bottomAnchor, constant: 15).isActive = true
		PopRockButton.widthAnchor.constraint(equalToConstant: 260).isActive = true
		PopRockButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		HeavyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		HeavyButton.topAnchor.constraint(equalTo: PopRockButton.bottomAnchor, constant: 15).isActive = true
		HeavyButton.widthAnchor.constraint(equalToConstant: 260).isActive = true
		HeavyButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
	}
	
	//All Genre Button Functions (NEW)
	static func createSPButton() -> UIButton {
		let button = UIButton()
		button.tintColor=UIColor .gray
		button.setTitleColor(.black, for: .normal)
		button.layer.cornerRadius = 5
		button.layer.borderWidth = 1
		button.layer.borderColor = UIColor.black.cgColor
		return button
	}
	
	@objc func mainButtonTapped(_ sender: UIButton) {
		
		self.presentingViewController?.dismiss(animated: true, completion: nil)
		
		let vc = MainUIController() 
		self.present(vc, animated: true, completion: nil)
		
	}
    
    //Any of the genre buttons tapped = this action

	@objc func genreButtonTapped(_ sender: UIButton!) {
        
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized{
                self.playGenre(genre: sender.currentTitle!)
            }
        }
        
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
		gradientChangeAnimation.duration = 15.00
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



