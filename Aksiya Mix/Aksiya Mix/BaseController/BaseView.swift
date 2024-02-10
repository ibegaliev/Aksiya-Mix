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
    
    func textFieldDidBeginEditing(textField: UITextField)
    func textFieldDidEndEditing(_ textField: UITextField)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String)
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
    
    func backButtonTapped() {
        delegate?.backButtonTapped()
    }
    
    func notificationTapped() {
        delegate?.notificationTapped()
    }
    
    func optionsTapped() {
        delegate?.optionsTapped()
    }

    
    func textFieldDidBeginEditing(textField: UITextField) {
        delegate?.textFieldDidBeginEditing(textField: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textFieldDidEndEditing(textField)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) {
        delegate?.textField(textField, shouldChangeCharactersIn: range, replacementString: string)
    }

    
}
