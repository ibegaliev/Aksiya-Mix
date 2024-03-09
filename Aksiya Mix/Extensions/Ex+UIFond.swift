//
//  Ex+UIFond.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

extension UIFont {
    static func appFont(ofSize: CGFloat, weight: MyFontType = .regular) -> UIFont {
        
        var font = UIFont(name: "SFProText-Regular", size: ofSize)
                
        switch weight {
            case .black:
                font = UIFont(name: "SFProText-Black", size: ofSize)
            case .bold:
                font = UIFont(name: "SFProText-Bold", size: ofSize)
            case .boldItalic:
                font = UIFont(name: "SFProText-BoldItalic", size: ofSize)
            case .heavy:
                font = UIFont(name: "SFProText-Heavy", size: ofSize)
            case .light:
                font = UIFont(name: "SFProText-Light", size: ofSize)
            case .lightItalic:
                font = UIFont(name: "SFProText-LightItalic", size: ofSize)
            case .medium:
                font = UIFont(name: "SFProText-Medium", size: ofSize)
            case .mediumItalic:
                font = UIFont(name: "SFProText-MediumItalic", size: ofSize)
            case .regular:
                font = UIFont(name: "SFProText-Regular", size: ofSize)
            case .regularItalic:
                font = UIFont(name: "SFProText-RegularItalic", size: ofSize)
            case .semibold:
                font = UIFont(name: "SFProText-Semibold", size: ofSize)
            case .semiboldItalic:
                font = UIFont(name: "SFProText-SemiboldItalic", size: ofSize)
            case .heavyItalic:
                font = UIFont(name: "SFProText-HeavyItalic", size: ofSize)
        }
        return font ?? UIFont.systemFont(ofSize: ofSize)
    }

}

enum MyFontType {
    case black
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
}
