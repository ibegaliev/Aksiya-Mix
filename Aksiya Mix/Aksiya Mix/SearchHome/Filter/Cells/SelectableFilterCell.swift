//
//  SelectableFilterCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 07/04/24.
//

import UIKit

class SelectableFilterCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Saralash"
        lbl.font = .appFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    lazy var allButton: BlueButton = {
        let btn = BlueButton()
        btn.setTitle("Hammasi", for: .normal)
        btn.titleLabel?.font = .appFont(ofSize: 14, weight: .medium)
        return btn
    }()
    
    lazy var lowButton: BlueButton = {
        let btn = BlueButton()
        btn.setTitle("Eng arzon", for: .normal)
        btn.titleLabel?.font = .appFont(ofSize: 14, weight: .medium)
        return btn
    }()
    
    lazy var hegButton: BlueButton = {
        let btn = BlueButton()
        btn.setTitle("Eng qimmat", for: .normal)
        btn.titleLabel?.font = .appFont(ofSize: 14, weight: .medium)
        return btn
    }()

    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 12
        stack.axis = .vertical
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
        contentView.addSubview(mainStack)
        [titleLabel, buttonsStack].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [allButton, lowButton, hegButton].forEach { item in
            buttonsStack.addArrangedSubview(item)
        }
        
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(4)
            make.left.right.equalTo(contentView).inset(16)
        }
        allButton.snp.makeConstraints { make in
            make.height.equalTo(35)
        }
    }
    
}
