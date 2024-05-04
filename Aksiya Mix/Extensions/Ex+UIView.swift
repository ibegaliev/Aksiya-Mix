//
//  Ex+UIView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/02/24.
//

import UIKit

extension UIView {
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = .zero
        layer.shadowRadius = 8
        layer.shadowPath = CGPath(
            roundedRect: .infinite,
            cornerWidth: .pi,
            cornerHeight: .pi,
            transform: .none
        )
    }
    
    func applyGradient(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        layer.sublayers?.filter({ $0 is CAGradientLayer }).forEach({ $0.removeFromSuperlayer() })
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }

    func formatMoneyAmount(amount: Int, currency: String) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        guard let formattedAmount = formatter.string(from: NSNumber(value: amount)) else {
            return nil
        }
        
        return "\(formattedAmount) \(currency)"
    }
    
}
