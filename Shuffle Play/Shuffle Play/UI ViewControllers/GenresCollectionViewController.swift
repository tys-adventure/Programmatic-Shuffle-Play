//
//  GenresCollectionViewController.swift
//  Shuffle Play
//
//  Created by Thom Pheijffer on 08/07/2018.
//  Copyright © 2018 Tyler Phillips. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class GenresCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
	
	let genres = ["1", "2", "3", "4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.register(ButtonCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.backgroundColor = .white
        // Do any additional setup after loading the view.
		
		if let flowLayout = collectionView?.collectionViewLayout as?
			UICollectionViewFlowLayout {
			flowLayout.scrollDirection = .vertical
			flowLayout.minimumLineSpacing = 30
			flowLayout.minimumInteritemSpacing = 40
			flowLayout.sectionInset = UIEdgeInsets(top: 30, left: 45, bottom: 30, right: 45)
		}
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
		return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		//print(PlayerController.buttonTitles.count)
        //return PlayerController.buttonTitles.count
		return genres.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ButtonCell
		//cell.backgroundColor = UIColor.black
		cell.title.text = genres[indexPath.row]
        //cell.title.text = PlayerController.buttonTitles[indexPath.row]
	
		cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		//return CGSize(width: view.frame.width, height: view.frame.height)
		return CGSize(width: 100, height: 40)
    }
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let player = PlayerController()
		print("")
		print("")
		print(genres[indexPath.row])
		print("")
		print("")
		player.playGenre(genre: genres[indexPath.row])
	}
    
}

class ButtonCell: UICollectionViewCell {
    
    var title: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
		self.backgroundColor = .clear
		//self.backgroundColor = UIColor(red: 37/255, green: 227/255, blue: 232/255, alpha: 0.5)
		self.alpha = 0
        title = UILabel()
        //title.text = "Test"
        title.backgroundColor = UIColor(red: 37/255, green: 227/255, blue: 232/255, alpha: 0.5)
        title.alpha = 0.5
        title.textColor = UIColor.black
		title.textAlignment = .center
        title.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        title.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
		
		#warning("The style isn't yet the same")
        title.layer.masksToBounds = false
		self.layer.masksToBounds = false
		title.clipsToBounds = false
		self.clipsToBounds = false
		
        title.layer.shadowRadius = 4.0
        title.layer.shadowOpacity = 0.5
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var frame = title.frame
        frame.size.height = self.frame.size.height
        frame.size.width = self.frame.size.width
        frame.origin.x = 0
        frame.origin.y = 0
        title.frame = frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
