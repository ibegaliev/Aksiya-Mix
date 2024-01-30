//
//  BottomTitlesView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 1/30/24.
//

import UIKit

class BottomTitlesView: UIView {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.axis = .vertical
        return stack
    }()
    
    lazy var topView: UIView = {
        let view = TitleTopView()

        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .white
        lbl.text = "Смартфон Apple iPhone 13 pro 256ГБ"
        lbl.numberOfLines = 2
        lbl.font = .boldSystemFont(ofSize: 12)
        return lbl
    }()
    
    lazy var costView: UIView = {
        let view = UIView()
        view.backgroundColor = .link
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .selectBlue
        
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        addSubview(mainStack)
        
        [topView, titleLabel, costView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(8)
        }
    }
    
}

class TitleTopView: UIView {
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setIU()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setIU() {
        addSubview(mainStack)
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
            make.height.equalTo(25)
        }
    }
    
}
