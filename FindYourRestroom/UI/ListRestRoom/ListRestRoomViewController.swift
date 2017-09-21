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
    
    var listModel: ListRestRoomViewModel?
    
    class func makeFromStoryBoard() -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListRestRoomViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initRestRoomTableView()
        
        if listModel == nil {
            listModel = ListRestRoomViewModel()
        }
    }
    
    func initRestRoomTableView() {
        restRoomTableView.delegate = self
        restRoomTableView.dataSource = self
        restRoomTableView.estimatedRowHeight = 80
        restRoomTableView.rowHeight = UITableViewAutomaticDimension
        
        let nib = UINib(nibName: ListRestRoomTableViewCell.identifier, bundle: nil)
        restRoomTableView.register(nib, forCellReuseIdentifier: ListRestRoomTableViewCell.identifier)
    }
}

extension ListRestRoomViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let model = listModel else {
            return
        }
        NavigationManager.showViewDetail(restRoom: model.restRooms[indexPath.row])
    }
    
}

extension ListRestRoomViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listModel?.numberOfSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listModel?.numberOfRow(inSection: section) ?? 0
    }
    
    func makeListRestRoomCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListRestRoomTableViewCell.identifier, for: indexPath) as? ListRestRoomTableViewCell, let model = listModel else {
            return UITableViewCell()
        }
        cell.distanceLabel.text = model.getDistance(atIndex: indexPath.row)
        cell.adresseLabel.text = model.getAdresse(atIndex: indexPath.row)
        cell.arrondissementLabel.text = model.getArrondissement(atIndex: indexPath.row)
        cell.openingDateLabel.text = model.getOpeningDate(atIndex: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return makeListRestRoomCell(tableView, cellForRowAt: indexPath)
    }
    
}
