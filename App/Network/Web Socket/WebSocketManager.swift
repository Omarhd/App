//
//  WebSocketManager.swift
//  App
//
//  Created by ios Dev on 06/03/2024.
//

import Foundation
import Combine

class WebSocketManager: NSObject, URLSessionWebSocketDelegate {
    
    private var webSocketTask: URLSessionWebSocketTask?
    var receivePublisher: PassthroughSubject<String, Never> = PassthroughSubject()
    private var url: URL
    private lazy var session: URLSession = {
        return URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
    }()

    init(url: URL) {
        self.url = url
        super.init()
        // No need to initialize 'session' here, as it's lazily initialized
    }

    
    func connect() async {
        self.webSocketTask = self.session.webSocketTask(with: self.url)
        self.webSocketTask?.resume()
        await listen()
    }
    
    func send(text: String) -> Future<Void, Error> {
        Future { promise in
            let message = URLSessionWebSocketTask.Message.string(text)
            self.webSocketTask?.send(message) { error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(()))
                }
            }
        }
    }
    
    private func listen() async {
        guard let webSocketTask = webSocketTask else { return }

        while true {
            do {
                let message = try await webSocketTask.receive()
                switch message {
                case .string(let text):
                    DispatchQueue.main.async { [weak self] in
                        self?.receivePublisher.send(text)
                    }
                case .data(let data):
                    // Handle binary data if needed
                    print("Received data: \(data)")
                @unknown default:
                    print("Received an unknown message type")
                }
            } catch {
                print("WebSocket receive error: \(error)")
                // Handle the error, possibly by breaking the loop and/or reconnecting
                AlertManager.shared.showErrorAlert(message: error.localizedDescription)
                break
            }
        }
    }

    
    func disconnect() async {
        let reason = "Client initiated disconnect".data(using: .utf8)
        webSocketTask?.cancel(with: .goingAway, reason: reason)
    }
    
    // URLSessionWebSocketDelegate methods as needed
}
