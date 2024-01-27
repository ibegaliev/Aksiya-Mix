//
//  SearchView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/26/24.
//

import UIKit
import SnapKit

class SearchView: UIView {
    
    lazy private var mainStack: UIStackView = {
        let stack = UIStackView()
        
        return stack
    }()
    
    lazy private var textField: SearchTextField = {
        let tf = SearchTextField()
        
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        addSubview(mainStack)
        
        mainStack.addArrangedSubview(textField)
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.right.bottom.equalTo(self).inset(16)
        }
    }
    
}

class SearchTextField: UIView {
    
    lazy private var icon: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    lazy var tf: UITextField = {
        let tf = UITextField()
        tf.placeholder = "поиск"
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backColor
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        
    }
    
    private func setConstraints() {
        
    }
    
}
