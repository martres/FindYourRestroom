//
//  ListRestRoomViewController.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import UIKit

class ListRestRoomViewController: UIViewController {
    
    @IBOutlet weak var restRoomTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initRestRoomTableView()
    }
    
    func initRestRoomTableView() {
        self.restRoomTableView.delegate = self
        self.restRoomTableView.dataSource = self
    }
}

extension ListRestRoomViewController: UITableViewDelegate {
    
}

extension ListRestRoomViewController: UITableViewDataSource {
    
}
