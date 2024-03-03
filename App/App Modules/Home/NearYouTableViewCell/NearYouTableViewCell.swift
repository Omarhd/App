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
    
    // MARK: - Propertis
    
    
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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
