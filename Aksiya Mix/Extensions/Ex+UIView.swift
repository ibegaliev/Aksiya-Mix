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
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
    }
    
//    func applyGradient(isVertical: Bool, colorArray: [UIColor]) {
//        layer.sublayers?.filter({ $0 is CAGradientLayer }).forEach({ $0.removeFromSuperlayer() })
//        
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = colorArray.map({ $0.cgColor })
//        if isVertical {
//            //top to bottom
//            gradientLayer.locations = [0.0, 1.0]
//        } else {
//            //left to right
//            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
//            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
//        }
//        
////        backgroundColor = .clear
//        gradientLayer.frame = bounds
//        layer.insertSublayer(gradientLayer, at: 0)
//    }
    
    func applyGradient(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        // Remove existing gradient layer if any
        layer.sublayers?.filter({ $0 is CAGradientLayer }).forEach({ $0.removeFromSuperlayer() })
        
        // Create gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.frame = bounds
        
        // Add gradient layer to view
        layer.insertSublayer(gradientLayer, at: 0)
    }

}
