//
//  SelectableValuteCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 07/04/24.
//

import UIKit

class SelectableValuteCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Valyutani tanlang"
        lbl.font = .appFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    lazy var uzsButton: BlueButton = {
        let btn = BlueButton()
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .selectBlue
        btn.setTitle("🇺🇿 UZS", for: .normal)
        btn.titleLabel?.font = .appFont(ofSize: 14, weight: .medium)
        btn.addTarget(self, action: #selector(uzsTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var usdButton: BlueButton = {
        let btn = BlueButton()
        btn.backgroundColor = .white
        btn.setTitle("🇺🇸 USD", for: .normal)
        btn.titleLabel?.font = .appFont(ofSize: 14, weight: .medium)
        btn.addTarget(self, action: #selector(usdTapped), for: .touchUpInside)
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
            make.left.right.equalTo(contentView)
        }
        usdButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
    }
    
    @objc
    private func uzsTapped() {
        uzsButton.backgroundColor = .selectBlue
        uzsButton.setTitleColor(.white, for: .normal)
        
        usdButton.backgroundColor = .white
        usdButton.setTitleColor(.selectBlue, for: .normal)
    }
    
    @objc
    private func usdTapped() {
        uzsButton.backgroundColor = .white
        uzsButton.setTitleColor(.selectBlue, for: .normal)
        
        usdButton.backgroundColor = .selectBlue
        usdButton.setTitleColor(.white, for: .normal)
    }
    
}
