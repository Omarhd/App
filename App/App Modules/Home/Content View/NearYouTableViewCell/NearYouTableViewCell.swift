//
//  SettingsTableViewCell.swift
//  App
//
//  Created by Omar Abdulrahman on 29/02/2024.
//

import UIKit

class NearYouTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var hotelImageView: UIImageView!
    @IBOutlet weak var propertyNameLabel: UILabel!
    @IBOutlet weak var propertyDistanceLabel: UILabel!
    @IBOutlet weak var propertyIsLikedButton: UIButton!
    @IBOutlet weak var propertyPriceLabel: UILabel!
    @IBOutlet weak var starsRatingStackView: UIStackView!
    
    // MARK: - Propertis
    weak var delegate: HomeViewProtocol?
    
    // MARK: - Methods
    fileprivate func initailUI() {
        hotelImageView.layer.cornerRadius = 12
    }
    
    func configureUI() {
        hotelImageView.image = .marina
    }
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initailUI()
        appendImagesToStackView(rating: 4)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func appendImagesToStackView(rating: Double) {
        // Remove any existing subviews from the stack view
        for subview in starsRatingStackView.arrangedSubviews {
            starsRatingStackView.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
        
        let emptyStarImage = UIImage(systemName: "star")
        let fullStarImage = UIImage(systemName: "star.fill")
        let halfStarImage = UIImage(systemName: "star.leadinghalf.filled")
        
        // Append 5 images to the stack view
        for i in 1...5 {
            var image: UIImage?
            if Double(i) <= rating {
                image = fullStarImage
            } else if Double(i) - rating == 0.5 {
                image = halfStarImage
            } else {
                image = emptyStarImage
            }
            
            if let image = image {
                let imageView = UIImageView(image: image)
                imageView.contentMode = .scaleAspectFit
                imageView.tintColor = rating >= Double(i) ? .systemYellow : .systemGray
                imageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
                imageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
                starsRatingStackView.addArrangedSubview(imageView)
            }
        }
    }

    
}
