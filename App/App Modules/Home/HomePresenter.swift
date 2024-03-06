//
//  HomePresenter.swift
//  App
//
//  Created by Omar Abdulrahman on 29/02/2024.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func displayData(_ data: AllPosts)
    func displayError(_ error: Error)
    func didSelectItem(atIndex index: Int, inCell cell: UITableViewCell)
    func receiveImage(_ image: UIImage)
}

final class HomePresenter {
    
    // MARK: - Properties
    weak var view: HomeViewProtocol?
    private let apiClient = APIClient()
    private let imageLoader = ImageLoader()

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
                let params = AllPostsRequest(forumID: "basketball")
                let result: AllPosts = try await apiClient.getWithParameters(from: url, parameters: params)
                view?.displayData(result)
                await loadImage(from: URL(string: "http://45.76.178.2155:9097/imgs/temp/1708589658_image_1708589657258.jpeg")!)
            } catch {
                view?.displayError(error)
            }
        }
    }
    
    func loadImage(from url: URL) async {
        do {
            let image = try await imageLoader.loadImage(from: url)
            view?.receiveImage(image)
        } catch {
            view?.displayError(error)
        }
    }
    
    func registerCells(tableView: UITableView, Identifire: String) {
        tableView.register(UINib(nibName: Identifire, bundle: nil), forCellReuseIdentifier: Identifire)
    }
    
}
