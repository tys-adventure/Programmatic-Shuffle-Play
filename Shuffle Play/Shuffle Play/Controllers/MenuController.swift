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
		textView.text = "Select Your Main Genre"
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	//Profile UIButton
	//Fix Button Image Please
	let mainButtonTapped: UIButton = {
		let button = UIButton()
		button.setTitle("Home", for: .normal)
		button.setTitleColor(.white, for: .normal)
		if let homeImage  = UIImage(named: "music-white.png") {
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
	
	//Blues Button
	let BluesButton: UIButton = {
		let btn = MenuController.createSPButton()
		btn.setTitle("Blues", for: .normal)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(BluesButton(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Pop Button
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
		
		btn.addTarget(self, action: #selector(PopButton(_:)), for:.touchUpInside)
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
	
	//Christian Button
	let ChristianButton: UIButton = {
		let btn = MenuController.createSPButton()
		btn.setTitle("Christianity", for: .normal)
		//btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
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
	
	//Country Button
	let CountryButton: UIButton = {
		let btn = MenuController.createSPButton()
		btn.setTitle("Country", for: .normal)
		//btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
		btn.layer.borderWidth = 2
		// Shadow and Radius for Circle Button
		btn.layer.shadowColor = UIColor.black.cgColor
		btn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		btn.layer.masksToBounds = false
		btn.layer.shadowRadius = 2.0
		btn.layer.shadowOpacity = 0.5
		
		btn.addTarget(self, action: #selector(CountryButton(_:)), for:.touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	//Soft Rock Button
	let SoftRockButton: UIButton = {
		let btn = MenuController.createSPButton()
		btn.setTitle("Soft Rock", for: .normal)
		//btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
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
	
	//R&B/Soul Button
	let SoulButton: UIButton = {
		let btn = MenuController.createSPButton()
		btn.setTitle("R&B/Soul", for: .normal)
		//btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
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
	
	//Hair Metal Button
	let HairMetalButton: UIButton = {
		let btn = MenuController.createSPButton()
		btn.setTitle("Hair Metal", for: .normal)
		//btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
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
	
	//Hard Rock Button
	let HardRockButton: UIButton = {
		let btn = MenuController.createSPButton()
		//btn.setTitle("Hard Rock", for: .normal)
		//btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
		btn.layer.borderWidth = 2
		if let homeImage  = UIImage(named: "backback2.png") {
			btn.setImage(homeImage, for: .normal)
		}
		btn.setTitle("Hard Rock", for: .normal)
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
		view.addSubview(BluesButton)
		view.addSubview(PopButton)
		view.addSubview(HipHopButton)
		view.addSubview(AlternativeButton)
		view.addSubview(RapButton)
		view.addSubview(RHButton)
		view.addSubview(PopRockButton)
		view.addSubview(HeavyButton)
		view.addSubview(ChristianButton)
		view.addSubview(CountryButton)
		view.addSubview(SoftRockButton)
		view.addSubview(SoulButton)
		view.addSubview(HairMetalButton)
		view.addSubview(HardRockButton)
		
		setupLayout()
		
		/*
		//Alert Controller
		let alertController = UIAlertController(title: "Sorry!", message: "This genre isnn't in your library!", preferredStyle: .alert)
		
		let destructiveAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
			// ...
		}
		alertController.addAction(destructiveAction)
		
		let OKAction = UIAlertAction(title: "OK", style: .default) { action in
			// ...
		}
		alertController.addAction(OKAction)
		
		self.present(alertController, animated: true) {
			// ...
		} */
	
        // Do any additional setup after loading the view.
    }
	
	private func setupLayout() {
		
		genreTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
		genreTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		genreTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		genreTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
		genreTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
		
		mainButtonTapped.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
		mainButtonTapped.widthAnchor.constraint(equalToConstant: 35).isActive = true
		mainButtonTapped.heightAnchor.constraint(equalToConstant: 35).isActive = true
		mainButtonTapped.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 35).isActive = true
		
		BluesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		BluesButton.topAnchor.constraint(equalTo: genreTextView.bottomAnchor, constant: -515).isActive = true
		BluesButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		BluesButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		PopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		PopButton.topAnchor.constraint(equalTo: genreTextView.bottomAnchor, constant: -515).isActive = true
		PopButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		PopButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		HipHopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		HipHopButton.topAnchor.constraint(equalTo: PopButton.bottomAnchor, constant: 15).isActive = true
		HipHopButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		HipHopButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		AlternativeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		AlternativeButton.topAnchor.constraint(equalTo: BluesButton.bottomAnchor, constant: 15).isActive = true
		AlternativeButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		AlternativeButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		RapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		RapButton.topAnchor.constraint(equalTo: AlternativeButton.bottomAnchor, constant: 15).isActive = true
		RapButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		RapButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		RHButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		RHButton.topAnchor.constraint(equalTo: HipHopButton.bottomAnchor, constant: 15).isActive = true
		RHButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		RHButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		PopRockButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		PopRockButton.topAnchor.constraint(equalTo: RapButton.bottomAnchor, constant: 15).isActive = true
		PopRockButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		PopRockButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		HeavyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		HeavyButton.topAnchor.constraint(equalTo: RHButton.bottomAnchor, constant: 15).isActive = true
		HeavyButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		HeavyButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		ChristianButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		ChristianButton.topAnchor.constraint(equalTo: PopRockButton.bottomAnchor, constant: 15).isActive = true
		ChristianButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		ChristianButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		CountryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		CountryButton.topAnchor.constraint(equalTo: HeavyButton.bottomAnchor, constant: 15).isActive = true
		CountryButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		CountryButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
		
		SoftRockButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		SoftRockButton.topAnchor.constraint(equalTo: ChristianButton.bottomAnchor, constant: 15).isActive = true
		SoftRockButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		SoftRockButton.heightAnchor.constraint(equalToConstant: 130).isActive = true
		
		SoulButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		SoulButton.topAnchor.constraint(equalTo: CountryButton.bottomAnchor, constant: 15).isActive = true
		SoulButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		SoulButton.heightAnchor.constraint(equalToConstant: 120)
		HairMetalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
		HairMetalButton.topAnchor.constraint(equalTo: SoftRockButton.bottomAnchor, constant: 15).isActive = true
		HairMetalButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		HairMetalButton.heightAnchor.constraint(equalToConstant: 130).isActive = true
		
		HardRockButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
		HardRockButton.topAnchor.constraint(equalTo: SoulButton.bottomAnchor, constant: 15).isActive = true
		HardRockButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
		HardRockButton.heightAnchor.constraint(equalToConstant: 130).isActive = true
		
	}
	
	//Alert Function
	/*
	func createAlert (title:String, message:String) {
		
		let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
		alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: ( (action), in
			alert.dismiss(animated: true, completion: nil)
		)))
		
	} */
	
	
	//All Genre Button Functions (NEW)
	static func createSPButton() -> UIButton {
		let button = UIButton()
		button.tintColor=UIColor .gray
		button.backgroundColor = UIColor.white
		button.alpha = 0.4
		button.setTitleColor(.black, for: .normal)
		button.layer.cornerRadius = 5
		button.layer.borderWidth = 1
		button.layer.borderColor = UIColor.white.cgColor
		return button
	}
	
	@objc func mainButtonTapped(_ sender: UIButton) {
		
		self.presentingViewController?.dismiss(animated: true, completion: nil)
		
		let vc = MainUIController() 
		self.present(vc, animated: true, completion: nil)
		
	}
	
	@objc func BluesButton(_ sender: UIButton) {
		
		//self.presentingViewController?.dismiss(animated: true, completion: nil)
		
		let vc = BluesController()
		self.present(vc, animated: true, completion: nil)
		
	}
	
	@objc func CountryButton(_ sender: UIButton) {
		
		//self.presentingViewController?.dismiss(animated: true, completion: nil)
		
		let vc = CountryController()
		self.present(vc, animated: true, completion: nil)
		
	}
	
	@objc func PopButton(_ sender: UIButton) {
		
		//self.presentingViewController?.dismiss(animated: true, completion: nil)
		
		let vc = PopController()
		self.present(vc, animated: true, completion: nil)
		
	}
	
	/*
	@objc func RHButton(_ sender: UIButton) {
		
		//self.presentingViewController?.dismiss(animated: true, completion: nil)
		
		let vc = HipHopRapController()
		self.present(vc, animated: true, completion: nil)
		
	} */
    
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



