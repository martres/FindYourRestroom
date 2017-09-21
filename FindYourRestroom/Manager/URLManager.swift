//
//  URLManager.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 21/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import Foundation

class URLManager {
    class func urlForRestrooms() -> String {
        return "https://data.ratp.fr/api/records/1.0/search/?dataset=sanisettesparis2011&rows=1000"
    }
}
