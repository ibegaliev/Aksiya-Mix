//
//  CategoryView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 11/02/24.
//

import UIKit

class CategoryView: UIView {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        backgroundColor = .red
    }
    
    private func setConstraints() {
        
    }
    
}
