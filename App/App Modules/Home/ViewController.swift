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
    private let presenter = HomePresenter()

    // MARK: - Properties
    private var dataSource: [SectionType] = [.profile, .search]
    private var isScrolling = false
    private var headerView: UIView!
    private var headerVisible = false

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

        headerView = StretchyHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 200)) // Adjust the height according to your preference
        tableView.addSubview(headerView)

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
            contentCell.delegate = self
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
        let offsetY = scrollView.contentOffset.y
        
        let headerRect = tableView.rectForHeader(inSection: 0)
        if tableView.contentOffset.y >= headerRect.origin.y && tableView.contentOffset.y < headerRect.maxY {
            headerView = tableView.headerView(forSection: 0)
        }
        
        guard isScrolling else {
            return
        }
        
        guard let tableView = scrollView as? UITableView else {
            return
        }
        
        guard scrollView.contentOffset != CGPoint.zero else {
            return
        }
        
        if let lastIndexPath = tableView.indexPathsForVisibleRows?.last {
            if lastIndexPath.section == tableView.numberOfSections - 1 && lastIndexPath.row == tableView.numberOfRows(inSection: lastIndexPath.section) - 1 {
                if let lastCell = tableView.cellForRow(at: lastIndexPath) as? FavAndNearTableViewCell {
                    lastCell.tableView.isScrollEnabled = true
                }
            }
        }
        
        if offsetY <= -50 && !headerVisible {
            showHeaderView()
        } else if offsetY > -50 && headerVisible {
            hideHeaderView()
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
    
    func showHeaderView() {
        UIView.animate(withDuration: 0.3) {
            let headerHeight: CGFloat = 180 // Adjust the header height as needed
            let insetTop = headerHeight + self.tableView.safeAreaInsets.top
            self.tableView.contentInset = UIEdgeInsets(top: insetTop, left: 0, bottom: 0, right: 0)
            self.headerView.frame.origin.y = -headerHeight
            self.headerVisible = true
        }
    }

    func hideHeaderView() {
        UIView.animate(withDuration: 0.3) {
            let insetTop = self.tableView.safeAreaInsets.top
            self.tableView.contentInset = UIEdgeInsets(top: insetTop, left: 0, bottom: 0, right: 0)
            self.headerView.frame.origin.y = 0
            self.headerVisible = false
        }
    }
    
}

extension ViewController: HomeViewProtocol {
    
    func didSelectItem(atIndex index: Int, inCell cell: UITableViewCell) {
        print(index)
    }
    
    func displayData(_ data: AllPosts) {
        print(data)
    }
    
    func displayError(_ error: Error) {
        AlertManager.shared.showErrorAlert(message: error.localizedDescription)
    }
    
    func receiveImage(_ image: UIImage) {
        
    }
    
}
