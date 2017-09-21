//
//  FavorisRestRoomViewController.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import UIKit

class FavorisRestRoomViewController: UIViewController {

    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var noFavorisLabel : UILabel!

    var modelFavoris = FavorisRestRoomViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let vc = ListRestRoomViewController.makeFromStoryBoard() as? ListRestRoomViewController {
            let model = ListRestRoomViewModel(restRooms: modelFavoris.restRooms)
            vc.listModel = model
            
            vc.willMove(toParentViewController: self)
            vc.view.frame = viewContainer.frame
            view.addSubview(vc.view)
            addChildViewController(vc)
            vc.didMove(toParentViewController: self)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewContainer.isHidden = modelFavoris.restRooms.count == 0
        noFavorisLabel.isHidden = !(modelFavoris.restRooms.count == 0)
    }

}
