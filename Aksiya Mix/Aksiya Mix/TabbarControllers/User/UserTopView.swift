//
//  UserTopView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 19/02/24.
//

import UIKit

class UserTopView: UIView {
    
    lazy var topView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var titleView: UILabel = {
        let lbl = UILabel()
        
        return lbl
    }()
    
    lazy var descripLabel: UILabel = {
        let lbl = UILabel()
        
        return lbl
    }()
    
    lazy var blueButton: BlueButton = {
        let btn = BlueButton()
        
        return btn
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        
        return stack
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
        
        backgroundColor = .red
        
        addSubview(mainStack)
        [topView, titleView, descripLabel, blueButton].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
}

class UserTopImageView: UIView {
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        
    }
    
    private func setConstraints() {
        
    }

}
