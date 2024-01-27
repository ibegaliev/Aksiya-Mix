//
//  BaseView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/26/24.
//

import UIKit

class BaseView: UIView {
    
    lazy var searchView: UIView = {
        let search = SearchView()
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
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
        
        backgroundColor = .backColor
        
        addSubview(searchView)
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: topAnchor),
            searchView.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 108.toScreen)
        ])
        
    }
    
}
