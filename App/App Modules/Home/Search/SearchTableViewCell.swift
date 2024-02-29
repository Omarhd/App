//
//  SearchTableViewCell.swift
//  App
//
//  Created by Omar Abdulrahman on 29/02/2024.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
  
    // MARK: - Methods
    fileprivate func intialUI() {
        searchView.layer.borderColor = UIColor.lightGray.cgColor
        searchView.layer.borderWidth = 1
        searchView.layer.cornerRadius = 12
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
