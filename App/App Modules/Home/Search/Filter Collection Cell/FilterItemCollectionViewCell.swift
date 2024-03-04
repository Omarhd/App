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
        
    // MARK: - Properties
    override var isSelected: Bool {
        didSet {
            containerView.backgroundColor = isSelected ? .outline : .clear
            locationIconImage.isHidden = false
        }
    }
    
    // MARK: - Methods
    fileprivate func intialUI() {
        containerView.layer.borderColor = UIColor.gray.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 12
        locationIconImage.isHidden = true
    }
    
    func configureUI(filter: Filters) {
        filterNameLabel.text = filter.filterName
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        intialUI()
    }
}
