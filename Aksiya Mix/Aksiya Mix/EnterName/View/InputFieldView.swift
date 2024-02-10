//
//  InputFieldView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

class InputFieldView: UIView {
    
    lazy var inputField: UITextField = {
        let tf = UITextField()
        tf.placeholder = LyricsManager.getLyrics(type: .name)
        tf.font = .appFont(ofSize: 16, weight: .regular)
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
        backgroundColor = .fieldBack
        layer.cornerRadius = 9
        clipsToBounds = true
        addSubview(inputField)
    }
    
    private func setConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(48)
        }
        inputField.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(12)
            make.left.right.equalTo(self).inset(16)
        }
    }
    
}
