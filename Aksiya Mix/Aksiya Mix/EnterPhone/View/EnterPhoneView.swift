//
//  EnterPhoneView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 2/8/24.
//

import UIKit

class EnterPhoneView: UIView {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        
        return lbl
    }()
    
    lazy var descriptionLabel: UILabel = {
        let lbl = UILabel()
        
        return lbl
    }()
    
    lazy var inputTitleLabel: UILabel = {
        let lbl = UILabel()
        
        return lbl
    }()
    
    lazy var inputNumberView: UIView = {
        let input = UIView()
        
        return input
    }()
    
    lazy var bottomButton: BlueButton = {
        let btn = BlueButton()
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setCOnstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        backgroundColor = .white

        
    }
    
    private func setCOnstraints() {
        
    }
}
