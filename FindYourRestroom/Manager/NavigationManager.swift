//
//  NavigationManager.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import UIKit

class NavigationManager {
    
    class func showMainTabBar() {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        guard let rootVC = window.rootViewController else {
            return
        }
        
        let tabBar = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainTabBar")

        tabBar.view.frame = rootVC.view.frame
        tabBar.view.layoutIfNeeded()
        
        UIView.transition(with: window, duration: 0.3, options: .curveEaseIn, animations: {
            window.rootViewController = tabBar
        }, completion: nil)
    }
    
    class func showViewDetail(fromVc: UIViewController) {
        
    }
}
