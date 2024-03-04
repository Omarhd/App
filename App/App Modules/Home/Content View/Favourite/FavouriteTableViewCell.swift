//
//  FavouriteTableViewCell.swift
//  App
//
//  Created by Omar Abdulrahman on 29/02/2024.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
  
    // MARK: - Methods
    private func intialUI() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0) // 24 spacing from the left
        layout.minimumInteritemSpacing = 16 // Set the spacing between items in a row
        layout.minimumLineSpacing = 16 // Set the spacing between rows
        
        collectionView.collectionViewLayout = layout
        
        let cellNib = UINib(nibName: FavouriteItemCollectionViewCell.viewIdentifier(), bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: FavouriteItemCollectionViewCell.viewIdentifier())

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        intialUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension FavouriteTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavouriteItemCollectionViewCell.viewIdentifier(), for: indexPath) as! FavouriteItemCollectionViewCell

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = UIScreen.main.bounds.width - 200
        let height: CGFloat = 200
            
        return CGSize(width: width, height: height)
    }
    
}
