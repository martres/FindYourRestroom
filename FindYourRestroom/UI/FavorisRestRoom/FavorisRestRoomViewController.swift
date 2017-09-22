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
    var listRestRoom: ListRestRoomViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let vc = ListRestRoomViewController.makeFromStoryBoard() as? ListRestRoomViewController {
            let model = ListRestRoomViewModel(restRooms: modelFavoris.restRooms)
            vc.listModel = model
            vc.listModel?.filter = "favorite = 1"
            vc.willMove(toParentViewController: self)
            vc.view.frame = viewContainer.frame
            viewContainer.addSubview(vc.view)
            addChildViewController(vc)
            vc.didMove(toParentViewController: self)
            listRestRoom = vc
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name(rawValue: "favoriteChange"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }
    
    func reloadData() {
        modelFavoris.getData()
        listRestRoom?.listModel?.restRooms = modelFavoris.restRooms
        viewContainer.isHidden = modelFavoris.restRooms.count == 0
        noFavorisLabel.isHidden = !(modelFavoris.restRooms.count == 0)
        listRestRoom?.restRoomTableView.reloadData()
    }

}
