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
    var dataSource: [SectionType] = [.profile, .search]
    var isScrolling = false

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.attachView(self)
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter.fetchMovies()
        
        presenter.registerCells(tableView: tableView, Identifire: ProfileTableViewCell.viewIdentifier())
        presenter.registerCells(tableView: tableView, Identifire: SearchTableViewCell.viewIdentifier())
        presenter.registerCells(tableView: tableView, Identifire: HeaderViewTableViewCell.viewIdentifier())
        presenter.registerCells(tableView: tableView, Identifire: FavAndNearTableViewCell.viewIdentifier())

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
            let contentCell = tableView.dequeueReusableCell(withIdentifier: FavAndNearTableViewCell.viewIdentifier(), for: indexPath) as! FavAndNearTableViewCell
            contentCell.tableView.reloadData()
            
            return contentCell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let searchCell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.viewIdentifier()) as! SearchTableViewCell

        switch dataSource[section] {
        case .profile:
            return nil
            
        case .search:
            searchCell.collectionView.reloadData()
            return searchCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return dataSource[section].headerHeight
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return dataSource[section].estimatedHeightForHeader
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return dataSource[section].estimatedHeightForHeader
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let headerRect = tableView.rectForHeader(inSection: 1)
        if tableView.contentOffset.y >= headerRect.origin.y && tableView.contentOffset.y < headerRect.maxY {
            if let headerView = tableView.headerView(forSection: 1) {
                headerView.backgroundColor = UIColor.red
            }
        }
        
        guard isScrolling else {
            return
        }
        
        guard let tableView = scrollView as? UITableView else {
            return
        }
        
        // Check if the content offset has changed
        guard scrollView.contentOffset != CGPoint.zero else {
            // Content offset hasn't changed, likely due to initial layout
            return
        }
        
        // Check if the last cell is currently visible
        if let lastIndexPath = tableView.indexPathsForVisibleRows?.last {
            if lastIndexPath.section == tableView.numberOfSections - 1 && lastIndexPath.row == tableView.numberOfRows(inSection: lastIndexPath.section) - 1 {
                if let lastCell = tableView.cellForRow(at: lastIndexPath) as? FavAndNearTableViewCell {
                    lastCell.tableView.isScrollEnabled = true
                }
            }
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isScrolling = true
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            isScrolling = false
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        isScrolling = false
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
