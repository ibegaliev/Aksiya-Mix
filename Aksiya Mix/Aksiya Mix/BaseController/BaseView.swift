//
//  BaseView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/26/24.
//

import UIKit

protocol BaseViewDelegate {
    func backButtonTapped()
    func notificationTapped()
    func optionsTapped()
    
    func searchTapped()
}

enum BaseMode {
    case home, search, option, none
}

class BaseView: UIView, SearchViewDelegate {
    
    var delegate: BaseViewDelegate?
    
    var mode: BaseMode? {
        get {
            return .home
        }
        set {
            searchView.mode = newValue
        }
    }
    
    lazy var searchView: SearchView = {
        let search = SearchView()
        search.delegate = self
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    lazy var backView: UIView = {
        let view = UIView()
        
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

        addSubview(searchView)
        addSubview(backView)
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: topAnchor),
            searchView.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 108.toScreen)
        ])
        
        backView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp_bottomMargin)
            make.left.right.bottom.equalTo(self)
        }
    }
    
    func searchTapped() {
        delegate?.searchTapped()
    }
    
    func backButtonTapped() {
        delegate?.backButtonTapped()
    }
    
    func notificationTapped() {
        delegate?.notificationTapped()
    }
    
    func optionsTapped() {
        delegate?.optionsTapped()
    }
    
}
