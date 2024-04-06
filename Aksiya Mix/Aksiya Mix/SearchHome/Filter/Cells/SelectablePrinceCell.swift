//
//  SelectablePrinceCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 07/04/24.
//

import UIKit

class SelectablePrinceCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Narx oraliqni belgilang"
        lbl.font = .appFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    lazy var uzsButton: BlueButton = {
        let btn = BlueButton()
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .selectBlue
        btn.setTitle("🇺🇸 USD", for: .normal)
        btn.titleLabel?.font = .appFont(ofSize: 14, weight: .medium)
        return btn
    }()
    
    lazy var usdButton: BlueButton = {
        let btn = BlueButton()
        btn.backgroundColor = .white
        btn.setTitle("🇺🇿 UZS", for: .normal)
        btn.titleLabel?.font = .appFont(ofSize: 14, weight: .medium)
        return btn
    }()

    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 12
        stack.axis = .vertical
        stack.alignment = .leading
        return stack
    }()
    
    lazy var buttonsStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 6
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
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
        contentView.backgroundColor = .backColor
        contentView.addSubview(mainStack)
        [titleLabel, buttonsStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [uzsButton, usdButton].forEach { item in
            buttonsStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(4)
            make.left.right.equalTo(contentView).inset(16)
        }
        usdButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
    }
    
}
