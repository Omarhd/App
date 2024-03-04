//
//  FavAndNearTableViewCell.swift
//  App
//
//  Created by ios Dev on 04/03/2024.
//

import UIKit

class FavAndNearTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var dataSource: [FaveAndNear] = [.favourite, .nearYou]

    
    // MARK: - Methods
    fileprivate func initalUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initalUI()
        
        tableView.register(UINib(nibName: FavouriteTableViewCell.viewIdentifier(), bundle: nil), forCellReuseIdentifier: FavouriteTableViewCell.viewIdentifier())
        tableView.register(UINib(nibName: NearYouTableViewCell.viewIdentifier(), bundle: nil), forCellReuseIdentifier: NearYouTableViewCell.viewIdentifier())
        tableView.register(UINib(nibName: HeaderViewTableViewCell.viewIdentifier(), bundle: nil), forCellReuseIdentifier: HeaderViewTableViewCell.viewIdentifier())

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension FavAndNearTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch dataSource[indexPath.section] {
        case .favourite:
            let favouriteCell = tableView.dequeueReusableCell(withIdentifier: FavouriteTableViewCell.viewIdentifier(), for: indexPath) as! FavouriteTableViewCell
            favouriteCell.collectionView.reloadData()

            return favouriteCell
            
        case .nearYou:
            let nearYouCell = tableView.dequeueReusableCell(withIdentifier: NearYouTableViewCell.viewIdentifier(), for: indexPath) as! NearYouTableViewCell
            nearYouCell.backgroundColor = .blue
            nearYouCell.configureUI()
            
            return nearYouCell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableCell(withIdentifier: HeaderViewTableViewCell.viewIdentifier()) as! HeaderViewTableViewCell

        switch dataSource[section] {
        case .favourite:
            let header = headerView
            header.configureCellForFavSection()
            return header

        case .nearYou:
            let header = headerView
            header.configureCellForNearSection()
            return header
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return dataSource[section].headerHeight
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return dataSource[section].estimatedHeightForHeader
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= 0 {
            self.tableView.isScrollEnabled = false
        }
    }
}
