//
//  FilterItemCollectionViewCell.swift
//  App
//
//  Created by Omar Abdulrahman on 29/02/2024.
//

import UIKit

class FilterItemCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var locationIconImage: UIImageView!
    @IBOutlet weak var filterNameLabel: UILabel!
        
    // MARK: - Methods
    fileprivate func intialUI() {
        containerView.layer.borderColor = UIColor.gray.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 12
    }
    
    func configureUI(filter: Filters) {
        self.filterNameLabel.text = filter.filterName
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        intialUI()
    }
}
