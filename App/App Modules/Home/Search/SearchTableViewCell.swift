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
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Methods
    fileprivate func intialUI() {
        searchView.layer.borderColor = UIColor.lightGray.cgColor
        searchView.layer.borderWidth = 1
        searchView.layer.cornerRadius = 12
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0) // 24 spacing from the left
        collectionView.collectionViewLayout = layout
        
        let cellNib = UINib(nibName: FilterItemCollectionViewCell.viewIdentifier(), bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: FilterItemCollectionViewCell.viewIdentifier())
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()

        searchTextField.delegate = self
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

extension SearchTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterItemCollectionViewCell.viewIdentifier(), for: indexPath) as? FilterItemCollectionViewCell else { return UICollectionViewCell() }

        cell.layer.cornerRadius = 12
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        
        if indexPath.item == 0 {
            cell.isSelected = true
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // Calculate cell size based on dynamic content
        let width: CGFloat = 100
        let height: CGFloat = 40 // Fixed height
            
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? FilterItemCollectionViewCell else { return }
        
        // Toggle selection
        cell.isSelected = !cell.isSelected
        if cell.isSelected {
            cell.locationIconImage.isHidden = false
        } else {
            cell.locationIconImage.isHidden = true
        }
    }
}

extension SearchTableViewCell: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("start")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("ended")
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Concatenate the current text in the text field with the replacement string
        let searchText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
        
        // Perform search operation based on searchText
        print("Searching for: \(searchText)")
        // You can perform search operations here
        
        return true
    }
}
