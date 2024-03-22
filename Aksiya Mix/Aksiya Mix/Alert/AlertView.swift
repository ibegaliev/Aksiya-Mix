//
//  AlertView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 21/03/24.
//

import UIKit

class AlertView: UIView {
    
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .backColor
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
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
        addSubview(backView)
    }
    
    private func setConstraints() {
        backView.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(16)
            make.height.equalTo(0.screenWight/2)
            make.center.equalTo(center)
        }
    }
    
}
