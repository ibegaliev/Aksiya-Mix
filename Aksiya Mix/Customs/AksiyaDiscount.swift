//
//  AksiyaDiscount.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 04/05/24.
//

import UIKit

class AksiyaDiscount: UIView {
    
    
    
    lazy var mainImageView: UIImageView = {
        let image = UIImageView()
        image.image = .aksiyaStar
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        
    }
    
    private func setConstraints() {
        
    }
    
}
