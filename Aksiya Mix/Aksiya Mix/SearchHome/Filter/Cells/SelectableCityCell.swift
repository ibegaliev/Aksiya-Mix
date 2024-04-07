//
//  SelectableCityCell.swift
//  Aksiya Mix
//
//  Created by iBegaliev on 07/04/24.
//

import UIKit

class SelectableCityCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Shaharni tanlang"
        lbl.font = .appFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    lazy var categoryView: SelectableCityItem = {
        let cell = SelectableCityItem()
        cell.title = "Toshkent"
        cell.backView.backgroundColor = .white
        return cell
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 12
        stack.axis = .vertical
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
        [titleLabel, categoryView].forEach { item in
            mainStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(4)
            make.left.right.equalTo(contentView)
        }
    }
    
}

class SelectableCityItem: UIView {
    
    var title: String? {
        get {
            return nil
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .backColor
        return view
    }()
        
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .appFont(ofSize: 16, weight: .semibold)
        lbl.textColor = .black
        return lbl
    }()
    
    lazy var chevronImage: UIImageView = {
        let img = UIImageView()
        img.image = .chevronRight
        return img
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 8
        return stack
    }()

    lazy var leftStack: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 4
        stack.alignment = .center
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        backgroundColor = .white
        layer.cornerRadius = 8
        clipsToBounds = true
        
        addSubview(backView)
        backView.addSubview(mainStack)
        [leftStack, chevronImage].forEach { item in
            mainStack.addArrangedSubview(item)
        }
        [titleLabel].forEach { item in
            leftStack.addArrangedSubview(item)
        }
    }
    
    private func setConstraints() {
        
        backView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        mainStack.snp.makeConstraints { make in
            make.edges.equalTo(backView).inset(12)
        }
        
        chevronImage.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        
    }
    
}
