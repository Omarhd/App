//
//  ChatViewController.swift
//  App
//
//  Created by ios Dev on 06/03/2024.
//

import UIKit

class ChatViewController: UIViewController {
    
    private var presenter: WebSocketPresenter!
    private let textView = UITextView()
    private let textField = UITextField()
    private let sendButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        guard let url = URL(string: "wss://example.com/websocket") else {
            fatalError("Invalid WebSocket URL")
        }
        presenter = WebSocketPresenter(view: self, url: url)
    }
    
    func setupUI() {
        // Setup textView, textField, and sendButton with proper layout and configurations
        sendButton.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
    }
    
    @objc func sendMessage() {
        presenter.sendMessage(textField.text ?? "")
        textField.text = "" // Clear the text field after sending
    }
    
}

extension ChatViewController: WebSocketViewProtocol {
    
    // MARK: - WebSocketViewProtocol
    func updateMessages(_ messages: [String]) {
        textView.text = messages.joined(separator: "\n")
    }
    
    func recivedError(_ error: String) {
        
    }

}
