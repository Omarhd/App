//
//  StretchyHeaderView.swift
//  App
//
//  Created by ios Dev on 05/03/2024.
//

import UIKit

class StretchyHeaderView: UIView {
    
    var headerSegmentedControl: UISegmentedControl!
    var collectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    private func setupSubviews() {
        // Set the background color directly on the header view
        backgroundColor = UIColor.background
        
        // Create and add the segmented control
        headerSegmentedControl = UISegmentedControl(items: ["Option 1", "Option 2"])
        headerSegmentedControl.translatesAutoresizingMaskIntoConstraints = false // Enable auto layout for the segmented control
        addSubview(headerSegmentedControl)
        
        // Create layout constraints for the segmented control
        NSLayoutConstraint.activate([
            headerSegmentedControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerSegmentedControl.topAnchor.constraint(equalTo: topAnchor, constant: 20), // Adjust top anchor according to your preference
            headerSegmentedControl.widthAnchor.constraint(equalTo: widthAnchor, constant: -40), // Adjust width anchor according to your preference
        ])
        
        // Create layout for the collection view
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        addSubview(collectionView)
        
        // Create layout constraints for the collection view
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: headerSegmentedControl.bottomAnchor, constant: 20), // Adjust top anchor according to your preference
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20), // Adjust leading anchor according to your preference
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20), // Adjust trailing anchor according to your preference
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20) // Adjust bottom anchor according to your preference
        ])
        
        collectionView.dataSource = self
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
    }
}

extension StretchyHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCollectionViewCell
        cell.imageView.image = UIImage(systemName: "person") // Replace with your image
        cell.label.text = "Item \(indexPath.item)"
        return cell
    }
}

class MyCollectionViewCell: UICollectionViewCell {
    var stackView: UIStackView!
    var imageView: UIImageView!
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    private func setupSubviews() {
        // Create and add stack view
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        // Create and add image view
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(imageView)
        
        // Create and add label
        label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(label)
        
        // Add constraints for stack view
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        // Add constraints for image view (optional if you want to control the size)
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 50), // Adjust according to your preference
            imageView.heightAnchor.constraint(equalToConstant: 50) // Adjust according to your preference
        ])
    }
}

