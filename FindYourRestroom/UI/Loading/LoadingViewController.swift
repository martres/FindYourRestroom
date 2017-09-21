//
//  LoadingViewController.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    @IBOutlet weak var centerImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var imgLoading: UIImageView!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    var loadingModel = LoadingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = UserLocationManager.sharedManager
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimation()
    }
    
    func startAnimation() {
        self.centerImageConstraint.constant -= self.imgLoading.frame.size.height
        UIView.animate(withDuration: 0.8, animations: {
            self.view.layoutIfNeeded()
            self.loadingLabel.alpha = 1
        }) { (_) in
            self.startRequest()
        }
    }
    
    func startRequest() {
        loader.startAnimating()
        loadingModel.fetchRestRoom {[weak self] (success) in
            guard let strongSelf = self else {
                return
            }
            
            if success {
                NavigationManager.showMainTabBar()
            } else {
                strongSelf.showError()
            }
        }
    }
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "It seems you don't any connection", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { (_) in
            self.startRequest()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
