//
//  SearchItemsView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 18/03/24.
//

import UIKit

class SearchItemsView: UIView {
    
    lazy var topNavigation: SearchItemTopView = {
        let view = SearchItemTopView()
        
        return view
    }()
    
    lazy var tableView: OfferView = {
        let view = OfferView()
        
        return view
    }()
    
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
        addSubview(tableView)
        addSubview(itemsView)
        addSubview(topNavigation)
    }
    
    private func setConstraints() {
        topNavigation.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.height.equalTo(90.toScreen)
        }
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        itemsView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}

class SearchItemTopView: UIView, SearchTextFieldDelegate {

    lazy private var textField: SearchTextField = {
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
