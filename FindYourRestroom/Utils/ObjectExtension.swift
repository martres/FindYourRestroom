//
//  ObjectExtension.swift
//  FindYourRestroom
//
//  Created by Martreux Steven on 22/09/2017.
//  Copyright © 2017 me. All rights reserved.
//

import Foundation
import RealmSwift

extension Object {
        
    class func ignoredPropertiesUpdating() -> [String] {
        return [String]()
    }
    
}
