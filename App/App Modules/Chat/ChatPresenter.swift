//
//  ChatPresenter.swift
//  App
//
//  Created by ios Dev on 06/03/2024.
//

import Foundation
import Combine

protocol WebSocketViewProtocol: AnyObject {
    func updateMessages(_ messages: [String])
    func recivedError(_ error: String)
}

class WebSocketPresenter {
    
    private weak var view: WebSocketViewProtocol?
    private var webSocketManager: WebSocketManager?
    private var cancellables = Set<AnyCancellable>()
    private var receivedMessages: [String] = [] {
        didSet {
            view?.updateMessages(receivedMessages)
        }
    }
    
    init(view: WebSocketViewProtocol, url: URL) {
        self.view = view
        self.webSocketManager = WebSocketManager(url: url)
        
        self.webSocketManager?.receivePublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] message in
                self?.receivedMessages.append(message)
            })
            .store(in: &cancellables)
        
        Task {
            await self.webSocketManager?.connect()
        }
    }
    
    func sendMessage(_ message: String) {
        guard !message.isEmpty else { return }
        
        webSocketManager?.send(text: message)
            .sink(receiveCompletion: { completion in
                // Handle completion if needed
            }, receiveValue: { [weak self] _ in
                // Handle message sent acknowledgment if needed
                print(message)
            })
            .store(in: &cancellables)
    }
}
