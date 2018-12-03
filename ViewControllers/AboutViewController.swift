//
//  AboutViewController.swift
//  Shuffle Plus Play
//
//  Created by Thom Pheijffer on 28/10/2018.
//  Copyright © 2018 Thom Pheijffer. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    //Logo imageView
    let shuffleImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "SPEmoji"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //Profile Shuffle Play textView
    let aboutLabelTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name:"Avenir Next", size: 25.0)
        textView.textAlignment = .center
        textView.backgroundColor = UIColor.clear
        textView.isUserInteractionEnabled = false
        
        textView.textColor = UIColor.black
        
        textView.text = "About Shuffle Play"
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    //About Shuffle Play textView
    let aboutTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name:"Avenir Next", size: 15.0)
        textView.textAlignment = .center
        textView.backgroundColor = UIColor.clear
        textView.isUserInteractionEnabled = false
        
        textView.textColor = UIColor.black
        
        textView.text = "Have you ever wanted to listen to a specific genre? Shuffle Play let's you do just that! Using your locally stored library from Apple Music, or your iPhone's storage, Shuffle Play shuffles the music on your phone by genre. Allowing you to choose a genre and listen!"
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    //HowTo Text View
    let howToTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name:"Avenir Next", size: 15.0)
        textView.textAlignment = .center
        textView.backgroundColor = UIColor.clear
        textView.isUserInteractionEnabled = false
        
        textView.textColor = UIColor.black
        
        textView.text = "Select a genre from the menu screen on the right. Once a genre is selected, music from your locally stored library, or your Apple Music library will play! **Note: If you do not have a specific genre within your library, music will not play.**"
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    //HowTo Label
    let howToLabelTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name:"Avenir Next", size: 25.0)
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.textAlignment = .center
        textView.backgroundColor = UIColor.clear
        textView.isUserInteractionEnabled = false
        
        textView.textColor = UIColor.black
        
        textView.text = "How To Use Shuffle Play Plus:"
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = UIColor(red: 137/255, green: 217/255, blue: 255/255, alpha: 1)
        view.backgroundColor = .white
        
        
        //setupLayout
        
        view.addSubview(aboutLabelTextView)
        view.addSubview(shuffleImageView)
        view.addSubview(aboutTextView)
        view.addSubview(howToTextView)
        view.addSubview(howToLabelTextView)
        
        setupLayout()
        
        
        // Do any additional setup after loading the view.
    }
    
    private func setupLayout() {
        
        aboutLabelTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        aboutLabelTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        aboutLabelTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        aboutLabelTextView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        aboutLabelTextView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        shuffleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        shuffleImageView.topAnchor.constraint(equalTo: aboutLabelTextView.bottomAnchor, constant: -465).isActive = true
        shuffleImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        shuffleImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        aboutTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        aboutTextView.topAnchor.constraint(equalTo: shuffleImageView.bottomAnchor, constant: 25).isActive = true
        aboutTextView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        aboutTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        aboutTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        aboutTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        howToTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        howToTextView.topAnchor.constraint(equalTo: howToLabelTextView.bottomAnchor, constant: 15).isActive = true
        howToTextView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        howToTextView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        howToTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        howToTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        howToLabelTextView.topAnchor.constraint(equalTo: aboutTextView.bottomAnchor, constant: -50).isActive = true
        howToLabelTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        howToLabelTextView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        howToLabelTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
}
