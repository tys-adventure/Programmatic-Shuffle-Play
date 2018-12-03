//
//  GenresCardViewController.swift
//  CardViewAnimation
//
//  Created by Thom Pheijffer on 27/10/2018.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import UIKit

class GenresCardViewController: UIViewController {
    
    @IBOutlet weak var handleArea: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var swiper: UIView!
    
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var genresLabelLeadingConstraint: NSLayoutConstraint!
    
    
    var cells = [GenreLabelCell]()
    
    let genres = ["Blues", "Pop", "Country", "Electronic", "Singer/Songwriter", "R&B/Soul", "Dance", "Hip-Hop/Rap", "Alternative", "Rock", "Christian/Gospel"]
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swiper.backgroundColor = UIColor(r: 180, g: 182, b: 184, a: 0.6)
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: contentView.bounds, collectionViewLayout: collectionViewFlowLayout)
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumLineSpacing = 30
        }
        
        collectionView.register(GenreLabelCell.self, forCellWithReuseIdentifier: "Cell")
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = .groupTableViewBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let cardWidth = self.view.frame.width * 0.375
        let contentInsets = (self.view.frame.width - (cardWidth * 2)) / 3
        print("ContentInsets: \(contentInsets)")
        
        
        collectionView.contentInset = UIEdgeInsets(top: 10, left: contentInsets, bottom: 8, right: contentInsets)
        genresLabel.textColor = UIColor(r: 180, g: 182, b: 184, a: 1)
        genresLabelLeadingConstraint.constant = contentInsets
        
        
        contentView.addSubview(collectionView)
        setupCollectionViewConstraints()
    }
    
    
    func setupCollectionViewConstraints() {
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }


}



extension GenresCardViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! GenreLabelCell
        
        cell.label.text = genres[indexPath.row]
        
        cells.append(cell)
        
        return cell
        
    }
    
    
    
}

extension GenresCardViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        cells.forEach { $0.isHighlighted = false }
        
        let cell = collectionView.cellForItem(at: indexPath)
        
        UIView.animate(withDuration: 0.2) {
            cell?.isHighlighted = true
        
        }
        
        let userInfo = ["genre" : genres[indexPath.item]]
        NotificationCenter.default.post(name: Notification.Name.genreButtonTapped, object: self, userInfo: userInfo)
        
    }
    
}

extension GenresCardViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //let cardWidth = self.view.frame.width / 3
        let cardWidth = self.view.frame.width * 0.375
//        print("Cardwith: \(cardWidth)")
//        print("Width \(self.view.frame.width)")
//        print("Height \(cardWidth / 4)")
        return CGSize(width: cardWidth, height: cardWidth / 3)
        //return CGSize(width: 150, height: 40)
    }
}

