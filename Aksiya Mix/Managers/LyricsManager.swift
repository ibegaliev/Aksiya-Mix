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
    case enterName
    case enterNameDescription
    case save
    case name
    case departaments
    case likedTitle
    case resentlySeen
    case endedTitle
    case log
    case welcome
    case welcomeDescription
    case enterComment
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
                case .enterName:
                    return "Ismingizni kiriting"
                case .enterNameDescription:
                    return "Ro'yxatdan o'tish uchun ismingizni kiriting"
                case .save:
                    return "Saqlash"
                case .name:
                    return "Ism"
                case .departaments:
                    return "Bo'limlar"
                case .likedTitle:
                    return "Saralanganlar"
                case .resentlySeen:
                    return "Yaqinda ko'rilganlar"
                case .endedTitle:
                    return "Tugagan e'lonlar"
                case .log:
                    return "Tizimga kirish"
                case .welcome:
                    return "AksiyaMixga xush kelibsiz!"
                case .welcomeDescription:
                    return "Xabar yuborish va qabul gilish, yangi e'lonlar joylash va o'zingiz yoqtirgan e'lonlar va saqlangan gidiruvlarni qayta ko rib chiqish uchun tizimga kiring. Bir necha daqiqada profil oching."
                case .enterComment:
                    return "Введите комментарий..."
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
                case .enterName:
                    return "Введите свое имя"
                case .enterNameDescription:
                    return "Введите свое имя, чтобы зарегистрироваться"
                case .save:
                    return "Сохранить"
                case .name:
                    return "Имя"
                case .departaments:
                    return "Отделы"
                case .likedTitle:
                    return "Сортированные"
                case .resentlySeen:
                    return "Недавно просмотренные"
                case .endedTitle:
                    return "Законченные объявления"
                case .log:
                    return "Авторизоваться"
                case .welcome:
                    return "Добро пожаловать в Aksiyamix!"
                case .welcomeDescription:
                    return "Войдите в систему, чтобы отправлять и получать сообщения, публиковать новые объявления и пересматривать понравившиеся объявления и сохраненные поисковые запросы. Откройте Профиль каждые несколько минут."
                case .enterComment:
                    return "Fikr bildiring..."
            }
        }
    }
    
}
