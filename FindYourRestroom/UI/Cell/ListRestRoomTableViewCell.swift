//
//  ListRestRoomTableViewCell.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import UIKit

class ListRestRoomTableViewCell: UITableViewCell {

    static var identifier = "ListRestRoomTableViewCell"
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var adresseLabel: UILabel!
    @IBOutlet weak var openingDateLabel: UILabel!
    @IBOutlet weak var arrondissementLabel: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewContainer.layer.cornerRadius = 8
        viewContainer.layer.borderColor = UIColor.lightGray.cgColor
        viewContainer.layer.borderWidth = 1
        viewContainer.clipsToBounds = true
        
        selectionStyle = .none
    }
}
