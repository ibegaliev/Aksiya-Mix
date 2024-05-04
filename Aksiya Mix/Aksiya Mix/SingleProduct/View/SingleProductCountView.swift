//
//  SingleProductCountView.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 13/03/24.
//

import UIKit

class SingleProductCountView: UIView {
    
    lazy var icon: UIImageView = {
        let img = UIImageView()
        img.image = .eyeCount
        return img
    }()
    
    lazy var countLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 10)
        lbl.textColor = .spacetext
        return lbl
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 0.5
        view.backgroundColor = .spacetext
        return view
    }()
    
    lazy var dataView: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 10)
        lbl.textColor = .spacetext
        return lbl
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
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
        addSubview(mainStack)
        [icon, countLabel, lineView, dataView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        lineView.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.height.equalTo(8)
        }
        icon.snp.makeConstraints { make in
            make.height.width.equalTo(10)
        }
    }
    
}
