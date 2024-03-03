//
//  ViewController.swift
//  App
//
//  Created by Omar Abdulrahman on 29/02/2024.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
  
    // MARK: - Presenter
    let presenter = HomePresenter()

    // MARK: - Properties
    var dataSource: [SectionType] = [.profile, .search, .favourite(1), .nearYou(1)]

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.attachView(self)
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter.fetchMovies()
        
        presenter.registerCells(tableView: tableView, Identifire: HeaderViewTableViewCell.viewIdentifier())
        presenter.registerCells(tableView: tableView, Identifire: ProfileTableViewCell.viewIdentifier())
        presenter.registerCells(tableView: tableView, Identifire: SearchTableViewCell.viewIdentifier())
        presenter.registerCells(tableView: tableView, Identifire: FavouriteTableViewCell.viewIdentifier())
        presenter.registerCells(tableView: tableView, Identifire: NearYouTableViewCell.viewIdentifier())

    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].numberOfRowsInSection
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch dataSource[indexPath.section] {
        case .profile:
            let profileCell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.viewIdentifier(), for: indexPath) as! ProfileTableViewCell
            return profileCell
            
        case .search:
            return UITableViewCell()
                        
        case .favourite:
            let favouriteCell = tableView.dequeueReusableCell(withIdentifier: FavouriteTableViewCell.viewIdentifier(), for: indexPath) as! FavouriteTableViewCell
            favouriteCell.collectionView.reloadData()

            return favouriteCell
            
        case .nearYou:
            let nearYouCell = tableView.dequeueReusableCell(withIdentifier: NearYouTableViewCell.viewIdentifier(), for: indexPath) as! NearYouTableViewCell
            nearYouCell.configureUI()
            
            return nearYouCell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let searchCell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.viewIdentifier()) as! SearchTableViewCell

        let headerView = tableView.dequeueReusableCell(withIdentifier: HeaderViewTableViewCell.viewIdentifier()) as! HeaderViewTableViewCell

        switch dataSource[section] {
        case .profile:
            return nil
            
        case .search:
            searchCell.collectionView.reloadData()
            return searchCell
            
        case .favourite(_):
            let header = headerView
            header.configureCellForFavSection()
            return header
            
        case .nearYou(_):
            headerView.configureCellForNearSection()
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
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        switch dataSource[section] {
        case .profile:
            break
        case .search:
            print("hello sticky")
        case .favourite(_):
            print("hello mf")
        case .nearYou(_):
            print("hello mf")
        }
    }
}

extension ViewController: HomeViewProtocol {
   
    func displayData(_ data: Movies) {
        print(data)
    }
    
    func displayError(_ error: Error) {
        print(error)
    }
    
}
