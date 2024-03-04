//
//  CustomTabBarController.swift
//  App
//
//  Created by ios Dev on 04/03/2024.
//

import UIKit

class CustomTabBarController: UITabBarController {

    private var circleView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.delegate = self
        initializeCircleView()
        
        DispatchQueue.main.async {
            self.moveCircleToTabItem(index: 0, animated: false)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        intialUI()
    }
    
    fileprivate func intialUI() {
        let newTabBarHeight = tabBar.frame.size.height + 16
    
        var newFrame = tabBar.frame
        newFrame.size.height = newTabBarHeight
        newFrame.origin.y = view.frame.size.height - newTabBarHeight
        
        tabBar.frame = newFrame
    }
    
    private func initializeCircleView() {
        let circleSize: CGFloat = 50
        let circleColor = UIColor.overlay // Customize the circle color as needed
        circleView = UIView()
        circleView?.backgroundColor = circleColor
        circleView?.layer.cornerRadius = circleSize / 2
        circleView?.frame.size = CGSize(width: circleSize, height: circleSize)
        circleView?.layer.borderWidth = 0.5
        circleView?.layer.borderColor = UIColor.accent.cgColor
        if let circleView = circleView {
            tabBar.addSubview(circleView)
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let items = tabBar.items, let index = items.firstIndex(of: item) else { return }
        moveCircleToTabItem(index: index, animated: true)
    }
    
    private func moveCircleToTabItem(index: Int, animated: Bool) {
        guard let tabItems = tabBar.items else { return }
        let numberOfItems = CGFloat(tabItems.count)
        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height)
        let xOffset = (tabBarItemSize.width * CGFloat(index)) + (tabBarItemSize.width / 2) - (circleView?.frame.width ?? 0) / 2
        let yOffset: CGFloat = +10
        
        // Animate the circle movement
        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                self.circleView?.frame.origin = CGPoint(x: xOffset, y: yOffset)
            })
        } else {
            circleView?.frame.origin = CGPoint(x: xOffset, y: yOffset)
        }
    }

    
}

extension CustomTabBarController: UITabBarControllerDelegate {
    // Implement delegate methods if needed
}


//class CustomHeightTabBar: UITabBar {
//
//    @IBInspectable var height: CGFloat = 90.0
//
//    override func sizeThatFits(_ size: CGSize) -> CGSize {
//        var sizeThatFits = super.sizeThatFits(size)
//        if height > 0.0 {
//            sizeThatFits.height = height
//        }
//        return sizeThatFits
//    }
//}
