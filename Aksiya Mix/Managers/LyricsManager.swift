//
//  LyricsManager.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/7/24.
//

import Foundation

enum LyricsManagerType {
    case selectLang
    case confirmation
}

class LyricsManager {
    
    class func getLyrics (type: LyricsManagerType) -> String {
        if LanguageManager().getLanguage() == "uz" {
            switch type {
                case .selectLang:
                    return "Ilova tilini tanlang"
                case .confirmation:
                    return "Tasdiqlash"
            }
        } else {
            switch type {
                case .selectLang:
                    return "Выберите язык приложения"
                case .confirmation:
                    return "Подтверждение"
            }
        }
    }
    
}
