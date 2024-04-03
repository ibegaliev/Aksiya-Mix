//
//  ProfileEditView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 03/04/24.
//

import UIKit

class ProfileEditView: UIView {
    
    lazy var topNavigation: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
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
        
        addSubview(topNavigation)
        backgroundColor = .backColor
    }
    
    private func setConstraints() {
        topNavigation.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.height.equalTo(85.toScreen)
        }
        
    }
    
}
