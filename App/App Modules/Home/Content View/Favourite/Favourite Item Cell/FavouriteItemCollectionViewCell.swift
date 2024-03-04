//
//  FavouriteItemCollectionViewCell.swift
//  App
//
//  Created by Omar Abdulrahman on 29/02/2024.
//

import UIKit

class FavouriteItemCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var hotelImage: UIImageView!
    @IBOutlet weak var viewersView: UIView!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var hotelLocationLabel: UILabel!
    @IBOutlet weak var hotelNameLabel: UILabel!
    @IBOutlet weak var ratingCountLabel: UILabel!
    
    
    // MARK: - Methods
    fileprivate func intialUI() {
        hotelImage.layer.cornerRadius = 12
        viewersView.layer.cornerRadius = 12
        viewersView.layer.borderWidth = 0.5
        viewersView.layer.borderColor = UIColor.white.cgColor
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        intialUI()
    }

}
