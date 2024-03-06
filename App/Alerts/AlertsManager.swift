//
//  AlertsManager.swift
//  App
//
//  Created by ios Dev on 06/03/2024.
//

import UIKit
import JDStatusBarNotification

class AlertManager {
    
    // Singleton instance
    static let shared = AlertManager()
    
    private init() {}
    
    func showSuccessAlert(message: String) {
        DispatchQueue.main.async {
            let image = UIImageView(image: UIImage(systemName: "gamecontroller.fill"))
            image.tintColor = .green
            NotificationPresenter.shared.present("Done", subtitle: message, includedStyle: .success, duration: 1.5)
            NotificationPresenter.shared.displayLeftView(image)
        }
    }
    
    func showErrorAlert(message: String) {
        DispatchQueue.main.async {
            let image = UIImageView(image: UIImage(systemName: "gamecontroller.fill"))
            image.tintColor = .red
            NotificationPresenter.shared.present("Error", subtitle: message, includedStyle: .warning, duration: 1.5)
            NotificationPresenter.shared.displayLeftView(image)
        }
    }
    
    func showInfoAlert(message: String) {
        DispatchQueue.main.async {
            let image = UIImageView(image: UIImage(systemName: "gamecontroller.fill"))
            NotificationPresenter.shared.present("Warring", subtitle: message, includedStyle: .matrix, duration: 1.5)
            NotificationPresenter.shared.displayLeftView(image)
        }
    }
    
    func showCustomAlert(message: String, backgroundColor: UIColor, textColor: UIColor) {
        
    }
    
    func dismissAlert() {
        DispatchQueue.main.async {
            NotificationPresenter.shared.dismiss()
        }
    }
}
