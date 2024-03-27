//
//  SearchItemsView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 18/03/24.
//

import UIKit

class SearchItemsView: UIView {
    
    lazy var itemsView: OfferItemsView = {
        let view = OfferItemsView()
        
        return view
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
        addSubview(itemsView)
    }
    
    private func setConstraints() {
        itemsView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}

class SearchItemTopView: UIView, SearchTextFieldDelegate {

    lazy var textField: SearchTextField = {
        let tf = SearchTextField()
        tf.delegate = self
        tf.isButton = false
        return tf
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
        backgroundColor = .white
        layer.cornerRadius = 8
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        addSubview(textField)
        
    }
    
    private func setConstraints() {
        textField.snp.makeConstraints { make in
            make.left.equalTo(self).inset(32)
            make.right.equalTo(self).inset(12)
            make.bottom.equalTo(self).inset(6)
        }
    }
    
    func tappedView() {
        
    }
    
}
