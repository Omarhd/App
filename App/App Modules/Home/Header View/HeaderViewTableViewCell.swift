//
//  HeaderViewTableViewCell.swift
//  App
//
//  Created by Omar Abdulrahman on 02/03/2024.
//

import UIKit

class HeaderViewTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var headerActionButton: UIButton!
   
    
    // MARK: - Properties
    
    
    // MARK: - Methods
    fileprivate func initalUI() {
        
    }
    
    func configureCellForFavSection() {
        self.headerTitleLabel.text = "Favourites"
        self.headerActionButton.isHidden = false
    }
    
    func configureCellForNearSection() {
        self.headerTitleLabel.text = "Near You"
        self.headerActionButton.isHidden = true
    }

    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        initalUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
