//
//  OtpFieldView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

class OtpFieldView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        backgroundColor = .fieldBack
    }
    
    private func setConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(48)
        }
    }
    
}
