//
//  Ex+UIFond.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

extension UIFont {
    static func appFont(ofSize: CGFloat, weight: MyFontType = .regular) -> UIFont {
        
        var font = UIFont(name: "SF-Pro-Text", size: ofSize)
        
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
        
        guard let customFont = UIFont(name: "SF-Pro-Text", size: UIFont.labelFontSize) else {
            fatalError("""
                Failed to load the "CustomFont-Light" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        
        switch weight {
            case .black:
                font = UIFont(name: "SF-Pro-Text-Black", size: ofSize)
            case .blackItalic:
                font = UIFont(name: "SF-Pro-Text-BlackItalic", size: ofSize)
            case .bold:
                font = UIFont(name: "SF-Pro-Text-Bold", size: ofSize)
            case .boldItalic:
                font = UIFont(name: "SF-Pro-Text-BoldItalic", size: ofSize)
            case .heavy:
                font = UIFont(name: "SF-Pro-Text-Heavy", size: ofSize)
            case .heavyItalic:
                font = UIFont(name: "SF-Pro-Text-HeavyItalic", size: ofSize)
            case .light:
                font = UIFont(name: "SF-Pro-Text-Light", size: ofSize)
            case .lightItalic:
                font = UIFont(name: "SF-Pro-Text-LightItalic", size: ofSize)
            case .medium:
                font = UIFont(name: "SF-Pro-Text-Medium", size: ofSize)
            case .mediumItalic:
                font = UIFont(name: "SF-Pro-Text-MediumItalic", size: ofSize)
            case .regular:
                font = UIFont(name: "SF-Pro-Text-Regular", size: ofSize)
            case .regularItalic:
                font = UIFont(name: "SF-Pro-Text-RegularItalic", size: ofSize)
            case .semibold:
                font = UIFont(name: "SF-Pro-Text-Semibold", size: ofSize)
            case .semiboldItalic:
                font = UIFont(name: "SF-Pro-Text-SemiboldItalic", size: ofSize)
            case .thin:
                font = UIFont(name: "SF-Pro-Text-Thin", size: ofSize)
            case .thinItalic:
                font = UIFont(name: "SF-Pro-Text-ThinItalic", size: ofSize)
            case .ultralight:
                font = UIFont(name: "SF-Pro-Text-Ultralight", size: ofSize)
            case .ultralightItalic:
                font = UIFont(name: "SF-Pro-Text-UltralightItalic", size: ofSize)
        }
        print(font?.familyName ?? "10000000")
        return font ?? UIFont.systemFont(ofSize: ofSize)
    }

}

enum MyFontType {
    case black
    case blackItalic
    case bold
    case boldItalic
    case heavy
    case heavyItalic
    case light
    case lightItalic
    case medium
    case mediumItalic
    case regular
    case regularItalic
    case semibold
    case semiboldItalic
    case thin
    case thinItalic
    case ultralight
    case ultralightItalic
}
