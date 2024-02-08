//
//  UserDefaultsManager.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/7/24.
//

import UIKit

class UserDefaultsManager {
    
    let standart = UserDefaults.standard
    
    func write(object: Any, key: String) {
        standart.set(object, forKey: key)
    }
    
    func getObject(key: String) -> Any {
        standart.object(forKey: key) ?? 0
    }
        
}
