//
//  HomePresenter.swift
//  App
//
//  Created by Omar Abdulrahman on 29/02/2024.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func displayData(_ data: Movies)
    func displayError(_ error: Error)
}

final class HomePresenter {
    
    weak var view: HomeViewProtocol?
    private let apiClient = APIClient()
        
    func attachView(_ view: HomeViewProtocol) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }

    func fetchMovies() {
        Task {
            do {
                guard let url = URL(string: "http://45.76.178.21:9097/api/poll-post?page=false") else { return }
                let result: Movies = try await apiClient.get(from: url)
                view?.displayData(result)
                
            } catch {
                view?.displayError(error)
            }
        }
    }
    
    func registerCells(tableView: UITableView, Identifire: String) {
        tableView.register(UINib(nibName: Identifire, bundle: nil), forCellReuseIdentifier: Identifire)
    }
    
}
