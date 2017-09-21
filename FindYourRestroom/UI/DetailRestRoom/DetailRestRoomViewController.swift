//
//  DetailRestRoomViewController.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import UIKit

class DetailRestRoomViewController: UIViewController {

    @IBOutlet weak var adresseLabel: UILabel!
    @IBOutlet weak var arrondissement: UILabel!
    @IBOutlet weak var openingDate: UILabel!
    @IBOutlet weak var coordinates: UILabel!
    
    var detailModel: DetailRestRoomViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addFavorite(_ sender: Any) {
        
    }
    
    @IBAction func share() {
        
    }
    
    @IBAction func call() {
        
    }
}
