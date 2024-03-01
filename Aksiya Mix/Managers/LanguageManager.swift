//
//  LanguageManager.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/7/24.
//

import Foundation

enum LanguageType {
    case uz, ru
}

class LanguageManager {
        
    let udManager = UserDefaultsManager()
    
    private var objectForUzbek: String = "uz"
    private var objectForRussian: String = "ru"
    private var keyForLanguage: String = "_Key_Language_AksiyaMix_Language_Key_"
    
    func setLanguage(lang: LanguageType?) {
        guard let lang else { return }
        switch lang {
            case .uz:
                udManager.write(object: objectForUzbek, key: keyForLanguage)
            case .ru:
                udManager.write(object: objectForRussian, key: keyForLanguage)
        }
    }
    
    func getLanguage() -> String? {
        return udManager.getObject(key: keyForLanguage) as? String
    }
        
}
