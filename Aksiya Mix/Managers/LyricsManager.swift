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
    case enterNumber
    case enterNumberDescription
    case phoneNumber
    case getCode
    case enterCode
    case enterDescription
    case resentCode
}

class LyricsManager {
    
    class func getLyrics (type: LyricsManagerType) -> String {
        if LanguageManager().getLanguage() == "uz" {
            switch type {
                case .selectLang:
                    return "Ilova tilini tanlang"
                case .confirmation:
                    return "Tasdiqlash"
                case .enterNumber:
                    return "Raqamingizni kiriting"
                case .enterNumberDescription:
                    return "Ro'yxatdan o'tish raqamingizni kiriting"
                case .phoneNumber:
                    return "Telefon raqami"
                case .getCode:
                    return "Kodni olish"
                case .enterCode:
                    return "Kodni kiriting"
                case .enterDescription:
                    return "Telefon raqamingizni tasdiqlash uchun 5 xonali kodni yuboring "
                case .resentCode:
                    return "Qayta kod yuborish"
            }
        } else {
            switch type {
                case .selectLang:
                    return "Выберите язык приложения"
                case .confirmation:
                    return "Подтверждение"
                case .enterNumber:
                    return "Введите свой номер"
                case .enterNumberDescription:
                    return "Введите свой номер для регистрации"
                case .phoneNumber:
                    return "Номер телефона"
                case .getCode:
                    return "Получить код"
                case .enterCode:
                    return "Введите код"
                case .enterDescription:
                    return "Для подтверждения телефона отправили 5-значный код на "
                case .resentCode:
                    return "Повторный ввод номера"
            }
        }
    }
    
}
