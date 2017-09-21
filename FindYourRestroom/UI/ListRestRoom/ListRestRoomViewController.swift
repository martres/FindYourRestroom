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
    
    class func makeFromStoryBoard() -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListRestRoomViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initRestRoomTableView()
    }
    
    func initRestRoomTableView() {
        restRoomTableView.delegate = self
        restRoomTableView.dataSource = self
        restRoomTableView.estimatedRowHeight = 70
        restRoomTableView.rowHeight = UITableViewAutomaticDimension
        
        let nib = UINib(nibName: ListRestRoomTableViewCell.identifier, bundle: nil)
        restRoomTableView.register(nib, forCellReuseIdentifier: ListRestRoomTableViewCell.identifier)
    }
}

extension ListRestRoomViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension ListRestRoomViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
}
