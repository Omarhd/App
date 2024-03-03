//
//  ProfileTableViewCell.swift
//  App
//
//  Created by Omar Abdulrahman on 29/02/2024.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    // MARK: - Profile
    @IBOutlet weak var greatingMessageLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    // MARK: - Methods
    fileprivate func intialUI() {
        
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
