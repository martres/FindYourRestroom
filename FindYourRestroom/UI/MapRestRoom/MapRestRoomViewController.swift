//
//  MapRestRoomViewController.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import UIKit

class MapRestRoomViewController: UIViewController {
    
    class func makeFromStoryBoard() -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MapRestRoomViewController")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
